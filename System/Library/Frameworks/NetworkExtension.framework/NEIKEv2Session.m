@interface NEIKEv2Session
+ (void)removeItemsFromDictionary:(int)a3 lowerEdge:;
- (BOOL)checkSelectedChildSAProposal:(id)a3;
- (BOOL)checkSelectedIKEProposal:(id)a3;
- (BOOL)peerAuthenticated;
- (BOOL)ppkAuthenticated;
- (BOOL)updateConfiguration:(id)a3;
- (NEIKEv2ConfigurationMessage)assignedConfiguration;
- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 kernelSASessionName:(id)a9 packetDelegate:(id)a10;
- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 saSession:(id)a9 packetDelegate:(id)a10;
- (NSObject)initWithIKEConfig:(NSObject *)a1 configurationDelegate:(void *)a2 queue:(void *)a3 saSession:(void *)a4 shouldCopySASession:(void *)a5 transport:(void *)a6 packetDelegate:(void *)a7;
- (NSObject)initWithIKEConfig:(void *)a3 configurationDelegate:(void *)a4 queue:(void *)a5 kernelSASessionName:(void *)a6 transport:(void *)a7 packetDelegate:;
- (NSObject)initWithIKEConfig:(void *)a3 firstChildConfig:(void *)a4 sessionConfig:(void *)a5 queue:(id *)a6 ipsecInterface:(void *)a7 ikeSocketHandler:(void *)a8 saSession:(char)a9 shouldOwnSASession:(void *)a10 packetDelegate:(void *)a11 transport:(void *)a12 configurationDelegate:;
- (NSString)description;
- (NSString)ikeInterfaceName;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (OS_dispatch_queue)clientQueue;
- (_BYTE)abort;
- copyChildWithID:(void *)a1;
- (_OWORD)addEmptyInterface;
- (__CFString)interfaceName;
- (id)additionalAddressesUpdateBlock;
- (id)childStateUpdateBlock;
- (id)configurationUpdateBlock;
- (id)copyChildWithSPI:(void *)a1;
- (id)copySAFromDictionary:(void *)a1 forChild:(void *)a2;
- (id)copySAFromDictionary:(void *)a1 forSPI:(void *)a2;
- (id)copySAsToDeleteAndInstallRekeyedChildSA:(id)a1;
- (id)firstChildSA;
- (id)privateNotifyStatusEvent;
- (id)redirectEventBlock;
- (id)shortDPDEventBlock;
- (id)stateUpdateBlock;
- (id)trafficSelectorUpdateBlock;
- (uint64_t)copyIPsecInterfaceWithMissingAllowed:(uint64_t)a1;
- (uint64_t)fireWaitingRequestHandlerWithPacket:(void *)a1;
- (uint64_t)generateSPIForChild:(void *)a3 proposals:;
- (uint64_t)handleIKEIntermediateForResponderIKESA:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (uint64_t)installChildSA:(uint64_t)a1;
- (uint64_t)interfaceIndex;
- (uint64_t)migrateAllChildSAs;
- (uint64_t)receiveDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 packet:;
- (uint64_t)sendCurrentRequest:(uint64_t)a1;
- (uint64_t)sendReply:(void *)a3 replyHandler:;
- (uint64_t)sendReplyForMessageID:(unsigned char *)a1;
- (uint64_t)sendRequest:(uint64_t)a1 retry:(void *)a2 replyHandler:(void *)a3;
- (uint64_t)sendRequest:(unint64_t)a3 retryIntervalInMilliseconds:(int)a4 maxRetries:(void *)a5 timeoutError:(char)a6 resend:(uint64_t)a7 sendMessageID:(void *)a8 sendCompletionHandler:(void *)a9 replyHandler:;
- (uint64_t)setupReceivedChildCopyError;
- (uint64_t)uninstallAllChildSAs;
- (unint64_t)state;
- (unsigned)addChild:(id)a3;
- (void)addFirstChild:(void *)a1;
- (void)blackholeDetectedSA:(id)a3;
- (void)cancelSendTimer;
- (void)clientCallback;
- (void)clientCallbackInfo;
- (void)connect;
- (void)dealloc;
- (void)deleteSA:(id)a3;
- (void)disconnect;
- (void)dpdTimerFired;
- (void)enqueuePendingRequestContext:(void *)a1;
- (void)expireSA:(id)a3;
- (void)finishConfigurationEstablishment;
- (void)forceRekeyChild:(unsigned int)a3;
- (void)forceRekeyIKE;
- (void)handleEAPAndGSPMForIKESA:(void *)a3 authPacket:(void *)a4 handler:;
- (void)handleFollowupKEForRekeyChildSAInitiator:(unint64_t)a3 iteration:(void *)a4 handler:;
- (void)handleFollowupKEForRekeyChildSAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (void)handleFollowupKEForRekeyIKESAInitiator:(void *)a3 rekeyIKEContext:(unint64_t)a4 iteration:(void *)a5 handler:;
- (void)handleFollowupKEForRekeyIKESAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:;
- (void)handleIKEIntermediateForInitiatorIKESA:(unint64_t)a3 iteration:(void *)a4 handler:;
- (void)idleTimeoutSA:(id)a3;
- (void)initiateDelete:(void *)a1;
- (void)initiateDeleteChildSA:(void *)a1;
- (void)initiateDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 deleteCompletionCallback:;
- (void)initiateInformational:(unsigned char *)a1;
- (void)initiateMOBIKE:(unsigned char *)a1;
- (void)initiateNewChildSA:(unsigned char *)a1;
- (void)initiateRekeyChildSA:(unsigned char *)a1;
- (void)initiateRekeyIKESA:(unsigned char *)a1;
- (void)invalidate;
- (void)invalidateDPDTimer;
- (void)invalidateWithCompletionHandler:(BOOL)a3 completionHandler:(id)a4;
- (void)processFragment:(_DWORD *)a1;
- (void)receiveConnection:(void *)a1;
- (void)receiveDeleteChildSA:(void *)a1;
- (void)receiveDeleteIKESA:(void *)a1;
- (void)receiveInformational:(unsigned char *)a1;
- (void)receiveMOBIKE:(void *)a1;
- (void)receiveNewChildSA:(void *)a3 packet:;
- (void)receivePacket:(id)a3;
- (void)receiveRedirect:(void *)a1;
- (void)receiveRekeyChildSA:(void *)a3 packet:;
- (void)receiveRekeyIKESA:(void *)a1;
- (void)removeChild:(unsigned int)a3;
- (void)removeChild:(void *)a3 withReason:;
- (void)removeFirstChild;
- (void)reportConfiguration;
- (void)reportError:(int)a3;
- (void)reportPrivateNotifies:(void *)a1;
- (void)reportPrivateNotifiesInPacket:(id *)a1;
- (void)reportServerRedirect:(void *)a1;
- (void)reportState;
- (void)reportTrafficSelectorsForChildSA:(void *)a1;
- (void)resetAll;
- (void)resetChild:(char *)a1;
- (void)resetMessages;
- (void)retryCookieForIKESA:(uint64_t)a3 validated:(void *)a4 handler:;
- (void)sendKeepaliveWithRetries:(unsigned int)a3 retryIntervalInMilliseconds:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6;
- (void)sendMOBIKEWithRetries:(unsigned int)a3 retryInterval:(unint64_t)a4 interfaceName:(id)a5 invalidateTransport:(BOOL)a6 resetEndpoint:(id)a7 callbackQueue:(id)a8 callback:(id)a9;
- (void)sendPendingRequestContext;
- (void)sendPrivateNotifies:(id)a3 maxRetries:(unsigned int)a4 retryIntervalInMilliseconds:(unint64_t)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)setAdditionalAddressesUpdateBlock:(id)a3;
- (void)setChildStateUpdateBlock:(id)a3;
- (void)setClientCallback:(void *)a3;
- (void)setClientCallbackInfo:(void *)a3;
- (void)setClientQueue:(id)a3;
- (void)setConfigurationUpdateBlock:(id)a3;
- (void)setIKESA:(uint64_t)a1;
- (void)setPendingPrivateNotifies:(uint64_t)a1;
- (void)setPrivateNotifyStatusEvent:(id)a3;
- (void)setReceivedReply:(uint64_t)a3 messageID:;
- (void)setRedirectEventBlock:(id)a3;
- (void)setSentMOBIKERequest:(int)a3 messageID:;
- (void)setShortDPDEventBlock:(id)a3;
- (void)setStateUpdateBlock:(id)a3;
- (void)setTrafficSelectorUpdateBlock:(id)a3;
- (void)startDPDTimer;
- (void)startIKELifetimeTimer;
- (void)uninstallOldRekeyedChildSAs:(void *)a1;
- (void)updateEndpointState;
@end

@implementation NEIKEv2Session

- (void)reportPrivateNotifiesInPacket:(id *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  self = a1;
  if (a1)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v29 = v3;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3) {
      id Property = objc_getProperty(v3, v4, 64, 1);
    }
    else {
      id Property = 0;
    }
    id obj = Property;
    uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (v10)
          {
            uint64_t v11 = v10[3];
            if ((unsigned __int16)v11 >= 0xA000u)
            {
              v12 = ne_log_obj();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                id v14 = objc_getProperty(v10, v13, 32, 1);
                *(_DWORD *)buf = 138412802;
                *(void *)v38 = self;
                *(_WORD *)&v38[8] = 1024;
                *(_DWORD *)&v38[10] = (unsigned __int16)v11;
                __int16 v39 = 2112;
                id v40 = v14;
                _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_INFO, "%@ Received private notify status %u %@", buf, 0x1Cu);
              }
              v15 = [NEIKEv2PrivateNotify alloc];
              id v17 = objc_getProperty(v10, v16, 32, 1);
              v18 = [(NEIKEv2PrivateNotify *)v15 initWithNotifyStatus:(unsigned __int16)v11 notifyData:v17];

              if (v18)
              {
                [v31 addObject:v18];
              }
              else
              {
                v19 = ne_log_obj();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                {
                  id v21 = objc_getProperty(v10, v20, 32, 1);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v38 = (unsigned __int16)v11;
                  *(_WORD *)&v38[4] = 2112;
                  *(void *)&v38[6] = v21;
                  _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "NEIKEv2PrivateNotify init %u %@ failed", buf, 0x12u);
                }
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v7);
    }

    id v3 = v29;
    if ([v31 count])
    {
      v23 = objc_getProperty(self, v22, 336, 1);
      if (v23 && (uint64_t v24 = v23[6], v23, v24 == 2))
      {
        -[NEIKEv2Session reportPrivateNotifies:](self, v31);
      }
      else
      {
        v25 = self + 49;
        id v26 = self[49];

        if (!v26)
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_storeStrong(v25, v27);
        }
        id v28 = *v25;
        [v28 addObjectsFromArray:v31];
      }
    }
  }
}

- (void)initiateDelete:(void *)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    if (!v4)
    {
      uint64_t v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) initiateDelete:]";
        _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "%s called with null deleteIKEContext", buf, 0xCu);
      }
      goto LABEL_27;
    }
    self;
    uint64_t v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2InformationalPacket alloc]);
    if (v6)
    {
      uint64_t v7 = objc_alloc_init(NEIKEv2DeletePayload);
      p_super = &v7->super.super;
      if (v7) {
        v7->_protocol = 1;
      }
      if (-[NEIKEv2Payload isValid]((uint64_t)v7))
      {
        *(void *)buf = p_super;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
        objc_setProperty_atomic(v6, v10, v9, 88);

        uint64_t v11 = v6;
        goto LABEL_11;
      }
      v47 = ne_log_obj();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteIKE]";
        _os_log_fault_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
      }
    }
    else
    {
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
      }
    }
    uint64_t v11 = 0;
LABEL_11:

    if (v11)
    {
      if (v4[24])
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke;
        v53[3] = &unk_1E5990558;
        v53[4] = a1;
        v12 = v4;
        id v54 = v12;
        if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v11, v53) == -1)
        {
          [v12 sendCallbackSuccess:0 session:a1];
          id v14 = objc_getProperty(a1, v13, 336, 1);
          ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete with reply", v15, v16, v17, v18, v19, v20, v21, v48);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, ErrorFailedToSend);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }
        v25 = v54;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke_4;
        aBlock[3] = &unk_1E5990580;
        id v27 = v4;
        id v51 = v27;
        v52 = a1;
        id v28 = _Block_copy(aBlock);
        uint64_t v11 = v11;
        id v29 = v28;
        id Property = objc_getProperty(a1, v30, 336, 1);
        int v32 = 4;
        if (Property)
        {
          if (Property[17]) {
            int v32 = 12;
          }
          else {
            int v32 = 4;
          }
        }
        Error = (void *)NEIKEv2CreateError(3);
        int v34 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]((uint64_t)a1, v11, 0, v32, Error, 0, 0xFFFFFFFFLL, v29, 0);

        if (v34 == -1)
        {
          [v27 sendCallbackSuccess:0 session:a1];
          id v36 = objc_getProperty(a1, v35, 336, 1);
          v44 = (void *)NEIKEv2CreateErrorFailedToSend(@"delete with send complete", v37, v38, v39, v40, v41, v42, v43, v49);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v36, 3uLL, v44);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }

        v25 = v51;
      }
    }
    else
    {
      id v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", buf, 0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v11 = 0;
    }
LABEL_27:
  }
}

void __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3 && ![(NEIKEv2Packet *)v3 hasErrors])
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v10 = 1;
      goto LABEL_9;
    }
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v6;
      uint64_t v7 = "%@ Failed to process packet";
LABEL_11:
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, v7, v12, 0xCu);
    }
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)v12 = 138412290;
      *(void *)&v12[4] = v11;
      uint64_t v7 = "%@ Failed to receive Delete packet";
      goto LABEL_11;
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v10 = 0;
LABEL_9:
  objc_msgSend(v8, "sendCallbackSuccess:session:", v10, v9, *(_OWORD *)v12);
}

uint64_t __43__NEIKEv2Session_Exchange__initiateDelete___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCallbackSuccess:a2 session:*(void *)(a1 + 40)];
}

- (void)initiateDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 deleteCompletionCallback:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_22;
  }
  id v9 = a2;
  uint64_t v11 = objc_getProperty(a1, v10, 368, 1);
  dispatch_assert_queue_V2(v11);

  id v12 = v9;
  self;
  if (!v12)
  {
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteChild:]";
      _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "%s called with null childSPI", buf, 0xCu);
    }
    uint64_t v20 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = -[NEIKEv2Packet initOutbound]([NEIKEv2InformationalPacket alloc]);
  if (!v13)
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  id v14 = objc_alloc_init(NEIKEv2DeletePayload);
  p_super = &v14->super.super;
  if (v14) {
    v14->_protocol = 3;
  }
  id v39 = v12;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  if (p_super) {
    objc_setProperty_atomic(p_super, v16, v17, 32);
  }

  if ((-[NEIKEv2Payload isValid]((uint64_t)p_super) & 1) == 0)
  {
    SEL v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2InformationalPacket(Exchange) createDeleteChild:]";
      _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
    }

LABEL_12:
    uint64_t v20 = 0;
    goto LABEL_13;
  }
  *(void *)buf = p_super;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
  objc_setProperty_atomic(v13, v19, v18, 88);

  uint64_t v20 = v13;
LABEL_13:

LABEL_14:
  if (v20)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = (uint64_t)__86__NEIKEv2Session_Exchange__initiateDeleteChildSPI_remoteSPI_deleteCompletionCallback___block_invoke;
    v36[3] = (uint64_t)&unk_1E59905D0;
    v36[4] = (uint64_t)a1;
    id v21 = v8;
    id v38 = v21;
    id v37 = v7;
    if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v20, v36) == -1)
    {
      (*((void (**)(id, void))v21 + 2))(v21, 0);
      id v23 = objc_getProperty(a1, v22, 336, 1);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete child", v24, v25, v26, v27, v28, v29, v30, v36[0]);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v23, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }
  }
  else
  {
    int v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", buf, 0xCu);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }

LABEL_22:
}

void __86__NEIKEv2Session_Exchange__initiateDeleteChildSPI_remoteSPI_deleteCompletionCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
      goto LABEL_8;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    uint64_t v6 = "%@ Failed to receive Delete packet";
LABEL_10:
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0xCu);
    goto LABEL_7;
  }
  if ((-[NEIKEv2InformationalPacket validateDeleteChild:]((uint64_t)v3, *(void **)(a1 + 40)) & 1) == 0)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    uint64_t v6 = "%@ Failed to process Delete packet";
    goto LABEL_10;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 1);
LABEL_8:
}

- (uint64_t)receiveDeleteChildSPI:(void *)a3 remoteSPI:(void *)a4 packet:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1) {
    id Property = objc_getProperty(a1, v9, 368, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  dispatch_assert_queue_V2(v12);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v31 = 138412290;
      *(void *)&v31[4] = a1;
      id v14 = "%@ Failed to receive Delete packet";
LABEL_11:
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v14, v31, 0xCu);
    }
LABEL_22:
    uint64_t v16 = 0;
    goto LABEL_23;
  }
  if ((-[NEIKEv2InformationalPacket validateDeleteChild:]((uint64_t)v10, v8) & 1) == 0)
  {
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v31 = 138412290;
      *(void *)&v31[4] = a1;
      id v14 = "%@ Failed to process Delete packet";
      goto LABEL_11;
    }
    goto LABEL_22;
  }
  if (v7) {
    +[NEIKEv2InformationalPacket createDeleteResponse:child:]((uint64_t)NEIKEv2InformationalPacket, v10, v7);
  }
  else {
  uint64_t v13 = +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]((uint64_t)NEIKEv2InformationalPacket, v10, 0);
  }
  if (!v13)
  {
    uint64_t v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v31 = 138412290;
      *(void *)&v31[4] = a1;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", v31, 0xCu);
    }

    uint64_t v13 = 0;
    goto LABEL_22;
  }
  if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v13, 0) & 1) == 0)
  {
    if (a1) {
      id v18 = objc_getProperty(a1, v15, 336, 1);
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete child reply", v20, v21, v22, v23, v24, v25, v26, *(uint64_t *)v31);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorFailedToSend);

    [(NEIKEv2Session *)a1 reportState];
    [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    goto LABEL_22;
  }
  uint64_t v16 = 1;
LABEL_23:

  return v16;
}

- (void)initiateInformational:(unsigned char *)a1
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v6 = Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn("-[NEIKEv2Session(Exchange) initiateInformational:]", "NEIKEv2Exchange.m", 318, "self.hasOutboundRequestInFlight");
  }
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v108 = a1;
    __int16 v109 = 2112;
    id v110 = v4;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@ Sending %@", buf, 0x16u);
  }

  if (!*((_DWORD *)v4 + 6)
    || (uint64_t v9 = objc_getProperty(a1, v8, 336, 1)) == 0
    || (uint64_t v10 = v9[6], v9, v10 != 2))
  {
    [v4 sendCallbackSuccess:0 session:a1];
    goto LABEL_72;
  }
  id v12 = objc_getProperty(a1, v11, 336, 1);
  if (!v12 || (char v13 = v12[11], v12, (v13 & 1) == 0))
  {
    self;
    uint64_t v15 = -[NEIKEv2Packet initOutbound]([NEIKEv2InformationalPacket alloc]);
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;
    }
    else
    {
      id v36 = ne_log_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
      }
    }
    SEL v35 = v16;
    goto LABEL_36;
  }
  uint64_t v16 = objc_getProperty(a1, v14, 336, 1);
  self;
  id v19 = -[NEIKEv2Packet initOutbound]([NEIKEv2InformationalPacket alloc]);
  if (!v19)
  {
    uint64_t v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
    }
    SEL v35 = 0;
    goto LABEL_35;
  }
  uint64_t v20 = [(NEIKEv2IKESA *)v16 initiatorSPI];
  uint64_t v23 = [(NEIKEv2IKESA *)v16 responderSPI];
  if (v16) {
    id v24 = objc_getProperty(v16, v22, 64, 1);
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;
  uint64_t v26 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v20, v23, v25);

  if (!-[NEIKEv2Packet addNotification:data:](v19, 0x4004uLL, v26))
  {
    int v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed", buf, 2u);
    }
    goto LABEL_33;
  }
  uint64_t v28 = [(NEIKEv2IKESA *)v16 initiatorSPI];
  id v31 = [(NEIKEv2IKESA *)v16 responderSPI];
  if (v16) {
    id v32 = objc_getProperty(v16, v30, 72, 1);
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;
  int v34 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v28, v31, v33);

  if (!-[NEIKEv2Packet addNotification:data:](v19, 0x4005uLL, v34))
  {
    id v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed", buf, 2u);
    }

LABEL_33:
    SEL v35 = 0;
    goto LABEL_34;
  }
  SEL v35 = v19;
LABEL_34:

LABEL_35:
LABEL_36:

  if (v35)
  {
    id v38 = *((id *)v4 + 4);
    uint64_t v39 = [v38 count];

    if (v39)
    {
      uint64_t v40 = v35;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id obj = *((id *)v4 + 4);
      uint64_t v41 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v104;
        while (2)
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v104 != v43) {
              objc_enumerationMutation(obj);
            }
            v45 = *(void **)(*((void *)&v103 + 1) + 8 * v44);
            v46 = objc_alloc_init(NEIKEv2NotifyPayload);
            unsigned int v47 = [v45 notifyStatus];
            if (v46)
            {
              v46->_notifyType = v47;
              uint64_t v48 = [v45 notifyData];
              objc_setProperty_atomic(v46, v49, v48, 32);
            }
            else
            {
              uint64_t v48 = [v45 notifyData];
            }

            if (!-[NEIKEv2Packet addNotifyPayload:](v40, v46))
            {
              v70 = ne_log_obj();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_19DDAF000, v70, OS_LOG_TYPE_FAULT, "[sendKeepalive addNotifyPayload:notifyPayload] failed", buf, 2u);
              }

              [v4 sendCallbackSuccess:0 session:a1];
              SEL v35 = v40;
              if (a1) {
                id v72 = objc_getProperty(a1, v71, 336, 1);
              }
              else {
                id v72 = 0;
              }
              id v73 = v72;
              ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"[sendKeepalive addNotifyPayload:notifyPayload] failed", v74, v75, v76, v77, v78, v79, v80, v98);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v73, 3uLL, ErrorInternal);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];

              v84 = obj;
              goto LABEL_67;
            }

            ++v44;
          }
          while (v42 != v44);
          uint64_t v50 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
          uint64_t v42 = v50;
          if (v50) {
            continue;
          }
          break;
        }
      }

      SEL v35 = v40;
    }
    unint64_t v51 = *((void *)v4 + 5);
    int v52 = *((_DWORD *)v4 + 6);
    Error = (void *)NEIKEv2CreateError(3);
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke;
    v101[3] = &unk_1E5990558;
    v101[4] = a1;
    id v54 = v4;
    id v102 = v54;
    int v55 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]((uint64_t)a1, v35, v51, v52, Error, 0, 0xFFFFFFFFLL, 0, v101);

    if (v55 == -1)
    {
      [v54 sendCallbackSuccess:0 session:a1];
      if (a1) {
        id v86 = objc_getProperty(a1, v85, 336, 1);
      }
      else {
        id v86 = 0;
      }
      id v87 = v86;
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"informational packet", v88, v89, v90, v91, v92, v93, v94, v99);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v87, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }
    else
    {
      uint64_t v56 = ne_log_obj();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v108 = a1;
        __int16 v109 = 2112;
        id v110 = v54;
        __int16 v111 = 1024;
        int v112 = v55;
        _os_log_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_INFO, "%@ Sent %@ with message ID %d", buf, 0x1Cu);
      }
    }
    v84 = v102;
LABEL_67:
  }
  else
  {
    v57 = ne_log_obj();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v108 = a1;
      _os_log_error_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_ERROR, "%@ Failed to create informational packet", buf, 0xCu);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    id v59 = objc_getProperty(a1, v58, 336, 1);
    v67 = (void *)NEIKEv2CreateErrorInternal(@"Failed to create informational packet", v60, v61, v62, v63, v64, v65, v66, v98);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v59, 3uLL, v67);

    [(NEIKEv2Session *)a1 reportState];
    [(NEIKEv2Session *)(uint64_t)a1 resetAll];
  }

LABEL_72:
}

void __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v9;
      id v8 = "%@ Failed to receive informational packet";
      uint64_t v10 = v6;
      uint32_t v11 = 12;
LABEL_32:
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, v8, buf, v11);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = ne_log_large_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v46 = v42;
      __int16 v47 = 2112;
      id v48 = v3;
      id v8 = "%@ Received packet was not informational as expected %@";
      goto LABEL_31;
    }
LABEL_9:

    [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v12, 336, 1);
    }
    id v14 = Property;
    Error = (void *)NEIKEv2CreateError(4);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, Error);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
    goto LABEL_12;
  }
  if ([(NEIKEv2Packet *)v3 hasErrors])
  {
    uint64_t v6 = ne_log_large_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v46 = v7;
      __int16 v47 = 2112;
      id v48 = v3;
      id v8 = "%@ Failed to process informational packet %@";
LABEL_31:
      uint64_t v10 = v6;
      uint32_t v11 = 22;
      goto LABEL_32;
    }
    goto LABEL_9;
  }
  id v18 = *(void **)(a1 + 32);
  if (!v18) {
    goto LABEL_22;
  }
  id v19 = objc_getProperty(v18, v5, 336, 1);
  if (!v19) {
    goto LABEL_22;
  }
  char v20 = v19[11];

  if ((v20 & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v21 = -[NEIKEv2Packet copyNotification:](v3, (const char *)0x4005);
  uint64_t v23 = v21;
  if (v21) {
    uint64_t v21 = objc_getProperty(v21, v22, 32, 1);
  }
  id v25 = v21;
  uint64_t v26 = *(void **)(a1 + 32);
  if (v26)
  {
    id v27 = objc_getProperty(v26, v24, 336, 1);
    uint64_t v29 = v27;
    if (v27) {
      id v27 = objc_getProperty(v27, v28, 496, 1);
    }
  }
  else
  {
    uint64_t v29 = 0;
    id v27 = 0;
  }
  id v30 = v27;
  char v31 = [v25 isEqualToData:v30];

  if ((v31 & 1) == 0)
  {
    int v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v35;
      _os_log_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_INFO, "%@ Successfully received informational packet, need SA update", buf, 0xCu);
    }

    id v37 = [NEIKEv2MOBIKEContext alloc];
    id v38 = *(id *)(a1 + 32);
    if (v38) {
      id v38 = objc_getProperty(v38, v36, 368, 1);
    }
    id v39 = v38;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke_28;
    v43[3] = &unk_1E59905A8;
    uint64_t v40 = *(void **)(a1 + 40);
    v43[4] = *(void *)(a1 + 32);
    id v44 = v40;
    uint64_t v41 = -[NEIKEv2MOBIKEContext initWithMOBIKEInterface:mobikeEndpoint:invalidateTransport:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]((id *)&v37->super.super.isa, 0, 0, 0, 4, 0, v39, v43);

    -[NEIKEv2Session initiateMOBIKE:](*(unsigned char **)(a1 + 32), v41);
  }
  else
  {
LABEL_22:
    id v32 = ne_log_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v33;
      _os_log_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_INFO, "%@ Successfully received informational packet", buf, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:1 session:*(void *)(a1 + 32)];
  }
LABEL_12:
}

void __50__NEIKEv2Session_Exchange__initiateInformational___block_invoke_28(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a2;
  uint64_t v9 = ne_log_obj();
  uint64_t v10 = v9;
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "%@ Updated remote SA successfully", (uint8_t *)&v18, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:1 session:v8];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v17;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to remote SA", (uint8_t *)&v18, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    if (v8) {
      id Property = objc_getProperty(v8, v12, 336, 1);
    }
    else {
      id Property = 0;
    }
    id v14 = Property;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, v7);

    [(NEIKEv2Session *)v8 reportState];
    [(NEIKEv2Session *)(uint64_t)v8 resetAll];
  }
}

- (void)initiateMOBIKE:(unsigned char *)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    if (!a1[15]) {
      __assert_rtn("-[NEIKEv2Session(Exchange) initiateMOBIKE:]", "NEIKEv2Exchange.m", 2917, "self.hasOutboundRequestInFlight");
    }
    if (!v4)
    {
      uint64_t v8 = ne_log_obj();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v59 = "-[NEIKEv2Session(Exchange) initiateMOBIKE:]";
        _os_log_fault_impl(&dword_19DDAF000, (os_log_t)v8, OS_LOG_TYPE_FAULT, "%s called with null mobikeContext", buf, 0xCu);
      }
      goto LABEL_33;
    }
    id v7 = objc_getProperty(a1, v6, 336, 1);
    if (!v7)
    {
      v53 = ne_log_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v59 = "-[NEIKEv2Session(Exchange) initiateMOBIKE:]";
        _os_log_fault_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v8 = 0;
      goto LABEL_33;
    }
    uint64_t v8 = (uint64_t)v7;
    if ((v7[11] & 1) == 0)
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "MOBIKE not supported for this IKE SA. Ignoring request", buf, 2u);
      }

      Error = (void *)NEIKEv2CreateError(9);
      -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v4, 0, a1, Error);
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    if (*((unsigned char *)v4 + 24))
    {
      -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v7, 1);
      uint64_t v12 = objc_getProperty(a1, v11, 360, 1);
      if (v12)
      {
        *(void *)(v12 + 64) = 1000;
        *(_DWORD *)(v12 + 12) = -1;
        *(void *)(v12 + 16) = 0;
        *(void *)(v12 + 24) = 0;
        *(_OWORD *)(v12 + 32) = xmmword_19DF9BF00;
        *(_OWORD *)(v12 + 48) = xmmword_19DF9BF10;
        *(_WORD *)(v12 + 8) = 0;
      }
    }
    id v13 = v4[4];
    objc_setProperty_atomic((id)v8, v14, v13, 304);

    id v15 = v4[5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_27:
      -[NEIKEv2IKESA setState:error:](v8, 4uLL, 0);
      [(NEIKEv2Session *)a1 reportState];
      Error = [(NEIKEv2IKESA *)(id *)v8 copyTransport];
      if (Error)
      {
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = (uint64_t)__43__NEIKEv2Session_Exchange__initiateMOBIKE___block_invoke;
        v56[3] = (uint64_t)&unk_1E5992328;
        v56[4] = (uint64_t)a1;
        v57 = v4;
        -[NEIKEv2Transport waitForTransport:]((uint64_t)Error, v56);
      }
      else
      {
        id v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to create a new transport for IKE SA", buf, 2u);
        }

        ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Initiate MOBIKE failed to create a new transport for IKE SA", v45, v46, v47, v48, v49, v50, v51, v56[0]);
        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v4, 0, a1, ErrorInternal);
      }
      goto LABEL_32;
    }
    id v17 = v4[5];
    int v18 = v17;
    if (v17)
    {
      if ([v17 address])
      {
        if (nelog_is_debug_logging_enabled())
        {
          uint64_t v19 = ne_log_obj();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v59 = (const char *)v8;
            __int16 v60 = 2112;
            uint64_t v61 = v18;
            _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "Setting remote address of %@ to %@", buf, 0x16u);
          }
        }
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F38BC8], "endpointWithAddress:", objc_msgSend(v18, "address"));
        objc_setProperty_atomic((id)v8, v21, v20, 72);

        if (!*(_WORD *)(objc_msgSend(objc_getProperty((id)v8, v22, 72, 1), "address") + 2))
        {
          char v24 = *(unsigned char *)(v8 + 12);
          uint64_t v25 = objc_msgSend(objc_getProperty((id)v8, v23, 72, 1), "address");
          if (v24) {
            __int16 v26 = -27631;
          }
          else {
            __int16 v26 = -3071;
          }
          *(_WORD *)(v25 + 2) = v26;
        }
        objc_setProperty_atomic((id)v8, v23, 0, 64);
        id v28 = objc_getProperty((id)v8, v27, 464, 1);
        id Property = objc_getProperty((id)v8, v29, 32, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v28, Property, 0);

        id v32 = objc_getProperty((id)v8, v31, 472, 1);
        id v34 = objc_getProperty((id)v8, v33, 32, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v32, v34, 0);

        id v36 = objc_getProperty((id)v8, v35, 480, 1);
        id v38 = objc_getProperty((id)v8, v37, 32, 1);
        -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v36, v38, 0);

        objc_setProperty_atomic((id)v8, v39, 0, 464);
        objc_setProperty_atomic((id)v8, v40, 0, 472);
        objc_setProperty_atomic((id)v8, v41, 0, 480);
        goto LABEL_26;
      }
      id v54 = ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      {
LABEL_44:

LABEL_26:
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136315138;
      id v59 = "-[NEIKEv2IKESA resetRemoteAddress:]";
      int v55 = "%s called with null remoteAddress.address";
    }
    else
    {
      id v54 = ne_log_obj();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 136315138;
      id v59 = "-[NEIKEv2IKESA resetRemoteAddress:]";
      int v55 = "%s called with null remoteAddress";
    }
    _os_log_fault_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_FAULT, v55, buf, 0xCu);
    goto LABEL_44;
  }
LABEL_34:
}

void __43__NEIKEv2Session_Exchange__initiateMOBIKE___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = (id *)Property;
  [(NEIKEv2IKESA *)v4 resyncAddress];

  uint64_t v6 = *(unsigned int **)(a1 + 32);
  uint64_t v8 = *(id *)(a1 + 40);
  if (v6)
  {
    uint64_t v9 = objc_getProperty(v6, v7, 368, 1);
    dispatch_assert_queue_V2(v9);

    id v11 = objc_getProperty(v6, v10, 336, 1);
    id v13 = v11;
    if (v11)
    {
      id v14 = objc_getProperty(v11, v12, 64, 1);

      if (v14)
      {
        if (v8)
        {
          int v15 = v8[7];
          unint64_t v16 = *((void *)v8 + 6);
        }
        else
        {
          int v15 = 0;
          unint64_t v16 = 0;
        }
        *(void *)&long long v58 = MEMORY[0x1E4F143A8];
        *((void *)&v58 + 1) = 3221225472;
        id v59 = __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke;
        __int16 v60 = &unk_1E5990738;
        uint64_t v61 = v8;
        uint64_t v62 = v6;
        id v63 = v13;
        id v17 = &v58;
        uint64_t v19 = objc_getProperty(v6, v18, 368, 1);
        dispatch_assert_queue_V2(v19);

        id v21 = objc_getProperty(v6, v20, 336, 1);
        uint64_t v22 = v6[6];
        uint64_t v24 = objc_getProperty(v6, v23, 376, 1);
        uint64_t v25 = (void *)v24;
        if (v22 == -1 || !v24)
        {
          v59((uint64_t)v17, 0);
        }
        else
        {
          unint64_t v50 = v16;
          __int16 v26 = ne_log_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "Re-sending previous MOBIKE request", buf, 2u);
          }

          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v53 = 3221225472;
          id v54 = __87__NEIKEv2Session_Exchange__resendPreviousMOBIKEInnerWithRetries_retryInterval_handler___block_invoke;
          int v55 = &unk_1E5990940;
          SEL v27 = v17;
          v57 = v27;
          id v56 = v21;
          if (-[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:]((uint64_t)v6, v25, v50, v15, 0, 1, v22, 0, buf) == -1)
          {
            id v28 = ne_log_obj();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v51 = 0;
              _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "Resend previous MOBIKE, failed to send Informational packet", v51, 2u);
            }

            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"resend previous MOBIKE, failed to send Informational packet", v29, v30, v31, v32, v33, v34, v35, v49);
            v59((uint64_t)v27, ErrorFailedToSend);
          }
        }

        ErrorInternal = v61;
        goto LABEL_23;
      }
      SEL v37 = ne_log_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v58) = 0;
        _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to fetch new local address for IKE SA", (uint8_t *)&v58, 2u);
      }

      uint64_t v45 = @"Initiate MOBIKE failed to fetch new local address for IKE SA";
    }
    else
    {
      uint64_t v47 = ne_log_obj();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        LODWORD(v58) = 136315138;
        *(void *)((char *)&v58 + 4) = "-[NEIKEv2Session(Exchange) initiateMOBIKEInner:]";
        _os_log_fault_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", (uint8_t *)&v58, 0xCu);
      }

      uint64_t v45 = @"Initiate MOBIKE failed, no IKE SA";
    }
    ErrorInternal = (void *)NEIKEv2CreateErrorInternal(v45, v38, v39, v40, v41, v42, v43, v44, v48);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:]((id *)v8, 0, v6, ErrorInternal);
LABEL_23:
  }
}

void __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(id **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v3, 0, v4, a2);
    return;
  }
  uint64_t v5 = *(id *)(a1 + 48);
  self;
  if (!v5)
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v87 = "+[NEIKEv2InformationalPacket(Exchange) createUpdateAddressInitiator:]";
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
    }
    uint64_t v22 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2InformationalPacket alloc]);
  id v7 = v6;
  if (!v6)
  {
    id v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    SEL v23 = "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed";
LABEL_38:
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v23, buf, 2u);
    goto LABEL_14;
  }
  if (-[NEIKEv2Packet addNotification:data:](v6, 0x4010uLL, 0))
  {
    uint64_t v9 = [(NEIKEv2IKESA *)v5 initiatorSPI];
    id v11 = [(NEIKEv2IKESA *)v5 responderSPI];
    id v13 = objc_getProperty(v5, v12, 64, 1);
    id v14 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v9, v11, v13);

    if (-[NEIKEv2Packet addNotification:data:](v7, 0x4004uLL, v14))
    {
      unint64_t v16 = [(NEIKEv2IKESA *)v5 initiatorSPI];
      SEL v18 = [(NEIKEv2IKESA *)v5 responderSPI];
      id v20 = objc_getProperty(v5, v19, 72, 1);
      id v21 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v16, v18, v20);

      if (-[NEIKEv2Packet addNotification:data:](v7, 0x4005uLL, v21))
      {
        uint64_t v22 = v7;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed", buf, 2u);
      }
    }
    else
    {
      id v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed", buf, 2u);
      }
    }
    uint64_t v22 = 0;
    goto LABEL_21;
  }
  id v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    SEL v23 = "[packet addNotification:NEIKEv2NotifyTypeUpdateSAAddresses] failed";
    goto LABEL_38;
  }
LABEL_14:
  uint64_t v22 = 0;
LABEL_22:

LABEL_23:
  if (v22)
  {
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    if (v25)
    {
      unint64_t v27 = *(void *)(v25 + 48);
      int v28 = *(_DWORD *)(v25 + 28);
    }
    else
    {
      unint64_t v27 = 0;
      int v28 = 0;
    }
    Error = (void *)NEIKEv2CreateError(3);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke_646;
    v82[3] = &unk_1E59908F0;
    v82[4] = *(void *)(a1 + 40);
    v83 = v22;
    id v84 = *(id *)(a1 + 32);
    id v85 = *(id *)(a1 + 48);
    int v30 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:](v26, v83, v27, v28, Error, 0, 0xFFFFFFFFLL, 0, v82);

    if (v30 == -1)
    {
      uint64_t v38 = *(id **)(a1 + 32);
      uint64_t v39 = *(void **)(a1 + 40);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator update addresses", v31, v32, v33, v34, v35, v36, v37, v79);
      -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v38, 0, v39, ErrorFailedToSend);

      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v41, 336, 1);
      }
      id v43 = Property;
      uint64_t v51 = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator update addresses", v44, v45, v46, v47, v48, v49, v50, v80);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v43, 3uLL, v51);

      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
      [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
    }
  }
  else
  {
    id v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to create Update Addresses packet", buf, 2u);
    }

    int v55 = *(id **)(a1 + 32);
    id v56 = *(void **)(a1 + 40);
    ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Initiate MOBIKE failed to create Update Addresses packet", v57, v58, v59, v60, v61, v62, v63, v78);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v55, 0, v56, ErrorInternal);

    id v66 = *(id *)(a1 + 40);
    if (v66) {
      id v66 = objc_getProperty(v66, v65, 336, 1);
    }
    id v67 = v66;
    uint64_t v75 = (void *)NEIKEv2CreateErrorInternal(@"Initiate MOBIKE failed to create Update Addresses packet", v68, v69, v70, v71, v72, v73, v74, v81);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, v75);

    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
  }
}

void __87__NEIKEv2Session_Exchange__resendPreviousMOBIKEInnerWithRetries_retryInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Resend previous MOBIKE, failed to receive Informational packet again", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = @"Resend previous MOBIKE, failed to receive Informational packet again";
    goto LABEL_10;
  }
  if ((-[NEIKEv2InformationalPacket validateUpdateAddresses:](v3, *(void **)(a1 + 32)) & 1) == 0)
  {
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Resend previous MOBIKE, failed to process Informational packet", (uint8_t *)&v16, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = @"Resend previous MOBIKE, failed to process Informational packet";
LABEL_10:
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v13, v5, v6, v7, v8, v9, v10, v11, v16);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, ErrorPeerInvalidSyntax);

    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

void __48__NEIKEv2Session_Exchange__initiateMOBIKEInner___block_invoke_646(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[NEIKEv2Session setSentMOBIKERequest:messageID:](*(void *)(a1 + 32), 0, -1);
    if (-[NEIKEv2InformationalPacket validateUpdateAddresses:](v3, *(void **)(a1 + 56)))
    {
      if ([(NEIKEv2Session *)*(void *)(a1 + 32) migrateAllChildSAs])
      {
        [(NEIKEv2Session *)*(void **)(a1 + 32) reportConfiguration];
        uint64_t v6 = *(void *)(a1 + 56);
        if (v6)
        {
          *(_WORD *)(v6 + 26) = 0;
          *(void *)(v6 + 120) = 0;
          *(unsigned char *)(v6 + 21) = 0;
          uint64_t v7 = *(void *)(a1 + 56);
        }
        else
        {
          uint64_t v7 = 0;
        }
        -[NEIKEv2IKESA setState:error:](v7, 2uLL, 0);
        [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
        uint64_t v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v54) = 0;
          _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "Initiate MOBIKE switched IKE SA addresses", (uint8_t *)&v54, 2u);
        }

        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](*(id **)(a1 + 48), 1, *(void **)(a1 + 32), 0);
      }
      else
      {
        int v30 = ne_log_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int v55 = 0;
          _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to migrate child SAs", v55, 2u);
        }

        uint64_t v31 = *(id **)(a1 + 48);
        uint64_t v32 = *(void **)(a1 + 32);
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Initiate MOBIKE failed to migrate child SAs", v33, v34, v35, v36, v37, v38, v39, v54);
        -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v31, 0, v32, ErrorInternal);

        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v41, 336, 1);
        }
        id v43 = Property;
        uint64_t v51 = (void *)NEIKEv2CreateErrorInternal(@"Initiate MOBIKE failed to migrate child SAs", v44, v45, v46, v47, v48, v49, v50, v54);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v43, 3uLL, v51);

        [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
        [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
      }
    }
    else
    {
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v56 = 0;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to process Informational packet", v56, 2u);
      }

      ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Initiate MOBIKE failed to process Informational packet", v17, v18, v19, v20, v21, v22, v23, v54);
      -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](*(id **)(a1 + 48), 0, *(void **)(a1 + 32), ErrorPeerInvalidSyntax);
      id v26 = *(id *)(a1 + 32);
      if (v26) {
        id v26 = objc_getProperty(v26, v25, 336, 1);
      }
      id v27 = v26;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorPeerInvalidSyntax);

      [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
      [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
    }
  }
  else
  {
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Initiate MOBIKE failed to receive Informational packet", buf, 2u);
    }

    uint64_t v11 = *(_DWORD **)(a1 + 40);
    if (v11) {
      int v12 = v11[6];
    }
    else {
      int v12 = 0;
    }
    -[NEIKEv2Session setSentMOBIKERequest:messageID:](*(void *)(a1 + 32), v11, v12);
    id v13 = *(id **)(a1 + 48);
    id v14 = *(void **)(a1 + 32);
    Error = (void *)NEIKEv2CreateError(3);
    -[NEIKEv2MOBIKEContext sendCallbackSuccess:session:error:](v13, 0, v14, Error);
  }
}

- (void)receiveInformational:(unsigned char *)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336, 1);
    if (!v7)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        LODWORD(v39) = 136315138;
        *(void *)((char *)&v39 + 4) = "-[NEIKEv2Session(Exchange) receiveInformational:]";
        _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", (uint8_t *)&v39, 0xCu);
      }
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4 && ![(NEIKEv2Packet *)v4 hasErrors])
      {
        if ((a1[11] & 1) == 0)
        {
          int v12 = (double *)objc_getProperty(a1, v9, 336, 1);
          id v14 = v12;
          if (v12)
          {
            uint64_t v15 = objc_msgSend(objc_getProperty(v12, v13, 88, 1), "deadPeerDetectionReceiveIntervalTriggerReporting");
            if (v15)
            {
              unint64_t v16 = v15;
              double Current = CFAbsoluteTimeGetCurrent();
              double v19 = v14[15];
              if (v19 == 0.0
                || Current - v19 > (double)v16
                || (unsigned __int16 v20 = *((_WORD *)v14 + 13) + 1,
                    *((_WORD *)v14 + 13) = v20,
                    objc_msgSend(objc_getProperty(v14, v17, 88, 1), "deadPeerDetectionReceiveMaxShortDPDBeforeReporting") > v20)|| (*((unsigned char *)v14 + 21) & 1) != 0)
              {
                v14[15] = Current;
              }
              else
              {
                *((unsigned char *)v14 + 21) = 1;
                v14[15] = Current;

                if (objc_getProperty(a1, v21, 336, 1))
                {
                  id v14 = [a1 shortDPDEventBlock];
                  uint64_t v22 = [a1 clientQueue];

                  if (v22 && v14)
                  {
                    uint64_t v23 = [a1 clientQueue];
                    *(void *)&long long v39 = MEMORY[0x1E4F143A8];
                    *((void *)&v39 + 1) = 3221225472;
                    uint64_t v40 = __32__NEIKEv2Session_reportShortDPD__block_invoke;
                    uint64_t v41 = &unk_1E59936F8;
                    uint64_t v42 = a1;
                    id v14 = v14;
                    id v43 = v14;
                    dispatch_async(v23, &v39);
                  }
                }
                else
                {
                  ne_log_obj();
                  id v14 = (double *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(v39) = 136315138;
                    *(void *)((char *)&v39 + 4) = "-[NEIKEv2Session reportShortDPD]";
                    _os_log_fault_impl(&dword_19DDAF000, (os_log_t)v14, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", (uint8_t *)&v39, 0xCu);
                  }
                }
              }
            }
          }

          -[NEIKEv2Session reportPrivateNotifiesInPacket:]((id *)a1, v4);
          id v25 = objc_getProperty(a1, v24, 336, 1);
          uint64_t v10 = +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]((uint64_t)NEIKEv2InformationalPacket, v4, v25);

          if (v10)
          {
            if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v10, 0) & 1) == 0)
            {
              id v27 = objc_getProperty(a1, v26, 336, 1);
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"informational reply", v28, v29, v30, v31, v32, v33, v34, v39);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorFailedToSend);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
            }
          }
          else
          {
            uint64_t v38 = ne_log_obj();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v39) = 138412290;
              *(void *)((char *)&v39 + 4) = a1;
              _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "%@ Failed to create Keepalive packet", (uint8_t *)&v39, 0xCu);
            }

            uint64_t v10 = 0;
          }
          goto LABEL_11;
        }
        uint64_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v39) = 138412290;
          *(void *)((char *)&v39 + 4) = a1;
          uint64_t v11 = "%@ Session has been aborted, cannot process informational";
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v39) = 138412290;
          *(void *)((char *)&v39 + 4) = a1;
          uint64_t v11 = "%@ Failed to process informational packet";
LABEL_34:
          _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v39, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v39) = 138412290;
        *(void *)((char *)&v39 + 4) = a1;
        uint64_t v11 = "%@ Failed to receive informational packet";
        goto LABEL_34;
      }
    }
LABEL_11:
  }
}

- (void)retryCookieForIKESA:(uint64_t)a3 validated:(void *)a4 handler:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = objc_getProperty(a1, v8, 368, 1);
    dispatch_assert_queue_V2(v10);

    if ((a3 & 1) != 0
      || (!v7 ? (id Property = 0) : (id Property = objc_getProperty(v7, v11, 280, 1)),
          id v13 = Property,
          v13,
          !v13))
    {
      v9[2](v9, a3);
    }
    else
    {
      [(NEIKEv2Session *)a1 resetMessages];
      uint64_t v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = a1;
        _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ Received cookie notification, retrying IKE SA Init with cookie (connect retry cookie)", buf, 0xCu);
      }

      unint64_t v16 = +[NEIKEv2IKESAInitPacket createIKESAInitForInitiatorIKESA:]((uint64_t)NEIKEv2IKESAInitPacket, v7);
      if (v16)
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __66__NEIKEv2Session_Exchange__retryCookieForIKESA_validated_handler___block_invoke;
        v43[3] = &unk_1E59905D0;
        v43[4] = a1;
        id v44 = v7;
        uint64_t v45 = v9;
        if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v16, v43) == -1)
        {
          id v18 = objc_getProperty(a1, v17, 336, 1);
          ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"retry SA INIT cookie", v19, v20, v21, v22, v23, v24, v25, v42);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v18, 3uLL, ErrorFailedToSend);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }
      }
      else
      {
        uint64_t v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v47 = a1;
          _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init retry packet (connect retry cookie)", buf, 0xCu);
        }

        id v31 = objc_getProperty(a1, v30, 336, 1);
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init retry packet (connect retry cookie)", v32, v33, v34, v35, v36, v37, v38, v42);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v31, 3uLL, ErrorInternal);

        [(NEIKEv2Session *)a1 reportState];
        [(NEIKEv2Session *)(uint64_t)a1 resetAll];
      }
    }
  }
}

void __66__NEIKEv2Session_Exchange__retryCookieForIKESA_validated_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40)))
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v22 = 138412290;
        *(void *)&v22[4] = v21;
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to parse IKE SA Init retry reply (connect retry cookie)", v22, 0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v4();
  }
  else
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)&v22[4] = v20;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE SA Init retry reply (connect retry cookie)", v22, 0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 336, 1);
    }
    id v8 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE SA Init retry reply (connect retry cookie)", v9, v10, v11, v12, v13, v14, v15, *(uint64_t *)v22);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
  }
}

void __62__NEIKEv2Session_Exchange__retryKEForIKESA_validated_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40)))
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v22 = 138412290;
        *(void *)&v22[4] = v21;
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to parse IKE SA Init retry reply (connect retry KE)", v22, 0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v4();
  }
  else
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)&v22[4] = v20;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE SA Init retry reply (connect retry KE)", v22, 0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 336, 1);
    }
    id v8 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE SA Init retry reply (connect retry KE)", v9, v10, v11, v12, v13, v14, v15, *(uint64_t *)v22);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
  }
}

- (void)handleIKEIntermediateForInitiatorIKESA:(unint64_t)a3 iteration:(void *)a4 handler:
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = objc_getProperty(a1, v8, 368, 1);
    dispatch_assert_queue_V2(v10);

    if (v7)
    {
      id Property = objc_getProperty(v7, v11, 96, 1);
      uint64_t v14 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v13, 120, 1);
      }
    }
    else
    {
      uint64_t v14 = 0;
      id Property = 0;
    }
    id v15 = Property;
    unint64_t v16 = [v15 count];

    if (v16 > a3)
    {
      if (v7)
      {
        id v18 = objc_getProperty(v7, v17, 96, 1);
        uint64_t v20 = v18;
        if (v18) {
          id v18 = objc_getProperty(v18, v19, 120, 1);
        }
      }
      else
      {
        uint64_t v20 = 0;
        id v18 = 0;
      }
      id v21 = v18;
      uint64_t v22 = [v21 objectAtIndexedSubscript:a3];

      if (v7) {
        id v24 = objc_getProperty(v7, v23, 96, 1);
      }
      else {
        id v24 = 0;
      }
      id v25 = v24;
      id v26 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v25);
      id v27 = [v26 objectForKeyedSubscript:v22];

      if (v27)
      {
        if (-[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v7, v27))
        {
          uint64_t v28 = -[NEIKEv2Packet initOutbound]([NEIKEv2IntermediatePacket alloc]);
          uint64_t v29 = objc_alloc_init(NEIKEv2KeyExchangePayload);
          id v31 = v29;
          if (v28)
          {
            objc_setProperty_atomic(v28, v30, v29, 88);

            id v33 = objc_getProperty(v28, v32, 88, 1);
            uint64_t v35 = v33;
            if (v33) {
              objc_setProperty_atomic(v33, v34, v27, 24);
            }
          }
          else
          {

            uint64_t v35 = 0;
          }

          id v110 = v22;
          if (v7)
          {
            id v37 = objc_getProperty(v7, v36, 160, 1);
            uint64_t v38 = v37;
            if (v37)
            {
              long long v39 = (void *)*((void *)v37 + 2);
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v38 = 0;
          }
          long long v39 = 0;
LABEL_19:
          id v40 = v39;
          uint64_t v42 = v40;
          if (v28)
          {
            id v43 = objc_getProperty(v28, v41, 88, 1);
            uint64_t v45 = v43;
            if (v43) {
              objc_setProperty_atomic(v43, v44, v42, 32);
            }

            id v47 = objc_getProperty(v28, v46, 88, 1);
          }
          else
          {

            id v47 = 0;
          }
          id v48 = v47;
          char v49 = -[NEIKEv2Payload isValid]((uint64_t)v48);

          if ((v49 & 1) == 0)
          {
            uint64_t v64 = ne_log_obj();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v117 = a1;
              _os_log_error_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE_INTERMEDIATE packet (connect intermediate)", buf, 0xCu);
            }

            id v66 = objc_getProperty(a1, v65, 336, 1);
            ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE_INTERMEDIATE packet (connect intermediate)", v67, v68, v69, v70, v71, v72, v73, v109);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v66, 3uLL, ErrorInternal);

            [(NEIKEv2Session *)a1 reportState];
            [(NEIKEv2Session *)(uint64_t)a1 resetAll];
            uint64_t v22 = v110;
            goto LABEL_40;
          }
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __85__NEIKEv2Session_Exchange__handleIKEIntermediateForInitiatorIKESA_iteration_handler___block_invoke;
          v111[3] = &unk_1E59905F8;
          v111[4] = a1;
          id v112 = v27;
          uint64_t v50 = v7;
          id v113 = v50;
          unint64_t v115 = a3;
          uint64_t v114 = v9;
          if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v28, v111) == -1)
          {
            id v55 = objc_getProperty(a1, v51, 336, 1);
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator IKE_INTERMEDIATE #%zu", v77, v78, v79, v80, v81, v82, v83, a3 + 1);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v55, 3uLL, ErrorFailedToSend);
            uint64_t v22 = v110;
          }
          else
          {
            if (v28) {
              int v52 = LODWORD(v28[3].isa) + 1;
            }
            else {
              int v52 = 1;
            }
            uint64_t v22 = v110;
            if (v7) {
              v50[7] = v52;
            }
            if (-[NEIKEv2IKESA updateIntAuthWithPacket:]((uint64_t)v50, v28)) {
              goto LABEL_39;
            }
            uint64_t v53 = ne_log_obj();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v117 = a1;
              _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE_INTERMEDIATE request packet for AUTH (connect intermediate)", buf, 0xCu);
            }

            id v55 = objc_getProperty(a1, v54, 336, 1);
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process IKE_INTERMEDIATE request packet for AUTH (connect intermediate)", v56, v57, v58, v59, v60, v61, v62, v109);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v55, 3uLL, ErrorFailedToSend);
          }

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
LABEL_39:

LABEL_40:
LABEL_41:

          goto LABEL_42;
        }
        v97 = ne_log_obj();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v117 = a1;
          __int16 v118 = 2112;
          v119 = v27;
          _os_log_error_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (connect intermediate)", buf, 0x16u);
        }

        id v88 = objc_getProperty(a1, v98, 336, 1);
        v96 = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (connect intermediate)", v99, v100, v101, v102, v103, v104, v105, (uint64_t)v27);
      }
      else
      {
        id v86 = ne_log_obj();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v117 = a1;
          __int16 v118 = 2112;
          v119 = v22;
          _os_log_error_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (connect intermediate)", buf, 0x16u);
        }

        id v88 = objc_getProperty(a1, v87, 336, 1);
        v96 = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (connect intermediate)", v89, v90, v91, v92, v93, v94, v95, (uint64_t)v22);
      }
      long long v106 = v96;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v88, 3uLL, v96);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
      goto LABEL_41;
    }
    v9[2](v9);
  }
LABEL_42:
}

void __85__NEIKEv2Session_Exchange__handleIKEIntermediateForInitiatorIKESA_iteration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id Property = v3;
    SEL v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24, 1);
        }
      }
      else
      {
        uint64_t v11 = 0;
        id v9 = 0;
      }
      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88, 1);
          unint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32, 1);
          }
        }
        else
        {
          unint64_t v16 = 0;
          id v14 = 0;
        }
        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88, 1);
            id v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24, 1);
            }
          }
          else
          {
            id v21 = 0;
            id v19 = 0;
          }
          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 40) method];

          if (v23 != v24)
          {
            uint64_t v56 = ne_log_obj();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              uint64_t v76 = *(void *)(a1 + 32);
              if (v6)
              {
                id v77 = objc_getProperty(v6, v57, 88, 1);
                uint64_t v79 = v77;
                if (v77) {
                  id v77 = objc_getProperty(v77, v78, 24, 1);
                }
              }
              else
              {
                uint64_t v79 = 0;
                id v77 = 0;
              }
              id v80 = v77;
              uint64_t v81 = [v80 method];
              uint64_t v82 = [*(id *)(a1 + 40) method];
              *(_DWORD *)buf = 138412802;
              uint64_t v119 = v76;
              __int16 v120 = 2048;
              uint64_t v121 = v81;
              __int16 v122 = 2048;
              uint64_t v123 = v82;
              _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (connect intermediate)", buf, 0x20u);
            }
            id v59 = *(id *)(a1 + 32);
            if (v59) {
              id v59 = objc_getProperty(v59, v58, 336, 1);
            }
            id v44 = v59;
            if (v6)
            {
              id v61 = objc_getProperty(v6, v60, 88, 1);
              uint64_t v53 = v61;
              if (v61) {
                id v61 = objc_getProperty(v61, v62, 24, 1);
              }
            }
            else
            {
              uint64_t v53 = 0;
              id v61 = 0;
            }
            id v63 = v61;
            uint64_t v64 = [v63 method];
            [*(id *)(a1 + 40) method];
            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (connect intermediate)", v65, v66, v67, v68, v69, v70, v71, v64);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v44, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_44;
          }
          if (v6)
          {
            id v26 = objc_getProperty(v6, v25, 88, 1);
            uint64_t v28 = v26;
            if (v26) {
              id v26 = objc_getProperty(v26, v27, 32, 1);
            }
          }
          else
          {
            uint64_t v28 = 0;
            id v26 = 0;
          }
          id v30 = v26;
          id v31 = *(void **)(a1 + 48);
          if (v31) {
            objc_setProperty_atomic(v31, v29, v30, 152);
          }

          if ([(NEIKEv2IKESA *)*(void *)(a1 + 48) processPrimaryKeyExchange])
          {
            if (-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 48), v6))
            {
              id v33 = *(unsigned char **)(a1 + 48);
              if (v33 && (-[NEIKEv2IKESA generateAllValuesUsingSA:](v33, *(void **)(a1 + 48)) & 1) != 0)
              {
                -[NEIKEv2Session handleIKEIntermediateForInitiatorIKESA:iteration:handler:](*(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 64) + 1, *(void *)(a1 + 56));
LABEL_45:

                goto LABEL_46;
              }
              v97 = ne_log_obj();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                uint64_t v115 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412290;
                uint64_t v119 = v115;
                _os_log_error_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_ERROR, "%@ Failed to generate crypto values (connect intermediate)", buf, 0xCu);
              }

              id v99 = *(id *)(a1 + 32);
              if (v99) {
                id v99 = objc_getProperty(v99, v98, 336, 1);
              }
              id v44 = v99;
              v107 = @"Failed to generate crypto values (connect intermediate)";
            }
            else
            {
              __int16 v111 = ne_log_obj();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
              {
                uint64_t v116 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412290;
                uint64_t v119 = v116;
                _os_log_error_impl(&dword_19DDAF000, v111, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE_INTERMEDIATE reply packet for AUTH (connect intermediate)", buf, 0xCu);
              }

              id v113 = *(id *)(a1 + 32);
              if (v113) {
                id v113 = objc_getProperty(v113, v112, 336, 1);
              }
              id v44 = v113;
              v107 = @"Failed to process IKE_INTERMEDIATE reply packet for AUTH (connect intermediate)";
            }
          }
          else
          {
            v108 = ne_log_obj();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v108, OS_LOG_TYPE_ERROR, "Failed to process KE data (connect intermediate)", buf, 2u);
            }

            id v110 = *(id *)(a1 + 32);
            if (v110) {
              id v110 = objc_getProperty(v110, v109, 336, 1);
            }
            id v44 = v110;
            v107 = @"Failed to process KE data (connect intermediate)";
          }
          ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v107, v100, v101, v102, v103, v104, v105, v106, v117);
LABEL_43:
          uint64_t v53 = ErrorCrypto;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v44, 3uLL, ErrorCrypto);
LABEL_44:

          [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
          [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
          goto LABEL_45;
        }
        char v49 = ne_log_obj();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = v75;
          _os_log_error_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (connect intermediate)", buf, 0xCu);
        }

        id v51 = *(id *)(a1 + 32);
        if (v51) {
          id v51 = objc_getProperty(v51, v50, 336, 1);
        }
        id v44 = v51;
        uint64_t v45 = @"Did not receive data in KE payload (connect intermediate)";
      }
      else
      {
        SEL v46 = ne_log_obj();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v74 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = v74;
          _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (connect intermediate)", buf, 0xCu);
        }

        id v48 = *(id *)(a1 + 32);
        if (v48) {
          id v48 = objc_getProperty(v48, v47, 336, 1);
        }
        id v44 = v48;
        uint64_t v45 = @"Did not receive method in KE payload (connect intermediate)";
      }
    }
    else
    {
      uint64_t v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v73 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v119 = v73;
        _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (connect intermediate)", buf, 0xCu);
      }

      id v36 = *(id *)(a1 + 32);
      if (v36) {
        id v36 = objc_getProperty(v36, v35, 336, 1);
      }
      id v44 = v36;
      uint64_t v45 = @"Did not receive KE payload (connect intermediate)";
    }
    ErrorCrypto = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v45, v37, v38, v39, v40, v41, v42, v43, v117);
    goto LABEL_43;
  }
  uint64_t v83 = ne_log_obj();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    uint64_t v114 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v119 = v114;
    _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE_INTERMEDIATE reply (connect intermediate)", buf, 0xCu);
  }

  id v85 = *(id *)(a1 + 32);
  if (v85) {
    id v85 = objc_getProperty(v85, v84, 336, 1);
  }
  id v86 = v85;
  uint64_t v94 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE_INTERMEDIATE reply (connect intermediate)", v87, v88, v89, v90, v91, v92, v93, v117);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v86, 3uLL, v94);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
LABEL_46:
}

- (uint64_t)handleIKEIntermediateForResponderIKESA:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    unint64_t v16 = objc_getProperty(a1, v15, 368, 1);
    dispatch_assert_queue_V2(v16);

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __120__NEIKEv2Session_Exchange__handleIKEIntermediateForResponderIKESA_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v31[3] = &unk_1E5990620;
    uint64_t v35 = a3;
    id v32 = v11;
    id v33 = a1;
    id v34 = v13;
    uint64_t v17 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v31);

    if ((v17 & 1) == 0)
    {
      id v19 = objc_getProperty(a1, v18, 336, 1);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"%@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v12);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void __120__NEIKEv2Session_Exchange__handleIKEIntermediateForResponderIKESA_iteration_replyPacket_replyPacketDescription_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  unint64_t v5 = *(void *)(a1 + 56);
  SEL v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 96, 1);
    id v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120, 1);
    }
  }
  else
  {
    id v9 = 0;
    id Property = 0;
  }
  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v4;
      id v14 = *(void **)(a1 + 32);
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 96, 1);
        uint64_t v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120, 1);
        }
      }
      else
      {
        uint64_t v17 = 0;
        id v15 = 0;
      }
      id v18 = v15;
      id v19 = [v18 objectAtIndexedSubscript:*(void *)(a1 + 56)];

      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 96, 1);
      }
      id v22 = v21;
      uint64_t v23 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v22);
      uint64_t v24 = [v23 objectForKeyedSubscript:v19];

      if (!v24)
      {
        v202 = ne_log_obj();
        if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
        {
          uint64_t v214 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v228 = v214;
          __int16 v229 = 2112;
          uint64_t v230 = (uint64_t)v19;
          _os_log_error_impl(&dword_19DDAF000, v202, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (receive intermediate)", buf, 0x16u);
        }

        id v204 = *(id *)(a1 + 40);
        if (v204) {
          id v204 = objc_getProperty(v204, v203, 336, 1);
        }
        id v116 = v204;
        ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (receive intermediate)", v205, v206, v207, v208, v209, v210, v211, (uint64_t)v19);
        goto LABEL_82;
      }
      if (v13) {
        id v26 = objc_getProperty(v13, v25, 88, 1);
      }
      else {
        id v26 = 0;
      }
      id v27 = v26;

      if (v27)
      {
        if (v13)
        {
          id v29 = objc_getProperty(v13, v28, 88, 1);
          id v31 = v29;
          if (v29) {
            id v29 = objc_getProperty(v29, v30, 24, 1);
          }
        }
        else
        {
          id v31 = 0;
          id v29 = 0;
        }
        id v32 = v29;

        if (v32)
        {
          if (v13)
          {
            id v34 = objc_getProperty(v13, v33, 88, 1);
            id v36 = v34;
            if (v34) {
              id v34 = objc_getProperty(v34, v35, 32, 1);
            }
          }
          else
          {
            id v36 = 0;
            id v34 = 0;
          }
          id v37 = v34;

          if (v37)
          {
            v226 = v19;
            if (v13)
            {
              id v39 = objc_getProperty(v13, v38, 88, 1);
              uint64_t v41 = v39;
              if (v39) {
                id v39 = objc_getProperty(v39, v40, 24, 1);
              }
            }
            else
            {
              uint64_t v41 = 0;
              id v39 = 0;
            }
            id v42 = v39;
            uint64_t v43 = [v42 method];
            uint64_t v44 = [v24 method];

            if (v43 != v44)
            {
              v128 = ne_log_obj();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                uint64_t v177 = *(void *)(a1 + 40);
                if (v13)
                {
                  id v178 = objc_getProperty(v13, v129, 88, 1);
                  v180 = v178;
                  if (v178) {
                    id v178 = objc_getProperty(v178, v179, 24, 1);
                  }
                }
                else
                {
                  v180 = 0;
                  id v178 = 0;
                }
                id v181 = v178;
                *(_DWORD *)buf = 138412802;
                uint64_t v228 = v177;
                __int16 v229 = 2048;
                uint64_t v230 = [v181 method];
                __int16 v231 = 2048;
                uint64_t v232 = [v24 method];
                _os_log_error_impl(&dword_19DDAF000, v128, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (receive intermediate)", buf, 0x20u);
              }
              id v131 = *(id *)(a1 + 40);
              if (v131) {
                id v131 = objc_getProperty(v131, v130, 336, 1);
              }
              id v133 = v131;
              if (v13)
              {
                id v134 = objc_getProperty(v13, v132, 88, 1);
                v136 = v134;
                if (v134) {
                  id v134 = objc_getProperty(v134, v135, 24, 1);
                }
              }
              else
              {
                v136 = 0;
                id v134 = 0;
              }
              id v137 = v134;
              uint64_t v138 = [v137 method];
              [v24 method];
              ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (receive intermediate)", v139, v140, v141, v142, v143, v144, v145, v138);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v133, 3uLL, ErrorPeerInvalidSyntax);

              [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
              [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
              id v19 = v226;
              goto LABEL_83;
            }
            SEL v46 = *(void **)(a1 + 32);
            if (v13)
            {
              id v47 = objc_getProperty(v13, v45, 88, 1);
              char v49 = v47;
              if (v47) {
                id v47 = objc_getProperty(v47, v48, 32, 1);
              }
            }
            else
            {
              char v49 = 0;
              id v47 = 0;
            }
            id v50 = v47;
            char v51 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:peerPayload:](v46, v24, v50);

            if (v51)
            {
              int v52 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IntermediatePacket alloc], v13);
              uint64_t v53 = objc_alloc_init(NEIKEv2KeyExchangePayload);
              id v55 = v53;
              if (v52)
              {
                objc_setProperty_atomic(v52, v54, v53, 88);

                id v57 = objc_getProperty(v52, v56, 88, 1);
                id v59 = v57;
                if (v57) {
                  objc_setProperty_atomic(v57, v58, v24, 24);
                }
              }
              else
              {

                id v59 = 0;
              }

              id v61 = *(void **)(a1 + 32);
              if (v61)
              {
                id v62 = objc_getProperty(v61, v60, 160, 1);
                id v63 = v62;
                if (v62)
                {
                  uint64_t v64 = (void *)*((void *)v62 + 2);
                  goto LABEL_37;
                }
              }
              else
              {
                id v63 = 0;
              }
              uint64_t v64 = 0;
LABEL_37:
              id v66 = v64;
              if (v52)
              {
                id v67 = objc_getProperty(v52, v65, 88, 1);
                uint64_t v69 = v67;
                if (v67) {
                  objc_setProperty_atomic(v67, v68, v66, 32);
                }
              }
              else
              {
                uint64_t v69 = 0;
              }

              if (v13) {
                id v71 = objc_getProperty(v13, v70, 88, 1);
              }
              else {
                id v71 = 0;
              }
              id v72 = v71;
              char v73 = -[NEIKEv2Payload isValid]((uint64_t)v72);

              if ((v73 & 1) == 0)
              {
                v159 = ne_log_obj();
                if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v183 = *(void *)(a1 + 40);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v228 = v183;
                  _os_log_error_impl(&dword_19DDAF000, v159, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE_INTERMEDIATE packet (receive intermediate)", buf, 0xCu);
                }

                v163 = *(void **)(a1 + 40);
                v162 = (uint64_t *)(a1 + 40);
                id v161 = v163;
                if (v163) {
                  id v161 = objc_getProperty(v161, v160, 336, 1);
                }
                id v102 = v161;
                ErrorCrypto = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE_INTERMEDIATE packet (receive intermediate)", v164, v165, v166, v167, v168, v169, v170, v224);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v102, 3uLL, ErrorCrypto);
                id v85 = v162;
                goto LABEL_102;
              }
              uint64_t v75 = *(void **)(a1 + 32);
              if (v75)
              {
                id v76 = objc_getProperty(v75, v74, 160, 1);
                id v77 = v76;
                if (v76)
                {
                  uint64_t v78 = (void *)*((void *)v76 + 3);
LABEL_46:
                  id v80 = v78;
                  uint64_t v81 = *(void **)(a1 + 32);
                  if (v81) {
                    objc_setProperty_atomic(v81, v79, v80, 168);
                  }

                  uint64_t v83 = *(void **)(a1 + 32);
                  if (v83)
                  {
                    objc_setProperty_atomic(v83, v82, 0, 160);
                    uint64_t v84 = *(void *)(a1 + 32);
                  }
                  else
                  {
                    uint64_t v84 = 0;
                  }
                  id v85 = (uint64_t *)(a1 + 40);
                  uint64_t v86 = *(void *)(a1 + 40);
                  uint64_t v87 = *(void *)(a1 + 56) + 1;
                  id v88 = [NSString alloc];
                  uint64_t v225 = *(void *)(a1 + 56) + 1;
                  uint64_t v89 = (void *)[v88 initWithFormat:@"responder IKE_INTERMEDIATE #%zu"];
                  int v90 = -[NEIKEv2Session handleIKEIntermediateForResponderIKESA:iteration:replyPacket:replyPacketDescription:handler:](v86, v84, v87, v52, v89, *(void *)(a1 + 48));

                  id v19 = v226;
                  if (!v90) {
                    goto LABEL_103;
                  }
                  if (-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 32), v13))
                  {
                    if (-[NEIKEv2IKESA updateIntAuthWithPacket:](*(void *)(a1 + 32), v52))
                    {
                      uint64_t v91 = *(unsigned char **)(a1 + 32);
                      if (v91 && (-[NEIKEv2IKESA generateAllValuesUsingSA:](v91, *(void **)(a1 + 32)) & 1) != 0) {
                        goto LABEL_103;
                      }
                      uint64_t v92 = ne_log_obj();
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v221 = *v85;
                        *(_DWORD *)buf = 138412290;
                        uint64_t v228 = v221;
                        _os_log_error_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_ERROR, "%@ Failed to generate crypto values (receive intermediate)", buf, 0xCu);
                      }

                      id v94 = (id)*v85;
                      if (*v85) {
                        id v94 = objc_getProperty(v94, v93, 336, 1);
                      }
                      id v102 = v94;
                      uint64_t v103 = @"Failed to generate crypto values (receive intermediate)";
                    }
                    else
                    {
                      v218 = ne_log_obj();
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v223 = *v85;
                        *(_DWORD *)buf = 138412290;
                        uint64_t v228 = v223;
                        _os_log_error_impl(&dword_19DDAF000, v218, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE_INTERMEDIATE reply packet for AUTH (receive intermediate)", buf, 0xCu);
                      }

                      id v220 = (id)*v85;
                      if (*v85) {
                        id v220 = objc_getProperty(v220, v219, 336, 1);
                      }
                      id v102 = v220;
                      uint64_t v103 = @"Failed to process IKE_INTERMEDIATE reply packet for AUTH (receive intermediate)";
                    }
                  }
                  else
                  {
                    v215 = ne_log_obj();
                    if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v222 = *v85;
                      *(_DWORD *)buf = 138412290;
                      uint64_t v228 = v222;
                      _os_log_error_impl(&dword_19DDAF000, v215, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE_INTERMEDIATE request packet for AUTH (receive intermediate)", buf, 0xCu);
                    }

                    id v217 = (id)*v85;
                    if (*v85) {
                      id v217 = objc_getProperty(v217, v216, 336, 1);
                    }
                    id v102 = v217;
                    uint64_t v103 = @"Failed to process IKE_INTERMEDIATE request packet for AUTH (receive intermediate)";
                  }
                  ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v103, v95, v96, v97, v98, v99, v100, v101, v225);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v102, 3uLL, ErrorCrypto);
LABEL_102:

                  [(NEIKEv2Session *)(void *)*v85 reportState];
                  [(NEIKEv2Session *)*v85 resetAll];
                  id v19 = v226;
LABEL_103:

                  goto LABEL_83;
                }
              }
              else
              {
                id v77 = 0;
              }
              uint64_t v78 = 0;
              goto LABEL_46;
            }
            v149 = ne_log_obj();
            id v19 = v226;
            if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
            {
              uint64_t v182 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              uint64_t v228 = v182;
              __int16 v229 = 2112;
              uint64_t v230 = (uint64_t)v24;
              _os_log_error_impl(&dword_19DDAF000, v149, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (receive intermediate)", buf, 0x16u);
            }

            id v151 = *(id *)(a1 + 40);
            if (v151) {
              id v151 = objc_getProperty(v151, v150, 336, 1);
            }
            id v116 = v151;
            ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (receive intermediate)", v152, v153, v154, v155, v156, v157, v158, (uint64_t)v24);
LABEL_82:
            v125 = ErrorInternal;
            -[NEIKEv2IKESA setState:error:]((uint64_t)v116, 3uLL, ErrorInternal);

            [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
            [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
LABEL_83:

            goto LABEL_84;
          }
          uint64_t v121 = ne_log_obj();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
          {
            uint64_t v176 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v228 = v176;
            _os_log_error_impl(&dword_19DDAF000, v121, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (receive intermediate)", buf, 0xCu);
          }

          id v123 = *(id *)(a1 + 40);
          if (v123) {
            id v123 = objc_getProperty(v123, v122, 336, 1);
          }
          id v116 = v123;
          uint64_t v117 = @"Did not receive data in KE payload (receive intermediate)";
        }
        else
        {
          __int16 v118 = ne_log_obj();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            uint64_t v175 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v228 = v175;
            _os_log_error_impl(&dword_19DDAF000, v118, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (receive intermediate)", buf, 0xCu);
          }

          id v120 = *(id *)(a1 + 40);
          if (v120) {
            id v120 = objc_getProperty(v120, v119, 336, 1);
          }
          id v116 = v120;
          uint64_t v117 = @"Did not receive method in KE payload (receive intermediate)";
        }
      }
      else
      {
        uint64_t v106 = ne_log_obj();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          uint64_t v174 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v228 = v174;
          _os_log_error_impl(&dword_19DDAF000, v106, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (receive intermediate)", buf, 0xCu);
        }

        id v108 = *(id *)(a1 + 40);
        if (v108) {
          id v108 = objc_getProperty(v108, v107, 336, 1);
        }
        id v116 = v108;
        uint64_t v117 = @"Did not receive KE payload (receive intermediate)";
      }
      ErrorInternal = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v117, v109, v110, v111, v112, v113, v114, v115, v224);
      goto LABEL_82;
    }
    v184 = ne_log_obj();
    if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
    {
      uint64_t v212 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v228 = v212;
      _os_log_error_impl(&dword_19DDAF000, v184, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE_INTERMEDIATE packet (receive intermediate)", buf, 0xCu);
    }

    id v186 = *(id *)(a1 + 40);
    if (v186) {
      id v186 = objc_getProperty(v186, v185, 336, 1);
    }
    id v194 = v186;
    v195 = @"Failed to receive IKE_INTERMEDIATE packet (receive intermediate)";
LABEL_118:
    v199 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v195, v187, v188, v189, v190, v191, v192, v193, v224);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v194, 3uLL, v199);

    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
    goto LABEL_84;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v196 = ne_log_obj();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      uint64_t v213 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v228 = v213;
      _os_log_error_impl(&dword_19DDAF000, v196, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE Auth packet (receive)", buf, 0xCu);
    }

    id v198 = *(id *)(a1 + 40);
    if (v198) {
      id v198 = objc_getProperty(v198, v197, 336, 1);
    }
    id v194 = v198;
    v195 = @"Failed to receive IKE Auth packet (receive)";
    goto LABEL_118;
  }
  if (v4) {
    int v104 = v4[6];
  }
  else {
    int v104 = 0;
  }
  uint64_t v105 = *(void *)(a1 + 32);
  if (v105) {
    *(_DWORD *)(v105 + 28) = v104;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_84:
}

- (void)handleEAPAndGSPMForIKESA:(void *)a3 authPacket:(void *)a4 handler:
{
  uint64_t v448 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (!a1) {
    goto LABEL_194;
  }
  unint64_t v11 = objc_getProperty(a1, v9, 368, 1);
  dispatch_assert_queue_V2(v11);

  if (v8)
  {
    id v13 = objc_getProperty(v8, v12, 136, 1);
    if (v13)
    {

LABEL_8:
      id Property = objc_getProperty(v8, v15, 136, 1);
      goto LABEL_9;
    }
    id v16 = objc_getProperty(v8, v14, 144, 1);
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  if (!v17)
  {
    v10[2](v10, v8);
    goto LABEL_194;
  }
  if (v8) {
    goto LABEL_8;
  }
  id Property = 0;
LABEL_9:
  id v19 = Property;

  if (!v19)
  {
    if (v8) {
      id v45 = objc_getProperty(v8, v20, 144, 1);
    }
    else {
      id v45 = 0;
    }
    id v46 = v45;

    if (!v46)
    {
      uint64_t v68 = 0;
      uint64_t v69 = "";
      goto LABEL_185;
    }
    id v47 = v7;
    id v48 = v8;
    self;
    id obja = v48;
    v419 = a1;
    if (v47)
    {
      if (v8)
      {
        if ([(NEIKEv2Packet *)v48 hasErrors])
        {
          v421 = v10;
          selfa = v47;
          id v51 = v8;
          long long v441 = 0u;
          long long v442 = 0u;
          long long v439 = 0u;
          long long v440 = 0u;
          id v52 = objc_getProperty(v48, v50, 64, 1);
          uint64_t v53 = [v52 countByEnumeratingWithState:&v439 objects:v446 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v440;
            while (2)
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v440 != v55) {
                  objc_enumerationMutation(v52);
                }
                id v57 = *(__CFString **)(*((void *)&v439 + 1) + 8 * i);
                if (v57 && (unint64_t)(v57->length - 1) <= 0x3FFE)
                {
                  uint64_t v98 = -[NEIKEv2NotifyPayload copyError](v57);
                  uint64_t v99 = ne_log_obj();
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                  {
                    v235 = (void *)[v48 copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v235;
                    __int16 v444 = 2112;
                    v445 = v98;
                    _os_log_error_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_ERROR, "%@ Initiator auth GSPM received notify error: %@", buf, 0x16u);
                  }
                  ErrorPeerInvalidSyntax = v98;

                  uint64_t v68 = 0;
                  uint64_t v65 = ErrorPeerInvalidSyntax;
                  id v8 = v51;
                  id v10 = v421;
                  id v47 = selfa;
                  goto LABEL_87;
                }
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v439 objects:v446 count:16];
              if (v54) {
                continue;
              }
              break;
            }
          }

          id v8 = v51;
          id v10 = v421;
          id v47 = selfa;
        }
        id v58 = objc_getProperty(v48, v50, 144, 1);
        id v59 = v58;
        if (v58) {
          uint64_t v60 = (void *)*((void *)v58 + 3);
        }
        else {
          uint64_t v60 = 0;
        }
        id v61 = v60;

        if (!v61)
        {
          uint64_t v101 = ne_log_obj();
          id v48 = obja;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            v236 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v236;
            _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ No GSPM data received", buf, 0xCu);

            id v48 = obja;
          }

          ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorPeerInvalidSyntax(@"No GSPM data received", v102, v103, v104, v105, v106, v107, v108, v409);
          uint64_t v65 = 0;
          goto LABEL_146;
        }
        id v63 = objc_getProperty(v47, v62, 456, 1);
        uint64_t v65 = v63;
        if ((BYTE1(v47[1].isa) & 1) == 0)
        {
          id v48 = obja;
          if (v63)
          {
LABEL_59:
            v422 = v65[2].isa;
            goto LABEL_108;
          }
          id v66 = -[NEIKEv2GSPM initWithIKESA:]((id *)[NEIKEv2GSPM alloc], v47);
          if (v66)
          {
            uint64_t v65 = v66;
            objc_setProperty_atomic(v47, v67, v66, 456);
            goto LABEL_59;
          }
          v382 = ne_log_obj();
          if (os_log_type_enabled(v382, OS_LOG_TYPE_ERROR))
          {
            v407 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v407;
            _os_log_error_impl(&dword_19DDAF000, v382, OS_LOG_TYPE_ERROR, "%@ Failed to create GSPM handler", buf, 0xCu);
          }
          v380 = @"Failed to create GSPM handler";
LABEL_263:
          ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal(v380, v373, v374, v375, v376, v377, v378, v379, v409);
          uint64_t v65 = 0;
          uint64_t v68 = 0;
LABEL_87:
          id v48 = obja;
LABEL_169:

          if (v68)
          {

            uint64_t v69 = "GSPM";
            a1 = v419;
            goto LABEL_185;
          }
          id v282 = v8;
          if (!v47 || (BYTE1(v47[1].isa) & 1) == 0)
          {
            v326 = ne_log_obj();
            if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v446 = 138412290;
              v447 = (const char *)v419;
              _os_log_error_impl(&dword_19DDAF000, v326, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth (GSPM) packet (receive)", v446, 0xCu);
            }

            id v327 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]((uint64_t)NEIKEv2IKEAuthPacket, obja, 0x18uLL);
            if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)v419, v327, 0))
            {
              -[NEIKEv2IKESA setState:error:]((uint64_t)v47, 3uLL, ErrorPeerInvalidSyntax);
              [(NEIKEv2Session *)v419 reportState];
            }
            else
            {
              id v356 = objc_getProperty(v419, v328, 336, 1);
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"GSPM refusal (receive) %@", v357, v358, v359, v360, v361, v362, v363, (uint64_t)ErrorPeerInvalidSyntax);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v356, 3uLL, ErrorFailedToSend);

              [(NEIKEv2Session *)v419 reportState];
              [(NEIKEv2Session *)(uint64_t)v419 resetAll];
            }

LABEL_247:
LABEL_248:
            id v8 = v282;
            goto LABEL_194;
          }
          v343 = [(__CFString *)ErrorPeerInvalidSyntax domain];
          if ([v343 isEqual:@"NEIKEv2ErrorDomain"])
          {
            uint64_t v344 = [(__CFString *)ErrorPeerInvalidSyntax code];

            if (v344 == 5)
            {
              v345 = ne_log_obj();
              if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v446 = 138412290;
                v447 = (const char *)v419;
                _os_log_impl(&dword_19DDAF000, v345, OS_LOG_TYPE_DEFAULT, "%@ Received server redirect in IKE Auth (GSPM) (connect)", v446, 0xCu);
              }

              -[NEIKEv2IKESA setState:error:]((uint64_t)v47, 3uLL, ErrorPeerInvalidSyntax);
              -[NEIKEv2Session reportServerRedirect:](v419, obja);
              [(NEIKEv2Session *)(uint64_t)v419 resetAll];
              v10[2](v10, 0);
              goto LABEL_247;
            }
          }
          else
          {
          }
          v367 = ne_log_obj();
          if (os_log_type_enabled(v367, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v446 = 138412290;
            v447 = (const char *)v419;
            _os_log_error_impl(&dword_19DDAF000, v367, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth (GSPM) packet (connect)", v446, 0xCu);
          }

          id v369 = objc_getProperty(v419, v368, 336, 1);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v369, 3uLL, ErrorPeerInvalidSyntax);

          [(NEIKEv2Session *)v419 reportState];
          [(NEIKEv2Session *)(uint64_t)v419 resetAll];
          goto LABEL_247;
        }
        id v48 = obja;
        if (!v63)
        {
          v372 = ne_log_obj();
          if (os_log_type_enabled(v372, OS_LOG_TYPE_ERROR))
          {
            v403 = (void *)[obja copyShortDescription];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v403;
            _os_log_error_impl(&dword_19DDAF000, v372, OS_LOG_TYPE_ERROR, "%@ Initiator is missing GSPM handler", buf, 0xCu);
          }
          v380 = @"Initiator is missing GSPM handler";
          goto LABEL_263;
        }
        if ((BYTE1(v47[2].isa) & 1) == 0)
        {
          if ((-[NEIKEv2IKEAuthPacket validateAuthPart1AsInitiator:beforeEAP:]((uint64_t)obja, v47, 0) & 1) == 0)
          {
            uint64_t Error = NEIKEv2CreateErrorPeerInvalidSyntax(@"Initial AUTH validation failed", v109, v110, v111, v112, v113, v114, v115, v409);
            goto LABEL_145;
          }
          if (-[NEIKEv2Packet hasNotification:](obja, (const char *)0x4017))
          {
            uint64_t Error = NEIKEv2CreateError(5);
LABEL_145:
            ErrorPeerInvalidSyntax = (__CFString *)Error;
LABEL_146:
            uint64_t v68 = 0;
            goto LABEL_169;
          }
        }
        v422 = 0;
LABEL_108:
        BYTE1(v47[2].isa) = 1;
        id v134 = objc_getProperty(v48, v64, 144, 1);
        v135 = v134;
        if (v134) {
          v136 = (void *)*((void *)v134 + 3);
        }
        else {
          v136 = 0;
        }
        id v144 = v136;
        if (v65[5].isa)
        {
          if (v65[1].isa)
          {
            id ErrorInternal = (id)NEIKEv2CreateErrorInternal(@"Failed to process extraneous peer message", v137, v138, v139, v140, v141, v142, v143, v409);
            goto LABEL_120;
          }
          Class isa = v65[3].isa;
          *(void *)buf = 0;
          uint64_t v153 = isa;
          uint64_t v154 = [(objc_class *)v153 processSecondPeerMessage:v144 error:buf];
          id v155 = *(id *)buf;
          Class v156 = v65[1].isa;
          v65[1].Class isa = (Class)v154;

          if (!v65[1].isa)
          {
            id v48 = obja;
            id ErrorInternal = v155;
LABEL_120:

            v417 = ErrorInternal;
            if (ErrorInternal)
            {
              v347 = ne_log_obj();
              if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
              {
                v394 = (void *)[obja copyShortDescription];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v394;
                __int16 v444 = 2112;
                v445 = v417;
                _os_log_error_impl(&dword_19DDAF000, v347, OS_LOG_TYPE_ERROR, "%@ Failed to process GSPM message: %@", buf, 0x16u);
              }
              uint64_t ErrorCrypto = NEIKEv2CreateErrorCrypto(@"Failed to process GSPM message", v348, v349, v350, v351, v352, v353, v354, v409);
              goto LABEL_256;
            }
            char v158 = BYTE1(v47[1].isa);
            if (v158)
            {
              v159 = v65[2].isa;

              char v158 = BYTE1(v47[1].isa);
              v422 = v159;
            }
            v160 = [NEIKEv2IKEAuthPacket alloc];
            if (v158)
            {
              uint64_t v68 = -[NEIKEv2Packet initOutbound](v160);
              if (!v68)
              {
                v381 = ne_log_obj();
                if (os_log_type_enabled(v381, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v381, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initOutbound] failed", buf, 2u);
                }

                uint64_t v169 = @"[[NEIKEv2IKEAuthPacket alloc] initOutbound] failed";
                goto LABEL_255;
              }
            }
            else
            {
              uint64_t v68 = -[NEIKEv2Packet initResponse:]((uint64_t)v160, v48);
              if (!v68)
              {
                id v161 = ne_log_obj();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v161, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initResponse:] failed", buf, 2u);
                }

                uint64_t v169 = @"[[NEIKEv2IKEAuthPacket alloc] initResponse:] failed";
LABEL_255:
                uint64_t ErrorCrypto = NEIKEv2CreateErrorInternal(v169, v162, v163, v164, v165, v166, v167, v168, v409);
LABEL_256:
                ErrorPeerInvalidSyntax = (__CFString *)ErrorCrypto;
                uint64_t v175 = 0;
                uint64_t v68 = 0;
                goto LABEL_134;
              }
            }
            uint64_t v170 = v422;
            if (v422)
            {
              v171 = objc_alloc_init(NEIKEv2GSPMPayload);
              objc_setProperty_atomic(v68, v172, v171, 144);

              id v174 = objc_getProperty(v68, v173, 144, 1);
              -[NEIKEv2GSPMPayload setGspmData:]((uint64_t)v174, v422);

              ErrorPeerInvalidSyntax = 0;
              uint64_t v175 = 0;
LABEL_168:

              goto LABEL_169;
            }
            uint64_t v176 = objc_alloc_init(NEIKEv2AuthPayload);
            objc_setProperty_atomic(v68, v177, v176, 128);

            id v178 = [[NEIKEv2AuthenticationProtocol alloc] initWithSecurePassword:-1];
            v180 = objc_getProperty(v68, v179, 128, 1);
            -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v180, v178);

            id v181 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:](v47, 0);
            uint64_t v183 = objc_getProperty(v68, v182, 128, 1);
            -[NEIKEv2AuthPayload setAuthenticationData:](v183, v181);

            v185 = objc_getProperty(v68, v184, 128, 1);
            LOBYTE(v183) = -[NEIKEv2Payload isValid]((uint64_t)v185);

            if ((v183 & 1) == 0)
            {
              uint64_t v187 = ne_log_obj();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
                _os_log_fault_impl(&dword_19DDAF000, v187, OS_LOG_TYPE_FAULT, "%s called with null responsePacket.auth.isValid", buf, 0xCu);
              }
              goto LABEL_137;
            }
            if (((uint64_t)v47[3].isa & 1) == 0)
            {
              ErrorPeerInvalidSyntax = 0;
              uint64_t v175 = 0;
LABEL_134:
              id v48 = obja;
              uint64_t v170 = v422;
              goto LABEL_168;
            }
            id v223 = objc_getProperty(v47, v186, 88, 1);
            char v224 = [v223 ppkIDType];

            HIBYTE(v438) = v224;
            if (v224)
            {
              id v226 = objc_getProperty(v47, v225, 88, 1);
              v227 = [v226 ppkID];

              if (v224 != 2 || v227)
              {
                uint64_t v228 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v227, "length") + 1);
                [v228 appendBytes:(char *)&v438 + 1 length:1];
                [v228 appendData:v227];
                v414 = v228;
                BOOL v229 = -[NEIKEv2Packet addNotification:data:](v68, 0x4034uLL, v228);
                uint64_t v170 = 0;
                if (v229)
                {
                  id v231 = objc_getProperty(v47, v230, 88, 1);
                  char v232 = [v231 ppkMandatory];

                  if (v232)
                  {
LABEL_166:

                    ErrorPeerInvalidSyntax = 0;
                    uint64_t v175 = 0;
                    goto LABEL_167;
                  }
                  uint64_t v233 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:](v47, (const char *)1);
                  if (-[NEIKEv2Packet addNotification:data:](v68, 0x4035uLL, v233))
                  {

                    goto LABEL_166;
                  }
                  v384 = v227;
                  id v385 = v8;
                  v395 = ne_log_obj();
                  if (os_log_type_enabled(v395, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_19DDAF000, v395, OS_LOG_TYPE_FAULT, "[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed", buf, 2u);
                  }

                  ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal(@"[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed", v396, v397, v398, v399, v400, v401, v402, v409);
                }
                else
                {
                  v384 = v227;
                  id v385 = v8;
                  v386 = ne_log_obj();
                  if (os_log_type_enabled(v386, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_19DDAF000, v386, OS_LOG_TYPE_FAULT, "[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed", buf, 2u);
                  }

                  ErrorPeerInvalidSyntax = (__CFString *)NEIKEv2CreateErrorInternal(@"[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed", v387, v388, v389, v390, v391, v392, v393, v409);
                  uint64_t v233 = 0;
                }

                uint64_t v175 = v68;
                uint64_t v68 = 0;
                id v8 = v385;
                uint64_t v170 = 0;
                goto LABEL_167;
              }
              uint64_t v187 = ne_log_obj();
              if (!os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
              {
LABEL_137:

                ErrorPeerInvalidSyntax = 0;
                uint64_t v170 = 0;
                uint64_t v175 = v68;
                uint64_t v68 = 0;
LABEL_167:
                id v48 = obja;
                goto LABEL_168;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
              v383 = "%s called with null ppkID";
            }
            else
            {
              uint64_t v187 = ne_log_obj();
              if (!os_log_type_enabled(v187, OS_LOG_TYPE_FAULT)) {
                goto LABEL_137;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
              v383 = "%s called with null ppkIDType";
            }
            _os_log_fault_impl(&dword_19DDAF000, v187, OS_LOG_TYPE_FAULT, v383, buf, 0xCu);
            goto LABEL_137;
          }
          Class v157 = v65[2].isa;
          v65[2].Class isa = 0;

          id ErrorInternal = 0;
        }
        else
        {
          id v416 = v8;
          v146 = v7;
          Class v147 = v65[3].isa;
          *(void *)buf = 0;
          v148 = v147;
          v149 = [(objc_class *)v148 processFirstPeerMessage:v144 error:buf];
          id v150 = *(id *)buf;

          if (v149)
          {
            objc_storeStrong((id *)&v65[2].isa, v149);
            objc_storeStrong((id *)&v65[5].isa, v136);
            id ErrorInternal = 0;
          }
          else
          {
            id ErrorInternal = v150;
          }

          id v7 = v146;
          id v8 = v416;
        }
        id v48 = obja;
        goto LABEL_120;
      }
      uint64_t v65 = ne_log_obj();
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      {
LABEL_228:
        ErrorPeerInvalidSyntax = 0;
        goto LABEL_146;
      }
      *(_DWORD *)v446 = 136315138;
      v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
      v325 = "%s called with null lastPacket";
    }
    else
    {
      uint64_t v65 = ne_log_obj();
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
        goto LABEL_228;
      }
      *(_DWORD *)v446 = 136315138;
      v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createGSPMForIKESA:lastPacket:refusalError:]";
      v325 = "%s called with null ikeSA";
    }
    _os_log_fault_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_FAULT, v325, v446, 0xCu);
    goto LABEL_228;
  }
  if (!v7 || (v7[9] & 1) == 0)
  {
    v281 = ne_log_obj();
    if (os_log_type_enabled(v281, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v446 = 138412290;
      v447 = (const char *)a1;
      _os_log_fault_impl(&dword_19DDAF000, v281, OS_LOG_TYPE_FAULT, "%@ EAP is not supported by responder (receive)", v446, 0xCu);
    }

    id v282 = v8;
    id v283 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]((uint64_t)NEIKEv2IKEAuthPacket, v8, 0x18uLL);
    if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v283, 0))
    {
      v291 = (void *)NEIKEv2CreateErrorInternal(@"EAP is not supported by responder (receive)", (uint64_t)v284, v285, v286, v287, v288, v289, v290, v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, v291);

      [(NEIKEv2Session *)a1 reportState];
    }
    else
    {
      id v314 = objc_getProperty(a1, v284, 336, 1);
      v322 = (void *)NEIKEv2CreateErrorFailedToSend(@"EAP unsupported refusal (receive)", v315, v316, v317, v318, v319, v320, v321, v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v314, 3uLL, v322);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }

    goto LABEL_248;
  }
  id v21 = v7;
  id v22 = v8;
  uint64_t v23 = self;
  self = v22;
  if ((v7[9] & 1) == 0)
  {
    id v33 = ne_log_obj();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_213;
    }
    *(_DWORD *)v446 = 136315138;
    v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
    v293 = "%s called with null ikeSA.isInitiator";
LABEL_258:
    _os_log_fault_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_FAULT, v293, v446, 0xCu);
    goto LABEL_213;
  }
  if (!v8)
  {
    id v33 = ne_log_obj();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      goto LABEL_213;
    }
    *(_DWORD *)v446 = 136315138;
    v447 = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
    v293 = "%s called with null lastResponderPacket";
    goto LABEL_258;
  }
  uint64_t v412 = v23;
  v420 = v10;
  if ([(NEIKEv2Packet *)v22 hasErrors])
  {
    uint64_t v26 = (uint64_t)v21;
    long long v441 = 0u;
    long long v442 = 0u;
    long long v439 = 0u;
    long long v440 = 0u;
    id obj = (NEIKEv2EAP *)objc_getProperty(v22, v25, 64, 1);
    uint64_t v27 = [(NEIKEv2EAP *)obj countByEnumeratingWithState:&v439 objects:v446 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = 0;
      uint64_t v30 = *(void *)v440;
      v418 = a1;
      while (2)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v440 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v439 + 1) + 8 * j);
          if (v32 && (unint64_t)(*(void *)(v32 + 24) - 1) <= 0x3FFE)
          {
            id v33 = -[NEIKEv2NotifyPayload copyError](*(__CFString **)(*((void *)&v439 + 1) + 8 * j));

            id v34 = ne_log_obj();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint64_t v44 = (void *)[self copyShortDescription];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v44;
              __int16 v444 = 2112;
              v445 = v33;
              _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "%@ Initiator auth EAP received notify error: %@", buf, 0x16u);
            }
            if (*(void *)(v32 + 24) & 0xFFFFFFFFFFFFE000) != 0x2000 || (*(unsigned char *)(v26 + 18))
            {
LABEL_61:
              id v21 = (unsigned char *)v26;
              -[NEIKEv2IKESA setState:error:](v26, 3uLL, v33);
              uint64_t v68 = 0;
              a1 = v418;
              id v10 = v420;
              id v22 = self;
              goto LABEL_182;
            }
            uint64_t v36 = objc_getProperty(self, v35, 128, 1);
            uint64_t v38 = (void *)v36;
            if (v36 && (id v39 = *(id *)(v36 + 32)) != 0)
            {
            }
            else
            {
              id v40 = objc_getProperty(self, v37, 136, 1);
              id v42 = v40;
              if (v40) {
                id v40 = objc_getProperty(v40, v41, 24, 1);
              }
              id v43 = v40;

              if (!v43) {
                goto LABEL_61;
              }
            }
            id v29 = v33;
          }
        }
        uint64_t v28 = [(NEIKEv2EAP *)obj countByEnumeratingWithState:&v439 objects:v446 count:16];
        a1 = v418;
        if (v28) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v29 = 0;
    }

    id v33 = v29;
    id v22 = self;
    id v21 = (unsigned char *)v26;
  }
  else
  {
    id v33 = 0;
  }
  id v70 = objc_getProperty(v22, v25, 136, 1);
  id v72 = v70;
  if (v70) {
    id v70 = objc_getProperty(v70, v71, 24, 1);
  }
  id v10 = v420;
  id v73 = v70;

  if (!v73)
  {
    uint64_t v89 = ne_log_obj();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      id v198 = (void *)[self copyShortDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v198;
      _os_log_error_impl(&dword_19DDAF000, v89, OS_LOG_TYPE_ERROR, "%@ No EAP data received", buf, 0xCu);
    }
    id objb = (id)NEIKEv2CreateErrorAuthentication(@"No EAP data received", v90, v91, v92, v93, v94, v95, v96, v409);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v21, 3uLL, objb);
    uint64_t v68 = 0;
    id v22 = self;

    goto LABEL_183;
  }
  id v22 = self;
  id obj = (NEIKEv2EAP *)objc_getProperty(v21, v74, 448, 1);
  if (!obj)
  {
    if (-[NEIKEv2IKEAuthPacket validateAuthPart1AsInitiator:beforeEAP:]((uint64_t)self, v21, 1))
    {
      if (-[NEIKEv2Packet hasNotification:](self, (const char *)0x4017))
      {
        id objc = (id)NEIKEv2CreateError(5);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v21, 3uLL, objc);
        uint64_t v68 = 0;

        goto LABEL_183;
      }
      id obj = objc_alloc_init(NEIKEv2EAP);
      objc_setProperty_atomic(v21, v151, obj, 448);
      v21[17] = 1;
      goto LABEL_70;
    }
LABEL_213:
    uint64_t v68 = 0;
    goto LABEL_183;
  }
LABEL_70:
  __int16 v438 = 0;
  id v76 = objc_getProperty(self, v75, 136, 1);
  uint64_t v78 = v76;
  if (v76) {
    id v76 = objc_getProperty(v76, v77, 24, 1);
  }
  id v79 = v76;
  -[NEIKEv2EAP createPayloadResponseForRequest:ikeSA:success:reportEAPError:]((uint64_t)obj, v79, v21, (BOOL *)&v438 + 1, (BOOL *)&v438);
  v81 = uint64_t v80 = (uint64_t)v21;

  v410 = v80;
  if (v33)
  {
    -[NEIKEv2IKESA setState:error:](v80, 3uLL, v33);
    uint64_t v68 = 0;
    id v22 = self;
    goto LABEL_181;
  }
  if (HIBYTE(v438) || v81)
  {
    uint64_t v117 = -[NEIKEv2Packet initOutbound]([NEIKEv2IKEAuthPacket alloc]);
    id v22 = self;
    if (!v117)
    {
      uint64_t v189 = ne_log_obj();
      if (os_log_type_enabled(v189, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v189, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initOutbound:] failed", buf, 2u);
      }

      v197 = (void *)NEIKEv2CreateErrorInternal(@"[[NEIKEv2IKEAuthPacket alloc] initOutbound:] failed", v190, v191, v192, v193, v194, v195, v196, v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v410, 3uLL, v197);

      goto LABEL_143;
    }
    if (v81)
    {
      __int16 v118 = objc_alloc_init(NEIKEv2EAPPayload);
      objc_setProperty_atomic(v117, v119, v118, 136);

      id v121 = objc_getProperty(v117, v120, 136, 1);
      id v123 = v121;
      if (v121) {
        objc_setProperty_atomic(v121, v122, v81, 24);
      }

      if ((BYTE2(v410[2].isa) & 1) == 0 || !-[NEIKEv2Packet hasNotification:](self, (const char *)0xA08D)) {
        goto LABEL_158;
      }
      v415 = v117;
      uint64_t v124 = ne_log_obj();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
      {
        v313 = (void *)[self copyShortDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v313;
        _os_log_debug_impl(&dword_19DDAF000, v124, OS_LOG_TYPE_DEBUG, "%@ Received request for device identity notify payload.", buf, 0xCu);
      }
      id v126 = objc_getProperty(v410, v125, 88, 1);
      v127 = [v126 IMEI];
      id v129 = objc_getProperty(v410, v128, 88, 1);
      v130 = [v129 IMEISV];
      id v131 = +[NEIKEv2IKEAuthPacket prepareDeviceIdentityNotifyPayload:IMEISV:lastResponderPacket:](v412, v127, v130, self);

      if (!v131
        || (v132 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0xA08DuLL, v131), BOOL v133 = -[NEIKEv2Packet addNotifyPayload:](v415, v132), v132, v133))
      {

        id v22 = self;
LABEL_157:
        uint64_t v117 = v415;
        goto LABEL_158;
      }
      v237 = ne_log_obj();
      if (os_log_type_enabled(v237, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v237, OS_LOG_TYPE_FAULT, "[responsePacket addNotifyPayload:notifyPayload] failed", buf, 2u);
      }

      v245 = (void *)NEIKEv2CreateErrorInternal(@"[responsePacket addNotifyPayload:notifyPayload] failed", v238, v239, v240, v241, v242, v243, v244, v409);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v410, 3uLL, v245);

      goto LABEL_178;
    }
    v199 = objc_alloc_init(NEIKEv2AuthPayload);
    objc_setProperty_atomic(v117, v200, v199, 128);

    v201 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:2];
    objc_getProperty(v117, v202, 128, 1);
    id v204 = v203 = v117;
    -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v204, v201);

    uint64_t v205 = -[NEIKEv2IKESA createInitiatorEAPAuthenticationDataUsingPrimeKey:](v410, 0);
    uint64_t v207 = objc_getProperty(v203, v206, 128, 1);
    -[NEIKEv2AuthPayload setAuthenticationData:](v207, v205);

    v415 = v203;
    uint64_t v209 = objc_getProperty(v203, v208, 128, 1);
    LOBYTE(v207) = -[NEIKEv2Payload isValid]((uint64_t)v209);

    if ((v207 & 1) == 0)
    {
      v234 = ne_log_obj();
      if (os_log_type_enabled(v234, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
        _os_log_fault_impl(&dword_19DDAF000, v234, OS_LOG_TYPE_FAULT, "%s called with null responsePacket.auth.isValid", buf, 0xCu);
      }

LABEL_178:
      uint64_t v68 = 0;
      id v10 = v420;
      id v22 = self;
LABEL_179:
      uint64_t v117 = v415;
      goto LABEL_180;
    }
    id v22 = self;
    uint64_t v117 = v203;
    if (((uint64_t)v410[3].isa & 1) == 0)
    {
LABEL_158:
      uint64_t v68 = v117;
      id v10 = v420;
      goto LABEL_180;
    }
    id v211 = objc_getProperty(v410, v210, 88, 1);
    unsigned __int8 v212 = [v211 ppkIDType];
    int v213 = v212;

    unsigned __int8 v437 = v212;
    if (v212)
    {
      id v215 = objc_getProperty(v410, v214, 88, 1);
      v216 = [v215 ppkID];

      uint64_t v117 = v415;
      if (v213 != 2 || v216)
      {
        id v217 = v216;
        v218 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v216, "length") + 1);
        [v218 appendBytes:&v437 length:1];
        v413 = v217;
        [v218 appendData:v217];
        id v33 = 0;
        if (-[NEIKEv2Packet addNotification:data:](v415, 0x4034uLL, v218))
        {
          id v220 = objc_getProperty(v410, v219, 88, 1);
          char v221 = [v220 ppkMandatory];

          if (v221)
          {
LABEL_156:

            id v22 = self;
            goto LABEL_157;
          }
          uint64_t v222 = -[NEIKEv2IKESA createInitiatorEAPAuthenticationDataUsingPrimeKey:](v410, (const char *)1);
          uint64_t v117 = v415;
          if (-[NEIKEv2Packet addNotification:data:](v415, 0x4035uLL, v222))
          {

            goto LABEL_156;
          }
          v411 = v222;
          v304 = ne_log_obj();
          id v10 = v420;
          if (os_log_type_enabled(v304, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, v304, OS_LOG_TYPE_FAULT, "[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed", buf, 2u);
          }

          v312 = (void *)NEIKEv2CreateErrorInternal(@"[responsePacket addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed", v305, v306, v307, v308, v309, v310, v311, v409);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v410, 3uLL, v312);

          id v22 = self;
          v280 = v411;
        }
        else
        {
          v272 = ne_log_obj();
          id v10 = v420;
          if (os_log_type_enabled(v272, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, v272, OS_LOG_TYPE_FAULT, "[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed", buf, 2u);
          }

          v280 = (void *)NEIKEv2CreateErrorInternal(@"[responsePacket addNotification:NEIKEv2NotifyTypePPKIdentity] failed", v273, v274, v275, v276, v277, v278, v279, v409);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v410, 3uLL, v280);
          id v22 = self;
        }

LABEL_143:
        uint64_t v68 = 0;
LABEL_180:

        goto LABEL_181;
      }
      v404 = v420;
      v405 = ne_log_obj();
      if (!os_log_type_enabled(v405, OS_LOG_TYPE_FAULT))
      {
LABEL_282:

        uint64_t v68 = 0;
        v408 = v404;
        id v22 = self;
        id v33 = 0;
        id v10 = v408;
        goto LABEL_179;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
      v406 = "%s called with null ppkID";
    }
    else
    {
      v404 = v420;
      v405 = ne_log_obj();
      if (!os_log_type_enabled(v405, OS_LOG_TYPE_FAULT)) {
        goto LABEL_282;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2IKEAuthPacket(Exchange) createEAPForInitiatorIKESA:lastResponderPacket:]";
      v406 = "%s called with null ppkIDType";
    }
    _os_log_fault_impl(&dword_19DDAF000, v405, OS_LOG_TYPE_FAULT, v406, buf, 0xCu);
    goto LABEL_282;
  }
  id v22 = self;
  if ((_BYTE)v438) {
    ErrorAuthentication = (void *)NEIKEv2CreateError(10);
  }
  else {
    ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"EAP error", v82, v83, v84, v85, v86, v87, v88, v409);
  }
  uint64_t v188 = ErrorAuthentication;
  -[NEIKEv2IKESA setState:error:]((uint64_t)v410, 3uLL, ErrorAuthentication);

  uint64_t v68 = 0;
LABEL_181:

  id v21 = v410;
LABEL_182:

LABEL_183:
  if (v68)
  {
    uint64_t v69 = "EAP";
LABEL_185:
    if (v7 && (v7[9] & 1) != 0)
    {
      v433[0] = MEMORY[0x1E4F143A8];
      v433[1] = 3221225472;
      v433[2] = __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke;
      v433[3] = &unk_1E5990620;
      v433[4] = a1;
      v436 = v69;
      v434 = v7;
      v435 = v10;
      if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v68, v433) == -1)
      {
        id v261 = objc_getProperty(a1, v260, 336, 1);
        v269 = (void *)NEIKEv2CreateErrorFailedToSend(@"%s response (connect)", v262, v263, v264, v265, v266, v267, v268, (uint64_t)v69);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v261, 3uLL, v269);

        [(NEIKEv2Session *)a1 reportState];
        [(NEIKEv2Session *)(uint64_t)a1 resetAll];
      }

      v259 = v434;
    }
    else
    {
      v429[0] = MEMORY[0x1E4F143A8];
      v429[1] = 3221225472;
      v429[2] = __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke_168;
      v429[3] = &unk_1E5990620;
      v429[4] = a1;
      v432 = v69;
      v430 = v7;
      v431 = v10;
      if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v68, v429) & 1) == 0)
      {
        id v248 = objc_getProperty(a1, v247, 336, 1);
        v256 = (void *)NEIKEv2CreateErrorFailedToSend(@"%s response (receive)", v249, v250, v251, v252, v253, v254, v255, (uint64_t)v69);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v248, 3uLL, v256);

        [(NEIKEv2Session *)a1 reportState];
        [(NEIKEv2Session *)(uint64_t)a1 resetAll];
      }

      v259 = v430;
    }

    goto LABEL_194;
  }
  if (*((void *)v21 + 6) != 3) {
    goto LABEL_230;
  }
  v294 = a1;
  id v295 = objc_getProperty(v21, v246, 56, 1);
  v296 = [v295 domain];
  if (([v296 isEqual:@"NEIKEv2ErrorDomain"] & 1) == 0)
  {

    a1 = v294;
LABEL_230:
    v330 = ne_log_obj();
    if (os_log_type_enabled(v330, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v446 = 138412290;
      v447 = (const char *)a1;
      _os_log_error_impl(&dword_19DDAF000, v330, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth (EAP) packet (connect)", v446, 0xCu);
    }

    id v332 = objc_getProperty(a1, v331, 336, 1);
    v340 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process IKE Auth (EAP) packet (connect)", v333, v334, v335, v336, v337, v338, v339, v409);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v332, 3uLL, v340);

    [(NEIKEv2Session *)a1 reportState];
    [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    goto LABEL_194;
  }
  id v298 = objc_getProperty(v21, v297, 56, 1);
  v299 = v7;
  uint64_t v300 = [v298 code];

  BOOL v301 = v300 == 5;
  id v7 = v299;
  a1 = v294;
  if (!v301) {
    goto LABEL_230;
  }
  v302 = ne_log_obj();
  if (os_log_type_enabled(v302, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v446 = 138412290;
    v447 = (const char *)v294;
    _os_log_impl(&dword_19DDAF000, v302, OS_LOG_TYPE_DEFAULT, "%@ Received server redirect in IKE Auth (EAP) (connect)", v446, 0xCu);
  }

  -[NEIKEv2Session reportServerRedirect:](v294, self);
  [(NEIKEv2Session *)(uint64_t)v294 resetAll];
  v10[2](v10, 0);
  id v7 = v299;
LABEL_194:
}

void __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](a1[4], a1[5], v3, a1[6]);
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      uint64_t v23 = v19;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE Auth (%s) reply (connect)", buf, 0x16u);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336, 1);
    }
    id v7 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE Auth (%s) reply (connect)", v8, v9, v10, v11, v12, v13, v14, a1[7]);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)(void *)a1[4] reportState];
    [(NEIKEv2Session *)a1[4] resetAll];
  }
}

void __72__NEIKEv2Session_Exchange__handleEAPAndGSPMForIKESA_authPacket_handler___block_invoke_168(uint64_t *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](a1[4], a1[5], v3, a1[6]);
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[4];
      uint64_t v19 = a1[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      uint64_t v23 = v19;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE Auth (%s) reply (receive)", buf, 0x16u);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336, 1);
    }
    id v7 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE Auth (%s) reply (receive)", v8, v9, v10, v11, v12, v13, v14, a1[7]);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)(void *)a1[4] reportState];
    [(NEIKEv2Session *)a1[4] resetAll];
  }
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v33;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE SA Init reply (connect)", buf, 0xCu);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v17, 336, 1);
    }
    id v19 = Property;
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE SA Init reply (connect)", v20, v21, v22, v23, v24, v25, v26, v34);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    goto LABEL_17;
  }
  uint64_t v5 = -[NEIKEv2IKESAInitPacket validateSAInitAsInitiator:]((uint64_t)v3, *(void **)(a1 + 40));
  if ((v5 & 1) != 0 || (SEL v6 = *(void **)(a1 + 40)) == 0 || v6[6] != 3)
  {
LABEL_19:
    uint64_t v30 = *(void **)(a1 + 32);
    id v29 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_193;
    v35[3] = &unk_1E59906C0;
    v35[4] = v30;
    id v31 = v29;
    uint64_t v32 = *(void *)(a1 + 48);
    id v36 = v31;
    uint64_t v37 = v32;
    -[NEIKEv2Session retryCookieForIKESA:validated:handler:](v30, v31, v5, v35);

    goto LABEL_20;
  }
  id v7 = objc_getProperty(v6, v4, 56, 1);
  uint64_t v8 = [v7 domain];
  if (([v8 isEqual:@"NEIKEv2ErrorDomain"] & 1) == 0)
  {

    goto LABEL_19;
  }
  id v10 = *(id *)(a1 + 40);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 56, 1);
  }
  id v11 = v10;
  uint64_t v12 = [v11 code];

  if (v12 != 5) {
    goto LABEL_19;
  }
  uint64_t v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = v14;
    _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEFAULT, "%@ Received server redirect in IKE SA Init (connect)", buf, 0xCu);
  }

  -[NEIKEv2Session reportServerRedirect:](*(void **)(a1 + 32), v3);
LABEL_17:
  [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
LABEL_20:
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_193(void *a1, uint64_t a2)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  uint64_t v102 = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_2;
  uint64_t v103 = &unk_1E59906C0;
  uint64_t v104 = v5;
  id v6 = v4;
  uint64_t v7 = a1[6];
  id v105 = v6;
  uint64_t v106 = v7;
  id v8 = v6;
  id v10 = v101;
  if (v5)
  {
    id v11 = objc_getProperty(v5, v9, 368, 1);
    dispatch_assert_queue_V2(v11);

    if ((a2 & 1) != 0
      || (!v8 ? (id v13 = 0) : (id v13 = objc_getProperty(v8, v12, 144, 1)),
          id v14 = v13,
          v14,
          !v14))
    {
      v102(v10, a2);
    }
    else
    {
      [(NEIKEv2Session *)v5 resetMessages];
      if (v8) {
        objc_setProperty_atomic(v8, v16, 0, 160);
      }
      id v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (v8) {
          id Property = objc_getProperty(v8, v18, 144, 1);
        }
        else {
          id Property = 0;
        }
        id v20 = Property;
        uint64_t v21 = [v20 method];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "%@ Received KE method preference %tu, retrying IKE SA Init (connect retry KE)", buf, 0x16u);
      }
      if (v8) {
        id v23 = objc_getProperty(v8, v22, 144, 1);
      }
      else {
        id v23 = 0;
      }
      id v99 = v23;
      uint64_t v25 = [v99 method];
      uint64_t v100 = v10;
      if (v8) {
        id v26 = objc_getProperty(v8, v24, 80, 1);
      }
      else {
        id v26 = 0;
      }
      id v98 = v26;
      id v27 = [v98 proposals];
      self;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v111 objects:buf count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v112;
        uint64_t v97 = *(void *)v112;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v112 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void **)(*((void *)&v111 + 1) + 8 * i);
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            uint64_t v34 = [v33 kemProtocols];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v107 objects:v115 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v108;
LABEL_23:
              uint64_t v38 = 0;
              while (1)
              {
                if (*(void *)v108 != v37) {
                  objc_enumerationMutation(v34);
                }
                if ([*(id *)(*((void *)&v107 + 1) + 8 * v38) method] == v25) {
                  break;
                }
                if (v36 == ++v38)
                {
                  uint64_t v36 = [v34 countByEnumeratingWithState:&v107 objects:v115 count:16];
                  if (v36) {
                    goto LABEL_23;
                  }
                  goto LABEL_29;
                }
              }

              if ([(NEIKEv2IKESA *)v8 generateInitialValues])
              {
                SEL v56 = +[NEIKEv2IKESAInitPacket createIKESAInitForInitiatorIKESA:]((uint64_t)NEIKEv2IKESAInitPacket, v8);
                id v10 = v100;
                if (v56)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&uint8_t buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = __62__NEIKEv2Session_Exchange__retryKEForIKESA_validated_handler___block_invoke;
                  uint64_t v117 = &unk_1E59905D0;
                  __int16 v118 = v5;
                  id v119 = v8;
                  SEL v120 = v100;
                  if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)v5, v56, buf) == -1)
                  {
                    id v58 = objc_getProperty(v5, v57, 336, 1);
                    ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"retry SA INIT KE", v59, v60, v61, v62, v63, v64, v65, v96);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v58, 3uLL, ErrorFailedToSend);

                    [(NEIKEv2Session *)v5 reportState];
                    [(NEIKEv2Session *)(uint64_t)v5 resetAll];
                  }
                }
                else
                {
                  uint64_t v80 = ne_log_obj();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v5;
                    _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init retry packet (connect retry KE)", buf, 0xCu);
                  }

                  id v82 = objc_getProperty(v5, v81, 336, 1);
                  id ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init retry packet (connect retry KE)", v83, v84, v85, v86, v87, v88, v89, v96);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v82, 3uLL, ErrorInternal);

                  [(NEIKEv2Session *)v5 reportState];
                  [(NEIKEv2Session *)(uint64_t)v5 resetAll];
                }

                goto LABEL_49;
              }
              uint64_t v69 = ne_log_obj();
              id v10 = v100;
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v5;
                _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, "%@ Failed to generate local crypto values (connect retry KE)", buf, 0xCu);
              }

              id v43 = objc_getProperty(v5, v70, 336, 1);
              id ErrorCrypto = (id)NEIKEv2CreateErrorCrypto(@"Failed to generate local crypto values (connect retry KE)", v71, v72, v73, v74, v75, v76, v77, v96);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v43, 3uLL, ErrorCrypto);
              goto LABEL_44;
            }
LABEL_29:

            uint64_t v31 = v97;
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v111 objects:buf count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }

      uint64_t v39 = ne_log_obj();
      id v10 = v100;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        if (v8) {
          id v93 = objc_getProperty(v8, v40, 144, 1);
        }
        else {
          id v93 = 0;
        }
        id v94 = v93;
        uint64_t v95 = [v94 method];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v95;
        _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, "%@ Received KE method preference %tu is not in config (connect retry KE)", buf, 0x16u);
      }
      id v43 = objc_getProperty(v5, v41, 336, 1);
      if (v8) {
        id v44 = objc_getProperty(v8, v42, 144, 1);
      }
      else {
        id v44 = 0;
      }
      id ErrorCrypto = v44;
      uint64_t v46 = [ErrorCrypto method];
      ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received KE method preference %tu is not in config (connect retry KE)", v47, v48, v49, v50, v51, v52, v53, v46);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v43, 3uLL, ErrorPeerInvalidSyntax);

LABEL_44:
      [(NEIKEv2Session *)v5 reportState];
      [(NEIKEv2Session *)(uint64_t)v5 resetAll];
    }
  }
LABEL_49:
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_3;
  v8[3] = &unk_1E59906C0;
  v8[4] = v5;
  id v6 = v4;
  uint64_t v7 = a1[6];
  id v9 = v6;
  uint64_t v10 = v7;
  -[NEIKEv2Session retryCookieForIKESA:validated:handler:](v5, v6, a2, v8);
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_3(uint64_t *a1, const char *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v44;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE SA Init packet (connect)", buf, 0xCu);
    }

    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v10, 336, 1);
    }
    id v19 = Property;
    id v20 = @"Failed to process IKE SA Init packet (connect)";
    goto LABEL_12;
  }
  id v3 = (void *)a1[5];
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, 0, 280);
    uint64_t v5 = a1[5];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v5)
    {
      char v7 = *(unsigned char *)(v5 + 23);
      if (v6)
      {
        if (v7)
        {
          [(NEIKEv2Session *)a1[4] removeFirstChild];
          uint64_t v25 = *(void *)(a1[6] + 8);
          id v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = 0;

          goto LABEL_20;
        }
        goto LABEL_6;
      }
      if (v7) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  if (!v6)
  {
LABEL_14:
    uint64_t v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v46;
      _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@ Failed to negotiate Childless SA (connect)", buf, 0xCu);
    }

    id v24 = (id)a1[4];
    if (v24) {
      id v24 = objc_getProperty(v24, v23, 336, 1);
    }
    id v19 = v24;
    id v20 = @"Failed to negotiate Childless SA (connect)";
LABEL_12:
    ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v20, v12, v13, v14, v15, v16, v17, v18, v47);
    goto LABEL_27;
  }
LABEL_6:
  -[NEIKEv2ChildSA setState:error:](v6, 1uLL, 0);
  [(NEIKEv2Session *)(void *)a1[4] reportState];
LABEL_20:
  if ([(NEIKEv2IKESA *)(unsigned char *)a1[5] generateAllValuesForSAInit])
  {
    id v28 = (void *)a1[4];
    id v27 = (void *)a1[5];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_203;
    v48[3] = &unk_1E5990698;
    id v29 = v27;
    uint64_t v30 = a1[4];
    id v49 = v29;
    uint64_t v50 = v30;
    uint64_t v51 = a1[6];
    -[NEIKEv2Session handleIKEIntermediateForInitiatorIKESA:iteration:handler:](v28, v29, 0, v48);

    return;
  }
  uint64_t v31 = ne_log_obj();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = v45;
    _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "%@ Failed to generate crypto values (connect)", buf, 0xCu);
  }

  id v33 = (id)a1[4];
  if (v33) {
    id v33 = objc_getProperty(v33, v32, 336, 1);
  }
  id v19 = v33;
  ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate crypto values (connect)", v34, v35, v36, v37, v38, v39, v40, v47);
LABEL_27:
  SEL v41 = ErrorPeerInvalidSyntax;
  -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)(void *)a1[4] reportState];
  [(NEIKEv2Session *)a1[4] resetAll];
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_203(uint64_t a1, const char *a2)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = *(unsigned char **)(a1 + 32);
  if (!v3 || (v3[24] & 1) == 0) {
    goto LABEL_5;
  }
  id v4 = [(NEIKEv2IKESA *)*(id *)(a1 + 32) ppk];
  int v5 = -[NEIKEv2IKESA generateDerivativesFromPPK:]((uint64_t)v3, v4);

  if (v5)
  {
    id v3 = *(unsigned char **)(a1 + 32);
LABEL_5:
    char v7 = +[NEIKEv2IKEAuthPacket createIKEAuthForInitiatorIKESA:childSA:]((uint64_t)NEIKEv2IKEAuthPacket, v3, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (v7)
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 336, 1);
      }
      id v9 = Property;
      id v11 = [(NEIKEv2IKESA *)v9 authenticationProtocol];
      int v12 = [v11 isSecurePassword];

      if (v12)
      {
        id v14 = *(id *)(a1 + 40);
        if (v14) {
          id v14 = objc_getProperty(v14, v13, 336, 1);
        }
        id v15 = v14;
        id v17 = [(NEIKEv2IKESA *)v15 authenticationProtocol];
      }
      else
      {
        uint64_t v47 = objc_getProperty(v7, v13, 128, 1);
        id v15 = (id)v47;
        if (v47) {
          uint64_t v48 = *(void **)(v47 + 24);
        }
        else {
          uint64_t v48 = 0;
        }
        id v17 = v48;
      }
      id v49 = v17;
      id v50 = *(id *)(a1 + 40);
      if (v50) {
        id v50 = objc_getProperty(v50, v18, 336, 1);
      }
      id v51 = v50;
      -[NEIKEv2IKESA setLocalAuthProtocolUsed:]((uint64_t)v51, v49);

      uint64_t v52 = *(void *)(a1 + 40);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_210;
      v71[3] = &unk_1E5990670;
      v71[4] = v52;
      id v53 = *(id *)(a1 + 32);
      uint64_t v54 = *(void *)(a1 + 48);
      id v72 = v53;
      uint64_t v73 = v54;
      if (-[NEIKEv2Session sendRequest:retry:replyHandler:](v52, v7, v71) == -1)
      {
        id v56 = *(id *)(a1 + 40);
        if (v56) {
          id v56 = objc_getProperty(v56, v55, 336, 1);
        }
        id v57 = v56;
        ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator AUTH", v58, v59, v60, v61, v62, v63, v64, v70);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v57, 3uLL, ErrorFailedToSend);

        [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
        [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
      }
    }
    else
    {
      id v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = v68;
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE Auth packet (connect)", buf, 0xCu);
      }

      id v21 = *(id *)(a1 + 40);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 336, 1);
      }
      id v22 = v21;
      id ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE Auth packet (connect)", v23, v24, v25, v26, v27, v28, v29, v70);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v22, 3uLL, ErrorInternal);

      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
      [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
    }

    return;
  }
  id v33 = ne_log_obj();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v69 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v75 = v69;
    _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "%@ Failed to generate PPK-derived keys (connect)", buf, 0xCu);
  }

  id v35 = *(id *)(a1 + 40);
  if (v35) {
    id v35 = objc_getProperty(v35, v34, 336, 1);
  }
  id v36 = v35;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate PPK-derived keys (connect)", v37, v38, v39, v40, v41, v42, v43, v70);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v36, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = *(id *)(a1 + 40);
    char v7 = v5;
    id v8 = &OBJC_IVAR___NEIKEv2IKESA__error;
    if (v4)
    {
      if (v5)
      {
        if (![(NEIKEv2IKESA *)v5 usesEAPOnlyAuthentication]) {
          goto LABEL_6;
        }
        id v10 = objc_getProperty(v4, v9, 136, 1);

        if (v10) {
          goto LABEL_6;
        }
        if ([(NEIKEv2Packet *)v4 hasErrors])
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v44 = objc_getProperty(v4, v37, 64, 1);
          uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:buf count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v76;
            while (2)
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v76 != v47) {
                  objc_enumerationMutation(v44);
                }
                id v49 = *(__CFString **)(*((void *)&v75 + 1) + 8 * i);
                if (v49 && (unint64_t)(v49->length - 1) <= 0x3FFE)
                {
                  id v36 = -[NEIKEv2NotifyPayload copyError](v49);
                  id v56 = ne_log_obj();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v61 = (char *)[v4 copyShortDescription];
                    *(_DWORD *)id v79 = 138412546;
                    uint64_t v80 = v61;
                    __int16 v81 = 2112;
                    id v82 = v36;
                    _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ EAP only authentication, received notify error %@", v79, 0x16u);
                  }
                  id v8 = &OBJC_IVAR___NEIKEv2IKESA__error;
                  goto LABEL_41;
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:buf count:16];
              if (v46) {
                continue;
              }
              break;
            }
          }

          id v8 = &OBJC_IVAR___NEIKEv2IKESA__error;
          goto LABEL_6;
        }
        uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax(@"EAP only mode, IKE Auth packet does not contain EAP (connect)", (uint64_t)v37, v38, v39, v40, v41, v42, v43, v70[0]);
      }
      else
      {
        uint64_t v62 = ne_log_obj();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)id v79 = 136315138;
          uint64_t v80 = "-[NEIKEv2IKEAuthPacket(Exchange) validateEAPOnlyAuthentication:]";
          _os_log_fault_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v79, 0xCu);
        }

        uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorInternal(@"IKE SA is nil", v63, v64, v65, v66, v67, v68, v69, v70[0]);
      }
      id v36 = (__CFString *)ErrorPeerInvalidSyntax;
LABEL_41:

      if (v36)
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v12, 336, 1);
        }
        id v58 = Property;
        -[NEIKEv2IKESA setState:error:]((uint64_t)v58, 3uLL, v36);

        [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
        [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
        goto LABEL_20;
      }
LABEL_7:
      if (v4)
      {
        id v13 = objc_getProperty(v4, v12, v8[138], 1);
        if (v13)
        {

          goto LABEL_18;
        }
        id v29 = objc_getProperty(v4, v14, 144, 1);
      }
      else
      {
        id v29 = 0;
      }
      id v30 = v29;

      if (!v30
        && (-[NEIKEv2IKEAuthPacket validateAuthPart1AsInitiator:beforeEAP:]((uint64_t)v4, *(void **)(a1 + 40), 0) & 1) == 0)
      {
        id v51 = *(id *)(a1 + 32);
        if (v51) {
          id v51 = objc_getProperty(v51, v31, 336, 1);
        }
        id v52 = v51;
        -[NEIKEv2IKESA setState:error:]((uint64_t)v52, 3uLL, 0);

        [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
        [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
        goto LABEL_19;
      }
LABEL_18:
      id v33 = *(void **)(a1 + 32);
      uint64_t v32 = *(void **)(a1 + 40);
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = (uint64_t)__43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_214;
      v70[3] = (uint64_t)&unk_1E5990648;
      id v34 = v32;
      uint64_t v74 = *(void *)(a1 + 48);
      uint64_t v35 = *(void *)(a1 + 32);
      id v71 = v34;
      uint64_t v72 = v35;
      id v73 = v4;
      -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](v33, v34, v73, v70);

LABEL_19:
      id v36 = 0;
LABEL_20:

      goto LABEL_21;
    }
LABEL_6:

    goto LABEL_7;
  }
  id v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v55 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v84 = v55;
    _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE Auth packet (connect)", buf, 0xCu);
  }

  id v17 = *(id *)(a1 + 32);
  if (v17) {
    id v17 = objc_getProperty(v17, v16, 336, 1);
  }
  id v18 = v17;
  uint64_t v26 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE Auth packet (connect)", v19, v20, v21, v22, v23, v24, v25, v70[0]);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v18, 3uLL, v26);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  [(NEIKEv2Session *)*(void *)(a1 + 32) resetAll];
LABEL_21:
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_214(uint64_t *a1, void *a2)
{
  uint64_t v458 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (unsigned char *)a1[4];
  if (v4)
  {
    v4[17] = 0;
    id v4 = (unsigned char *)a1[4];
  }
  id v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
  uint64_t v6 = v4;
  id v7 = v5;
  id v9 = v7;
  if (!v3) {
    goto LABEL_34;
  }
  if (!v6)
  {
    v328 = ne_log_obj();
    if (os_log_type_enabled(v328, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v422 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsInitiator:childSA:]";
      v329 = "%s called with null ikeSA";
LABEL_297:
      _os_log_fault_impl(&dword_19DDAF000, v328, OS_LOG_TYPE_FAULT, v329, buf, 0xCu);
    }
LABEL_298:

    goto LABEL_34;
  }
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = (v6[23] & 1) == 0;
  }
  if (v10)
  {
    v328 = ne_log_obj();
    if (os_log_type_enabled(v328, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v422 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsInitiator:childSA:]";
      v329 = "%s called with null childSA";
      goto LABEL_297;
    }
    goto LABEL_298;
  }
  if ((v6[9] & 1) == 0)
  {
    v328 = ne_log_obj();
    if (os_log_type_enabled(v328, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v422 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsInitiator:childSA:]";
      v329 = "%s called with null ikeSA.isInitiator";
      goto LABEL_297;
    }
    goto LABEL_298;
  }
  self = v3;
  if ([(NEIKEv2Packet *)v3 hasErrors])
  {
    v406 = v9;
    uint64_t v402 = a1;
    long long v439 = 0u;
    long long v440 = 0u;
    long long block = 0u;
    long long v438 = 0u;
    id v12 = objc_getProperty(v3, v11, 64, 1);
    uint64_t v13 = [v12 countByEnumeratingWithState:&block objects:&v441 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v438;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v438 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&block + 1) + 8 * v17);
          if (v18 && (unint64_t)(*(void *)(v18 + 24) - 1) <= 0x3FFE)
          {
            id Error = -[NEIKEv2NotifyPayload copyError](*(__CFString **)(*((void *)&block + 1) + 8 * v17));

            uint64_t v20 = ne_log_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v26 = (char *)[self copyShortDescription];
              *(_DWORD *)buf = 138412546;
              v422 = v26;
              __int16 v423 = 2112;
              id v424 = Error;
              _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "%@ Initiator auth received notify error %@", buf, 0x16u);
            }
            id v3 = self;
            if ((*(void *)(v18 + 24) & 0xFFFFFFFFFFFFE000) != 0x2000
              || (v6[18] & 1) != 0
              || ((objc_getProperty(self, v21, 128, 1),
                   uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                   (uint64_t v23 = (void *)v22) == 0)
                ? (uint64_t v24 = 0)
                : (uint64_t v24 = *(void **)(v22 + 32)),
                  id v25 = v24,
                  v25,
                  v23,
                  !v25))
            {
              -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, Error);

              a1 = v402;
              id v9 = v406;
              goto LABEL_33;
            }
            id v15 = Error;
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v27 = [v12 countByEnumeratingWithState:&block objects:&v441 count:16];
        uint64_t v14 = v27;
      }
      while (v27);
    }
    else
    {
      id v15 = 0;
    }

    uint64_t v28 = v15;
    a1 = v402;
    id v9 = v406;
  }
  else
  {
    uint64_t v28 = 0;
  }
  if ([(NEIKEv2IKESA *)v6 usesEAPOnlyAuthentication] && (v6[20] & 1) == 0)
  {
    id v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v272 = (char *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v422 = v272;
      _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ EAP only authentication incomplete", buf, 0xCu);
    }
    ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"EAP only authentication did not complete", v31, v32, v33, v34, v35, v36, v37, v386);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, ErrorAuthentication);

    goto LABEL_45;
  }
  if ((-[NEIKEv2IKEAuthPacket validateAuthPayloadAsInitiator:beforeEAP:](v3, v6, 0) & 1) == 0)
  {
LABEL_45:
    char v419 = 0;
LABEL_46:

LABEL_79:
    uint64_t v67 = (void *)a1[4];
    if (v67 && v67[6] == 3)
    {
      id v68 = objc_getProperty(v67, v29, 56, 1);
      uint64_t v69 = [v68 domain];
      if ([v69 isEqual:@"NEIKEv2ErrorDomain"])
      {
        id Property = (id)a1[4];
        if (Property) {
          id Property = objc_getProperty(Property, v70, 56, 1);
        }
        id v72 = Property;
        uint64_t v73 = [v72 code];

        if (v73 == 5)
        {
          uint64_t v74 = ne_log_obj();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v75 = a1[5];
            LODWORD(v441) = 138412290;
            *(void *)((char *)&v441 + 4) = v75;
            _os_log_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_DEFAULT, "%@ Received server redirect in IKE Auth (connect)", (uint8_t *)&v441, 0xCu);
          }

          long long v77 = [NEIKEv2DeleteIKEContext alloc];
          id v78 = (id)a1[5];
          if (v78) {
            id v78 = objc_getProperty(v78, v76, 368, 1);
          }
          id v79 = v78;
          v417[0] = MEMORY[0x1E4F143A8];
          v417[1] = 3221225472;
          v417[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_216;
          v417[3] = &unk_1E5990580;
          v417[4] = a1[5];
          id v418 = v3;
          uint64_t v80 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v77->super.super.isa, 0, v79, v417);

          -[NEIKEv2Session initiateDelete:]((void *)a1[5], v80);
          goto LABEL_217;
        }
      }
      else
      {
      }
    }
    __int16 v81 = ne_log_obj();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      uint64_t v255 = a1[5];
      LODWORD(v441) = 138412290;
      *(void *)((char *)&v441 + 4) = v255;
      _os_log_error_impl(&dword_19DDAF000, v81, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth packet (connect)", (uint8_t *)&v441, 0xCu);
    }

    uint64_t v83 = a1[4];
    if (!v83 || *(void *)(v83 + 48) != 1)
    {
      id v91 = (id)a1[5];
      if (v91) {
        id v91 = objc_getProperty(v91, v82, 336, 1);
      }
      id v92 = v91;
      uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process IKE Auth packet (connect)", v93, v94, v95, v96, v97, v98, v99, v386);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v92, 3uLL, ErrorPeerInvalidSyntax);

      [(NEIKEv2Session *)(void *)a1[5] reportState];
      [(NEIKEv2Session *)a1[5] resetAll];
      goto LABEL_217;
    }
    uint64_t v84 = *(void **)(*(void *)(a1[7] + 8) + 40);
    if (v84 && v84[4] == 3)
    {
      id v85 = objc_getProperty(v84, v82, 40, 1);
      -[NEIKEv2IKESA setState:error:](v83, 3uLL, v85);
    }
    uint64_t v87 = [NEIKEv2DeleteIKEContext alloc];
    id v88 = (id)a1[5];
    if (v88) {
      id v88 = objc_getProperty(v88, v86, 368, 1);
    }
    id v89 = v88;
    v416[0] = MEMORY[0x1E4F143A8];
    v416[1] = 3221225472;
    v416[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_217;
    v416[3] = &unk_1E5990AD8;
    v416[4] = a1[5];
    uint64_t v90 = v416;
LABEL_202:
    v246 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v87->super.super.isa, 0, v89, v90);

    -[NEIKEv2Session initiateDelete:]((void *)a1[5], v246);
    goto LABEL_217;
  }
  if (v28)
  {
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v28);
    goto LABEL_45;
  }
  if (-[NEIKEv2Packet hasNotification:](v3, (const char *)0x4017))
  {
    uint64_t v104 = 5;
LABEL_106:
    id Error = (id)NEIKEv2CreateError(v104);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, Error);
LABEL_33:

LABEL_34:
    goto LABEL_79;
  }
  if (v6[23]) {
    goto LABEL_281;
  }
  if (v9) {
    id v247 = objc_getProperty(v9, v103, 48, 1);
  }
  else {
    id v247 = 0;
  }
  id v248 = v247;
  if ([v248 mode] == 1)
  {
    char v249 = -[NEIKEv2Packet hasNotification:](v3, (const char *)0x4007);

    if ((v249 & 1) == 0)
    {
      uint64_t v251 = ne_log_obj();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
      {
        uint64_t v338 = (char *)[v3 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v422 = v338;
        _os_log_error_impl(&dword_19DDAF000, v251, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA was not accepted", buf, 0xCu);
      }
      uint64_t v104 = 9;
      goto LABEL_106;
    }
  }
  else
  {
  }
  v256 = objc_getProperty(v3, v250, 88, 1);
  v258 = v256;
  if (v256) {
    v256 = objc_getProperty(v256, v257, 24, 1);
  }
  id Error = v256;

  if ([Error count] != 1)
  {
    uint64_t v273 = ne_log_obj();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_ERROR))
    {
      v326 = (char *)[v3 copyShortDescription];
      int v327 = [Error count];
      *(_DWORD *)buf = 138412546;
      v422 = v326;
      __int16 v423 = 1024;
      LODWORD(v424) = v327;
      _os_log_error_impl(&dword_19DDAF000, v273, OS_LOG_TYPE_ERROR, "%@ Received %u child SA proposals, require 1", buf, 0x12u);
    }
    uint64_t v274 = [Error count];
    id v282 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received %u child SA proposals", v275, v276, v277, v278, v279, v280, v281, v274);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v282);

    goto LABEL_33;
  }
  v259 = [Error firstObject];
  if (([(NEIKEv2ChildSAProposal *)v259 isAValidResponse] & 1) == 0)
  {
    v284 = ne_log_obj();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
    {
      uint64_t v363 = (void *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412802;
      v422 = (const char *)v9;
      __int16 v423 = 2112;
      id v424 = v363;
      __int16 v425 = 2112;
      v426 = v259;
      _os_log_error_impl(&dword_19DDAF000, v284, OS_LOG_TYPE_ERROR, "%@ %@ Received invalid child proposal %@", buf, 0x20u);
    }
    uint64_t v285 = @"Received invalid child proposal %@";
    goto LABEL_265;
  }
  if (v259) {
    id v262 = objc_getProperty(v259, v261, 80, 1);
  }
  else {
    id v262 = 0;
  }
  id v263 = v262;

  if (!v263)
  {
    v284 = ne_log_obj();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
    {
      v381 = (char *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v422 = v381;
      _os_log_error_impl(&dword_19DDAF000, v284, OS_LOG_TYPE_ERROR, "%@ Child SA proposal missing SPI", buf, 0xCu);
    }
    uint64_t v285 = @"Received child proposal missing SPI %@";
LABEL_265:

    v325 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v285, v318, v319, v320, v321, v322, v323, v324, (uint64_t)v259);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v325);

    goto LABEL_33;
  }
  uint64_t v409 = Error;
  long long v435 = 0u;
  long long v436 = 0u;
  *(_OWORD *)v433 = 0u;
  long long v434 = 0u;
  uint64_t v265 = v9;
  uint64_t v266 = [(NEIKEv2ChildSA *)v9 configProposalsWithoutKEM];
  uint64_t v267 = [v266 countByEnumeratingWithState:v433 objects:&v429 count:16];
  if (!v267) {
    goto LABEL_234;
  }
  uint64_t v268 = v267;
  uint64_t v269 = *(void *)v434;
LABEL_228:
  uint64_t v270 = 0;
  while (1)
  {
    if (*(void *)v434 != v269) {
      objc_enumerationMutation(v266);
    }
    v271 = *(void **)(*(void *)&v433[8] + 8 * v270);
    if (-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]((uint64_t)v271, v259, 0, 0)) {
      break;
    }
    if (v268 == ++v270)
    {
      uint64_t v268 = [v266 countByEnumeratingWithState:v433 objects:&v429 count:16];
      if (!v268)
      {
LABEL_234:

        goto LABEL_259;
      }
      goto LABEL_228;
    }
  }
  id v288 = v271;

  if (!v288)
  {
LABEL_259:
    uint64_t v309 = ne_log_obj();
    id v9 = v265;
    uint64_t v28 = v409;
    if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
    {
      uint64_t v375 = a1;
      uint64_t v377 = (void *)[v3 copyShortDescription];
      if (v265) {
        id v378 = objc_getProperty(v265, v376, 48, 1);
      }
      else {
        id v378 = 0;
      }
      id v379 = v378;
      v380 = [v379 proposals];
      *(_DWORD *)buf = 138413058;
      v422 = v265;
      __int16 v423 = 2112;
      id v424 = v377;
      __int16 v425 = 2112;
      v426 = v259;
      __int16 v427 = 2112;
      v428 = v380;
      _os_log_error_impl(&dword_19DDAF000, v309, OS_LOG_TYPE_ERROR, "%@ %@ Received child proposal %@ does not match config %@", buf, 0x2Au);

      id v3 = self;
      a1 = v375;
      uint64_t v28 = v409;
    }

    uint64_t v317 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received child proposal does not match config", v310, v311, v312, v313, v314, v315, v316, v386);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v317);

    char v419 = 0;
    goto LABEL_261;
  }
  uint64_t v289 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v288, v259, 0, 0);
  v291 = v289;
  id v9 = v265;
  if (v265)
  {
    objc_setProperty_atomic(v265, v290, v289, 56);

    id v293 = objc_getProperty(v265, v292, 56, 1);
  }
  else
  {

    id v293 = 0;
  }
  id v294 = v293;

  id v295 = ne_log_obj();
  v296 = v295;
  if (!v294)
  {
    if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
    {
      v382 = (char *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v422 = v382;
      _os_log_error_impl(&dword_19DDAF000, v296, OS_LOG_TYPE_ERROR, "%@ Could not set chosen proposal values", buf, 0xCu);
    }
    uint64_t v337 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Could not set chosen proposal values", v330, v331, v332, v333, v334, v335, v336, v386);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v337);

    char v419 = 0;
    uint64_t v28 = v409;
    goto LABEL_261;
  }
  if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
  {
    id v298 = (void *)[v3 copyShortDescription];
    v299 = a1;
    if (v265) {
      id v300 = objc_getProperty(v265, v297, 56, 1);
    }
    else {
      id v300 = 0;
    }
    BOOL v301 = v300;
    *(_DWORD *)buf = 138412802;
    v422 = v265;
    __int16 v423 = 2112;
    id v424 = v298;
    __int16 v425 = 2112;
    v426 = v301;
    _os_log_impl(&dword_19DDAF000, v296, OS_LOG_TYPE_DEFAULT, "%@ %@ Chose responder auth child proposal %@", buf, 0x20u);

    a1 = v299;
  }

  -[NEIKEv2ChildSA setConfigProposalsWithoutKEM:](v265, v302);
  if (v265) {
    id v304 = objc_getProperty(v265, v303, 48, 1);
  }
  else {
    id v304 = 0;
  }
  id v305 = v304;
  if ([v305 sequencePerTrafficClass])
  {
    int v306 = -[NEIKEv2Packet hasNotification:](v3, (const char *)0xC350);

    if (v306)
    {
      uint64_t v308 = ne_log_obj();
      if (os_log_type_enabled(v308, OS_LOG_TYPE_DEBUG))
      {
        v384 = (char *)[v3 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v422 = v384;
        _os_log_debug_impl(&dword_19DDAF000, v308, OS_LOG_TYPE_DEBUG, "%@ Server Sequence Per Traffic Class supported", buf, 0xCu);
      }
      if (v265) {
        v265[10] = 1;
      }
    }
  }
  else
  {
  }
  uint64_t v339 = objc_getProperty(v3, v307, 160, 1);
  v341 = v339;
  if (v339) {
    uint64_t v339 = objc_getProperty(v339, v340, 24, 1);
  }
  id v342 = v339;
  -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v265, v342);

  uint64_t v344 = [(NEIKEv2ChildSA *)v265 initiatorTrafficSelectors];

  if (!v344)
  {
    v364 = ne_log_obj();
    uint64_t v28 = v409;
    if (os_log_type_enabled(v364, OS_LOG_TYPE_ERROR))
    {
      v383 = (char *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v422 = v383;
      _os_log_error_impl(&dword_19DDAF000, v364, OS_LOG_TYPE_ERROR, "%@ Could not set initiator traffic selectors", buf, 0xCu);

      uint64_t v28 = v409;
    }

    v372 = @"Could not set initiator traffic selectors";
    goto LABEL_302;
  }
  v346 = objc_getProperty(v3, v345, 168, 1);
  uint64_t v348 = v346;
  if (v346) {
    v346 = objc_getProperty(v346, v347, 24, 1);
  }
  id v349 = v346;
  -[NEIKEv2ChildSA setResponderTrafficSelectors:](v265, v349);

  uint64_t v351 = [(NEIKEv2ChildSA *)v265 responderTrafficSelectors];

  if (!v351)
  {
    uint64_t v373 = ne_log_obj();
    uint64_t v28 = v409;
    if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
    {
      id v385 = (char *)[v3 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v422 = v385;
      _os_log_error_impl(&dword_19DDAF000, v373, OS_LOG_TYPE_ERROR, "%@ Could not set responder traffic selectors", buf, 0xCu);

      uint64_t v28 = v409;
    }

    v372 = @"Could not set responder traffic selectors";
LABEL_302:
    uint64_t v374 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v372, v365, v366, v367, v368, v369, v370, v371, v386);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v374);

    char v419 = 0;
LABEL_261:

    goto LABEL_46;
  }

LABEL_281:
  id v352 = objc_getProperty(v3, v103, 152, 1);

  if (v352)
  {
    id v354 = objc_getProperty(v3, v353, 152, 1);
    id v356 = v354;
    if (v354) {
      id v354 = objc_getProperty(v354, v355, 24, 1);
    }
    id v357 = v354;
    objc_setProperty_atomic(v6, v358, v357, 488);
  }
  id v359 = objc_getProperty(v6, v353, 88, 1);
  if ([v359 negotiateMOBIKE])
  {
    int v360 = -[NEIKEv2Packet hasNotification:](v3, (const char *)0x400C);

    if (v360)
    {
      uint64_t v361 = ne_log_obj();
      if (os_log_type_enabled(v361, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v362 = (char *)[v3 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v422 = v362;
        _os_log_debug_impl(&dword_19DDAF000, v361, OS_LOG_TYPE_DEBUG, "%@ Server MOBIKE supported", buf, 0xCu);
      }
      v6[11] = 1;
    }
  }
  else
  {
  }
  uint64_t v39 = (void *)a1[5];
  id v40 = v3;
  v403 = a1;
  if (!v39) {
    goto LABEL_110;
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v429 = 0u;
  long long v430 = 0u;
  long long v431 = 0u;
  long long v432 = 0u;
  id v400 = v40;
  id v43 = objc_getProperty(v40, v42, 64, 1);
  uint64_t v44 = [v43 countByEnumeratingWithState:&v429 objects:&v441 count:16];
  if (!v44) {
    goto LABEL_73;
  }
  uint64_t v46 = v44;
  uint64_t v47 = *(void *)v430;
  do
  {
    uint64_t v48 = 0;
    do
    {
      if (*(void *)v430 != v47) {
        objc_enumerationMutation(v43);
      }
      id v49 = *(void **)(*((void *)&v429 + 1) + 8 * v48);
      if (v49)
      {
        uint64_t v50 = v49[3];
        if (v50 != 16398)
        {
          if (v50 != 16397) {
            goto LABEL_68;
          }
          long long block = 0uLL;
          id v51 = objc_getProperty(v49, v45, 32, 1);
          if ([v51 length] == 4)
          {
            LOWORD(block) = 528;
            id v52 = v51;
            id v53 = (char *)&block + 4;
            uint64_t v54 = 4;
            goto LABEL_60;
          }
          id v56 = ne_log_obj();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = [v51 length];
            *(_DWORD *)v433 = 134217984;
            *(void *)&v433[4] = v57;
            id v58 = v56;
            uint64_t v59 = "Additional IPv4 address has invalid length %llu";
            goto LABEL_71;
          }
          goto LABEL_64;
        }
        long long block = 0uLL;
        DWORD2(v438) = 0;
        *(void *)&long long v438 = 0;
        id v51 = objc_getProperty(v49, v45, 32, 1);
        if ([v51 length] == 16)
        {
          LOWORD(block) = 7708;
          id v52 = v51;
          id v53 = (char *)&block + 8;
          uint64_t v54 = 16;
LABEL_60:
          [v52 getBytes:v53 length:v54];
          uint64_t v55 = [MEMORY[0x1E4F38BC8] endpointWithAddress:&block];
        }
        else
        {
          id v56 = ne_log_obj();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v60 = [v51 length];
            *(_DWORD *)v433 = 134217984;
            *(void *)&v433[4] = v60;
            id v58 = v56;
            uint64_t v59 = "Additional IPv6 address has invalid length %llu";
LABEL_71:
            _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, v59, v433, 0xCu);
          }
LABEL_64:

          uint64_t v55 = 0;
        }

        if (v55) {
          [v41 addObject:v55];
        }
      }
LABEL_68:
      ++v48;
    }
    while (v46 != v48);
    uint64_t v61 = [v43 countByEnumeratingWithState:&v429 objects:&v441 count:16];
    uint64_t v46 = v61;
  }
  while (v61);
LABEL_73:

  id v3 = self;
  if (![v41 count]) {
    goto LABEL_109;
  }
  id v63 = v41;
  if (!v63)
  {
    uint64_t v64 = ne_log_obj();
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
      goto LABEL_108;
    }
    LODWORD(block) = 136315138;
    *(void *)((char *)&block + 4) = "-[NEIKEv2Session reportServerAdditionalAddresses:]";
    uint64_t v286 = "%s called with null additionalAddresses";
LABEL_242:
    _os_log_fault_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_FAULT, v286, (uint8_t *)&block, 0xCu);
    goto LABEL_108;
  }
  if (!objc_getProperty(v39, v62, 336, 1))
  {
    uint64_t v64 = ne_log_obj();
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
      goto LABEL_108;
    }
    LODWORD(block) = 136315138;
    *(void *)((char *)&block + 4) = "-[NEIKEv2Session reportServerAdditionalAddresses:]";
    uint64_t v286 = "%s called with null self.ikeSA";
    goto LABEL_242;
  }
  uint64_t v64 = [v39 additionalAddressesUpdateBlock];
  uint64_t v65 = [v39 clientQueue];

  if (v65 && v64)
  {
    uint64_t v66 = [v39 clientQueue];
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    *(void *)&long long v438 = __50__NEIKEv2Session_reportServerAdditionalAddresses___block_invoke;
    *((void *)&v438 + 1) = &unk_1E5992CA0;
    *(void *)&long long v439 = v39;
    uint64_t v64 = v64;
    *(void *)&long long v440 = v64;
    *((void *)&v439 + 1) = v63;
    dispatch_async(v66, &block);
  }
LABEL_108:

LABEL_109:
  id v40 = v400;
LABEL_110:

  -[NEIKEv2Session reportPrivateNotifiesInPacket:]((id *)a1[5], v40);
  id v105 = (void *)a1[5];
  if (v105) {
    id v105 = (void *)v105[49];
  }
  uint64_t v106 = v105;
  uint64_t v107 = [v106 count];

  if (v107)
  {
    long long v109 = (void *)a1[5];
    if (v109) {
      long long v110 = (void *)v109[49];
    }
    else {
      long long v110 = 0;
    }
    id v111 = v110;
    -[NEIKEv2Session reportPrivateNotifies:](v109, v111);

    -[NEIKEv2Session setPendingPrivateNotifies:](a1[5], 0);
  }
  uint64_t v112 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v112 && (-[NEIKEv2ChildSA generateAllValues](v112) & 1) == 0)
  {
    uint64_t v240 = ne_log_obj();
    if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
    {
      uint64_t v283 = a1[5];
      LODWORD(v441) = 138412290;
      *(void *)((char *)&v441 + 4) = v283;
      _os_log_error_impl(&dword_19DDAF000, v240, OS_LOG_TYPE_ERROR, "%@ Failed to generate Child SA crypto values (connect)", (uint8_t *)&v441, 0xCu);
    }

    uint64_t v87 = [NEIKEv2DeleteIKEContext alloc];
    id v242 = (id)a1[5];
    if (v242) {
      id v242 = objc_getProperty(v242, v241, 368, 1);
    }
    id v89 = v242;
    v415[0] = MEMORY[0x1E4F143A8];
    v415[1] = 3221225472;
    v415[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_221;
    v415[3] = &unk_1E5990AD8;
    v415[4] = a1[5];
    uint64_t v90 = v415;
    goto LABEL_202;
  }
  [(NEIKEv2Session *)(unsigned char *)a1[5] finishConfigurationEstablishment];
  [(NEIKEv2Session *)(void *)a1[5] reportConfiguration];
  long long v114 = (void *)a1[5];
  if (v114)
  {
    uint64_t v115 = [MEMORY[0x1E4F28F80] processInfo];
    id v116 = [v115 processName];

    if (([&unk_1EF08D3D8 containsObject:v116] & 1) == 0)
    {
      id v118 = objc_getProperty(v114, v117, 336, 1);
      if (v118)
      {
        id v120 = objc_getProperty(v118, v119, 96, 1);
        __int16 v122 = v120;
        if (v120) {
          id v120 = objc_getProperty(v120, v121, 88, 1);
        }
      }
      else
      {
        __int16 v122 = 0;
        id v120 = 0;
      }
      id v123 = v120;
      v408 = [v123 description];

      id v125 = objc_getProperty(v114, v124, 336, 1);
      if (v125)
      {
        id v127 = objc_getProperty(v125, v126, 96, 1);
        id v129 = v127;
        if (v127) {
          id v127 = objc_getProperty(v127, v128, 96, 1);
        }
      }
      else
      {
        id v129 = 0;
        id v127 = 0;
      }
      id v130 = v127;
      v407 = [v130 description];

      id v132 = objc_getProperty(v114, v131, 336, 1);
      if (v132)
      {
        id v134 = objc_getProperty(v132, v133, 96, 1);
        v136 = v134;
        if (v134) {
          id v134 = objc_getProperty(v134, v135, 104, 1);
        }
      }
      else
      {
        v136 = 0;
        id v134 = 0;
      }
      id v137 = v134;
      v404 = [v137 description];

      id v139 = objc_getProperty(v114, v138, 336, 1);
      if (v139)
      {
        id v141 = objc_getProperty(v139, v140, 96, 1);
        uint64_t v143 = v141;
        if (v141) {
          id v141 = objc_getProperty(v141, v142, 112, 1);
        }
      }
      else
      {
        uint64_t v143 = 0;
        id v141 = 0;
      }
      id v144 = v141;
      uint64_t v401 = [v144 description];

      id v146 = objc_getProperty(v114, v145, 336, 1);
      v148 = v116;
      if (v146) {
        id v146 = objc_getProperty(v146, v147, 144, 1);
      }
      id v149 = v146;
      id v150 = (void *)MEMORY[0x1E4F1CC38];
      SEL v151 = (void *)MEMORY[0x1E4F1CC28];
      if (v149) {
        uint64_t v152 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v152 = (void *)MEMORY[0x1E4F1CC28];
      }
      id v399 = v152;

      id v154 = objc_getProperty(v114, v153, 336, 1);
      if (v154) {
        id v154 = objc_getProperty(v154, v155, 280, 1);
      }
      id v156 = v154;
      if (v156) {
        Class v157 = v150;
      }
      else {
        Class v157 = v151;
      }
      id v398 = v157;

      v159 = [(NEIKEv2Session *)v114 firstChildSA];
      id v161 = v159;
      if (v159)
      {
        id v162 = objc_getProperty(v159, v160, 56, 1);
        uint64_t v164 = v162;
        if (v162) {
          id v162 = objc_getProperty(v162, v163, 96, 1);
        }
      }
      else
      {
        uint64_t v164 = 0;
        id v162 = 0;
      }
      id v165 = v162;
      uint64_t v396 = [v165 description];

      uint64_t v167 = [(NEIKEv2Session *)v114 firstChildSA];
      uint64_t v169 = v167;
      if (v167)
      {
        id v170 = objc_getProperty(v167, v168, 56, 1);
        SEL v172 = v170;
        if (v170) {
          id v170 = objc_getProperty(v170, v171, 104, 1);
        }
      }
      else
      {
        SEL v172 = 0;
        id v170 = 0;
      }
      id v173 = v170;
      v394 = [v173 description];

      uint64_t v175 = objc_getProperty(v114, v174, 336, 1);
      if (v175) {
        uint64_t v176 = (void *)v175[54];
      }
      else {
        uint64_t v176 = 0;
      }
      id v177 = v176;
      uint64_t v392 = [v177 description];

      SEL v179 = objc_getProperty(v114, v178, 336, 1);
      if (v179) {
        v180 = (void *)v179[55];
      }
      else {
        v180 = 0;
      }
      id v181 = v180;
      uint64_t v391 = [v181 description];

      id v183 = objc_getProperty(v114, v182, 336, 1);
      if (v183)
      {
        id v185 = objc_getProperty(v183, v184, 448, 1);
        uint64_t v187 = v185;
        if (v185)
        {
          uint64_t v387 = objc_msgSend(objc_getProperty(v185, v186, 160, 1), "description");
          goto LABEL_155;
        }
      }
      else
      {
        uint64_t v187 = 0;
      }
      uint64_t v387 = 0;
LABEL_155:

      uint64_t v188 = NSNumber;
      id v190 = objc_getProperty(v114, v189, 336, 1);
      if (v190) {
        id v190 = objc_getProperty(v190, v191, 128, 1);
      }
      id v192 = v190;
      uint64_t v193 = objc_msgSend(v188, "numberWithUnsignedInteger:", objc_msgSend(v192, "length"));

      uint64_t v194 = NSNumber;
      id v196 = objc_getProperty(v114, v195, 336, 1);
      if (v196) {
        id v196 = objc_getProperty(v196, v197, 136, 1);
      }
      id v198 = v196;
      v199 = objc_msgSend(v194, "numberWithUnsignedInteger:", objc_msgSend(v198, "length"));

      *(void *)&long long v441 = MEMORY[0x1E4F143A8];
      *((void *)&v441 + 1) = 3221225472;
      long long v442 = __48__NEIKEv2Session_sendAnalyticsOfChosenProtocols__block_invoke;
      v443 = &unk_1E5990EB0;
      id v444 = v408;
      id v445 = v407;
      id v446 = v404;
      id v447 = v401;
      id v448 = v399;
      id v449 = v398;
      id v450 = v396;
      id v451 = v394;
      id v116 = v148;
      id v452 = v392;
      id v453 = v391;
      id v454 = v387;
      id v455 = v193;
      id v456 = v199;
      id v457 = v148;
      id v390 = v199;
      id v389 = v193;
      id v388 = v387;
      id v200 = v391;
      id v393 = v392;
      id v395 = v394;
      id v397 = v396;
      id v201 = v398;
      id v202 = v399;
      id v203 = v401;
      id v204 = v404;
      id v205 = v407;
      id v206 = v408;
      AnalyticsSendEventLazy();

      id v3 = self;
      a1 = v403;
    }
  }
  -[NEIKEv2IKESA setLocalAuthProtocolUsed:](a1[4], 0);
  -[NEIKEv2IKESA setRemoteAuthProtocolUsed:](a1[4], 0);
  [(NEIKEv2IKESA *)(void *)a1[4] clearAuthenticationSecrets];
  SEL v208 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v208 && (-[NEIKEv2Session installChildSA:](a1[5], v208) & 1) == 0)
  {
    uint64_t v243 = ne_log_obj();
    if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
    {
      uint64_t v287 = a1[5];
      LODWORD(v441) = 138412290;
      *(void *)((char *)&v441 + 4) = v287;
      _os_log_error_impl(&dword_19DDAF000, v243, OS_LOG_TYPE_ERROR, "%@ Failed to install Child SA (connect)", (uint8_t *)&v441, 0xCu);
    }

    uint64_t v87 = [NEIKEv2DeleteIKEContext alloc];
    id v245 = (id)a1[5];
    if (v245) {
      id v245 = objc_getProperty(v245, v244, 368, 1);
    }
    id v89 = v245;
    v414[0] = MEMORY[0x1E4F143A8];
    v414[1] = 3221225472;
    v414[2] = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_225;
    v414[3] = &unk_1E5990AD8;
    v414[4] = a1[5];
    uint64_t v90 = v414;
    goto LABEL_202;
  }
  uint64_t v209 = a1[5];
  if (!v209) {
    goto LABEL_212;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v209 + 352));

  if (!WeakRetained) {
    goto LABEL_212;
  }
  long long v412 = 0u;
  long long v413 = 0u;
  long long v410 = 0u;
  long long v411 = 0u;
  unsigned __int8 v212 = (void *)a1[6];
  if (v212 && (id v213 = objc_getProperty(v212, v211, 152, 1)) != 0)
  {
    id v215 = v213;
    id v216 = objc_getProperty(v213, v214, 24, 1);
    v218 = v216;
    if (v216) {
      id v216 = objc_getProperty(v216, v217, 16, 1);
    }
  }
  else
  {
    v218 = 0;
    id v215 = 0;
    id v216 = 0;
  }
  id v219 = v216;

  uint64_t v220 = [v219 countByEnumeratingWithState:&v410 objects:v420 count:16];
  if (!v220)
  {

    goto LABEL_212;
  }
  uint64_t v221 = v220;
  char v222 = 0;
  uint64_t v223 = *(void *)v411;
  while (2)
  {
    uint64_t v224 = 0;
    while (2)
    {
      if (*(void *)v411 != v223) {
        objc_enumerationMutation(v219);
      }
      uint64_t v225 = *(void **)(*((void *)&v410 + 1) + 8 * v224);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v227 = [v225 address];
        uint64_t v228 = (void *)a1[5];
        if (v228)
        {
          id v229 = objc_getProperty(v228, v226, 336, 1);
          id v231 = v229;
          if (v229)
          {
            char v232 = v227;
            ptrdiff_t v233 = 64;
            goto LABEL_182;
          }
          goto LABEL_183;
        }
LABEL_186:
        id v231 = 0;
        goto LABEL_183;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v227 = [v225 address];
        v235 = (void *)a1[5];
        if (!v235) {
          goto LABEL_186;
        }
        id v229 = objc_getProperty(v235, v234, 336, 1);
        id v231 = v229;
        if (v229)
        {
          char v232 = v227;
          ptrdiff_t v233 = 72;
LABEL_182:
          objc_setProperty_atomic(v229, v230, v232, v233);
        }
LABEL_183:

        char v222 = 1;
      }
      if (v221 != ++v224) {
        continue;
      }
      break;
    }
    uint64_t v236 = [v219 countByEnumeratingWithState:&v410 objects:v420 count:16];
    uint64_t v221 = v236;
    if (v236) {
      continue;
    }
    break;
  }

  if (v222)
  {
    v237 = ne_log_obj();
    if (os_log_type_enabled(v237, OS_LOG_TYPE_INFO))
    {
      uint64_t v238 = a1[5];
      LODWORD(v441) = 138412290;
      *(void *)((char *)&v441 + 4) = v238;
      _os_log_impl(&dword_19DDAF000, v237, OS_LOG_TYPE_INFO, "%@ Changing addresses and migrating (connect)", (uint8_t *)&v441, 0xCu);
    }

    [(NEIKEv2Session *)a1[5] migrateAllChildSAs];
  }
LABEL_212:
  uint64_t v252 = ne_log_obj();
  if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v253 = a1[5];
    LODWORD(v441) = 138412290;
    *(void *)((char *)&v441 + 4) = v253;
    _os_log_impl(&dword_19DDAF000, v252, OS_LOG_TYPE_DEFAULT, "%@ Completed connection (connect)", (uint8_t *)&v441, 0xCu);
  }

  -[NEIKEv2IKESA setState:error:](a1[4], 2uLL, 0);
  uint64_t v254 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (v254)
  {
    -[NEIKEv2Session reportTrafficSelectorsForChildSA:]((void *)a1[5], v254);
    -[NEIKEv2ChildSA setState:error:](*(void *)(*(void *)(a1[7] + 8) + 40), 2uLL, 0);
  }
  [(NEIKEv2Session *)(void *)a1[5] reportState];
LABEL_217:
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_216(uint64_t a1)
{
  -[NEIKEv2Session reportServerRedirect:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v3 resetAll];
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_217(uint64_t a1, const char *a2)
{
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_221(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA crypto values (connect)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke_225(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  id ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA (connect)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

- (uint64_t)setupReceivedChildCopyError
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = objc_getProperty(a1, a2, 368, 1);
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = [(NEIKEv2Session *)a1 firstChildSA];
  uint64_t v7 = (void *)v5;
  if (!v5)
  {
    uint64_t v23 = objc_getProperty(a1, v6, 336, 1);
    if (v23)
    {
      char v24 = v23[23];

      if (v24)
      {
        [(NEIKEv2Session *)a1 reportState];
        uint64_t ErrorInternal = 0;
        goto LABEL_14;
      }
    }
    uint64_t v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = a1;
      _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to get childSA receiver", v28, 0xCu);
    }

    uint64_t v22 = @"Failed to get childSA receiver";
    goto LABEL_12;
  }
  *(unsigned char *)(v5 + 9) = 0;
  -[NEIKEv2ChildSA setState:error:](v5, 1uLL, 0);
  [(NEIKEv2Session *)a1 reportState];
  id v10 = objc_getProperty(v7, v9, 48, 1);
  uint64_t v11 = [v10 proposals];
  char v12 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v7, v11);

  uint64_t ErrorInternal = 0;
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = a1;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to generate Child SA SPI (receive)", v28, 0xCu);
    }

    uint64_t v22 = @"Failed to generate Child SA SPI (receive)";
LABEL_12:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v22, v15, v16, v17, v18, v19, v20, v21, *(uint64_t *)v28);
  }
LABEL_14:

  return ErrorInternal;
}

void __58__NEIKEv2Session_Exchange__setupReceivedChildWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, const void *a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v9 = a3;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v8, 368, 1);
  }
  uint64_t v11 = Property;
  dispatch_assert_queue_V2(v11);

  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13 || !*(unsigned char *)(v13 + 13))
  {
    uint64_t ErrorInternal = ne_log_obj();
    if (os_log_type_enabled(ErrorInternal, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v29;
      _os_log_fault_impl(&dword_19DDAF000, ErrorInternal, OS_LOG_TYPE_FAULT, "%@ already received config block", v51, 0xCu);
    }
    goto LABEL_35;
  }
  *(unsigned char *)(v13 + 13) = 0;
  if (!v7)
  {
    id v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v35;
      _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ Listener rejected this IKEv2 inbound connection by sending back nil sessionConfig", v51, 0xCu);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = @"Listener rejected this IKEv2 inbound connection by sending back nil sessionConfig";
    goto LABEL_34;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  if (v14)
  {
    uint64_t v15 = objc_getProperty(v14, v12, 336, 1);
    if (v15)
    {
      char v16 = v15[23] & 1;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  char v16 = 0;
LABEL_9:

  if (!v9 && (v16 & 1) == 0)
  {
    uint64_t v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      *(_DWORD *)id v51 = 138412290;
      *(void *)&v51[4] = v36;
      _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@ Listener rejected this IKEv2 inbound connection by sending back nil childConfig", v51, 0xCu);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = @"Listener rejected this IKEv2 inbound connection by sending back nil childConfig";
LABEL_34:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v27, v19, v20, v21, v22, v23, v24, v25, *(uint64_t *)v51);
    (*(void (**)(uint64_t, NSObject *))(v26 + 16))(v26, ErrorInternal);
    goto LABEL_35;
  }
  uint64_t v31 = *(void **)(a1 + 32);
  if (v31)
  {
    uint64_t v32 = objc_getProperty(v31, v17, 336, 1);
    if (v32)
    {
      char v33 = v32[23];

      if (v9)
      {
        if (v33)
        {
          uint64_t v34 = ne_log_obj();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            uint64_t v37 = *(void *)(a1 + 32);
            *(_DWORD *)id v51 = 138412290;
            *(void *)&v51[4] = v37;
            _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, "%@ Listener sent back non-nil childConfig for childless SA connection", v51, 0xCu);
          }

          uint64_t v26 = *(void *)(a1 + 40);
          uint64_t v27 = @"Listener sent back non-nil childConfig for childless SA connection";
          goto LABEL_34;
        }
      }
    }
  }
  if (a4)
  {
    uint64_t v38 = *(void *)(a1 + 32);
    if (v38 && *(void *)(v38 + 328))
    {
      uint64_t v39 = ne_log_obj();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v51 = 0;
        _os_log_fault_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_FAULT, "Tried to set ipsecInterface when already set", v51, 2u);
      }

      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = @"Tried to set ipsecInterface when already set";
      goto LABEL_34;
    }
    CFTypeRef v40 = CFRetain(a4);
    uint64_t v41 = *(void *)(a1 + 32);
    if (v41) {
      *(void *)(v41 + 328) = v40;
    }
  }
  SEL v42 = ne_log_large_obj();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    uint64_t v43 = *(void *)(a1 + 32);
    *(_DWORD *)id v51 = 138412802;
    *(void *)&v51[4] = v43;
    __int16 v52 = 2112;
    id v53 = v7;
    __int16 v54 = 2112;
    id v55 = v9;
    _os_log_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_INFO, "%@ Received responseSessionConfig %@ responseChildConfig %@", v51, 0x20u);
  }

  uint64_t v45 = *(void **)(a1 + 32);
  if (v45)
  {
    id v46 = objc_getProperty(v45, v44, 336, 1);
    uint64_t v48 = v46;
    if (v46) {
      objc_setProperty_atomic(v46, v47, v7, 88);
    }
  }
  else
  {
    uint64_t v48 = 0;
  }

  if (v9) {
    -[NEIKEv2Session addFirstChild:](*(void **)(a1 + 32), v9);
  }
  uint64_t v50 = *(void *)(a1 + 40);
  uint64_t ErrorInternal = [(NEIKEv2Session *)*(void **)(a1 + 32) setupReceivedChildCopyError];
  (*(void (**)(uint64_t, NSObject *))(v50 + 16))(v50, ErrorInternal);
LABEL_35:
}

- (void)receiveConnection:(void *)a1
{
  v285[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336, 1);
    id v9 = v7;
    if (!v7)
    {
      uint64_t v254 = ne_log_obj();
      if (os_log_type_enabled(v254, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v282 = "-[NEIKEv2Session(Exchange) receiveConnection:]";
        _os_log_fault_impl(&dword_19DDAF000, v254, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }

      goto LABEL_77;
    }
    if (v4 && (int v10 = v4[6]) != 0)
    {
      uint64_t v14 = ne_log_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 138412546;
      id v282 = (const char *)a1;
      __int16 v283 = 1024;
      int v284 = v10;
      id v200 = "%@ Dropping IKE SA Init with wrong message ID %d";
      id v201 = v14;
      uint32_t v202 = 18;
    }
    else
    {
      id v11 = objc_getProperty(v7, v8, 80, 1);
      char v12 = [v11 serverMode];

      uint64_t v13 = ne_log_obj();
      uint64_t v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v282 = (const char *)a1;
          _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEFAULT, "%@ Starting IKEv2 responder from SA_INIT", buf, 0xCu);
        }

        v9[9] = 0;
        char v16 = (void *)[(NEIKEv2Packet *)v4 copyUnifiedData];
        objc_setProperty_atomic(v9, v17, v16, 320);

        -[NEIKEv2IKESA setState:error:]((uint64_t)v9, 1uLL, 0);
        [(NEIKEv2Session *)a1 reportState];
        id v20 = objc_getProperty(v9, v19, 304, 1);

        if (!v20)
        {
          uint64_t v21 = [a1 ikeInterfaceName];
          objc_setProperty_atomic(v9, v22, v21, 304);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          SEL v145 = ne_log_obj();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v282 = (const char *)a1;
            _os_log_error_impl(&dword_19DDAF000, v145, OS_LOG_TYPE_ERROR, "%@ Failed to receive IKE SA Init packet (receive)", buf, 0xCu);
          }

          id v147 = objc_getProperty(a1, v146, 336, 1);
          uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive IKE SA Init packet (receive)", v148, v149, v150, v151, v152, v153, v154, v258);
LABEL_76:
          id v156 = ErrorPeerInvalidSyntax;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v147, 3uLL, ErrorPeerInvalidSyntax);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
          goto LABEL_77;
        }
        unint64_t v269 = 7;
        if (-[NEIKEv2IKESAInitPacket validateSAInitAsResponder:errorCodeToSend:](v4, v9, &v269))
        {
          if ([(NEIKEv2IKESA *)v9 generateInitialValues])
          {
            uint64_t v24 = v4;
            uint64_t v25 = v9;
            self;
            id v27 = objc_getProperty(v25, v26, 96, 1);

            if (!v27)
            {
              uint64_t v28 = ne_log_obj();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                id v282 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitResponse:ikeSA:]";
                _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.chosenProposal", buf, 0xCu);
              }
              id v144 = 0;
LABEL_120:

              if (v144)
              {
                char v229 = [(NEIKEv2IKESA *)v25 generateAllValuesForSAInit];
                uint64_t v230 = ne_log_obj();
                id v231 = v230;
                if (v229)
                {
                  if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v282 = (const char *)a1;
                    _os_log_impl(&dword_19DDAF000, v231, OS_LOG_TYPE_DEFAULT, "%@ Sending SA_INIT reply", buf, 0xCu);
                  }

                  v266[0] = MEMORY[0x1E4F143A8];
                  v266[1] = 3221225472;
                  v266[2] = __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke;
                  v266[3] = &unk_1E5990760;
                  uint64_t v267 = v25;
                  uint64_t v268 = a1;
                  -[NEIKEv2Session handleIKEIntermediateForResponderIKESA:iteration:replyPacket:replyPacketDescription:handler:](a1, v267, 0, v144, @"responder SA INIT", v266);

                  goto LABEL_132;
                }
                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v282 = (const char *)a1;
                  _os_log_error_impl(&dword_19DDAF000, v231, OS_LOG_TYPE_ERROR, "%@ Failed to generate crypto values (receive)", buf, 0xCu);
                }

                id v234 = objc_getProperty(a1, v243, 336, 1);
                id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate crypto values (receive)", v244, v245, v246, v247, v248, v249, v250, v258);
              }
              else
              {
                char v232 = ne_log_obj();
                if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v282 = (const char *)a1;
                  _os_log_error_impl(&dword_19DDAF000, v232, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init packet (receive)", buf, 0xCu);
                }

                id v234 = objc_getProperty(a1, v233, 336, 1);
                id ErrorCrypto = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init packet (receive)", v235, v236, v237, v238, v239, v240, v241, v258);
              }
              uint64_t v251 = ErrorCrypto;
              -[NEIKEv2IKESA setState:error:]((uint64_t)v234, 3uLL, ErrorCrypto);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
LABEL_132:

              goto LABEL_77;
            }
            uint64_t v28 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKESAInitPacket alloc], v24);
            if (!v28)
            {
              uint64_t v80 = ne_log_obj();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed", buf, 2u);
              }
              id v144 = 0;
              goto LABEL_119;
            }
            uint64_t v264 = v24;
            uint64_t v29 = objc_alloc_init(NEIKEv2IKESAPayload);
            objc_setProperty_atomic(v28, v30, v29, 96);

            self = v25;
            id v32 = objc_getProperty(v25, v31, 96, 1);
            v285[0] = v32;
            char v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v285 count:1];
            uint64_t v35 = objc_getProperty(v28, v34, 96, 1);
            uint64_t v37 = v35;
            if (v35) {
              objc_setProperty_atomic(v35, v36, v33, 24);
            }

            uint64_t v39 = objc_getProperty(v28, v38, 96, 1);
            char v40 = -[NEIKEv2Payload isValid]((uint64_t)v39);

            if (v40)
            {
              uint64_t v41 = objc_alloc_init(NEIKEv2KeyExchangePayload);
              objc_setProperty_atomic(v28, v42, v41, 104);

              id v44 = objc_getProperty(self, v43, 96, 1);
              id v46 = [(NEIKEv2IKESAProposal *)v44 kemProtocol];
              uint64_t v48 = objc_getProperty(v28, v47, 104, 1);
              uint64_t v50 = v48;
              if (v48) {
                objc_setProperty_atomic(v48, v49, v46, 24);
              }

              id v52 = objc_getProperty(self, v51, 160, 1);
              id v53 = v52;
              if (v52) {
                __int16 v54 = (void *)*((void *)v52 + 2);
              }
              else {
                __int16 v54 = 0;
              }
              id v55 = v54;
              uint64_t v57 = objc_getProperty(v28, v56, 104, 1);
              uint64_t v59 = v57;
              if (v57) {
                objc_setProperty_atomic(v57, v58, v55, 32);
              }

              uint64_t v61 = objc_getProperty(v28, v60, 104, 1);
              char v62 = -[NEIKEv2Payload isValid]((uint64_t)v61);

              if (v62)
              {
                id v63 = objc_alloc_init(NEIKEv2NoncePayload);
                objc_setProperty_atomic(v28, v64, v63, 112);

                uint64_t v25 = self;
                id v66 = objc_getProperty(self, v65, 128, 1);
                id v68 = objc_getProperty(v28, v67, 112, 1);
                uint64_t v70 = v68;
                if (v68) {
                  objc_setProperty_atomic(v68, v69, v66, 24);
                }

                id v72 = objc_getProperty(v28, v71, 112, 1);
                char v73 = -[NEIKEv2Payload isValid]((uint64_t)v72);

                if (v73)
                {
                  uint64_t v75 = [(NEIKEv2IKESA *)self initiatorSPI];
                  long long v77 = [(NEIKEv2IKESA *)self responderSPI];
                  id v79 = objc_getProperty(self, v78, 64, 1);
                  uint64_t v80 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v75, v77, v79);

                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4004uLL, v80))
                  {
                    uint64_t v87 = ne_log_obj();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, v87, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed", buf, 2u);
                    }
                    id v144 = 0;
                    uint64_t v25 = self;
                    goto LABEL_160;
                  }
                  v260 = v80;
                  id v82 = [(NEIKEv2IKESA *)self initiatorSPI];
                  uint64_t v84 = [(NEIKEv2IKESA *)self responderSPI];
                  id v86 = objc_getProperty(self, v85, 72, 1);
                  uint64_t v87 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v82, v84, v86);

                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4005uLL, v87))
                  {
                    log = ne_log_obj();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, log, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed", buf, 2u);
                    }
                    id v144 = 0;
                    goto LABEL_157;
                  }
                  if (!-[NEIKEv2Packet addNotification:data:](v28, 0x402EuLL, 0))
                  {
                    log = ne_log_obj();
                    uint64_t v25 = self;
                    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, log, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeIKEv2FragmentationSupported] failed", buf, 2u);
                    }
                    id v144 = 0;
                    goto LABEL_158;
                  }
                  id v89 = objc_getProperty(self, v88, 80, 1);
                  uint64_t v90 = [v89 extraSupportedSignatureHashes];
                  id v92 = [(NEIKEv2IKESA *)self remoteAuthentication];
                  uint64_t v93 = +[NEIKEv2Crypto copySignHashDataForSet:authentication:]((uint64_t)NEIKEv2Crypto, v90, v92);

                  log = v93;
                  if (v93 && !-[NEIKEv2Packet addNotification:data:](v28, 0x402FuLL, v93))
                  {
                    uint64_t v255 = ne_log_obj();
                    if (!os_log_type_enabled(v255, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_156;
                    }
                    *(_WORD *)buf = 0;
                    v256 = "[packet addNotification:NEIKEv2NotifyTypeSignatureHashAlgorithms] failed";
                  }
                  else
                  {
                    id v95 = objc_getProperty(self, v94, 80, 1);
                    int v96 = [v95 requestChildlessSA];

                    if (!v96 || -[NEIKEv2Packet addNotification:data:](v28, 0x4022uLL, 0))
                    {
                      if (((_BYTE)self[3] & 1) == 0 || -[NEIKEv2Packet addNotification:data:](v28, 0x4033uLL, 0))
                      {
                        id Property = objc_getProperty(self, v97, 96, 1);
                        uint64_t v100 = Property;
                        if (Property) {
                          id Property = objc_getProperty(Property, v99, 120, 1);
                        }
                        id v101 = Property;

                        if (!v101 || -[NEIKEv2Packet addNotification:data:](v28, 0x4036uLL, 0))
                        {
                          v259 = v87;
                          uint64_t v102 = self;
                          id v103 = self[13];

                          if (v103)
                          {
                            id v105 = self[13];
                            unsigned int v106 = bswap32([v105 securePasswordMethod]) >> 16;

                            *(_WORD *)buf = v106;
                            uint64_t v107 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:2];
                            if (!-[NEIKEv2Packet addNotification:data:](v28, 0x4028uLL, v107))
                            {
                              v257 = ne_log_obj();
                              if (os_log_type_enabled(v257, OS_LOG_TYPE_FAULT))
                              {
                                *(_WORD *)uint64_t v279 = 0;
                                _os_log_fault_impl(&dword_19DDAF000, v257, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeSecurePasswordMethods] failed", v279, 2u);
                              }

                              id v144 = 0;
                              goto LABEL_164;
                            }

                            uint64_t v102 = self;
                          }
                          long long v276 = 0u;
                          long long v277 = 0u;
                          long long v275 = 0u;
                          long long v274 = 0u;
                          id v108 = objc_getProperty(v102, v104, 80, 1);
                          long long v109 = [v108 customIKESAInitVendorPayloads];

                          uint64_t v110 = [v109 countByEnumeratingWithState:&v274 objects:buf count:16];
                          if (v110)
                          {
                            uint64_t v111 = v110;
                            id v262 = *(id *)v275;
                            do
                            {
                              for (uint64_t i = 0; i != v111; ++i)
                              {
                                if (*(id *)v275 != v262) {
                                  objc_enumerationMutation(v109);
                                }
                                long long v113 = *(void **)(*((void *)&v274 + 1) + 8 * i);
                                long long v114 = objc_alloc_init(NEIKEv2VendorIDPayload);
                                id v116 = [v113 vendorData];
                                if (v114) {
                                  objc_setProperty_atomic(v114, v115, v116, 24);
                                }

                                id v118 = objc_getProperty(v28, v117, 120, 1);

                                if (v118)
                                {
                                  id v120 = objc_getProperty(v28, v119, 120, 1);
                                  uint64_t v121 = [v120 arrayByAddingObject:v114];
                                  objc_setProperty_atomic(v28, v122, v121, 120);
                                }
                                else
                                {
                                  uint64_t v280 = v114;
                                  id v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v280 count:1];
                                  objc_setProperty_atomic(v28, v123, v120, 120);
                                }
                              }
                              uint64_t v111 = [v109 countByEnumeratingWithState:&v274 objects:buf count:16];
                            }
                            while (v111);
                          }

                          long long v272 = 0u;
                          long long v273 = 0u;
                          long long v270 = 0u;
                          long long v271 = 0u;
                          id v125 = objc_getProperty(self, v124, 80, 1);
                          id v126 = [v125 customIKESAInitPayloads];

                          id v263 = v126;
                          uint64_t v127 = [v126 countByEnumeratingWithState:&v270 objects:v279 count:16];
                          if (v127)
                          {
                            uint64_t v128 = v127;
                            uint64_t v129 = *(void *)v271;
                            do
                            {
                              uint64_t v130 = 0;
                              do
                              {
                                if (*(void *)v271 != v129) {
                                  objc_enumerationMutation(v263);
                                }
                                SEL v131 = *(void **)(*((void *)&v270 + 1) + 8 * v130);
                                id v132 = objc_alloc_init(NEIKEv2CustomPayload);
                                uint64_t v133 = [v131 customType];
                                if (v132)
                                {
                                  v132->_customType = v133;
                                  id v134 = [v131 customData];
                                  objc_setProperty_atomic(v132, v135, v134, 32);
                                }
                                else
                                {
                                  id v134 = [v131 customData];
                                }

                                id v137 = objc_getProperty(v28, v136, 56, 1);

                                if (v137)
                                {
                                  id v139 = objc_getProperty(v28, v138, 56, 1);
                                  uint64_t v140 = [v139 arrayByAddingObject:v132];
                                  objc_setProperty_atomic(v28, v141, v140, 56);
                                }
                                else
                                {
                                  uint64_t v278 = v132;
                                  id v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v278 count:1];
                                  objc_setProperty_atomic(v28, v142, v139, 56);
                                }

                                ++v130;
                              }
                              while (v128 != v130);
                              uint64_t v143 = [v263 countByEnumeratingWithState:&v270 objects:v279 count:16];
                              uint64_t v128 = v143;
                            }
                            while (v143);
                          }

                          id v144 = v28;
LABEL_164:
                          uint64_t v24 = v264;
                          uint64_t v25 = self;
                          uint64_t v87 = v259;
                          uint64_t v80 = v260;
                          goto LABEL_159;
                        }
                        uint64_t v255 = ne_log_obj();
                        if (!os_log_type_enabled(v255, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_156;
                        }
                        *(_WORD *)buf = 0;
                        v256 = "[packet addNotification:NEIKEv2NotifyTypeIntermediateExchangeSupported] failed";
                        goto LABEL_155;
                      }
                      uint64_t v255 = ne_log_obj();
                      if (os_log_type_enabled(v255, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v256 = "[packet addNotification:NEIKEv2NotifyTypeUsePPK] failed";
                        goto LABEL_155;
                      }
LABEL_156:

                      id v144 = 0;
LABEL_157:
                      uint64_t v25 = self;
LABEL_158:
                      uint64_t v24 = v264;
                      uint64_t v80 = v260;
LABEL_159:

LABEL_160:
                      goto LABEL_119;
                    }
                    uint64_t v255 = ne_log_obj();
                    if (!os_log_type_enabled(v255, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_156;
                    }
                    *(_WORD *)buf = 0;
                    v256 = "[packet addNotification:NEIKEv2NotifyTypeChildlessIKEv2Supported] failed";
                  }
LABEL_155:
                  _os_log_fault_impl(&dword_19DDAF000, v255, OS_LOG_TYPE_FAULT, v256, buf, 2u);
                  goto LABEL_156;
                }
                uint64_t v80 = ne_log_obj();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  id v282 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitResponse:ikeSA:]";
                  v227 = "%s called with null packet.nonce.isValid";
                  goto LABEL_117;
                }
LABEL_118:
                id v144 = 0;
LABEL_119:

                goto LABEL_120;
              }
              uint64_t v80 = ne_log_obj();
              uint64_t v25 = self;
              if (!os_log_type_enabled(v80, OS_LOG_TYPE_FAULT)) {
                goto LABEL_118;
              }
              *(_DWORD *)buf = 136315138;
              id v282 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitResponse:ikeSA:]";
              v227 = "%s called with null packet.ke.isValid";
            }
            else
            {
              uint64_t v80 = ne_log_obj();
              uint64_t v25 = self;
              if (!os_log_type_enabled(v80, OS_LOG_TYPE_FAULT)) {
                goto LABEL_118;
              }
              *(_DWORD *)buf = 136315138;
              id v282 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitResponse:ikeSA:]";
              v227 = "%s called with null packet.sa.isValid";
            }
LABEL_117:
            _os_log_fault_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_FAULT, v227, buf, 0xCu);
            goto LABEL_118;
          }
          SEL v179 = ne_log_obj();
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v282 = (const char *)a1;
            _os_log_error_impl(&dword_19DDAF000, v179, OS_LOG_TYPE_ERROR, "%@ Failed to generate local crypto values (receive)", buf, 0xCu);
          }

          id v147 = objc_getProperty(a1, v180, 336, 1);
          uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate local crypto values (receive)", v181, v182, v183, v184, v185, v186, v187, v258);
          goto LABEL_76;
        }
        if (v269 == 17)
        {
          v159 = objc_getProperty(v4, v23, 104, 1);
          id v161 = v159;
          if (v159) {
            v159 = objc_getProperty(v159, v160, 24, 1);
          }
          uint64_t v14 = v159;

          id v163 = objc_getProperty(v9, v162, 96, 1);
          id v165 = [(NEIKEv2IKESAProposal *)v163 kemProtocol];

          *(_WORD *)uint64_t v279 = bswap32([v165 method]) >> 16;
          uint64_t v166 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v279 length:2];
          uint64_t v167 = +[NEIKEv2IKESAInitPacket createIKESAInitResponse:errorCode:errorData:]((uint64_t)NEIKEv2IKESAInitPacket, v4, 0x11uLL, v166);

          if (v167)
          {
            char v168 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v167, 0);
            id v177 = objc_getProperty(a1, v169, 336, 1);
            if (v168) {
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorCrypto(@"KE method received in IKE SA Init packet (%@) doesn't match selected (%@) (receive)", v170, v171, v172, v173, v174, v175, v176, (uint64_t)v14);
            }
            else {
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"SA INIT INVALID KE", v170, v171, v172, v173, v174, v175, v176, v258);
            }
          }
          else
          {
            id v203 = ne_log_obj();
            if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v282 = (const char *)a1;
              _os_log_error_impl(&dword_19DDAF000, v203, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init Invalid KE packet", buf, 0xCu);
            }

            id v177 = objc_getProperty(a1, v204, 336, 1);
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init Invalid KE packet", v205, v206, v207, v208, v209, v210, v211, v258);
          }
          uint64_t v221 = ErrorFailedToSend;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v177, 3uLL, ErrorFailedToSend);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }
        else
        {
          uint64_t v188 = ne_log_obj();
          if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v282 = (const char *)a1;
            _os_log_error_impl(&dword_19DDAF000, v188, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE SA Init packet (receive)", buf, 0xCu);
          }

          uint64_t v14 = +[NEIKEv2IKESAInitPacket createIKESAInitResponse:errorCode:errorData:]((uint64_t)NEIKEv2IKESAInitPacket, v4, v269, 0);
          if (v14)
          {
            char v189 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, 0);
            id v198 = objc_getProperty(a1, v190, 336, 1);
            if (v189) {
              uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process IKE SA Init packet (receive)", v191, v192, v193, v194, v195, v196, v197, v258);
            }
            else {
              uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorFailedToSend(@"SA INIT refusal", v191, v192, v193, v194, v195, v196, v197, v258);
            }
          }
          else
          {
            unsigned __int8 v212 = ne_log_obj();
            if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v282 = (const char *)a1;
              _os_log_error_impl(&dword_19DDAF000, v212, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init refusal packet", buf, 0xCu);
            }

            id v198 = objc_getProperty(a1, v213, 336, 1);
            uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init refusal packet", v214, v215, v216, v217, v218, v219, v220, v258);
          }
          uint64_t v224 = ErrorInternal;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v198, 3uLL, ErrorInternal);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }
LABEL_72:

LABEL_77:
        goto LABEL_78;
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 138412290;
      id v282 = (const char *)a1;
      id v200 = "%@ Dropping IKE SA Init sent to non-server session";
      id v201 = v14;
      uint32_t v202 = 12;
    }
    _os_log_error_impl(&dword_19DDAF000, v201, OS_LOG_TYPE_ERROR, v200, buf, v202);
    goto LABEL_72;
  }
LABEL_78:
}

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke(uint64_t a1, void *a2)
{
  v246[12] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = (uint64_t)v4;
  if (!v3) {
    goto LABEL_96;
  }
  if (v4 && (v4[9] & 1) != 0)
  {
    uint64_t v216 = ne_log_obj();
    if (os_log_type_enabled(v216, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v237 = 136315138;
      uint64_t v238 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart1AsResponderCopyErrorForIKESA:errorCodeToSend:]";
      _os_log_fault_impl(&dword_19DDAF000, v216, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", v237, 0xCu);
    }

    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(@"validateAuthPart1AsResponder called as initiator", v217, v218, v219, v220, v221, v222, v223, v224);
    goto LABEL_136;
  }
  if ([(NEIKEv2Packet *)v3 hasErrors])
  {
    long long v235 = 0u;
    long long v236 = 0u;
    *(_OWORD *)location = 0u;
    long long v234 = 0u;
    id v8 = objc_getProperty(v3, v7, 64, 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:location objects:buf count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v234;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v234 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (__CFString *)*((void *)location[1] + i);
          if (v13)
          {
            unint64_t length = v13->length;
            if (length - 1 <= 0x3FFE)
            {
              uint64_t ErrorPeerInvalidSyntax = -[NEIKEv2NotifyPayload copyError](v13);
              if (!ErrorPeerInvalidSyntax) {
                uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorInternal(@"Failed to copy notify error", v25, v26, v27, v28, v29, v30, v31, v224);
              }
              char v33 = ne_log_obj();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                SEL v204 = (char *)[v3 copyShortDescription];
                *(_DWORD *)uint64_t v237 = 138412546;
                uint64_t v238 = v204;
                __int16 v239 = 2112;
                id v240 = ErrorPeerInvalidSyntax;
                _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "%@ Responder auth received notify error %@", v237, 0x16u);
              }
              goto LABEL_102;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:location objects:buf count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  id Property = objc_getProperty(v3, v7, 96, 1);
  SEL v17 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v16, 24, 1);
  }
  id v18 = Property;

  if (!v18)
  {
    SEL v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v205 = (char *)[v3 copyShortDescription];
      *(_DWORD *)uint64_t v237 = 138412290;
      uint64_t v238 = v205;
      _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "%@ Initiator ID missing", v237, 0xCu);
    }
    SEL v42 = @"Initiator ID missing";
    goto LABEL_100;
  }
  if (v6) {
    id v20 = objc_getProperty((id)v6, v19, 80, 1);
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;
  if (([v21 requestChildlessSA] & 1) == 0)
  {

    goto LABEL_33;
  }
  uint64_t v23 = objc_getProperty(v3, v22, 88, 1);

  if (v23)
  {
LABEL_33:
    if (v6 && (*(unsigned char *)(v6 + 23) & 1) != 0) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  if (v6)
  {
    *(unsigned char *)(v6 + 23) = 1;
    goto LABEL_38;
  }
LABEL_35:
  SEL v43 = objc_getProperty(v3, v24, 88, 1);
  uint64_t v45 = v43;
  if (v43) {
    SEL v43 = objc_getProperty(v43, v44, 24, 1);
  }
  id v46 = v43;

  if (!v46)
  {
    uint64_t v140 = ne_log_obj();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
    {
      uint64_t v214 = (char *)[v3 copyShortDescription];
      *(_DWORD *)uint64_t v237 = 138412290;
      uint64_t v238 = v214;
      _os_log_error_impl(&dword_19DDAF000, v140, OS_LOG_TYPE_ERROR, "%@ Received no SA proposals", v237, 0xCu);
    }
    SEL v42 = @"Received no SA proposals";
LABEL_100:
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v42, v35, v36, v37, v38, v39, v40, v41, v224);
    goto LABEL_101;
  }
LABEL_38:
  SEL v47 = objc_getProperty(v3, v24, 96, 1);
  id v49 = v47;
  if (v47) {
    id v50 = objc_getProperty(v47, v48, 24, 1);
  }
  else {
    id v50 = 0;
  }
  id v51 = v50;
  if (v6) {
    objc_storeStrong((id *)(v6 + 344), v50);
  }

  id v53 = objc_getProperty(v3, v52, 104, 1);
  id v55 = v53;
  if (v53) {
    id v56 = objc_getProperty(v53, v54, 24, 1);
  }
  else {
    id v56 = 0;
  }
  id v57 = v56;
  if (v6) {
    objc_storeStrong((id *)(v6 + 336), v56);
  }

  int v58 = -[NEIKEv2Packet hasNotification:](v3, (const char *)0x4007);
  if (v6)
  {
    uint64_t v60 = 1;
    if (!v58) {
      uint64_t v60 = 2;
    }
    *(void *)(v6 + 352) = v60;
  }
  uint64_t v61 = objc_getProperty(v3, v59, 88, 1);
  id v63 = v61;
  if (v61) {
    id v64 = objc_getProperty(v61, v62, 24, 1);
  }
  else {
    id v64 = 0;
  }
  id v65 = v64;
  if (v6) {
    objc_storeStrong((id *)(v6 + 360), v64);
  }

  id v67 = objc_getProperty(v3, v66, 152, 1);
  uint64_t v69 = v67;
  if (v67) {
    id v70 = objc_getProperty(v67, v68, 24, 1);
  }
  else {
    id v70 = 0;
  }
  id v71 = v70;
  if (v6) {
    objc_storeStrong((id *)(v6 + 392), v70);
  }

  char v73 = objc_getProperty(v3, v72, 160, 1);
  uint64_t v75 = v73;
  if (v73) {
    id v76 = objc_getProperty(v73, v74, 24, 1);
  }
  else {
    id v76 = 0;
  }
  id v77 = v76;
  if (v6) {
    objc_storeStrong((id *)(v6 + 400), v76);
  }

  id v79 = objc_getProperty(v3, v78, 168, 1);
  __int16 v81 = v79;
  if (v79) {
    id v82 = objc_getProperty(v79, v80, 24, 1);
  }
  else {
    id v82 = 0;
  }
  id v83 = v82;
  uint64_t v84 = v83;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 408), v82);

    SEL v85 = *(void **)(v6 + 104);
  }
  else
  {

    SEL v85 = 0;
  }
  id v86 = v85;

  uint64_t v88 = objc_getProperty(v3, v87, 128, 1);
  id v89 = (void *)v88;
  if (v88) {
    uint64_t v90 = *(void **)(v88 + 24);
  }
  else {
    uint64_t v90 = 0;
  }
  id v91 = v90;
  id v92 = v91;
  if (!v86)
  {
    -[NEIKEv2IKESA setAuthProtocolFromPacket:](v6, v91);

    uint64_t v109 = objc_getProperty(v3, v108, 128, 1);
    id v110 = (id)v109;
    if (v109) {
      uint64_t v111 = *(void **)(v109 + 32);
    }
    else {
      uint64_t v111 = 0;
    }
    id v112 = v111;
    if (v6) {
      objc_storeStrong((id *)(v6 + 376), v111);
    }

    goto LABEL_86;
  }

  if (v92)
  {
    uint64_t v94 = ne_log_obj();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      uint64_t v206 = (char *)[v3 copyShortDescription];
      uint64_t v208 = objc_getProperty(v3, v207, 128, 1);
      uint64_t v209 = (void *)v208;
      if (v208) {
        uint64_t v210 = *(void **)(v208 + 24);
      }
      else {
        uint64_t v210 = 0;
      }
      id v211 = v210;
      if (v6) {
        unsigned __int8 v212 = *(void **)(v6 + 104);
      }
      else {
        unsigned __int8 v212 = 0;
      }
      id v213 = v212;
      *(_DWORD *)uint64_t v237 = 138412802;
      uint64_t v238 = v206;
      __int16 v239 = 2112;
      id v240 = v211;
      __int16 v241 = 2112;
      id v242 = v213;
      _os_log_error_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_ERROR, "%@ Responder packet authentication method %@ is not compatible with configuration %@", v237, 0x20u);
    }
    uint64_t v96 = objc_getProperty(v3, v95, 128, 1);
    uint64_t v97 = (void *)v96;
    if (v96) {
      uint64_t v98 = *(void **)(v96 + 24);
    }
    else {
      uint64_t v98 = 0;
    }
    id v99 = v98;
    if (v6) {
      uint64_t v100 = *(void **)(v6 + 104);
    }
    else {
      uint64_t v100 = 0;
    }
    id v225 = v100;
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorAuthentication(@"Responder packet authentication method %@ is not compatible with configuration %@", v101, v102, v103, v104, v105, v106, v107, (uint64_t)v99);

    goto LABEL_76;
  }
  id v113 = objc_getProperty(v3, v93, 144, 1);

  if (!v113)
  {
    uint64_t v188 = ne_log_obj();
    if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
    {
      uint64_t v215 = (char *)[v3 copyShortDescription];
      *(_DWORD *)uint64_t v237 = 138412290;
      uint64_t v238 = v215;
      _os_log_error_impl(&dword_19DDAF000, v188, OS_LOG_TYPE_ERROR, "%@ Packet missing GSPM payload", v237, 0xCu);
    }
    uint64_t ErrorInternal = NEIKEv2CreateErrorAuthentication(@"Packet missing GSPM payload", v189, v190, v191, v192, v193, v194, v195, v224);
LABEL_136:
    uint64_t ErrorPeerInvalidSyntax = (void *)ErrorInternal;
LABEL_76:
    unint64_t length = 24;
    goto LABEL_102;
  }
  if (v6) {
    long long v114 = *(void **)(v6 + 104);
  }
  else {
    long long v114 = 0;
  }
  id v110 = v114;
  -[NEIKEv2IKESA setAuthProtocolFromPacket:](v6, v110);
LABEL_86:

  if (!v6 || (*(unsigned char *)(v6 + 24) & 1) == 0) {
    goto LABEL_96;
  }
  uint64_t v115 = -[NEIKEv2Packet copyNotification:](v3, (const char *)0x4034);
  SEL v117 = v115;
  if (!v115)
  {
LABEL_95:

LABEL_96:
    goto LABEL_107;
  }
  uint64_t v118 = [(NEIKEv2NotifyPayload *)v115 getPPKIDType];
  uint64_t v126 = v118;
  if ((unint64_t)(v118 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"PPK ID type %zu is invalid", (uint64_t)v119, v120, v121, v122, v123, v124, v125, v118);
  }
  else
  {
    uint64_t v127 = (void *)[(NEIKEv2NotifyPayload *)v117 copyPPKID];
    uint64_t v128 = [v127 length];
    if (v126 != 2 || v128)
    {
      -[NEIKEv2IKESA setPpkIDFromPacket:](v6, v127);
      *(void *)(v6 + 416) = v126;
      SEL v136 = -[NEIKEv2Packet copyNotification:](v3, (const char *)0x4035);
      SEL v138 = v136;
      if (v136) {
        SEL v136 = objc_getProperty(v136, v137, 32, 1);
      }
      id v139 = v136;
      -[NEIKEv2IKESA setPrimeAuthenticationDataFromPacket:](v6, v139);

      goto LABEL_95;
    }
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"PPK ID missing from payload", v129, v130, v131, v132, v133, v134, v135, v224);
  }
LABEL_101:
  unint64_t length = 7;
LABEL_102:

  if (ErrorPeerInvalidSyntax)
  {
    SEL v141 = ne_log_obj();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      uint64_t v197 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v197;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19DDAF000, v141, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth packet (receive p1) %@", buf, 0x16u);
    }

    id v142 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]((uint64_t)NEIKEv2IKEAuthPacket, v3, length);
    if (-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 40), v142, 0))
    {
      -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 3uLL, ErrorPeerInvalidSyntax);
      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    }
    else
    {
      id v154 = *(id *)(a1 + 40);
      if (v154) {
        id v154 = objc_getProperty(v154, v143, 336, 1);
      }
      id v155 = v154;
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"AUTH refusal p1 %@", v156, v157, v158, v159, v160, v161, v162, (uint64_t)ErrorPeerInvalidSyntax);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v155, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
      [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
    }

    goto LABEL_147;
  }
LABEL_107:
  uint64_t v145 = *(void *)(a1 + 40);
  v227[0] = MEMORY[0x1E4F143A8];
  v227[1] = 3221225472;
  uint64_t v228 = __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_295;
  char v229 = &unk_1E5990738;
  uint64_t v230 = v145;
  id v231 = *(id *)(a1 + 32);
  id v232 = v3;
  id v147 = v227;
  if (v145)
  {
    uint64_t v148 = objc_getProperty((id)v145, v146, 368, 1);
    dispatch_assert_queue_V2(v148);

    id WeakRetained = objc_loadWeakRetained((id *)(v145 + 344));
    uint64_t v151 = [(NEIKEv2Session *)(void *)v145 firstChildSA];

    if (v151 || !WeakRetained)
    {
      uint64_t v166 = objc_getProperty((id)v145, v152, 336, 1);
      char v168 = v166;
      if (v166 && (v166[23] & 1) != 0)
      {
        uint64_t v170 = [(NEIKEv2Session *)(void *)v145 firstChildSA];

        if (v170) {
          [(NEIKEv2Session *)v145 removeFirstChild];
        }
      }
      else
      {
      }
      uint64_t v153 = (NEIKEv2SessionConfiguration *)[(NEIKEv2Session *)(void *)v145 setupReceivedChildCopyError];
      v228(v147, v153);
    }
    else if (*(unsigned char *)(v145 + 13))
    {
      ne_log_obj();
      uint64_t v153 = (NEIKEv2SessionConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v153->super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v145;
        _os_log_fault_impl(&dword_19DDAF000, &v153->super, OS_LOG_TYPE_FAULT, "%@ already expecting config block", buf, 0xCu);
      }
    }
    else
    {
      *(_WORD *)(v145 + 13) = 257;
      uint64_t v171 = (id *)objc_getProperty((id)v145, v152, 336, 1);
      uint64_t v173 = v171;
      if (v171)
      {
        if (objc_getProperty(v171, v172, 88, 1))
        {
          uint64_t v153 = (NEIKEv2SessionConfiguration *)objc_msgSend(objc_getProperty(v173, v174, 88, 1), "copy");
        }
        else
        {
          uint64_t v153 = objc_alloc_init(NEIKEv2SessionConfiguration);
          uint64_t v175 = (void *)[v173[42] copy];
          [(NEIKEv2SessionConfiguration *)v153 setLocalIdentifier:v175];

          uint64_t v176 = (void *)[v173[43] copy];
          [(NEIKEv2SessionConfiguration *)v153 setRemoteIdentifier:v176];

          id v177 = (void *)[v173[46] copy];
          [(NEIKEv2SessionConfiguration *)v153 setRemoteAuthentication:v177];

          SEL v178 = (void *)[v173[49] copy];
          [(NEIKEv2SessionConfiguration *)v153 setConfigurationRequest:v178];

          SEL v179 = (void *)[v173[53] copy];
          [(NEIKEv2SessionConfiguration *)v153 setPpkID:v179];

          [(NEIKEv2SessionConfiguration *)v153 setPpkIDType:v173[52]];
        }
      }
      else
      {
        uint64_t v153 = 0;
      }

      id v181 = objc_getProperty((id)v145, v180, 336, 1);
      uint64_t v183 = v181;
      if (v181 && (*((unsigned char *)v181 + 23) & 1) != 0)
      {
        uint64_t v185 = 0;
      }
      else
      {
        uint64_t v184 = objc_getProperty((id)v145, v182, 336, 1);
        if (v184)
        {
          uint64_t v185 = objc_alloc_init(NEIKEv2ChildSAConfiguration);
          [(NEIKEv2ChildSAConfiguration *)v185 setMode:v184[44]];
          uint64_t v186 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v184[45] copyItems:1];
          [(NEIKEv2ChildSAConfiguration *)v185 setProposals:v186];

          if (*((unsigned char *)v184 + 9))
          {
            id v198 = ne_log_obj();
            if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v198, OS_LOG_TYPE_FAULT, "copyChildConfig called on initiator", buf, 2u);
            }

            uint64_t v226 = 50;
            uint64_t v187 = 51;
          }
          else
          {
            uint64_t v226 = 51;
            uint64_t v187 = 50;
          }
          v199 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v184[v187] copyItems:1];
          [(NEIKEv2ChildSAConfiguration *)v185 setRemoteTrafficSelectors:v199];

          id v200 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v184[v226] copyItems:1];
          [(NEIKEv2ChildSAConfiguration *)v185 setLocalTrafficSelectors:v200];
        }
        else
        {
          uint64_t v185 = 0;
        }
      }
      id v202 = objc_getProperty((id)v145, v201, 336, 1);
      if (v202)
      {
        objc_initWeak(location, v202);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __45__NEIKEv2IKESA_Crypto__copyValidateAuthBlock__block_invoke;
        uint64_t v244 = &unk_1E5990500;
        objc_copyWeak(v246, location);
        uint64_t v245 = (uint64_t)v202;
        id v203 = _Block_copy(buf);
        objc_destroyWeak(v246);
        objc_destroyWeak(location);
      }
      else
      {
        id v203 = 0;
      }

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __58__NEIKEv2Session_Exchange__setupReceivedChildWithHandler___block_invoke;
      uint64_t v244 = &unk_1E59906E8;
      uint64_t v245 = v145;
      v246[0] = v147;
      [WeakRetained requestConfigurationForSession:v145 sessionConfig:v153 childConfig:v185 validateAuthBlock:v203 responseBlock:buf];
    }
  }

  uint64_t ErrorPeerInvalidSyntax = 0;
LABEL_147:
}

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_295(void **a1, void *a2)
{
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = [(NEIKEv2Session *)a1[4] firstChildSA];
  uint64_t v6 = (__CFString *)v5;
  if (v3) {
    goto LABEL_2;
  }
  if (v5)
  {
    uint64_t v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (const char *)a1[4];
      *(_DWORD *)buf = 138412546;
      long long v274 = v25;
      __int16 v275 = 2112;
      long long v276 = v6;
      _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEFAULT, "%@ Set up Child SA %@", buf, 0x16u);
    }

    goto LABEL_22;
  }
  uint64_t v26 = a1[5];
  if (v26 && (v26[23] & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v27 = ne_log_obj();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v221 = (const char *)a1[4];
    *(_DWORD *)buf = 138412290;
    long long v274 = v221;
    _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "%@ Failed to set up Child SA", buf, 0xCu);
  }

  uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(@"Failed to set up Child SA", v28, v29, v30, v31, v32, v33, v34, v243);
  if (!ErrorInternal)
  {
LABEL_22:
    uint64_t v36 = a1[6];
    uint64_t v37 = a1[5];
    uint64_t v38 = v6;
    uint64_t v40 = v38;
    if (!v36) {
      goto LABEL_133;
    }
    if (v37)
    {
      if (v37[9])
      {
        id v232 = ne_log_obj();
        if (os_log_type_enabled(v232, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          long long v274 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsResponderCopyErrorForIKESA:childSA:errorCodeToSend:]";
          _os_log_fault_impl(&dword_19DDAF000, v232, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", buf, 0xCu);
        }

        id v240 = @"validateAuthPart2AsResponder called as initiator";
        goto LABEL_149;
      }
      char v41 = v37[23] & 1;
      if (v38)
      {
LABEL_27:
        SEL v42 = [(NEIKEv2IKESA *)v37 copyInitiatorIdentifier];

        self = v36;
        if (v42)
        {
          id Property = objc_getProperty(v36, v43, 96, 1);
          id v46 = Property;
          if (Property) {
            id Property = objc_getProperty(Property, v45, 24, 1);
          }
          id v47 = Property;
          id v49 = [(NEIKEv2IKESA *)v37 copyInitiatorIdentifier];
          char v50 = [v47 isEqual:v49];

          uint64_t v36 = self;
          if ((v50 & 1) == 0)
          {
            id v89 = objc_getProperty(self, v43, 96, 1);
            id v91 = v89;
            if (v89) {
              id v89 = objc_getProperty(v89, v90, 24, 1);
            }
            id v92 = v89;
            id v76 = (__CFString *)[v92 copyShortDescription];

            uint64_t v94 = [(NEIKEv2IKESA *)v37 copyInitiatorIdentifier];
            id v79 = (__CFString *)[v94 copyShortDescription];

            SEL v95 = ne_log_obj();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
              uint64_t v220 = (char *)[self copyShortDescription];
              *(_DWORD *)buf = 138412802;
              long long v274 = v220;
              __int16 v275 = 2112;
              long long v276 = v76;
              __int16 v277 = 2112;
              uint64_t v278 = v79;
              _os_log_error_impl(&dword_19DDAF000, v95, OS_LOG_TYPE_ERROR, "%@ Initiator ID could not be verified (%@ != %@)", buf, 0x20u);
            }
            uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax(@"Initiator ID could not be verified (%@ != %@)", v96, v97, v98, v99, v100, v101, v102, (uint64_t)v76);
            goto LABEL_51;
          }
        }
        id v51 = objc_getProperty(v36, v43, 96, 1);
        id v53 = v51;
        if (v51) {
          id v51 = objc_getProperty(v51, v52, 24, 1);
        }
        id v55 = v51;
        if (v37) {
          objc_setProperty_atomic(v37, v54, v55, 504);
        }

        id v57 = objc_getProperty(v36, v56, 104, 1);
        uint64_t v59 = v57;
        if (v57 && (id v60 = objc_getProperty(v57, v58, 24, 1)) != 0)
        {
          char v62 = v60;
          id v63 = [(NEIKEv2IKESA *)v37 copyResponderIdentifier];

          if (v63)
          {
            id v65 = objc_getProperty(self, v64, 104, 1);
            id v67 = v65;
            if (v65) {
              id v65 = objc_getProperty(v65, v66, 24, 1);
            }
            id v68 = v65;
            id v70 = [(NEIKEv2IKESA *)v37 copyResponderIdentifier];
            char v71 = [v68 isEqual:v70];

            if ((v71 & 1) == 0)
            {
              SEL v72 = objc_getProperty(self, v64, 104, 1);
              uint64_t v74 = v72;
              if (v72) {
                SEL v72 = objc_getProperty(v72, v73, 24, 1);
              }
              id v75 = v72;
              id v76 = (__CFString *)[v75 copyShortDescription];

              SEL v78 = [(NEIKEv2IKESA *)v37 copyResponderIdentifier];
              id v79 = (__CFString *)[v78 copyShortDescription];

              uint64_t v80 = ne_log_obj();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                char v229 = (char *)[self copyShortDescription];
                *(_DWORD *)buf = 138412802;
                long long v274 = v229;
                __int16 v275 = 2112;
                long long v276 = v76;
                __int16 v277 = 2112;
                uint64_t v278 = v79;
                _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "%@ Responder ID could not be verified (%@ != %@)", buf, 0x20u);
              }
              uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax(@"Responder ID could not be verified (%@ != %@)", v81, v82, v83, v84, v85, v86, v87, (uint64_t)v76);
LABEL_51:
              id v3 = (id)ErrorPeerInvalidSyntax;

LABEL_52:
              unint64_t v7 = 24;
              goto LABEL_138;
            }
          }
        }
        else
        {
        }
        uint64_t v103 = self;
        id v104 = objc_getProperty(self, v64, 152, 1);
        uint64_t v106 = v104;
        if (!v104 || (uint64_t v107 = objc_getProperty(v104, v105, 24, 1)) == 0)
        {
          uint64_t v118 = 0;
LABEL_89:

          goto LABEL_90;
        }
        uint64_t v108 = v107[1];

        if (v108 != 1)
        {
LABEL_90:
          if (!v37 || (v37[23] & 1) == 0)
          {
            if (-[NEIKEv2Packet hasNotification:](v103, (const char *)0x4007)) {
              unint64_t v139 = 1;
            }
            else {
              unint64_t v139 = 2;
            }
            if (v6) {
              id v140 = objc_getProperty(v40, v138, 48, 1);
            }
            else {
              id v140 = 0;
            }
            id v141 = v140;
            uint64_t v142 = [v141 mode];

            if (v139 == v142)
            {
              if (v6) {
                id v144 = objc_getProperty(v40, v143, 48, 1);
              }
              else {
                id v144 = 0;
              }
              uint64_t v145 = self;
              id v146 = v144;
              if ([v146 sequencePerTrafficClass])
              {
                int v147 = -[NEIKEv2Packet hasNotification:](self, (const char *)0xC350);

                if (v147)
                {
                  uint64_t v149 = ne_log_obj();
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
                  {
                    id v231 = (char *)[self copyShortDescription];
                    *(_DWORD *)buf = 138412290;
                    long long v274 = v231;
                    _os_log_debug_impl(&dword_19DDAF000, v149, OS_LOG_TYPE_DEBUG, "%@ Sequence Per Traffic Class supported", buf, 0xCu);
                  }
                  if (v6) {
                    BYTE2(v40->info) = 1;
                  }
                }
              }
              else
              {
              }
              id v163 = objc_getProperty(self, v148, 88, 1);
              id v165 = v163;
              if (v163) {
                id v163 = objc_getProperty(v163, v164, 24, 1);
              }
              id v166 = v163;

              if (v6) {
                id v168 = objc_getProperty(v40, v167, 48, 1);
              }
              else {
                id v168 = 0;
              }
              id v169 = v168;
              uint64_t v170 = [v169 proposals];

              if (v6) {
                id v172 = objc_getProperty(v40, v171, 48, 1);
              }
              else {
                id v172 = 0;
              }
              id v173 = v172;
              uint64_t v174 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]((uint64_t)NEIKEv2ChildSAProposal, v170, v166, [v173 preferInitiatorProposalOrder], 0);
              uint64_t v176 = v174;
              if (v6)
              {
                objc_setProperty_atomic(v40, v175, v174, 56);

                id v178 = objc_getProperty(v40, v177, 56, 1);
              }
              else
              {

                id v178 = 0;
              }
              id v179 = v178;

              SEL v180 = ne_log_obj();
              id v181 = v180;
              if (v179)
              {
                uint64_t v258 = v170;
                if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v183 = (__CFString *)[self copyShortDescription];
                  if (v6) {
                    id v184 = objc_getProperty(v40, v182, 56, 1);
                  }
                  else {
                    id v184 = 0;
                  }
                  uint64_t v185 = (__CFString *)v184;
                  *(_DWORD *)buf = 138412802;
                  long long v274 = (const char *)v40;
                  __int16 v275 = 2112;
                  long long v276 = v183;
                  __int16 v277 = 2112;
                  uint64_t v278 = v185;
                  _os_log_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_DEFAULT, "%@ %@ Chose initiator auth child proposal %@", buf, 0x20u);

                  uint64_t v145 = self;
                }

                uint64_t v187 = objc_getProperty(v145, v186, 160, 1);
                uint64_t v189 = v187;
                if (v187) {
                  uint64_t v187 = objc_getProperty(v187, v188, 24, 1);
                }
                uint64_t v190 = v37;
                id v192 = v187;
                uint64_t v253 = a1;
                if (v6)
                {
                  uint64_t v193 = v40;
                  id v194 = objc_getProperty(v40, v191, 48, 1);
                }
                else
                {
                  id v194 = 0;
                  uint64_t v193 = v40;
                }
                id v195 = v194;
                uint64_t v196 = [v195 remoteTrafficSelectors];
                id v197 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]((uint64_t)NEIKEv2TrafficSelector, (uint64_t)v192, v196);
                -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v193, v197);

                v199 = objc_getProperty(self, v198, 168, 1);
                SEL v201 = v199;
                if (v199) {
                  v199 = objc_getProperty(v199, v200, 24, 1);
                }
                uint64_t v37 = v190;
                id v203 = v199;
                if (v6) {
                  id v204 = objc_getProperty(v40, v202, 48, 1);
                }
                else {
                  id v204 = 0;
                }
                id v205 = v204;
                uint64_t v206 = [v205 localTrafficSelectors];
                id v207 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]((uint64_t)NEIKEv2TrafficSelector, (uint64_t)v203, v206);
                -[NEIKEv2ChildSA setResponderTrafficSelectors:](v40, v207);

                a1 = v253;
                goto LABEL_133;
              }
              if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
              {
                uint64_t v230 = (char *)[self copyShortDescription];
                *(_DWORD *)buf = 138412290;
                long long v274 = v230;
                _os_log_error_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_ERROR, "%@ No matching proposal found", buf, 0xCu);
              }
              id v3 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"No matching proposal found", v208, v209, v210, v211, v212, v213, v214, v243);
            }
            else
            {
              uint64_t v151 = ne_log_obj();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
              {
                uint64_t v222 = (char *)[self copyShortDescription];
                ChildSAModeString = NEIKEv2CreateChildSAModeString(v139);
                id v225 = v37;
                if (v6) {
                  id v226 = objc_getProperty(v40, v223, 48, 1);
                }
                else {
                  id v226 = 0;
                }
                id v227 = v226;
                uint64_t v228 = NEIKEv2CreateChildSAModeString([v227 mode]);
                *(_DWORD *)buf = 138412802;
                long long v274 = v222;
                __int16 v275 = 2112;
                long long v276 = ChildSAModeString;
                __int16 v277 = 2112;
                uint64_t v278 = v228;
                _os_log_error_impl(&dword_19DDAF000, v151, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA did not match (packet had %@ but config expected %@)", buf, 0x20u);

                uint64_t v37 = v225;
              }

              uint64_t v153 = NEIKEv2CreateChildSAModeString(v139);
              if (v6) {
                id v154 = objc_getProperty(v40, v152, 48, 1);
              }
              else {
                id v154 = 0;
              }
              id v155 = v154;
              uint64_t v244 = NEIKEv2CreateChildSAModeString([v155 mode]);
              id v3 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Transport mode Child SA did not match (packet had %@ but config expected %@)", v156, v157, v158, v159, v160, v161, v162, (uint64_t)v153);
            }
            unint64_t v7 = 14;
LABEL_138:

            if (v3) {
              goto LABEL_3;
            }
LABEL_139:
            uint64_t v216 = a1[4];
            uint64_t v215 = a1[5];
            uint64_t v217 = a1[6];
            v259[0] = MEMORY[0x1E4F143A8];
            v259[1] = 3221225472;
            v259[2] = __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_302;
            v259[3] = &unk_1E5990710;
            id v218 = v215;
            uint64_t v219 = a1[4];
            id v260 = v218;
            id v261 = v219;
            id v262 = a1[6];
            id v263 = v40;
            -[NEIKEv2Session handleEAPAndGSPMForIKESA:authPacket:handler:](v216, v218, v217, v259);

            id v3 = v260;
            goto LABEL_11;
          }
LABEL_133:

          goto LABEL_139;
        }
        id v110 = objc_getProperty(self, v109, 152, 1);
        id v112 = v110;
        if (v110) {
          id v110 = objc_getProperty(v110, v111, 24, 1);
        }
        id v114 = v110;
        if (v37) {
          id v115 = objc_getProperty(v37, v113, 88, 1);
        }
        else {
          id v115 = 0;
        }
        id v116 = v115;
        SEL v117 = [v116 configurationReply];
        uint64_t v118 = v114;
        id v119 = v117;
        self;
        uint64_t v251 = v6;
        uint64_t v254 = v119;
        if (v118 && v118[1] == 1)
        {
          if (v119 && v119[1] == 2)
          {
            id v246 = v116;
            uint64_t v248 = v112;
            uint64_t v249 = v37;
            uint64_t v250 = v40;
            uint64_t v252 = a1;
            uint64_t v120 = objc_alloc_init(NEIKEv2ConfigurationMessage);
            if (v120) {
              v120->_configurationType = 2;
            }
            uint64_t v245 = v120;
            uint64_t v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v268 = 0u;
            long long v269 = 0u;
            long long v270 = 0u;
            long long v271 = 0u;
            uint64_t v247 = v118;
            id obj = objc_getProperty(v118, v122, 16, 1);
            uint64_t v123 = [obj countByEnumeratingWithState:&v268 objects:buf count:16];
            if (v123)
            {
              uint64_t v125 = v123;
              uint64_t v257 = *(void *)v269;
              do
              {
                for (uint64_t i = 0; i != v125; ++i)
                {
                  if (*(void *)v269 != v257) {
                    objc_enumerationMutation(obj);
                  }
                  long long v264 = 0u;
                  long long v265 = 0u;
                  long long v266 = 0u;
                  long long v267 = 0u;
                  uint64_t v127 = v119;
                  id v128 = objc_getProperty(v119, v124, 16, 1);
                  uint64_t v129 = [v128 countByEnumeratingWithState:&v264 objects:v272 count:16];
                  if (v129)
                  {
                    uint64_t v130 = v129;
                    uint64_t v131 = *(void *)v265;
                    do
                    {
                      for (uint64_t j = 0; j != v130; ++j)
                      {
                        if (*(void *)v265 != v131) {
                          objc_enumerationMutation(v128);
                        }
                        uint64_t v133 = *(void **)(*((void *)&v264 + 1) + 8 * j);
                        if ([v133 isMemberOfClass:objc_opt_class()]) {
                          [v121 addObject:v133];
                        }
                      }
                      uint64_t v130 = [v128 countByEnumeratingWithState:&v264 objects:v272 count:16];
                    }
                    while (v130);
                  }

                  id v119 = v127;
                }
                uint64_t v125 = [obj countByEnumeratingWithState:&v268 objects:buf count:16];
              }
              while (v125);
            }

            uint64_t v135 = v245;
            if (v245) {
              objc_setProperty_atomic(v245, v134, v121, 16);
            }
            a1 = v252;
            uint64_t v37 = v249;
            uint64_t v40 = v250;
            uint64_t v103 = self;
            uint64_t v118 = v247;
            uint64_t v106 = v248;
            SEL v136 = v246;
            goto LABEL_86;
          }
          SEL v136 = v116;
          uint64_t v121 = ne_log_obj();
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
          {
LABEL_153:
            uint64_t v103 = self;
            uint64_t v106 = v112;
            uint64_t v135 = 0;
LABEL_86:

            if (v37) {
              objc_setProperty_atomic(v37, v137, v135, 488);
            }

            uint64_t v6 = v251;
            goto LABEL_89;
          }
          *(_DWORD *)buf = 136315138;
          long long v274 = "+[NEIKEv2ConfigurationMessage copyConfigurationForRequest:reply:]";
          id v242 = "%s called with null (reply.configurationType == NEIKEv2ConfigurationTypeReply)";
        }
        else
        {
          SEL v136 = v116;
          uint64_t v121 = ne_log_obj();
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_FAULT)) {
            goto LABEL_153;
          }
          *(_DWORD *)buf = 136315138;
          long long v274 = "+[NEIKEv2ConfigurationMessage copyConfigurationForRequest:reply:]";
          id v242 = "%s called with null (request.configurationType == NEIKEv2ConfigurationTypeRequest)";
        }
        _os_log_fault_impl(&dword_19DDAF000, v121, OS_LOG_TYPE_FAULT, v242, buf, 0xCu);
        goto LABEL_153;
      }
    }
    else
    {
      char v41 = 0;
      if (v38) {
        goto LABEL_27;
      }
    }
    if (v41) {
      goto LABEL_27;
    }
    __int16 v241 = ne_log_obj();
    if (os_log_type_enabled(v241, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v274 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart2AsResponderCopyErrorForIKESA:childSA:errorCodeToSend:]";
      _os_log_fault_impl(&dword_19DDAF000, v241, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
    }

    id v240 = @"validateAuthPart2AsResponder called with nil childSA";
LABEL_149:
    id v3 = (id)NEIKEv2CreateErrorInternal(v240, v233, v234, v235, v236, v237, v238, v239, v243);
    goto LABEL_52;
  }
  id v3 = (id)ErrorInternal;
LABEL_2:
  unint64_t v7 = 24;
LABEL_3:
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v150 = (const char *)a1[4];
    *(_DWORD *)buf = 138412290;
    long long v274 = v150;
    _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth packet (receive p2)", buf, 0xCu);
  }

  id v9 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]((uint64_t)NEIKEv2IKEAuthPacket, a1[6], v7);
  if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1[4], v9, 0))
  {
    -[NEIKEv2IKESA setState:error:]((uint64_t)a1[5], 3uLL, v3);
    [(NEIKEv2Session *)a1[4] reportState];
  }
  else
  {
    id v12 = a1[4];
    if (v12) {
      id v12 = objc_getProperty(v12, v10, 336, 1);
    }
    id v13 = v12;
    ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"AUTH refusal p2 %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v3);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v13, 3uLL, ErrorFailedToSend);

    [(NEIKEv2Session *)a1[4] reportState];
    [(NEIKEv2Session *)(uint64_t)a1[4] resetAll];
  }

LABEL_11:
}

void __46__NEIKEv2Session_Exchange__receiveConnection___block_invoke_302(uint64_t a1, void *a2)
{
  v538[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v8 = 0;
    if (!v3)
    {
      uint64_t v5 = 0;
      goto LABEL_16;
    }
    BOOL v9 = 1;
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 17) = 0;
  unint64_t v7 = *(id *)(a1 + 32);
  uint64_t v8 = (uint64_t)v7;
  if (!v5) {
    goto LABEL_16;
  }
  BOOL v9 = v7 == 0;
  if (!v7 || (v7[9] & 1) == 0)
  {
LABEL_5:
    uint64_t v10 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
    if ([v10 method])
    {
      if (v9)
      {

LABEL_8:
        uint64_t v13 = objc_getProperty(v5, v12, 128, 1);
        uint64_t v14 = (void *)v13;
        uint64_t v15 = a1;
        if (v13) {
          uint64_t v16 = *(void **)(v13 + 24);
        }
        else {
          uint64_t v16 = 0;
        }
        id v17 = v16;

        uint64_t v19 = objc_getProperty(v5, v18, 128, 1);
        uint64_t v20 = (void *)v19;
        if (v19) {
          id v21 = *(void **)(v19 + 32);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;

        if ([v17 isSecurePassword]
          && ([(NEIKEv2IKESA *)(id)v8 remoteAuthentication],
              uint64_t v24 = objc_claimAutoreleasedReturnValue(),
              int v25 = [v24 isSecurePassword],
              v24,
              v25))
        {
          uint64_t v26 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];

          id v17 = (id)v26;
        }
        else
        {
          uint64_t v61 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
          char v62 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]((uint64_t)NEIKEv2Crypto, v17, v61);

          if ((v62 & 1) == 0)
          {
            uint64_t v74 = ne_log_obj();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v296 = (char *)[v5 copyShortDescription];
              id v298 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
              *(_DWORD *)buf = 138412802;
              v533 = v296;
              __int16 v534 = 2112;
              uint64_t v535 = (uint64_t)v17;
              __int16 v536 = 2112;
              v537 = v298;
              _os_log_error_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_ERROR, "%@ Responder packet authentication method %@ is not compatible with configuration %@", buf, 0x20u);
            }
            v503 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
            ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"Packet authentication method %@ is not compatible with configuration %@", v76, v77, v78, v79, v80, v81, v82, (uint64_t)v17);

            goto LABEL_194;
          }
        }
        if (v9 || (*(unsigned char *)(v8 + 24) & 1) == 0) {
          goto LABEL_42;
        }
        id v99 = objc_getProperty((id)v8, v27, 456, 1);
        if (!v99 || (uint64_t v101 = *(void *)(v8 + 416), v99, v101))
        {
LABEL_76:
          uint64_t v128 = *(void *)(v8 + 416);
          id v129 = objc_getProperty((id)v8, v100, 88, 1);
          uint64_t v130 = v129;
          if (v128)
          {
            uint64_t v131 = [v129 ppkIDType];

            if (v131 != 2
              || (id v133 = objc_getProperty((id)v8, v132, 88, 1),
                  [v133 ppkID],
                  uint64_t v134 = objc_claimAutoreleasedReturnValue(),
                  v134,
                  v133,
                  v134))
            {
              id v135 = objc_getProperty((id)v8, v132, 88, 1);
              uint64_t v136 = [v135 ppkIDType];

              id v138 = objc_getProperty((id)v8, v137, 88, 1);
              unint64_t v139 = [v138 ppkID];

              if (*(void *)(v8 + 416) == v136)
              {
                id v140 = v5;
                id v141 = *(id *)(v8 + 424);
                if ([v141 length] || objc_msgSend(v139, "length"))
                {
                  id v142 = *(id *)(v8 + 424);
                  char v143 = [v142 isEqualToData:v139];

                  if ((v143 & 1) == 0)
                  {
                    uint64_t v145 = ne_log_obj();
                    if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                    {
                      v485 = (char *)*(id *)(v8 + 424);
                      *(_DWORD *)buf = 138412546;
                      v533 = v485;
                      __int16 v534 = 2112;
                      uint64_t v535 = (uint64_t)v139;
                      _os_log_error_impl(&dword_19DDAF000, v145, OS_LOG_TYPE_ERROR, "PPK ID %@ != Expected %@", buf, 0x16u);
                    }
                    uint64_t v5 = v140;
LABEL_153:

                    id v251 = objc_getProperty((id)v8, v250, 88, 1);
                    int v252 = [v251 ppkMandatory];

                    if (v252)
                    {
                      uint64_t v253 = ne_log_obj();
                      if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_19DDAF000, v253, OS_LOG_TYPE_ERROR, "Wrong PPK ID received with mandatory PPK auth", buf, 2u);
                      }

                      id v261 = @"Wrong PPK ID received with mandatory PPK auth";
LABEL_185:
                      uint64_t ErrorCrypto = NEIKEv2CreateErrorAuthentication(v261, v254, v255, v256, v257, v258, v259, v260, v502);
LABEL_193:
                      ErrorAuthentication = (void *)ErrorCrypto;

                      goto LABEL_194;
                    }
                    id v262 = *(id *)(v8 + 384);

                    id v263 = ne_log_obj();
                    long long v264 = v263;
                    if (!v262)
                    {
                      if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_19DDAF000, v264, OS_LOG_TYPE_ERROR, "Wrong PPK ID received and no non-PPK AUTH data received", buf, 2u);
                      }

                      id v261 = @"Wrong PPK ID received and no non-PPK AUTH data received";
                      goto LABEL_185;
                    }
                    long long v265 = v139;
                    if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19DDAF000, v264, OS_LOG_TYPE_INFO, "Wrong PPK ID received, falling back to non-PPK AUTH data", buf, 2u);
                    }

                    id v266 = *(id *)(v8 + 384);
                    int v63 = 0;
                    id v22 = v266;
LABEL_189:

LABEL_43:
                    id v64 = v17;
                    SEL v66 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
                    int v67 = [v66 isNonStandard];

                    uint64_t v69 = v64;
                    if (v67)
                    {
                      uint64_t v69 = [(NEIKEv2IKESA *)(id)v8 remoteAuthentication];
                    }
                    if (v9) {
                      id Property = 0;
                    }
                    else {
                      id Property = objc_getProperty((id)v8, v68, 456, 1);
                    }
                    id v71 = Property;

                    if (v71)
                    {
                      if ([v69 method] == 12)
                      {
                        SEL v72 = -[NEIKEv2IKESA createInitiatorGSPMAuthenticationDataUsingPrimeKey:](v8, 0);
                        if (v72
                          && +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v72, v22))
                        {
                          if (!v9)
                          {
                            *(unsigned char *)(v8 + 18) = 1;
                            if (v63) {
                              *(unsigned char *)(v8 + 19) = 1;
                            }
                          }

LABEL_150:
                          a1 = v15;
                          goto LABEL_16;
                        }
                        id v242 = ne_log_obj();
                        if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
                        {
                          int v327 = v5;
                          v328 = (char *)[v5 copyShortDescription];
                          *(_DWORD *)buf = 138412290;
                          v533 = v328;
                          _os_log_error_impl(&dword_19DDAF000, v242, OS_LOG_TYPE_ERROR, "%@ GSPM authentication data could not be verified", buf, 0xCu);

                          uint64_t v5 = v327;
                        }

                        ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"GSPM authentication data could not be verified", v243, v244, v245, v246, v247, v248, v249, v502);
                        goto LABEL_168;
                      }
                      uint64_t v152 = ne_log_obj();
                      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                      {
                        v326 = (char *)[v5 copyShortDescription];
                        *(_DWORD *)buf = 138412546;
                        v533 = v326;
                        __int16 v534 = 2112;
                        uint64_t v535 = (uint64_t)v69;
                        _os_log_error_impl(&dword_19DDAF000, v152, OS_LOG_TYPE_ERROR, "%@ Wrong authentication method %@ for GSPM", buf, 0x16u);
                      }
                      uint64_t v160 = NEIKEv2CreateErrorAuthentication(@"Wrong authentication method $@ for GSPM", v153, v154, v155, v156, v157, v158, v159, (uint64_t)v69);
                    }
                    else
                    {
                      if ([v69 isSignature])
                      {
                        if (v9) {
                          id v147 = 0;
                        }
                        else {
                          id v147 = objc_getProperty((id)v8, v146, 88, 1);
                        }
                        v507 = v5;
                        id v148 = v147;
                        uint64_t v149 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v148);

                        if (v149)
                        {
                          uint64_t v150 = (void *)-[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](v8, 0);
                          char v151 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]((uint64_t)NEIKEv2Crypto, v22, v150, v69, v149);
                          CFRelease(v149);
                          if (v151)
                          {
                            if (!v9)
                            {
                              *(unsigned char *)(v8 + 18) = 1;
                              if (v63) {
                                *(unsigned char *)(v8 + 19) = 1;
                              }
                            }

                            uint64_t v5 = v507;
                            goto LABEL_150;
                          }
                          __int16 v277 = ne_log_obj();
                          if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v331 = (char *)[v507 copyShortDescription];
                            *(_DWORD *)buf = 138412546;
                            v533 = v331;
                            __int16 v534 = 2112;
                            uint64_t v535 = (uint64_t)v69;
                            _os_log_error_impl(&dword_19DDAF000, v277, OS_LOG_TYPE_ERROR, "%@ Responder failed to validate remote authentication data %@", buf, 0x16u);
                          }
                          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"Failed to validate remote authentication data %@", v278, v279, v280, v281, v282, v283, v284, (uint64_t)v69);
                        }
                        else
                        {
                          v494 = ne_log_obj();
                          if (os_log_type_enabled(v494, OS_LOG_TYPE_FAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_fault_impl(&dword_19DDAF000, v494, OS_LOG_TYPE_FAULT, "Responder configuration is missing remote public key", buf, 2u);
                          }

                          ErrorAuthentication = (void *)NEIKEv2CreateErrorInternal(@"Responder configuration is missing remote public key", v495, v496, v497, v498, v499, v500, v501, v502);
                        }
                        uint64_t v5 = v507;
                        goto LABEL_168;
                      }
                      if (-[NEIKEv2IKESA checkSharedKeyAuthData:usingPrimeKey:](v8, v22, 0))
                      {
                        if (!v9)
                        {
                          *(unsigned char *)(v8 + 18) = 1;
                          if (v63) {
                            *(unsigned char *)(v8 + 19) = 1;
                          }
                        }
                        goto LABEL_150;
                      }
                      long long v268 = ne_log_obj();
                      if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v330 = (char *)[v5 copyShortDescription];
                        *(_DWORD *)buf = 138412546;
                        v533 = v330;
                        __int16 v534 = 2112;
                        uint64_t v535 = (uint64_t)v69;
                        _os_log_error_impl(&dword_19DDAF000, v268, OS_LOG_TYPE_ERROR, "%@ Responder failed to validate remote authentication data %@", buf, 0x16u);
                      }
                      uint64_t v160 = NEIKEv2CreateErrorAuthentication(@"Failed to validate remote authentication data %@", v269, v270, v271, v272, v273, v274, v275, (uint64_t)v69);
                    }
                    ErrorAuthentication = (void *)v160;
LABEL_168:

                    unint64_t v276 = 24;
LABEL_196:
                    a1 = v15;
                    goto LABEL_197;
                  }
                }
                else
                {
                }
                id v300 = [(NEIKEv2IKESA *)(id)v8 ppk];
                char v301 = -[NEIKEv2IKESA generateDerivativesFromPPK:](v8, v300);

                if ((v301 & 1) == 0)
                {
                  v302 = ne_log_obj();
                  uint64_t v5 = v140;
                  if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v533 = (const char *)v140;
                    _os_log_error_impl(&dword_19DDAF000, v302, OS_LOG_TYPE_ERROR, "%@ Failed to generate PPK-derived keys", buf, 0xCu);
                  }

                  uint64_t ErrorCrypto = NEIKEv2CreateErrorCrypto(@"Failed to generate PPK-derived keys", v303, v304, v305, v306, v307, v308, v309, v502);
                  goto LABEL_193;
                }
                long long v265 = v139;
                int v63 = 1;
                uint64_t v5 = v140;
                goto LABEL_189;
              }
              uint64_t v145 = ne_log_obj();
              if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
              {
                v329 = *(const char **)(v8 + 416);
                *(_DWORD *)buf = 134218240;
                v533 = v329;
                __int16 v534 = 2048;
                uint64_t v535 = v136;
                _os_log_error_impl(&dword_19DDAF000, v145, OS_LOG_TYPE_ERROR, "PPK Type %zu != Expected Type %zu", buf, 0x16u);
              }
              goto LABEL_153;
            }
            uint64_t v285 = ne_log_obj();
            if (os_log_type_enabled(v285, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v533 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthFinalAsResponderCopyErrorForIKESA:errorCodeToSend:]";
              _os_log_fault_impl(&dword_19DDAF000, v285, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.sessionConfiguration.ppkID", buf, 0xCu);
            }

            uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(@"PPK use negotiated but PPK ID is not present in configuration", v286, v287, v288, v289, v290, v291, v292, v502);
          }
          else
          {
            int v161 = [v129 ppkMandatory];

            if (!v161)
            {
LABEL_42:
              int v63 = 0;
              goto LABEL_43;
            }
            uint64_t v162 = ne_log_obj();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v162, OS_LOG_TYPE_ERROR, "No PPK ID received with mandatory PPK auth", buf, 2u);
            }

            uint64_t ErrorInternal = NEIKEv2CreateErrorAuthentication(@"No PPK ID received with mandatory PPK auth", v163, v164, v165, v166, v167, v168, v169, v502);
          }
          ErrorAuthentication = (void *)ErrorInternal;
LABEL_194:
          unint64_t v276 = 24;
LABEL_195:

          goto LABEL_196;
        }
        uint64_t v102 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4034);
        id v104 = v102;
        if (v102)
        {
          uint64_t v105 = [(NEIKEv2NotifyPayload *)v102 getPPKIDType];
          uint64_t v113 = v105;
          if ((unint64_t)(v105 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            ErrorAuthentication = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"PPK ID type %zu is invalid", (uint64_t)v106, v107, v108, v109, v110, v111, v112, v105);
          }
          else
          {
            id v114 = (void *)[(NEIKEv2NotifyPayload *)v104 copyPPKID];
            uint64_t v115 = [v114 length];
            if (v113 != 2 || v115)
            {
              -[NEIKEv2IKESA setPpkIDFromPacket:](v8, v114);
              *(void *)(v8 + 416) = v113;
              uint64_t v123 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4035);
              uint64_t v125 = v123;
              uint64_t v126 = v5;
              if (v123) {
                uint64_t v123 = objc_getProperty(v123, v124, 32, 1);
              }
              id v127 = v123;
              -[NEIKEv2IKESA setPrimeAuthenticationDataFromPacket:](v8, v127);

              uint64_t v5 = v126;
              goto LABEL_75;
            }
            ErrorAuthentication = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"PPK ID missing from payload", v116, v117, v118, v119, v120, v121, v122, v502);
          }
          unint64_t v276 = 7;
          goto LABEL_195;
        }
LABEL_75:

        goto LABEL_76;
      }
      char v11 = *(unsigned char *)(v8 + 18);

      if ((v11 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_16:

    goto LABEL_17;
  }
  v486 = ne_log_obj();
  if (os_log_type_enabled(v486, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v533 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthFinalAsResponderCopyErrorForIKESA:errorCodeToSend:]";
    _os_log_fault_impl(&dword_19DDAF000, v486, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", buf, 0xCu);
  }

  ErrorAuthentication = (void *)NEIKEv2CreateErrorInternal(@"validateAuthFinalAsResponder called as initiator", v487, v488, v489, v490, v491, v492, v493, v502);
  unint64_t v276 = 24;
LABEL_197:

  if (ErrorAuthentication)
  {
    uint64_t v310 = ne_log_obj();
    if (os_log_type_enabled(v310, OS_LOG_TYPE_ERROR))
    {
      v325 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v533 = v325;
      _os_log_error_impl(&dword_19DDAF000, v310, OS_LOG_TYPE_ERROR, "%@ Failed to process IKE Auth packet (receive final)", buf, 0xCu);
    }

    id v239 = +[NEIKEv2IKEAuthPacket createIKEAuthResponse:refusalError:]((uint64_t)NEIKEv2IKEAuthPacket, v5, v276);
    if (-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 40), v239, 0))
    {
      -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 3uLL, ErrorAuthentication);
      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    }
    else
    {
      id v313 = *(id *)(a1 + 40);
      if (v313) {
        id v313 = objc_getProperty(v313, v311, 336, 1);
      }
      id v314 = v313;
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"AUTH refusal final %@", v315, v316, v317, v318, v319, v320, v321, (uint64_t)ErrorAuthentication);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v314, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
      [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
    }
    goto LABEL_332;
  }
LABEL_17:
  -[NEIKEv2Session reportPrivateNotifiesInPacket:](*(id **)(a1 + 40), *(void **)(a1 + 48));
  if (*(void **)(a1 + 48) != v5) {
    -[NEIKEv2Session reportPrivateNotifiesInPacket:](*(id **)(a1 + 40), v5);
  }
  uint64_t v28 = *(void **)(a1 + 40);
  if (v28) {
    uint64_t v28 = (void *)v28[49];
  }
  uint64_t v29 = v28;
  uint64_t v30 = [v29 count];

  if (v30)
  {
    uint64_t v31 = *(void **)(a1 + 40);
    if (v31) {
      uint64_t v32 = (void *)v31[49];
    }
    else {
      uint64_t v32 = 0;
    }
    id v33 = v32;
    -[NEIKEv2Session reportPrivateNotifies:](v31, v33);

    -[NEIKEv2Session setPendingPrivateNotifies:](*(void *)(a1 + 40), 0);
  }
  uint64_t v34 = *(void **)(a1 + 32);
  uint64_t v35 = *(void **)(a1 + 56);
  id v36 = v5;
  uint64_t v37 = v34;
  uint64_t v38 = v35;
  self;
  if (!v37)
  {
    SEL v43 = ne_log_obj();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      goto LABEL_265;
    }
    *(_DWORD *)buf = 136315138;
    v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
    id v60 = "%s called with null ikeSA";
    goto LABEL_38;
  }
  if (!v38 && (HIBYTE(v37[2].isa) & 1) == 0)
  {
    SEL v43 = ne_log_obj();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      goto LABEL_265;
    }
    *(_DWORD *)buf = 136315138;
    v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
    id v60 = "%s called with null childSA";
    goto LABEL_38;
  }
  id v40 = objc_getProperty(v37, v39, 96, 1);

  if (!v40)
  {
    SEL v43 = ne_log_obj();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
LABEL_265:
      id v239 = 0;
      goto LABEL_266;
    }
    *(_DWORD *)buf = 136315138;
    v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
    id v60 = "%s called with null ikeSA.chosenProposal";
LABEL_38:
    _os_log_fault_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_FAULT, v60, buf, 0xCu);
    goto LABEL_265;
  }
  uint64_t v41 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKEAuthPacket alloc], v36);
  if (!v41)
  {
    char v73 = ne_log_obj();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initResponse:] failed", buf, 2u);
    }

    SEL v43 = 0;
    goto LABEL_265;
  }
  SEL v43 = v41;
  id v44 = [(NEIKEv2IKESA *)v37 copyResponderIdentifier];

  if (v44)
  {
    id v46 = objc_alloc_init(NEIKEv2ResponderIdentifierPayload);
    objc_setProperty_atomic(v43, v47, v46, 104);

    id v49 = [(NEIKEv2IKESA *)v37 copyResponderIdentifier];
    id v51 = objc_getProperty(v43, v50, 104, 1);
    id v53 = v51;
    if (v51) {
      objc_setProperty_atomic(v51, v52, v49, 24);
    }

    id v55 = objc_getProperty(v43, v54, 104, 1);
    char v56 = -[NEIKEv2Payload isValid]((uint64_t)v55);

    if ((v56 & 1) == 0)
    {
      uint64_t v97 = ne_log_obj();
      if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
        goto LABEL_264;
      }
      *(_DWORD *)buf = 136315138;
      v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
      uint64_t v98 = "%s called with null packet.idr.isValid";
LABEL_141:
      id v240 = v97;
      uint32_t v241 = 12;
LABEL_142:
      _os_log_fault_impl(&dword_19DDAF000, v240, OS_LOG_TYPE_FAULT, v98, buf, v241);
      goto LABEL_264;
    }
  }
  v506 = v5;
  id v57 = objc_getProperty(v37, v45, 96, 1);
  if (-[NEIKEv2IKESAProposal hasEAPMethods](v57))
  {

    goto LABEL_106;
  }
  uint64_t v84 = [(NEIKEv2IKESA *)v37 authenticationProtocol];
  uint64_t v85 = [v84 method];

  if (!v85) {
    goto LABEL_106;
  }
  uint64_t v86 = [(NEIKEv2IKESA *)v37 authenticationProtocol];
  int v87 = [v86 isSecurePassword];

  if (v87)
  {
    uint64_t v88 = objc_alloc_init(NEIKEv2AuthPayload);
    objc_setProperty_atomic(v43, v89, v88, 128);

    id v91 = [(NEIKEv2IKESA *)v37 authenticationProtocol];
    uint64_t v93 = objc_getProperty(v43, v92, 128, 1);
    -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v93, v91);

    uint64_t v94 = (NEIKEv2AuthPayload *)-[NEIKEv2IKESA createResponderGSPMAuthenticationDataUsingPrimeKey:](v37, 0);
    uint64_t v96 = objc_getProperty(v43, v95, 128, 1);
    -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)v96, v94);
  }
  else
  {
    uint64_t v94 = -[NEIKEv2IKESA copyAuthenticationPayloadUsingPrimeKey:]((id *)&v37->isa, 0);
    objc_setProperty_atomic(v43, v171, v94, 128);
  }

  id v173 = objc_getProperty(v43, v172, 128, 1);
  char v174 = -[NEIKEv2Payload isValid]((uint64_t)v173);

  if ((v174 & 1) == 0)
  {
    uint64_t v97 = ne_log_obj();
    uint64_t v5 = v506;
    if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
      goto LABEL_264;
    }
    *(_DWORD *)buf = 136315138;
    v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
    uint64_t v98 = "%s called with null packet.auth.isValid";
    goto LABEL_141;
  }
  uint64_t v176 = objc_getProperty(v37, v175, 224, 1);

  if (v176 && !-[NEIKEv2Packet addNotification:data:](v43, 0x4034uLL, 0))
  {
    uint64_t v238 = ne_log_obj();
    if (!os_log_type_enabled(v238, OS_LOG_TYPE_FAULT)) {
      goto LABEL_136;
    }
    *(_WORD *)buf = 0;
    id v293 = "[packet addNotification:NEIKEv2NotifyTypePPKIdentity] failed";
    id v294 = v238;
    uint32_t v295 = 2;
    goto LABEL_206;
  }
LABEL_106:
  id v177 = objc_getProperty(v37, v59, 88, 1);
  id v178 = [v177 configurationReply];

  if (v178)
  {
    SEL v180 = objc_alloc_init(NEIKEv2ConfigPayload);
    objc_setProperty_atomic(v43, v181, v180, 152);

    id v183 = objc_getProperty(v37, v182, 88, 1);
    id v184 = [v183 configurationReply];
    id v186 = objc_getProperty(v43, v185, 152, 1);
    uint64_t v188 = v186;
    if (v186) {
      objc_setProperty_atomic(v186, v187, v184, 24);
    }

    id v190 = objc_getProperty(v43, v189, 152, 1);
    char v191 = -[NEIKEv2Payload isValid]((uint64_t)v190);

    if ((v191 & 1) == 0)
    {
      uint64_t v238 = ne_log_obj();
      if (!os_log_type_enabled(v238, OS_LOG_TYPE_FAULT))
      {
LABEL_136:

        id v239 = 0;
        uint64_t v5 = v506;
        goto LABEL_266;
      }
      *(_DWORD *)buf = 136315138;
      v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
      id v293 = "%s called with null packet.config.isValid";
      id v294 = v238;
      uint32_t v295 = 12;
LABEL_206:
      _os_log_fault_impl(&dword_19DDAF000, v294, OS_LOG_TYPE_FAULT, v293, buf, v295);
      goto LABEL_136;
    }
  }
  uint64_t v5 = v506;
  self = v43;
  if (HIBYTE(v37[2].isa)) {
    goto LABEL_214;
  }
  id v192 = objc_alloc_init(NEIKEv2ChildSAPayload);
  objc_setProperty_atomic(v43, v193, v192, 88);

  if (v38) {
    id v195 = objc_getProperty(v38, v194, 56, 1);
  }
  else {
    id v195 = 0;
  }
  id v196 = v195;
  id v197 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v196);
  v538[0] = v197;
  SEL v198 = [MEMORY[0x1E4F1C978] arrayWithObjects:v538 count:1];
  id v200 = objc_getProperty(v43, v199, 88, 1);
  id v202 = v200;
  if (v200) {
    objc_setProperty_atomic(v200, v201, v198, 24);
  }

  id v204 = objc_getProperty(v43, v203, 88, 1);
  char v205 = -[NEIKEv2Payload isValid]((uint64_t)v204);

  if ((v205 & 1) == 0)
  {
    uint64_t v97 = ne_log_obj();
    uint64_t v5 = v506;
    if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
      goto LABEL_264;
    }
    *(_DWORD *)buf = 136315138;
    v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
    uint64_t v98 = "%s called with null packet.sa.isValid";
    goto LABEL_141;
  }
  uint64_t v206 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
  objc_setProperty_atomic(v43, v207, v206, 160);

  uint64_t v209 = [(NEIKEv2ChildSA *)v38 initiatorTrafficSelectors];
  uint64_t v211 = objc_getProperty(v43, v210, 160, 1);
  uint64_t v213 = v211;
  uint64_t v5 = v506;
  if (v211) {
    objc_setProperty_atomic(v211, v212, v209, 24);
  }

  uint64_t v215 = objc_getProperty(v43, v214, 160, 1);
  char v216 = -[NEIKEv2Payload isValid]((uint64_t)v215);

  if (v216)
  {
    uint64_t v217 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
    objc_setProperty_atomic(v43, v218, v217, 168);

    uint64_t v220 = [(NEIKEv2ChildSA *)v38 responderTrafficSelectors];
    uint64_t v222 = objc_getProperty(v43, v221, 168, 1);
    uint64_t v224 = v222;
    if (v222) {
      objc_setProperty_atomic(v222, v223, v220, 24);
    }

    id v226 = objc_getProperty(v43, v225, 168, 1);
    char v227 = -[NEIKEv2Payload isValid]((uint64_t)v226);

    if (v227)
    {
      if (v38) {
        id v229 = objc_getProperty(v38, v228, 48, 1);
      }
      else {
        id v229 = 0;
      }
      id v230 = v229;
      uint64_t v231 = [v230 mode];

      if (v231 == 1 && !-[NEIKEv2Packet addNotification:data:](v43, 0x4007uLL, 0))
      {
        uint64_t v97 = ne_log_obj();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
          goto LABEL_264;
        }
        *(_WORD *)buf = 0;
        uint64_t v98 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
        goto LABEL_334;
      }
      if (!-[NEIKEv2Packet addNotification:data:](v43, 0x400AuLL, 0))
      {
        uint64_t v97 = ne_log_obj();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
          goto LABEL_264;
        }
        *(_WORD *)buf = 0;
        uint64_t v98 = "[packet addNotification:NEIKEv2NotifyTypeESPTFCPaddingNotSupported] failed";
        goto LABEL_334;
      }
      if (!-[NEIKEv2Packet addNotification:data:](v43, 0x400BuLL, 0))
      {
        uint64_t v97 = ne_log_obj();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
          goto LABEL_264;
        }
        *(_WORD *)buf = 0;
        uint64_t v98 = "[packet addNotification:NEIKEv2NotifyTypeNonFirstFragmentsAlso] failed";
        goto LABEL_334;
      }
      if (v38) {
        id v233 = objc_getProperty(v38, v232, 48, 1);
      }
      else {
        id v233 = 0;
      }
      id v234 = v233;
      if ([v234 sequencePerTrafficClass])
      {
        int v235 = -[NEIKEv2Packet hasNotification:](v36, (const char *)0xC350);

        if (v235)
        {
          uint64_t v236 = +[NEIKEv2NotifyPayload createNotifyPayloadType:]();
          BOOL v237 = -[NEIKEv2Packet addNotifyPayload:](v43, v236);

          if (!v237)
          {
            uint64_t v97 = ne_log_obj();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v98 = "[packet addNotifyPayload:notifyPayload] failed";
LABEL_334:
              id v240 = v97;
              uint32_t v241 = 2;
              goto LABEL_142;
            }
LABEL_264:

            goto LABEL_265;
          }
        }
      }
      else
      {
      }
LABEL_214:
      id v332 = objc_getProperty(v37, v179, 88, 1);
      char v333 = [v332 initialContactDisabled];

      if ((v333 & 1) != 0 || -[NEIKEv2Packet addNotification:data:](v43, 0x4000uLL, 0))
      {
        id v335 = objc_getProperty(v37, v334, 88, 1);
        int v336 = [v335 negotiateMOBIKE];

        if (!v336 || -[NEIKEv2Packet addNotification:data:](v43, 0x400CuLL, 0))
        {
          id v504 = v36;
          uint64_t v505 = a1;
          long long v525 = 0u;
          long long v526 = 0u;
          long long v523 = 0u;
          long long v524 = 0u;
          id v338 = objc_getProperty(v37, v337, 88, 1);
          uint64_t v339 = [v338 customIKEAuthPrivateNotifies];

          uint64_t v340 = [v339 countByEnumeratingWithState:&v523 objects:buf count:16];
          if (v340)
          {
            uint64_t v341 = v340;
            uint64_t v342 = *(void *)v524;
            while (2)
            {
              uint64_t v343 = 0;
              do
              {
                if (*(void *)v524 != v342) {
                  objc_enumerationMutation(v339);
                }
                uint64_t v344 = *(void **)(*((void *)&v523 + 1) + 8 * v343);
                v345 = objc_alloc_init(NEIKEv2NotifyPayload);
                unsigned int v346 = [v344 notifyStatus];
                if (v345)
                {
                  v345->_notifyType = v346;
                  v347 = [v344 notifyData];
                  objc_setProperty_atomic(v345, v348, v347, 32);
                }
                else
                {
                  v347 = [v344 notifyData];
                }

                if (!-[NEIKEv2Packet addNotifyPayload:](v43, v345))
                {
                  id v388 = ne_log_obj();
                  if (os_log_type_enabled(v388, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v531 = 0;
                    _os_log_fault_impl(&dword_19DDAF000, v388, OS_LOG_TYPE_FAULT, "[packet addNotifyPayload:notifyPayload] failed", v531, 2u);
                  }

                  id v239 = 0;
                  goto LABEL_260;
                }

                ++v343;
              }
              while (v341 != v343);
              uint64_t v349 = [v339 countByEnumeratingWithState:&v523 objects:buf count:16];
              uint64_t v341 = v349;
              if (v349) {
                continue;
              }
              break;
            }
          }

          long long v521 = 0u;
          long long v522 = 0u;
          long long v519 = 0u;
          long long v520 = 0u;
          id v351 = objc_getProperty(v37, v350, 88, 1);
          id v352 = [v351 customIKEAuthVendorPayloads];

          id obj = v352;
          uint64_t v353 = [v352 countByEnumeratingWithState:&v519 objects:v531 count:16];
          if (v353)
          {
            uint64_t v354 = v353;
            uint64_t v355 = *(void *)v520;
            do
            {
              for (uint64_t i = 0; i != v354; ++i)
              {
                if (*(void *)v520 != v355) {
                  objc_enumerationMutation(obj);
                }
                id v357 = *(void **)(*((void *)&v519 + 1) + 8 * i);
                SEL v358 = objc_alloc_init(NEIKEv2VendorIDPayload);
                int v360 = [v357 vendorData];
                if (v358) {
                  objc_setProperty_atomic(v358, v359, v360, 24);
                }

                uint64_t v362 = objc_getProperty(self, v361, 176, 1);

                if (v362)
                {
                  v364 = objc_getProperty(self, v363, 176, 1);
                  uint64_t v365 = [v364 arrayByAddingObject:v358];
                  objc_setProperty_atomic(self, v366, v365, 176);
                }
                else
                {
                  v530 = v358;
                  v364 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v530 count:1];
                  objc_setProperty_atomic(self, v367, v364, 176);
                }
              }
              uint64_t v354 = [obj countByEnumeratingWithState:&v519 objects:v531 count:16];
            }
            while (v354);
          }

          long long v517 = 0u;
          long long v518 = 0u;
          long long v515 = 0u;
          long long v516 = 0u;
          id v369 = objc_getProperty(v37, v368, 88, 1);
          uint64_t v370 = [v369 customIKEAuthPayloads];

          uint64_t v371 = [v370 countByEnumeratingWithState:&v515 objects:v529 count:16];
          if (v371)
          {
            uint64_t v372 = v371;
            uint64_t v373 = *(void *)v516;
            do
            {
              uint64_t v374 = 0;
              do
              {
                if (*(void *)v516 != v373) {
                  objc_enumerationMutation(v370);
                }
                uint64_t v375 = *(void **)(*((void *)&v515 + 1) + 8 * v374);
                uint64_t v376 = objc_alloc_init(NEIKEv2CustomPayload);
                uint64_t v377 = [v375 customType];
                if (v376)
                {
                  v376->_customType = v377;
                  id v378 = [v375 customData];
                  objc_setProperty_atomic(v376, v379, v378, 32);
                }
                else
                {
                  id v378 = [v375 customData];
                }

                v381 = objc_getProperty(self, v380, 56, 1);

                if (v381)
                {
                  v383 = objc_getProperty(self, v382, 56, 1);
                  v384 = [v383 arrayByAddingObject:v376];
                  objc_setProperty_atomic(self, v385, v384, 56);
                }
                else
                {
                  v528 = v376;
                  v383 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v528 count:1];
                  objc_setProperty_atomic(self, v386, v383, 56);
                }

                ++v374;
              }
              while (v372 != v374);
              uint64_t v387 = [v370 countByEnumeratingWithState:&v515 objects:v529 count:16];
              uint64_t v372 = v387;
            }
            while (v387);
          }

          SEL v43 = self;
          id v239 = v43;
LABEL_260:
          uint64_t v5 = v506;
          id v36 = v504;
          a1 = v505;
          goto LABEL_266;
        }
        uint64_t v97 = ne_log_obj();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
          goto LABEL_264;
        }
        *(_WORD *)buf = 0;
        uint64_t v98 = "[packet addNotification:NEIKEv2NotifyTypeMOBIKESupported] failed";
      }
      else
      {
        uint64_t v97 = ne_log_obj();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
          goto LABEL_264;
        }
        *(_WORD *)buf = 0;
        uint64_t v98 = "[packet addNotification:NEIKEv2NotifyTypeInitialContact] failed";
      }
      goto LABEL_334;
    }
    long long v267 = ne_log_obj();
    if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
      _os_log_fault_impl(&dword_19DDAF000, v267, OS_LOG_TYPE_FAULT, "%s called with null packet.tsr.isValid", buf, 0xCu);
    }
  }
  else
  {
    long long v267 = ne_log_obj();
    if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v533 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthResponse:ikeSA:childSA:]";
      _os_log_fault_impl(&dword_19DDAF000, v267, OS_LOG_TYPE_FAULT, "%s called with null packet.tsi.isValid", buf, 0xCu);
    }
  }

  id v239 = 0;
LABEL_266:

  id v389 = ne_log_obj();
  id v390 = v389;
  if (v239)
  {
    if (os_log_type_enabled(v389, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v391 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v533 = v391;
      _os_log_impl(&dword_19DDAF000, v390, OS_LOG_TYPE_DEFAULT, "%@ Sending AUTH reply", buf, 0xCu);
    }

    if (-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 40), v239, 0))
    {
      uint64_t v393 = *(void *)(a1 + 56);
      if (v393 && (-[NEIKEv2ChildSA generateAllValues](v393) & 1) == 0)
      {
        id v456 = ne_log_obj();
        if (os_log_type_enabled(v456, OS_LOG_TYPE_ERROR))
        {
          v483 = *(const char **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v533 = v483;
          _os_log_error_impl(&dword_19DDAF000, v456, OS_LOG_TYPE_ERROR, "%@ Failed to generate Child SA crypto values (receive)", buf, 0xCu);
        }

        id v458 = *(id *)(a1 + 40);
        if (v458) {
          id v458 = objc_getProperty(v458, v457, 336, 1);
        }
        id v447 = v458;
        id v455 = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA crypto values (receive)", v459, v460, v461, v462, v463, v464, v465, v502);
      }
      else
      {
        [(NEIKEv2Session *)*(unsigned char **)(a1 + 40) finishConfigurationEstablishment];
        [(NEIKEv2Session *)*(void **)(a1 + 40) reportConfiguration];
        [(NEIKEv2IKESA *)*(void **)(a1 + 32) clearAuthenticationSecrets];
        uint64_t v396 = *(void **)(a1 + 56);
        if (!v396 || (-[NEIKEv2Session installChildSA:](*(void *)(a1 + 40), v396) & 1) != 0)
        {
          id v397 = ne_log_obj();
          if (os_log_type_enabled(v397, OS_LOG_TYPE_DEFAULT))
          {
            id v398 = *(const char **)(a1 + 40);
            uint64_t v399 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            v533 = v398;
            __int16 v534 = 2112;
            uint64_t v535 = v399;
            _os_log_impl(&dword_19DDAF000, v397, OS_LOG_TYPE_DEFAULT, "%@ Installed Child SA %@", buf, 0x16u);
          }

          uint64_t v400 = *(void *)(a1 + 40);
          if (v400)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v400 + 352));

            if (WeakRetained)
            {
              long long v513 = 0u;
              long long v514 = 0u;
              long long v511 = 0u;
              long long v512 = 0u;
              v403 = *(void **)(a1 + 40);
              if (v403)
              {
                id v404 = objc_getProperty(v403, v402, 336, 1);
                v406 = v404;
                uint64_t v407 = a1;
                if (v404) {
                  id v404 = objc_getProperty(v404, v405, 88, 1);
                }
              }
              else
              {
                uint64_t v407 = a1;
                v406 = 0;
                id v404 = 0;
              }
              id v408 = v404;
              uint64_t v409 = [v408 configurationReply];
              long long v411 = v409;
              if (v409) {
                uint64_t v409 = objc_getProperty(v409, v410, 16, 1);
              }
              id v412 = v409;

              uint64_t v413 = [v412 countByEnumeratingWithState:&v511 objects:v527 count:16];
              if (!v413)
              {

                a1 = v407;
                goto LABEL_326;
              }
              uint64_t v414 = v413;
              selfa = v239;
              char v415 = 0;
              uint64_t v416 = *(void *)v512;
              while (1)
              {
                uint64_t v417 = 0;
                do
                {
                  if (*(void *)v512 != v416) {
                    objc_enumerationMutation(v412);
                  }
                  id v418 = *(void **)(*((void *)&v511 + 1) + 8 * v417);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v420 = [v418 address];
                    v421 = *(void **)(v407 + 40);
                    if (!v421) {
                      goto LABEL_300;
                    }
                    id v422 = objc_getProperty(v421, v419, 336, 1);
                    id v424 = v422;
                    if (v422)
                    {
                      __int16 v425 = v420;
                      ptrdiff_t v426 = 72;
LABEL_296:
                      objc_setProperty_atomic(v422, v423, v425, v426);
                    }
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_298;
                    }
                    v420 = [v418 address];
                    v428 = *(void **)(v407 + 40);
                    if (!v428)
                    {
LABEL_300:
                      id v424 = 0;
                      goto LABEL_297;
                    }
                    id v422 = objc_getProperty(v428, v427, 336, 1);
                    id v424 = v422;
                    if (v422)
                    {
                      __int16 v425 = v420;
                      ptrdiff_t v426 = 64;
                      goto LABEL_296;
                    }
                  }
LABEL_297:

                  char v415 = 1;
LABEL_298:
                  ++v417;
                }
                while (v414 != v417);
                uint64_t v429 = [v412 countByEnumeratingWithState:&v511 objects:v527 count:16];
                uint64_t v414 = v429;
                if (!v429)
                {

                  a1 = v407;
                  id v239 = selfa;
                  if (v415)
                  {
                    long long v430 = ne_log_obj();
                    if (os_log_type_enabled(v430, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v431 = *(const char **)(v407 + 40);
                      *(_DWORD *)buf = 138412290;
                      v533 = v431;
                      _os_log_impl(&dword_19DDAF000, v430, OS_LOG_TYPE_DEFAULT, "%@ Changing addresses and migrating (receive)", buf, 0xCu);
                    }

                    [(NEIKEv2Session *)*(void *)(v407 + 40) migrateAllChildSAs];
                  }
                  break;
                }
              }
            }
          }
LABEL_326:
          v479 = ne_log_obj();
          if (os_log_type_enabled(v479, OS_LOG_TYPE_DEFAULT))
          {
            v480 = *(const char **)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v533 = v480;
            _os_log_impl(&dword_19DDAF000, v479, OS_LOG_TYPE_DEFAULT, "%@ Completed connection (receive)", buf, 0xCu);
          }

          -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 2uLL, 0);
          v481 = *(void **)(a1 + 56);
          if (v481)
          {
            -[NEIKEv2Session reportTrafficSelectorsForChildSA:](*(void **)(a1 + 40), v481);
            -[NEIKEv2ChildSA setState:error:](*(void *)(a1 + 56), 2uLL, 0);
          }
          [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
          goto LABEL_331;
        }
        v466 = ne_log_obj();
        if (os_log_type_enabled(v466, OS_LOG_TYPE_ERROR))
        {
          v484 = *(const char **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v533 = v484;
          _os_log_error_impl(&dword_19DDAF000, v466, OS_LOG_TYPE_ERROR, "%@ Failed to install Child SA (receive)", buf, 0xCu);
        }

        id v468 = *(id *)(a1 + 40);
        if (v468) {
          id v468 = objc_getProperty(v468, v467, 336, 1);
        }
        id v447 = v468;
        id v455 = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA (receive)", v469, v470, v471, v472, v473, v474, v475, v502);
      }
    }
    else
    {
      id v446 = *(id *)(a1 + 40);
      if (v446) {
        id v446 = objc_getProperty(v446, v392, 336, 1);
      }
      id v447 = v446;
      id v455 = (void *)NEIKEv2CreateErrorFailedToSend(@"responder AUTH", v448, v449, v450, v451, v452, v453, v454, v502);
    }
    v476 = v455;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v447, 3uLL, v455);

    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
LABEL_331:
    ErrorAuthentication = 0;
    goto LABEL_332;
  }
  if (os_log_type_enabled(v389, OS_LOG_TYPE_ERROR))
  {
    v482 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v533 = v482;
    _os_log_error_impl(&dword_19DDAF000, v390, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE AUTH packet (receive)", buf, 0xCu);
  }

  id v434 = *(id *)(a1 + 40);
  if (v434) {
    id v434 = objc_getProperty(v434, v433, 336, 1);
  }
  id v435 = v434;
  v443 = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE AUTH packet (receive)", v436, v437, v438, v439, v440, v441, v442, v502);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v435, 3uLL, v443);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
  ErrorAuthentication = 0;
  id v239 = 0;
LABEL_332:
}

- (void)initiateNewChildSA:(unsigned char *)a1
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v6 = Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn("-[NEIKEv2Session(Exchange) initiateNewChildSA:]", "NEIKEv2Exchange.m", 1546, "self.hasOutboundRequestInFlight");
  }
  id v7 = v4[3];
  id v9 = objc_getProperty(a1, v8, 336, 1);
  uint64_t v10 = v9;
  if (!v7)
  {
    uint64_t v132 = ne_log_obj();
    if (!os_log_type_enabled(v132, OS_LOG_TYPE_FAULT))
    {
LABEL_72:

      [v4 sendCallbackSuccess:0 session:a1];
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "-[NEIKEv2Session(Exchange) initiateNewChildSA:]";
    id v133 = "%s called with null childSA";
LABEL_76:
    _os_log_fault_impl(&dword_19DDAF000, v132, OS_LOG_TYPE_FAULT, v133, buf, 0xCu);
    goto LABEL_72;
  }
  if (!v9)
  {
    uint64_t v132 = ne_log_obj();
    if (!os_log_type_enabled(v132, OS_LOG_TYPE_FAULT)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "-[NEIKEv2Session(Exchange) initiateNewChildSA:]";
    id v133 = "%s called with null ikeSA";
    goto LABEL_76;
  }
  -[NEIKEv2ChildSA setState:error:]((uint64_t)v7, 1uLL, 0);
  [(NEIKEv2Session *)a1 reportState];
  id v13 = objc_getProperty(v7, v12, 48, 1);
  uint64_t v14 = [v13 proposals];
  char v15 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v7, v14);

  if ((v15 & 1) == 0)
  {
    SEL v92 = ne_log_obj();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", buf, 2u);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    uint64_t v100 = @"Failed to generate Child SA SPI";
    goto LABEL_39;
  }
  if ((-[NEIKEv2ChildSA generateInitialValues]((id *)v7) & 1) == 0)
  {
    uint64_t v101 = ne_log_obj();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "Failed to generate local Child crypto values", buf, 2u);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    uint64_t v100 = @"Failed to generate local Child crypto values";
LABEL_39:
    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v100, v93, v94, v95, v96, v97, v98, v99, (uint64_t)v134);
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v7, 3uLL, ErrorCrypto);

    [(NEIKEv2Session *)a1 reportState];
    -[NEIKEv2Session resetChild:](a1, v7);
    goto LABEL_67;
  }
  uint64_t v16 = v7;
  self;
  if ((v16[9] & 1) == 0)
  {
    uint64_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "%s called with null childSA.isInitiator", buf, 0xCu);
    }
    goto LABEL_58;
  }
  id v17 = -[NEIKEv2Packet initOutbound]([NEIKEv2CreateChildPacket alloc]);
  if (!v17)
  {
    id v104 = ne_log_obj();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed", buf, 2u);
    }

    uint64_t v19 = 0;
    goto LABEL_58;
  }
  uint64_t v19 = v17;
  id v20 = objc_getProperty(v16, v18, 48, 1);
  uint64_t v21 = [v20 mode];

  if (v21 == 1 && !-[NEIKEv2Packet addNotification:data:](v19, 0x4007uLL, 0))
  {
    uint64_t v105 = ne_log_obj();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v106 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
      uint64_t v107 = v105;
      uint32_t v108 = 2;
LABEL_56:
      _os_log_fault_impl(&dword_19DDAF000, v107, OS_LOG_TYPE_FAULT, v106, buf, v108);
      goto LABEL_57;
    }
    goto LABEL_57;
  }
  id v22 = objc_alloc_init(NEIKEv2ChildSAPayload);
  objc_setProperty_atomic(v19, v23, v22, 96);

  id v25 = objc_getProperty(v16, v24, 48, 1);
  uint64_t v26 = [v25 proposals];
  uint64_t v28 = objc_getProperty(v19, v27, 96, 1);
  uint64_t v30 = v28;
  if (v28) {
    objc_setProperty_atomic(v28, v29, v26, 24);
  }

  uint64_t v32 = objc_getProperty(v19, v31, 96, 1);
  char v33 = -[NEIKEv2Payload isValid]((uint64_t)v32);

  if ((v33 & 1) == 0)
  {
    uint64_t v105 = ne_log_obj();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.childSA.isValid";
LABEL_55:
    uint64_t v107 = v105;
    uint32_t v108 = 12;
    goto LABEL_56;
  }
  if ([(NEIKEv2ChildSA *)v16 shouldGenerateNewDHKeys])
  {
    uint64_t v35 = objc_alloc_init(NEIKEv2KeyExchangePayload);
    objc_setProperty_atomic(v19, v36, v35, 104);

    id v134 = objc_getProperty(v16, v37, 48, 1);
    uint64_t v38 = [v134 proposals];
    uint64_t v39 = [v38 firstObject];
    uint64_t v41 = [(NEIKEv2IKESAProposal *)v39 kemProtocol];
    SEL v43 = objc_getProperty(v19, v42, 104, 1);
    uint64_t v45 = v43;
    if (v43) {
      objc_setProperty_atomic(v43, v44, v41, 24);
    }

    id v47 = objc_getProperty(v16, v46, 112, 1);
    uint64_t v48 = v47;
    if (v47) {
      id v49 = (void *)*((void *)v47 + 2);
    }
    else {
      id v49 = 0;
    }
    id v50 = v49;
    SEL v52 = objc_getProperty(v19, v51, 104, 1);
    SEL v54 = v52;
    if (v52) {
      objc_setProperty_atomic(v52, v53, v50, 32);
    }

    char v56 = objc_getProperty(v19, v55, 104, 1);
    char v57 = -[NEIKEv2Payload isValid]((uint64_t)v56);

    if ((v57 & 1) == 0)
    {
      uint64_t v105 = ne_log_obj();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      uint64_t v106 = "%s called with null packet.ke.isValid";
      goto LABEL_55;
    }
  }
  int v58 = objc_alloc_init(NEIKEv2NoncePayload);
  objc_setProperty_atomic(v19, v59, v58, 112);

  uint64_t v61 = objc_getProperty(v16, v60, 80, 1);
  int v63 = objc_getProperty(v19, v62, 112, 1);
  id v65 = v63;
  if (v63) {
    objc_setProperty_atomic(v63, v64, v61, 24);
  }

  int v67 = objc_getProperty(v19, v66, 112, 1);
  char v68 = -[NEIKEv2Payload isValid]((uint64_t)v67);

  if ((v68 & 1) == 0)
  {
    uint64_t v105 = ne_log_obj();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.nonce.isValid";
    goto LABEL_55;
  }
  uint64_t v69 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
  objc_setProperty_atomic(v19, v70, v69, 128);

  SEL v72 = [(NEIKEv2ChildSA *)v16 configuredInitiatorTrafficSelectors];
  uint64_t v74 = objc_getProperty(v19, v73, 128, 1);
  uint64_t v76 = v74;
  if (v74) {
    objc_setProperty_atomic(v74, v75, v72, 24);
  }

  uint64_t v78 = objc_getProperty(v19, v77, 128, 1);
  char v79 = -[NEIKEv2Payload isValid]((uint64_t)v78);

  if ((v79 & 1) == 0)
  {
    uint64_t v105 = ne_log_obj();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
    uint64_t v106 = "%s called with null packet.tsi.isValid";
    goto LABEL_55;
  }
  uint64_t v80 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
  objc_setProperty_atomic(v19, v81, v80, 136);

  uint64_t v83 = [(NEIKEv2ChildSA *)v16 configuredResponderTrafficSelectors];
  uint64_t v85 = objc_getProperty(v19, v84, 136, 1);
  int v87 = v85;
  if (v85) {
    objc_setProperty_atomic(v85, v86, v83, 24);
  }

  SEL v89 = objc_getProperty(v19, v88, 136, 1);
  char v90 = -[NEIKEv2Payload isValid]((uint64_t)v89);

  if ((v90 & 1) == 0)
  {
    uint64_t v105 = ne_log_obj();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v140 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAForInitiatorChildSA:]";
      uint64_t v106 = "%s called with null packet.tsr.isValid";
      goto LABEL_55;
    }
LABEL_57:

LABEL_58:
    id v91 = 0;
    goto LABEL_59;
  }
  uint64_t v19 = v19;
  id v91 = v19;
LABEL_59:

  if (v91)
  {
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke;
    v135[3] = &unk_1E59907B0;
    uint64_t v109 = v4;
    uint64_t v136 = v109;
    SEL v137 = a1;
    id v138 = v16;
    if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v91, v135) == -1)
    {
      [v109 sendCallbackSuccess:0 session:a1];
      id v111 = objc_getProperty(a1, v110, 336, 1);
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"create child SA", v112, v113, v114, v115, v116, v117, v118, (uint64_t)v134);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v111, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }
  }
  else
  {
    uint64_t v122 = ne_log_obj();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v122, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", buf, 2u);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v123, v124, v125, v126, v127, v128, v129, (uint64_t)v134);
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v16, 3uLL, ErrorInternal);

    [(NEIKEv2Session *)a1 reportState];
    -[NEIKEv2Session resetChild:](a1, v16);
  }

LABEL_67:
}

void __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke(id *a1, void *a2)
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SEL v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)SEL v218 = 0;
      _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Failed to receive Create Child SA packet", v218, 2u);
    }

    [a1[4] sendCallbackSuccess:0 session:a1[5]];
    uint64_t v26 = (uint64_t)a1[6];
    SEL v27 = @"Failed to receive Create Child SA packet";
    goto LABEL_83;
  }
  id v4 = (char *)a1[6];
  uint64_t v6 = v4;
  if (!v3) {
    goto LABEL_80;
  }
  if (!v4 || (v4[9] & 1) == 0)
  {
    SEL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      SEL v210 = "-[NEIKEv2CreateChildPacket(Exchange) validateCreateChildAsInitiator:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null childSA.isInitiator", buf, 0xCu);
    }
    goto LABEL_79;
  }
  if (![(NEIKEv2Packet *)v3 hasErrors]) {
    goto LABEL_16;
  }
  long long v207 = 0u;
  long long v208 = 0u;
  long long v206 = 0u;
  long long v205 = 0u;
  SEL v8 = objc_getProperty(v3, v7, 64, 1);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v205 objects:v218 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v206;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v206 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(__CFString **)(*((void *)&v205 + 1) + 8 * i);
      if (v13 && (unint64_t)(v13->length - 1) <= 0x3FFE)
      {
        id v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          SEL v43 = [v3 copyShortDescription];
          id v44 = -[NEIKEv2NotifyPayload copyError](v13);
          *(_DWORD *)buf = 138412802;
          SEL v210 = v6;
          __int16 v211 = 2112;
          uint64_t v212 = (uint64_t)v43;
          __int16 v213 = 2112;
          uint64_t v214 = (uint64_t)v44;
          uint64_t v45 = "%@ %@ Initiator create child received notify error %@";
          SEL v46 = v17;
          goto LABEL_46;
        }
LABEL_78:

        goto LABEL_79;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v205 objects:v218 count:16];
  }
  while (v10);
LABEL_15:

LABEL_16:
  id v14 = objc_getProperty(v6, v7, 48, 1);
  if ([v14 mode] != 1)
  {

LABEL_24:
    id Property = objc_getProperty(v3, v16, 96, 1);
    uint64_t v30 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v29, 24, 1);
    }
    SEL v8 = Property;

    if ([v8 count] == 1)
    {
      id v17 = [v8 firstObject];
      if ([(NEIKEv2ChildSAProposal *)v17 isAValidResponse])
      {
        if (v17) {
          id v33 = objc_getProperty(v17, v32, 80, 1);
        }
        else {
          id v33 = 0;
        }
        id v34 = v33;

        if (v34)
        {
          long long v203 = 0u;
          long long v204 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          id v36 = objc_getProperty(v6, v35, 48, 1);
          SEL v37 = [v36 proposals];

          uint64_t v38 = [v37 countByEnumeratingWithState:&v201 objects:v217 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v202;
LABEL_33:
            uint64_t v41 = 0;
            while (1)
            {
              if (*(void *)v202 != v40) {
                objc_enumerationMutation(v37);
              }
              SEL v42 = *(void **)(*((void *)&v201 + 1) + 8 * v41);
              if (-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]((uint64_t)v42, v17, 0, 0))break; {
              if (v39 == ++v41)
              }
              {
                uint64_t v39 = [v37 countByEnumeratingWithState:&v201 objects:v217 count:16];
                if (v39) {
                  goto LABEL_33;
                }
                goto LABEL_39;
              }
            }
            id v44 = v42;

            if (!v44) {
              goto LABEL_64;
            }
            id v49 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v44, v17, 0, 0);
            objc_setProperty_atomic(v6, v50, v49, 56);

            id v52 = objc_getProperty(v6, v51, 56, 1);
            id v53 = ne_log_obj();
            SEL v43 = v53;
            if (v52)
            {
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                SEL v54 = (void *)[v3 copyShortDescription];
                id v56 = objc_getProperty(v6, v55, 56, 1);
                *(_DWORD *)buf = 138412802;
                SEL v210 = v6;
                __int16 v211 = 2112;
                uint64_t v212 = (uint64_t)v54;
                __int16 v213 = 2112;
                uint64_t v214 = (uint64_t)v56;
                _os_log_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_DEFAULT, "%@ %@ Chose responder new child proposal %@", buf, 0x20u);
              }
              int v58 = objc_getProperty(v3, v57, 112, 1);

              if (v58)
              {
                SEL v60 = objc_getProperty(v3, v59, 112, 1);
                SEL v62 = v60;
                if (v60) {
                  SEL v60 = objc_getProperty(v60, v61, 24, 1);
                }
                id v63 = v60;

                if (v63)
                {
                  id v64 = -[NEIKEv2ChildSA ikeSA]((id *)v6);
                  self = v64;
                  if (v64) {
                    id v64 = objc_getProperty(v64, v65, 80, 1);
                  }
                  id v66 = v64;
                  int v67 = [v66 strictNonceSizeChecks];

                  if (v67)
                  {
                    uint64_t v69 = objc_getProperty(v3, v68, 112, 1);
                    id v71 = v69;
                    if (v69) {
                      uint64_t v69 = objc_getProperty(v69, v70, 24, 1);
                    }
                    id v72 = v69;
                    uint64_t v73 = [v72 length];

                    if ((unint64_t)(v73 - 257) <= 0xFFFFFFFFFFFFFF0ELL)
                    {
                      id v75 = ne_log_obj();
                      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v76 = (void *)[v3 copyShortDescription];
                        *(_DWORD *)buf = 138412802;
                        SEL v210 = v6;
                        __int16 v211 = 2112;
                        uint64_t v212 = (uint64_t)v76;
                        __int16 v213 = 2048;
                        uint64_t v214 = v73;
                        SEL v77 = "%@ %@ NONCE data length %zu is out of bounds";
                        uint64_t v78 = v75;
                        uint32_t v79 = 32;
LABEL_142:
                        _os_log_error_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
                      }
LABEL_148:

                      goto LABEL_77;
                    }
                    id v88 = self;
                    id v193 = (id)v73;
                    if (self) {
                      id v88 = objc_getProperty(self, v74, 96, 1);
                    }
                    id v89 = v88;
                    id v91 = [(NEIKEv2IKESAProposal *)v89 prfProtocol];
                    unsigned int v92 = [v91 nonceSize];

                    if ((unint64_t)v193 < v92)
                    {
                      id v75 = ne_log_obj();
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_148;
                      }
                      uint64_t v94 = (void *)[v3 copyShortDescription];
                      if (self) {
                        id v95 = objc_getProperty(self, v93, 96, 1);
                      }
                      else {
                        id v95 = 0;
                      }
                      id v96 = v95;
                      uint64_t v98 = [(NEIKEv2IKESAProposal *)v96 prfProtocol];
                      *(_DWORD *)buf = 138413058;
                      SEL v210 = v6;
                      __int16 v211 = 2112;
                      uint64_t v212 = (uint64_t)v94;
                      __int16 v213 = 2048;
                      uint64_t v214 = (uint64_t)v193;
                      __int16 v215 = 2112;
                      uint64_t v216 = (uint64_t)v98;
                      _os_log_error_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_ERROR, "%@ %@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x2Au);

LABEL_147:
                      goto LABEL_148;
                    }
                  }
                  uint64_t v99 = objc_getProperty(v3, v68, 112, 1);
                  uint64_t v101 = v99;
                  if (v99) {
                    uint64_t v99 = objc_getProperty(v99, v100, 24, 1);
                  }
                  id v102 = v99;
                  objc_setProperty_atomic(v6, v103, v102, 88);

                  if ([(NEIKEv2ChildSA *)v6 shouldGenerateNewDHKeys])
                  {
                    uint64_t v106 = objc_getProperty(v3, v105, 104, 1);

                    if (!v106)
                    {
                      id v75 = ne_log_obj();
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_148;
                      }
                      uint64_t v76 = (void *)[v3 copyShortDescription];
                      *(_DWORD *)buf = 138412546;
                      SEL v210 = v6;
                      __int16 v211 = 2112;
                      uint64_t v212 = (uint64_t)v76;
                      SEL v77 = "%@ %@ Did not receive KE payload";
                      goto LABEL_141;
                    }
                    uint32_t v108 = objc_getProperty(v3, v107, 104, 1);
                    SEL v110 = v108;
                    if (v108) {
                      uint32_t v108 = objc_getProperty(v108, v109, 24, 1);
                    }
                    id v111 = v108;

                    if (!v111)
                    {
                      id v75 = ne_log_obj();
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_148;
                      }
                      uint64_t v76 = (void *)[v3 copyShortDescription];
                      *(_DWORD *)buf = 138412546;
                      SEL v210 = v6;
                      __int16 v211 = 2112;
                      uint64_t v212 = (uint64_t)v76;
                      SEL v77 = "%@ %@ Did not receive method in KE payload";
                      goto LABEL_141;
                    }
                    uint64_t v113 = objc_getProperty(v3, v112, 104, 1);
                    uint64_t v115 = v113;
                    if (v113) {
                      uint64_t v113 = objc_getProperty(v113, v114, 32, 1);
                    }
                    id v116 = v113;

                    if (!v116)
                    {
                      id v75 = ne_log_obj();
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_148;
                      }
                      uint64_t v76 = (void *)[v3 copyShortDescription];
                      *(_DWORD *)buf = 138412546;
                      SEL v210 = v6;
                      __int16 v211 = 2112;
                      uint64_t v212 = (uint64_t)v76;
                      SEL v77 = "%@ %@ Did not receive data in KE payload";
                      goto LABEL_141;
                    }
                    uint64_t v118 = objc_getProperty(v3, v117, 104, 1);
                    if (v118)
                    {
                      uint64_t v120 = v118;
                      uint64_t v118 = objc_getProperty(v118, v119, 24, 1);
                    }
                    else
                    {
                      uint64_t v120 = 0;
                    }
                    id v191 = v118;
                    id v194 = (id)[v191 method];
                    id v122 = objc_getProperty(v6, v121, 56, 1);
                    uint64_t v124 = [(NEIKEv2IKESAProposal *)v122 kemProtocol];
                    uint64_t v125 = [v124 method];

                    if (v194 != (id)v125)
                    {
                      id v75 = ne_log_obj();
                      if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_148;
                      }
                      uint64_t v192 = [v3 copyShortDescription];
                      uint64_t v164 = objc_getProperty(v3, v163, 104, 1);
                      id v195 = v164;
                      if (v164) {
                        uint64_t v164 = objc_getProperty(v164, v165, 24, 1);
                      }
                      id v190 = v164;
                      uint64_t v189 = [v190 method];
                      id v167 = objc_getProperty(v6, v166, 56, 1);
                      uint64_t v169 = [(NEIKEv2IKESAProposal *)v167 kemProtocol];
                      uint64_t v170 = [v169 method];
                      *(_DWORD *)buf = 138413058;
                      SEL v210 = v6;
                      __int16 v211 = 2112;
                      uint64_t v94 = (void *)v192;
                      uint64_t v212 = v192;
                      __int16 v213 = 2048;
                      uint64_t v214 = v189;
                      __int16 v215 = 2048;
                      uint64_t v216 = v170;
                      _os_log_error_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_ERROR, "%@ %@ Did not receive matching method from KE payload (%zu != %zu)", buf, 0x2Au);

                      goto LABEL_147;
                    }
                    uint64_t v127 = objc_getProperty(v3, v126, 104, 1);
                    uint64_t v129 = v127;
                    if (v127) {
                      uint64_t v127 = objc_getProperty(v127, v128, 32, 1);
                    }
                    id v130 = v127;
                    objc_setProperty_atomic(v6, v131, v130, 104);
                  }
                  uint64_t v132 = objc_getProperty(v3, v105, 128, 1);
                  id v134 = v132;
                  if (v132) {
                    uint64_t v132 = objc_getProperty(v132, v133, 24, 1);
                  }
                  id v135 = v132;
                  -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v6, v135);

                  SEL v137 = [(NEIKEv2ChildSA *)v6 initiatorTrafficSelectors];

                  if (v137)
                  {
                    unint64_t v139 = objc_getProperty(v3, v138, 136, 1);
                    uint64_t v141 = v139;
                    if (v139) {
                      unint64_t v139 = objc_getProperty(v139, v140, 24, 1);
                    }
                    id v142 = v139;
                    -[NEIKEv2ChildSA setResponderTrafficSelectors:](v6, v142);

                    id v144 = [(NEIKEv2ChildSA *)v6 responderTrafficSelectors];

                    if (v144)
                    {

                      id v146 = a1[6];
                      if (v146)
                      {
                        id v147 = objc_getProperty(v146, v145, 56, 1);
                        uint64_t v149 = v147;
                        if (v147) {
                          id v147 = objc_getProperty(v147, v148, 112, 1);
                        }
                      }
                      else
                      {
                        uint64_t v149 = 0;
                        id v147 = 0;
                      }
                      id v150 = v147;

                      if (v150 && ([(NEIKEv2ChildSA *)(uint64_t)a1[6] processPrimaryKeyExchange] & 1) == 0)
                      {
                        uint64_t v188 = ne_log_obj();
                        if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)SEL v218 = 0;
                          _os_log_error_impl(&dword_19DDAF000, v188, OS_LOG_TYPE_ERROR, "Failed to process KE data", v218, 2u);
                        }

                        [a1[4] sendCallbackSuccess:0 session:a1[5]];
                        uint64_t v26 = (uint64_t)a1[6];
                        uint64_t v162 = @"Failed to process KE data";
                      }
                      else
                      {
                        if (-[NEIKEv2ChildSA generateAllValues]((uint64_t)a1[6]))
                        {
                          if (-[NEIKEv2Session installChildSA:]((uint64_t)a1[5], a1[6]))
                          {
                            -[NEIKEv2Session reportTrafficSelectorsForChildSA:](a1[5], a1[6]);
                            uint64_t v152 = ne_log_obj();
                            if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)SEL v218 = 0;
                              _os_log_impl(&dword_19DDAF000, v152, OS_LOG_TYPE_INFO, "Completed new child SA connection", v218, 2u);
                            }

                            -[NEIKEv2ChildSA setState:error:]((uint64_t)a1[6], 2uLL, 0);
                            [(NEIKEv2Session *)a1[5] reportState];
                            [a1[4] sendCallbackSuccess:1 session:a1[5]];
                          }
                          else
                          {
                            SEL v171 = ne_log_obj();
                            if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)SEL v218 = 0;
                              _os_log_error_impl(&dword_19DDAF000, v171, OS_LOG_TYPE_ERROR, "Failed to install Child SA", v218, 2u);
                            }

                            char v174 = a1[5];
                            id v173 = a1[6];
                            if (v173)
                            {
                              id v175 = objc_getProperty(v173, v172, 56, 1);
                              id v177 = v175;
                              if (v175) {
                                id v175 = objc_getProperty(v175, v176, 80, 1);
                              }
                            }
                            else
                            {
                              id v177 = 0;
                              id v175 = 0;
                            }
                            id v179 = v175;
                            id v180 = a1[6];
                            if (v180)
                            {
                              id v181 = objc_getProperty(v180, v178, 56, 1);
                              id v183 = v181;
                              if (v181) {
                                id v181 = objc_getProperty(v181, v182, 88, 1);
                              }
                            }
                            else
                            {
                              id v183 = 0;
                              id v181 = 0;
                            }
                            id v184 = v181;
                            v197[0] = MEMORY[0x1E4F143A8];
                            v197[1] = 3221225472;
                            v197[2] = __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke_341;
                            v197[3] = &unk_1E5990788;
                            id v185 = a1[4];
                            id v186 = a1[5];
                            id v187 = a1[6];
                            id v198 = v185;
                            id v199 = v186;
                            id v200 = v187;
                            -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v174, v179, v184, v197);
                          }
                          goto LABEL_85;
                        }
                        uint64_t v154 = ne_log_obj();
                        if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)SEL v218 = 0;
                          _os_log_error_impl(&dword_19DDAF000, v154, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", v218, 2u);
                        }

                        [a1[4] sendCallbackSuccess:0 session:a1[5]];
                        uint64_t v26 = (uint64_t)a1[6];
                        uint64_t v162 = @"Failed to generate Child SA crypto values";
                      }
                      uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v162, v155, v156, v157, v158, v159, v160, v161, v189);
                      goto LABEL_84;
                    }
                    id v75 = ne_log_obj();
                    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_148;
                    }
                    uint64_t v76 = (void *)[v3 copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    SEL v210 = v6;
                    __int16 v211 = 2112;
                    uint64_t v212 = (uint64_t)v76;
                    SEL v77 = "%@ %@ Could not set responder traffic selectors";
                  }
                  else
                  {
                    id v75 = ne_log_obj();
                    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_148;
                    }
                    uint64_t v76 = (void *)[v3 copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    SEL v210 = v6;
                    __int16 v211 = 2112;
                    uint64_t v212 = (uint64_t)v76;
                    SEL v77 = "%@ %@ Could not set initiator traffic selectors";
                  }
LABEL_141:
                  uint64_t v78 = v75;
                  uint32_t v79 = 22;
                  goto LABEL_142;
                }
                SEL v43 = ne_log_obj();
                if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_76;
                }
                id v81 = (id)[v3 copyShortDescription];
                *(_DWORD *)buf = 138412546;
                SEL v210 = v6;
                __int16 v211 = 2112;
                uint64_t v212 = (uint64_t)v81;
                uint64_t v83 = "%@ %@ Did not receive NONCE data";
              }
              else
              {
                SEL v43 = ne_log_obj();
                if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_76;
                }
                id v81 = (id)[v3 copyShortDescription];
                *(_DWORD *)buf = 138412546;
                SEL v210 = v6;
                __int16 v211 = 2112;
                uint64_t v212 = (uint64_t)v81;
                uint64_t v83 = "%@ %@ Did not receive NONCE payload";
              }
            }
            else
            {
              if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                goto LABEL_76;
              }
              id v81 = (id)[v3 copyShortDescription];
              *(_DWORD *)buf = 138412546;
              SEL v210 = v6;
              __int16 v211 = 2112;
              uint64_t v212 = (uint64_t)v81;
              uint64_t v83 = "%@ %@ Could not set chosen proposal values";
            }
            _os_log_error_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_ERROR, v83, buf, 0x16u);
            goto LABEL_75;
          }
LABEL_39:

LABEL_64:
          id v44 = ne_log_obj();
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            goto LABEL_77;
          }
          SEL v43 = [v3 copyShortDescription];
          id v81 = objc_getProperty(v6, v80, 48, 1);
          uint64_t v82 = [v81 proposals];
          *(_DWORD *)buf = 138413058;
          SEL v210 = v6;
          __int16 v211 = 2112;
          uint64_t v212 = (uint64_t)v43;
          __int16 v213 = 2112;
          uint64_t v214 = (uint64_t)v17;
          __int16 v215 = 2112;
          uint64_t v216 = (uint64_t)v82;
          _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, "%@ %@ Received proposal %@ does not match config %@", buf, 0x2Au);

LABEL_75:
          goto LABEL_76;
        }
        id v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          SEL v43 = [v3 copyShortDescription];
          *(_DWORD *)buf = 138412546;
          SEL v210 = v6;
          __int16 v211 = 2112;
          uint64_t v212 = (uint64_t)v43;
          uint64_t v45 = "%@ %@ Child SA proposal missing SPI";
          SEL v46 = v44;
          uint32_t v48 = 22;
LABEL_47:
          _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, v45, buf, v48);
LABEL_76:
        }
      }
      else
      {
        id v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          SEL v43 = [v3 copyShortDescription];
          *(_DWORD *)buf = 138412802;
          SEL v210 = v6;
          __int16 v211 = 2112;
          uint64_t v212 = (uint64_t)v43;
          __int16 v213 = 2112;
          uint64_t v214 = (uint64_t)v17;
          uint64_t v45 = "%@ %@ Received invalid child proposal %@";
          SEL v46 = v44;
LABEL_46:
          uint32_t v48 = 32;
          goto LABEL_47;
        }
      }
    }
    else
    {
      id v17 = ne_log_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_78;
      }
      id v44 = [v3 copyShortDescription];
      int v47 = [v8 count];
      *(_DWORD *)buf = 138412802;
      SEL v210 = v6;
      __int16 v211 = 2112;
      uint64_t v212 = (uint64_t)v44;
      __int16 v213 = 1024;
      LODWORD(v214) = v47;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@ %@ Received %u child SA proposals, require 1", buf, 0x1Cu);
    }
LABEL_77:

    goto LABEL_78;
  }
  char v15 = -[NEIKEv2Packet hasNotification:](v3, (const char *)0x4007);

  if (v15) {
    goto LABEL_24;
  }
  SEL v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v17 = [v3 copyShortDescription];
    *(_DWORD *)buf = 138412546;
    SEL v210 = v6;
    __int16 v211 = 2112;
    uint64_t v212 = (uint64_t)v17;
    _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ %@ Transport mode Child SA was not accepted", buf, 0x16u);
    goto LABEL_78;
  }
LABEL_79:

LABEL_80:
  SEL v84 = ne_log_obj();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)SEL v218 = 0;
    _os_log_error_impl(&dword_19DDAF000, v84, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA packet", v218, 2u);
  }

  [a1[4] sendCallbackSuccess:0 session:a1[5]];
  uint64_t v26 = (uint64_t)a1[6];
  SEL v27 = @"Failed to process Create Child SA packet";
LABEL_83:
  uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v27, v19, v20, v21, v22, v23, v24, v25, v189);
LABEL_84:
  uint64_t v86 = ErrorCrypto;
  -[NEIKEv2ChildSA setState:error:](v26, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)a1[5] reportState];
  -[NEIKEv2Session resetChild:]((char *)a1[5], a1[6]);
LABEL_85:
}

void __47__NEIKEv2Session_Exchange__initiateNewChildSA___block_invoke_341(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA", v3, v4, v5, v6, v7, v8, v9, v14);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  SEL v12 = *(char **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);

  -[NEIKEv2Session resetChild:](v12, v13);
}

- (void)receiveNewChildSA:(void *)a3 packet:
{
  uint64_t v388 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = objc_getProperty(a1, v6, 368, 1);
    dispatch_assert_queue_V2(v8);

    id v11 = objc_getProperty(a1, v9, 336, 1);
    if (!v11)
    {
      uint64_t v275 = ne_log_obj();
      if (os_log_type_enabled(v275, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)SEL v386 = 136315138;
        uint64_t v387 = "-[NEIKEv2Session(Exchange) receiveNewChildSA:packet:]";
        _os_log_fault_impl(&dword_19DDAF000, v275, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v386, 0xCu);
      }

      goto LABEL_92;
    }
    if (v5)
    {
      id v12 = objc_getProperty(v5, v10, 48, 1);
      id v13 = [v12 proposals];
      char v14 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v5, v13);

      if (v14)
      {
        if (-[NEIKEv2ChildSA generateInitialValues]((id *)v5))
        {
          uint64_t v16 = v5;
          if (v16[9])
          {
            uint64_t v20 = ne_log_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              SEL v379 = "-[NEIKEv2CreateChildPacket(Exchange) validateCreateChildAsResponder:]";
              _os_log_fault_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_FAULT, "%s called with null !childSA.isInitiator", buf, 0xCu);
            }
            goto LABEL_75;
          }
          if ([(NEIKEv2Packet *)v7 hasErrors])
          {
            long long v376 = 0u;
            long long v377 = 0u;
            long long v374 = 0u;
            long long v375 = 0u;
            if (v7)
            {
              SEL v18 = v7;
              id Property = objc_getProperty(v7, v17, 64, 1);
            }
            else
            {
              SEL v18 = 0;
              id Property = 0;
            }
            uint64_t v20 = Property;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v374 objects:v386 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v375;
              while (2)
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v375 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(__CFString **)(*((void *)&v374 + 1) + 8 * i);
                  if (v25 && (unint64_t)(v25->length - 1) <= 0x3FFE)
                  {
                    SEL v103 = ne_log_obj();
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v136 = (void *)[v18 copyShortDescription];
                      SEL v137 = -[NEIKEv2NotifyPayload copyError](v25);
                      *(_DWORD *)buf = 138412802;
                      SEL v379 = v16;
                      __int16 v380 = 2112;
                      v381 = v136;
                      __int16 v382 = 2112;
                      unint64_t v383 = (unint64_t)v137;
                      _os_log_error_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_ERROR, "%@ %@ Responder create child received notify error %@", buf, 0x20u);
                    }
                    id v7 = v18;
                    goto LABEL_75;
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v374 objects:v386 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            id v7 = v18;
          }
          if (-[NEIKEv2Packet hasNotification:](v7, (const char *)0x4007)) {
            uint64_t v27 = 1;
          }
          else {
            uint64_t v27 = 2;
          }
          id v28 = objc_getProperty(v16, v26, 48, 1);
          uint64_t v29 = [v28 mode];

          if (v27 != v29)
          {
            uint64_t v20 = ne_log_obj();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
LABEL_75:

              goto LABEL_76;
            }
            id v36 = (void *)[v7 copyShortDescription];
            *(_DWORD *)buf = 138412546;
            SEL v379 = v16;
            __int16 v380 = 2112;
            v381 = v36;
            _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "%@ %@ Transport mode Child SA did not match", buf, 0x16u);
LABEL_74:

            goto LABEL_75;
          }
          SEL v31 = objc_getProperty(v7, v30, 96, 1);
          id v33 = v31;
          if (v31) {
            SEL v31 = objc_getProperty(v31, v32, 24, 1);
          }
          uint64_t v20 = v31;

          id v35 = objc_getProperty(v16, v34, 48, 1);
          id v36 = [v35 proposals];

          if ([v20 count])
          {
            self = v7;
            id v38 = objc_getProperty(v16, v37, 48, 1);
            uint64_t v39 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]((uint64_t)NEIKEv2ChildSAProposal, v36, v20, [v38 preferInitiatorProposalOrder], 0);
            objc_setProperty_atomic(v16, v40, v39, 56);

            id v42 = objc_getProperty(v16, v41, 56, 1);
            SEL v43 = ne_log_obj();
            id v44 = v43;
            if (!v42)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                id v104 = self;
                uint64_t v105 = (void *)[self copyShortDescription];
                *(_DWORD *)buf = 138412546;
                SEL v379 = v16;
                __int16 v380 = 2112;
                v381 = v105;
                uint64_t v106 = "%@ %@ No matching proposal found";
                goto LABEL_167;
              }
LABEL_72:
              id v7 = self;
              goto LABEL_73;
            }
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v45 = (void *)[self copyShortDescription];
              id v47 = v11;
              id v48 = objc_getProperty(v16, v46, 56, 1);
              *(_DWORD *)buf = 138412802;
              SEL v379 = v16;
              __int16 v380 = 2112;
              v381 = v45;
              __int16 v382 = 2112;
              unint64_t v383 = (unint64_t)v48;
              _os_log_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_DEFAULT, "%@ %@ Chose initiator new child proposal %@", buf, 0x20u);

              id v11 = v47;
            }

            id v7 = self;
            SEL v50 = objc_getProperty(self, v49, 112, 1);

            if (v50)
            {
              id v52 = objc_getProperty(self, v51, 112, 1);
              SEL v54 = v52;
              if (v52) {
                id v52 = objc_getProperty(v52, v53, 24, 1);
              }
              id v55 = v52;

              if (v55)
              {
                id WeakRetained = objc_loadWeakRetained((id *)v16 + 3);
                id v361 = WeakRetained;
                id v58 = v11;
                if (WeakRetained) {
                  id WeakRetained = objc_getProperty(WeakRetained, v57, 80, 1);
                }
                id v59 = WeakRetained;
                int v60 = [v59 strictNonceSizeChecks];

                if (v60)
                {
                  SEL v62 = objc_getProperty(self, v61, 112, 1);
                  id v64 = v62;
                  if (v62) {
                    SEL v62 = objc_getProperty(v62, v63, 24, 1);
                  }
                  id v65 = v62;
                  uint64_t v66 = [v65 length];

                  unint64_t v359 = v66;
                  char v68 = (v66 != 15) & __CFADD__(v66 - 257, 242);
                  id v11 = v58;
                  if (!v68)
                  {
                    uint64_t v69 = ne_log_obj();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                    {
                      SEL v70 = (void *)[self copyShortDescription];
                      *(_DWORD *)buf = 138412802;
                      SEL v379 = v16;
                      __int16 v380 = 2112;
                      v381 = v70;
                      __int16 v382 = 2048;
                      unint64_t v383 = v359;
                      _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, "%@ %@ NONCE data length %zu is out of bounds", buf, 0x20u);
                    }
                    goto LABEL_165;
                  }
                  id v138 = v361;
                  if (v361) {
                    id v138 = objc_getProperty(v361, v67, 96, 1);
                  }
                  id v139 = v138;
                  uint64_t v141 = [(NEIKEv2IKESAProposal *)v139 prfProtocol];
                  unsigned int v142 = [v141 nonceSize];

                  if (v359 < v142)
                  {
                    uint64_t v69 = ne_log_obj();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v331 = (void *)[self copyShortDescription];
                      if (v361) {
                        id v332 = objc_getProperty(v361, v330, 96, 1);
                      }
                      else {
                        id v332 = 0;
                      }
                      id v333 = v332;
                      id v335 = [(NEIKEv2IKESAProposal *)v333 prfProtocol];
                      *(_DWORD *)buf = 138413058;
                      SEL v379 = v16;
                      __int16 v380 = 2112;
                      v381 = v331;
                      __int16 v382 = 2048;
                      unint64_t v383 = v359;
                      __int16 v384 = 2112;
                      uint64_t v385 = (uint64_t)v335;
                      _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, "%@ %@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x2Au);
                    }
                    id v11 = v58;
                    goto LABEL_165;
                  }
                }
                char v143 = objc_getProperty(self, v61, 112, 1);
                uint64_t v145 = v143;
                if (v143) {
                  char v143 = objc_getProperty(v143, v144, 24, 1);
                }
                id v146 = v143;
                objc_setProperty_atomic(v16, v147, v146, 88);

                id v11 = v58;
                int v360 = v36;
                if (![(NEIKEv2ChildSA *)v16 shouldGenerateNewDHKeys])
                {
LABEL_115:
                  id v177 = objc_getProperty(self, v149, 128, 1);
                  id v364 = v11;
                  if (v177)
                  {
                    id v179 = v177;
                    id v177 = objc_getProperty(v177, v178, 24, 1);
                  }
                  else
                  {
                    id v179 = 0;
                  }
                  id v180 = v177;
                  id v182 = objc_getProperty(v16, v181, 48, 1);
                  id v183 = [v182 remoteTrafficSelectors];
                  id v184 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]((uint64_t)NEIKEv2TrafficSelector, (uint64_t)v180, v183);
                  -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v16, v184);

                  id v186 = objc_getProperty(self, v185, 136, 1);
                  uint64_t v188 = v186;
                  if (v186) {
                    id v186 = objc_getProperty(v186, v187, 24, 1);
                  }
                  id v189 = v186;
                  id v191 = objc_getProperty(v16, v190, 48, 1);
                  uint64_t v192 = [v191 localTrafficSelectors];
                  id v193 = +[NEIKEv2TrafficSelector copyConstrainedTrafficSelectorsForRequest:reply:]((uint64_t)NEIKEv2TrafficSelector, (uint64_t)v189, v192);
                  -[NEIKEv2ChildSA setResponderTrafficSelectors:](v16, v193);

                  id v7 = self;
                  id v194 = self;
                  id v195 = v16;
                  self;
                  if (v16[9])
                  {
                    id v200 = ne_log_obj();
                    if (os_log_type_enabled(v200, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)SEL v386 = 136315138;
                      uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                      _os_log_fault_impl(&dword_19DDAF000, v200, OS_LOG_TYPE_FAULT, "%s called with null !childSA.isInitiator", v386, 0xCu);
                    }
                    uint64_t v271 = 0;
                    id v11 = v364;
                    goto LABEL_179;
                  }
                  id v197 = objc_getProperty(v195, v196, 56, 1);

                  id v11 = v364;
                  if (v197)
                  {
                    uint64_t v198 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2CreateChildPacket alloc], v194);
                    if (v198)
                    {
                      id v200 = v198;
                      id v201 = objc_getProperty(v195, v199, 48, 1);
                      uint64_t v202 = [v201 mode];

                      if (v202 != 1 || -[NEIKEv2Packet addNotification:data:](v200, 0x4007uLL, 0))
                      {
                        long long v203 = objc_alloc_init(NEIKEv2ChildSAPayload);
                        objc_setProperty_atomic(v200, v204, v203, 96);

                        id v206 = objc_getProperty(v195, v205, 48, 1);
                        long long v207 = [v206 proposals];
                        uint64_t v209 = objc_getProperty(v200, v208, 96, 1);
                        __int16 v211 = v209;
                        if (v209) {
                          objc_setProperty_atomic(v209, v210, v207, 24);
                        }

                        __int16 v213 = objc_getProperty(v200, v212, 96, 1);
                        char v214 = -[NEIKEv2Payload isValid]((uint64_t)v213);

                        if (v214)
                        {
                          if ([(NEIKEv2ChildSA *)v195 shouldGenerateNewDHKeys])
                          {
                            uint64_t v216 = objc_alloc_init(NEIKEv2KeyExchangePayload);
                            objc_setProperty_atomic(v200, v217, v216, 104);

                            id v219 = objc_getProperty(v195, v218, 56, 1);
                            SEL v221 = [(NEIKEv2IKESAProposal *)v219 kemProtocol];
                            uint64_t v223 = objc_getProperty(v200, v222, 104, 1);
                            SEL v225 = v223;
                            if (v223) {
                              objc_setProperty_atomic(v223, v224, v221, 24);
                            }

                            id v227 = objc_getProperty(v195, v226, 112, 1);
                            uint64_t v228 = v227;
                            if (v227) {
                              id v229 = (void *)*((void *)v227 + 2);
                            }
                            else {
                              id v229 = 0;
                            }
                            id v230 = v229;
                            id v232 = objc_getProperty(v200, v231, 104, 1);
                            id v234 = v232;
                            if (v232) {
                              objc_setProperty_atomic(v232, v233, v230, 32);
                            }

                            uint64_t v236 = objc_getProperty(v200, v235, 104, 1);
                            char v237 = -[NEIKEv2Payload isValid]((uint64_t)v236);

                            if ((v237 & 1) == 0)
                            {
                              uint64_t v280 = ne_log_obj();
                              if (!os_log_type_enabled(v280, OS_LOG_TYPE_FAULT)) {
                                goto LABEL_217;
                              }
                              *(_DWORD *)SEL v386 = 136315138;
                              uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                              uint64_t v281 = "%s called with null packet.ke.isValid";
                              goto LABEL_223;
                            }
                          }
                          uint64_t v238 = objc_alloc_init(NEIKEv2NoncePayload);
                          objc_setProperty_atomic(v200, v239, v238, 112);

                          uint32_t v241 = objc_getProperty(v195, v240, 80, 1);
                          uint64_t v243 = objc_getProperty(v200, v242, 112, 1);
                          uint64_t v245 = v243;
                          id v11 = v364;
                          if (v243) {
                            objc_setProperty_atomic(v243, v244, v241, 24);
                          }

                          uint64_t v247 = objc_getProperty(v200, v246, 112, 1);
                          char v248 = -[NEIKEv2Payload isValid]((uint64_t)v247);

                          if (v248)
                          {
                            uint64_t v249 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
                            objc_setProperty_atomic(v200, v250, v249, 128);

                            int v252 = [(NEIKEv2ChildSA *)v195 initiatorTrafficSelectors];
                            uint64_t v254 = objc_getProperty(v200, v253, 128, 1);
                            uint64_t v256 = v254;
                            if (v254) {
                              objc_setProperty_atomic(v254, v255, v252, 24);
                            }

                            uint64_t v258 = objc_getProperty(v200, v257, 128, 1);
                            char v259 = -[NEIKEv2Payload isValid]((uint64_t)v258);

                            if (v259)
                            {
                              uint64_t v260 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
                              objc_setProperty_atomic(v200, v261, v260, 136);

                              id v263 = [(NEIKEv2ChildSA *)v195 responderTrafficSelectors];
                              long long v265 = objc_getProperty(v200, v264, 136, 1);
                              long long v267 = v265;
                              if (v265) {
                                objc_setProperty_atomic(v265, v266, v263, 24);
                              }

                              uint64_t v269 = objc_getProperty(v200, v268, 136, 1);
                              char v270 = -[NEIKEv2Payload isValid]((uint64_t)v269);

                              if (v270)
                              {
                                id v200 = v200;
                                uint64_t v271 = v200;
LABEL_218:
                                id v11 = v364;
                                goto LABEL_179;
                              }
                              uint64_t v280 = ne_log_obj();
                              if (!os_log_type_enabled(v280, OS_LOG_TYPE_FAULT))
                              {
LABEL_217:

                                uint64_t v271 = 0;
                                goto LABEL_218;
                              }
                              *(_DWORD *)SEL v386 = 136315138;
                              uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                              uint64_t v281 = "%s called with null packet.tsr.isValid";
LABEL_223:
                              _os_log_fault_impl(&dword_19DDAF000, v280, OS_LOG_TYPE_FAULT, v281, v386, 0xCu);
                              goto LABEL_217;
                            }
                            unint64_t v276 = ne_log_obj();
                            if (os_log_type_enabled(v276, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)SEL v386 = 136315138;
                              uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                              __int16 v277 = "%s called with null packet.tsi.isValid";
                              goto LABEL_176;
                            }
LABEL_178:

                            uint64_t v271 = 0;
LABEL_179:
                            id v7 = self;
LABEL_180:

                            if (v271)
                            {
                              if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v271, 0))
                              {
                                id v289 = objc_getProperty(v195, v282, 56, 1);
                                uint64_t v291 = v289;
                                if (v289) {
                                  id v289 = objc_getProperty(v289, v290, 112, 1);
                                }
                                id v292 = v289;

                                if (v292 && ([(NEIKEv2ChildSA *)(uint64_t)v195 processPrimaryKeyExchange] & 1) == 0)
                                {
                                  id v347 = v11;
                                  SEL v348 = ne_log_obj();
                                  if (os_log_type_enabled(v348, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)SEL v386 = 0;
                                    _os_log_error_impl(&dword_19DDAF000, v348, OS_LOG_TYPE_ERROR, "Failed to process KE data", v386, 2u);
                                  }

                                  id v350 = objc_getProperty(v195, v349, 56, 1);
                                  id v352 = v350;
                                  if (v350) {
                                    id v350 = objc_getProperty(v350, v351, 80, 1);
                                  }
                                  id v353 = v350;
                                  id v355 = objc_getProperty(v195, v354, 56, 1);
                                  id v357 = v355;
                                  if (v355) {
                                    id v355 = objc_getProperty(v355, v356, 88, 1);
                                  }
                                  id v358 = v355;
                                  v371[0] = MEMORY[0x1E4F143A8];
                                  v371[1] = 3221225472;
                                  v371[2] = __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke;
                                  v371[3] = &unk_1E5990580;
                                  uint64_t v372 = v195;
                                  uint64_t v373 = a1;
                                  -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](a1, v353, v358, v371);

                                  id v11 = v347;
                                }
                                else
                                {
                                  if (-[NEIKEv2ChildSA generateAllValues]((uint64_t)v195))
                                  {
                                    if (-[NEIKEv2Session installChildSA:]((uint64_t)a1, v195))
                                    {
                                      -[NEIKEv2ChildSA setState:error:]((uint64_t)v195, 2uLL, 0);
                                      [(NEIKEv2Session *)a1 reportState];
LABEL_210:

                                      goto LABEL_92;
                                    }
                                    uint64_t v319 = ne_log_obj();
                                    if (os_log_type_enabled(v319, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_WORD *)SEL v386 = 0;
                                      _os_log_error_impl(&dword_19DDAF000, v319, OS_LOG_TYPE_ERROR, "Failed to install Child SA", v386, 2u);
                                    }

                                    id v321 = objc_getProperty(v195, v320, 56, 1);
                                    uint64_t v323 = v321;
                                    if (v321) {
                                      id v321 = objc_getProperty(v321, v322, 80, 1);
                                    }
                                    id v324 = v321;
                                    id v326 = objc_getProperty(v195, v325, 56, 1);
                                    v328 = v326;
                                    id v316 = v11;
                                    if (v326) {
                                      id v326 = objc_getProperty(v326, v327, 88, 1);
                                    }
                                    id v329 = v326;
                                    v365[0] = MEMORY[0x1E4F143A8];
                                    v365[1] = 3221225472;
                                    v365[2] = __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_358;
                                    v365[3] = &unk_1E5990580;
                                    SEL v366 = v195;
                                    SEL v367 = a1;
                                    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](a1, v324, v329, v365);

                                    uint64_t v318 = v366;
                                  }
                                  else
                                  {
                                    uint64_t v306 = ne_log_obj();
                                    if (os_log_type_enabled(v306, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_WORD *)SEL v386 = 0;
                                      _os_log_error_impl(&dword_19DDAF000, v306, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", v386, 2u);
                                    }

                                    id v308 = objc_getProperty(v195, v307, 56, 1);
                                    uint64_t v310 = v308;
                                    if (v308) {
                                      id v308 = objc_getProperty(v308, v309, 80, 1);
                                    }
                                    id v311 = v308;
                                    id v313 = objc_getProperty(v195, v312, 56, 1);
                                    uint64_t v315 = v313;
                                    id v316 = v11;
                                    if (v313) {
                                      id v313 = objc_getProperty(v313, v314, 88, 1);
                                    }
                                    id v317 = v313;
                                    v368[0] = MEMORY[0x1E4F143A8];
                                    v368[1] = 3221225472;
                                    v368[2] = __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_357;
                                    v368[3] = &unk_1E5990580;
                                    id v369 = v195;
                                    uint64_t v370 = a1;
                                    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](a1, v311, v317, v368);

                                    uint64_t v318 = v369;
                                  }

                                  id v11 = v316;
                                }
                                id v7 = self;
                                goto LABEL_210;
                              }
                              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"create child SA reply", (uint64_t)v282, v283, v284, v285, v286, v287, v288, v359);
                            }
                            else
                            {
                              uint32_t v295 = ne_log_obj();
                              if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)SEL v386 = 0;
                                _os_log_error_impl(&dword_19DDAF000, v295, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", v386, 2u);
                              }

                              ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v296, v297, v298, v299, v300, v301, v302, v359);
                            }
                            uint64_t v304 = ErrorFailedToSend;
                            -[NEIKEv2ChildSA setState:error:]((uint64_t)v195, 3uLL, ErrorFailedToSend);

                            [(NEIKEv2Session *)a1 reportState];
                            -[NEIKEv2Session resetChild:]((char *)a1, v195);
                            goto LABEL_210;
                          }
                          unint64_t v276 = ne_log_obj();
                          if (!os_log_type_enabled(v276, OS_LOG_TYPE_FAULT)) {
                            goto LABEL_178;
                          }
                          *(_DWORD *)SEL v386 = 136315138;
                          uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                          __int16 v277 = "%s called with null packet.nonce.isValid";
                        }
                        else
                        {
                          unint64_t v276 = ne_log_obj();
                          id v11 = v364;
                          if (!os_log_type_enabled(v276, OS_LOG_TYPE_FAULT)) {
                            goto LABEL_178;
                          }
                          *(_DWORD *)SEL v386 = 136315138;
                          uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                          __int16 v277 = "%s called with null packet.childSA.isValid";
                        }
LABEL_176:
                        uint64_t v278 = v276;
                        uint32_t v279 = 12;
                        goto LABEL_177;
                      }
                      unint64_t v276 = ne_log_obj();
                      if (os_log_type_enabled(v276, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)SEL v386 = 0;
                        __int16 v277 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
                        uint64_t v278 = v276;
                        uint32_t v279 = 2;
LABEL_177:
                        _os_log_fault_impl(&dword_19DDAF000, v278, OS_LOG_TYPE_FAULT, v277, v386, v279);
                        goto LABEL_178;
                      }
                      goto LABEL_178;
                    }
                    uint64_t v274 = ne_log_obj();
                    if (os_log_type_enabled(v274, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)SEL v386 = 0;
                      _os_log_fault_impl(&dword_19DDAF000, v274, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed", v386, 2u);
                    }

                    id v200 = 0;
                  }
                  else
                  {
                    id v200 = ne_log_obj();
                    if (os_log_type_enabled(v200, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)SEL v386 = 136315138;
                      uint64_t v387 = "+[NEIKEv2CreateChildPacket(Exchange) createChildSAResponse:childSA:]";
                      _os_log_fault_impl(&dword_19DDAF000, v200, OS_LOG_TYPE_FAULT, "%s called with null childSA.chosenProposal", v386, 0xCu);
                    }
                  }
                  uint64_t v271 = 0;
                  goto LABEL_180;
                }
                id v150 = objc_getProperty(self, v149, 104, 1);

                if (v150)
                {
                  uint64_t v152 = objc_getProperty(self, v151, 104, 1);
                  uint64_t v154 = v152;
                  if (v152) {
                    uint64_t v152 = objc_getProperty(v152, v153, 24, 1);
                  }
                  id v155 = v152;

                  if (v155)
                  {
                    uint64_t v157 = objc_getProperty(self, v156, 104, 1);
                    uint64_t v159 = v157;
                    if (v157) {
                      uint64_t v157 = objc_getProperty(v157, v158, 32, 1);
                    }
                    id v160 = v157;

                    if (v160)
                    {
                      uint64_t v162 = objc_getProperty(self, v161, 104, 1);
                      uint64_t v164 = v162;
                      id v363 = v11;
                      if (v162) {
                        uint64_t v162 = objc_getProperty(v162, v163, 24, 1);
                      }
                      id v165 = v162;
                      unint64_t v359 = [v165 method];
                      id v167 = objc_getProperty(v16, v166, 56, 1);
                      uint64_t v169 = [(NEIKEv2IKESAProposal *)v167 kemProtocol];
                      uint64_t v170 = [v169 method];

                      if (v359 == v170)
                      {
                        SEL v172 = objc_getProperty(self, v171, 104, 1);
                        char v174 = v172;
                        id v11 = v363;
                        if (v172) {
                          SEL v172 = objc_getProperty(v172, v173, 32, 1);
                        }
                        id v175 = v172;
                        objc_setProperty_atomic(v16, v176, v175, 104);

                        goto LABEL_115;
                      }
                      uint64_t v69 = ne_log_obj();
                      id v11 = v363;
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                      {
                        int v336 = (void *)[self copyShortDescription];
                        id v338 = objc_getProperty(self, v337, 104, 1);
                        uint64_t v340 = v338;
                        if (v338) {
                          id v338 = objc_getProperty(v338, v339, 24, 1);
                        }
                        id v341 = v338;
                        unint64_t v359 = [v341 method];
                        id v343 = objc_getProperty(v16, v342, 56, 1);
                        v345 = [(NEIKEv2IKESAProposal *)v343 kemProtocol];
                        uint64_t v346 = [v345 method];
                        *(_DWORD *)buf = 138413058;
                        SEL v379 = v16;
                        __int16 v380 = 2112;
                        v381 = v336;
                        __int16 v382 = 2048;
                        unint64_t v383 = v359;
                        __int16 v384 = 2048;
                        uint64_t v385 = v346;
                        _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, "%@ %@ Did not receive matching method from KE payload (%zu != %zu)", buf, 0x2Au);

                        id v11 = v363;
                      }
LABEL_164:
                      id v36 = v360;
LABEL_165:

                      id v7 = self;
LABEL_76:
                      uint32_t v108 = ne_log_obj();
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)SEL v386 = 0;
                        _os_log_error_impl(&dword_19DDAF000, v108, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA", v386, 2u);
                      }

                      id v110 = objc_getProperty(v16, v109, 40, 1);
                      id v111 = [v110 domain];
                      int v112 = [v111 isEqual:@"NEIKEv2ErrorDomain"];

                      if (v112)
                      {
                        id v114 = objc_getProperty(v16, v113, 40, 1);
                        uint64_t v115 = [v114 code];

                        if (v115 == 8) {
                          unint64_t v116 = 24;
                        }
                        else {
                          unint64_t v116 = 7;
                        }
                      }
                      else
                      {
                        unint64_t v116 = 7;
                      }
                      uint64_t v117 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, v7, v116, 0);
                      if (v117)
                      {
                        if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v117, 0))
                        {
                          -[NEIKEv2ChildSA setState:error:]((uint64_t)v16, 3uLL, 0);
LABEL_91:
                          [(NEIKEv2Session *)a1 reportState];
                          -[NEIKEv2Session resetChild:]((char *)a1, v16);

                          goto LABEL_92;
                        }
                        uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorFailedToSend(@"create child SA refusal (failed to create response packet)", v118, v119, v120, v121, v122, v123, v124, v359);
                      }
                      else
                      {
                        uint64_t v126 = ne_log_obj();
                        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)SEL v386 = 0;
                          _os_log_error_impl(&dword_19DDAF000, v126, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", v386, 2u);
                        }

                        uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v127, v128, v129, v130, v131, v132, v133, v359);
                      }
                      id v135 = ErrorInternal;
                      -[NEIKEv2ChildSA setState:error:]((uint64_t)v16, 3uLL, ErrorInternal);

                      goto LABEL_91;
                    }
                    uint64_t v69 = ne_log_obj();
                    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_164;
                    }
                    uint64_t v272 = (void *)[self copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    SEL v379 = v16;
                    __int16 v380 = 2112;
                    v381 = v272;
                    uint64_t v273 = "%@ %@ Did not receive KE data";
                  }
                  else
                  {
                    uint64_t v69 = ne_log_obj();
                    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_164;
                    }
                    uint64_t v272 = (void *)[self copyShortDescription];
                    *(_DWORD *)buf = 138412546;
                    SEL v379 = v16;
                    __int16 v380 = 2112;
                    v381 = v272;
                    uint64_t v273 = "%@ %@ Did not receive method in KE payload";
                  }
                }
                else
                {
                  uint64_t v69 = ne_log_obj();
                  if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_164;
                  }
                  uint64_t v272 = (void *)[self copyShortDescription];
                  *(_DWORD *)buf = 138412546;
                  SEL v379 = v16;
                  __int16 v380 = 2112;
                  v381 = v272;
                  uint64_t v273 = "%@ %@ Did not receive KE payload";
                }
                _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, v273, buf, 0x16u);

                goto LABEL_164;
              }
              id v44 = ne_log_obj();
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                goto LABEL_72;
              }
              id v104 = self;
              uint64_t v105 = (void *)[self copyShortDescription];
              *(_DWORD *)buf = 138412546;
              SEL v379 = v16;
              __int16 v380 = 2112;
              v381 = v105;
              uint64_t v106 = "%@ %@ Did not receive NONCE data";
LABEL_167:
              _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, v106, buf, 0x16u);

              id v7 = v104;
              goto LABEL_73;
            }
            id v44 = ne_log_obj();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              uint64_t v107 = (void *)[self copyShortDescription];
              *(_DWORD *)buf = 138412546;
              SEL v379 = v16;
              __int16 v380 = 2112;
              v381 = v107;
              _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, "%@ %@ Did not receive NONCE payload", buf, 0x16u);

              goto LABEL_72;
            }
          }
          else
          {
            id v44 = ne_log_obj();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              id v104 = v7;
              uint64_t v105 = (void *)[v7 copyShortDescription];
              *(_DWORD *)buf = 138412546;
              SEL v379 = v16;
              __int16 v380 = 2112;
              v381 = v105;
              uint64_t v106 = "%@ %@ Received no SA proposals";
              goto LABEL_167;
            }
          }
LABEL_73:

          goto LABEL_74;
        }
        char v90 = ne_log_obj();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)SEL v386 = 0;
          _os_log_error_impl(&dword_19DDAF000, v90, OS_LOG_TYPE_ERROR, "Failed to generate local Child crypto values", v386, 2u);
        }

        id v89 = @"Failed to generate local Child crypto values";
      }
      else
      {
        id v81 = ne_log_obj();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)SEL v386 = 0;
          _os_log_error_impl(&dword_19DDAF000, v81, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", v386, 2u);
        }

        id v89 = @"Failed to generate Child SA SPI";
      }
      uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v89, v82, v83, v84, v85, v86, v87, v88, v359);
      -[NEIKEv2ChildSA setState:error:]((uint64_t)v5, 3uLL, ErrorCrypto);

      [(NEIKEv2Session *)a1 reportState];
      -[NEIKEv2Session resetChild:]((char *)a1, v5);
LABEL_92:

      goto LABEL_93;
    }
    id v71 = ne_log_obj();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)SEL v386 = 0;
      _os_log_debug_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_DEBUG, "No eligible configuration for new Child SAs", v386, 2u);
    }

    id v72 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, v7, 0x23uLL, 0);
    if (v72)
    {
      if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v72, 0))
      {
        id v80 = 0;
LABEL_59:

        [(NEIKEv2Session *)a1 reportState];
        -[NEIKEv2Session resetChild:]((char *)a1, 0);

        goto LABEL_92;
      }
      uint64_t v101 = (void *)NEIKEv2CreateErrorFailedToSend(@"create child SA refusal (no eligible configuration)", v73, v74, v75, v76, v77, v78, v79, v359);
    }
    else
    {
      uint64_t v93 = ne_log_obj();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)SEL v386 = 0;
        _os_log_error_impl(&dword_19DDAF000, v93, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", v386, 2u);
      }

      uint64_t v101 = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v94, v95, v96, v97, v98, v99, v100, v359);
    }
    id v80 = v101;

    goto LABEL_59;
  }
LABEL_93:
}

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data", a2, a3, a4, a5, a6, a7, a8, v14);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v13 = *(void **)(a1 + 32);
  id v12 = *(char **)(a1 + 40);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_357(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA crypto values", a2, a3, a4, a5, a6, a7, a8, v14);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v13 = *(void **)(a1 + 32);
  id v12 = *(char **)(a1 + 40);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __53__NEIKEv2Session_Exchange__receiveNewChildSA_packet___block_invoke_358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA", a2, a3, a4, a5, a6, a7, a8, v14);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v13 = *(void **)(a1 + 32);
  id v12 = *(char **)(a1 + 40);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __69__NEIKEv2Session_Exchange__retryKEForRekeyChildSA_validated_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[NEIKEv2CreateChildPacket validateRekeyResponseChildSA:]((uint64_t)v3, *(void **)(a1 + 48)))
    {
      uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v19 = 138412290;
        *(void *)&v19[4] = v18;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ Failed to process Create Child SA packet (child rekey retry KE)", v19, 0xCu);
      }

      uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v4();
  }
  else
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v19 = 138412290;
      *(void *)&v19[4] = v17;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to receive Create Child SA packet (child rekey retry KE)", v19, 0xCu);
    }

    [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive Create Child SA packet (child rekey retry KE)", v7, v8, v9, v10, v11, v12, v13, *(uint64_t *)v19);
    -[NEIKEv2ChildSA setState:error:](v6, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
  }
}

- (void)handleFollowupKEForRekeyChildSAInitiator:(unint64_t)a3 iteration:(void *)a4 handler:
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  uint64_t v9 = a4;
  if (a1)
  {
    uint64_t v10 = objc_getProperty(a1, v8, 368, 1);
    dispatch_assert_queue_V2(v10);

    if (v7) {
      uint64_t v11 = (const char *)v7[6];
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = -[NEIKEv2Session copyChildWithID:](a1, v11);
    uint64_t v14 = v12;
    if (v12)
    {
      id Property = objc_getProperty(v12, v13, 56, 1);
      uint64_t v17 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v16, 120, 1);
      }
    }
    else
    {
      uint64_t v17 = 0;
      id Property = 0;
    }
    id v18 = Property;
    unint64_t v19 = [v18 count];

    if (v19 <= a3)
    {
      if (v14) {
        objc_setProperty_atomic(v14, v20, 0, 128);
      }
      v9[2](v9);
      goto LABEL_47;
    }
    if (!a3)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
      if (v14)
      {
        id v23 = objc_getProperty(v14, v21, 56, 1);
        uint64_t v25 = v23;
        if (v23) {
          id v23 = objc_getProperty(v23, v24, 120, 1);
        }
      }
      else
      {
        uint64_t v25 = 0;
        id v23 = 0;
      }
      id v26 = v23;
      id v28 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v26, "count"));
      if (v14) {
        objc_setProperty_atomic(v14, v27, v28, 136);
      }
    }
    if (v14)
    {
      id v29 = objc_getProperty(v14, v20, 56, 1);
      SEL v31 = v29;
      if (v29) {
        id v29 = objc_getProperty(v29, v30, 120, 1);
      }
    }
    else
    {
      SEL v31 = 0;
      id v29 = 0;
    }
    id v32 = v29;
    id v33 = [v32 objectAtIndexedSubscript:a3];

    if (v14) {
      id v35 = objc_getProperty(v14, v34, 56, 1);
    }
    else {
      id v35 = 0;
    }
    id v36 = v35;
    SEL v37 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v36);
    id v38 = [v37 objectForKeyedSubscript:v33];

    if (v38)
    {
      if (-[NEIKEv2ChildSA generateLocalValuesForKEMProtocol:](v14, v38))
      {
        uint32_t v108 = v33;
        uint64_t v39 = -[NEIKEv2Packet initOutbound]([NEIKEv2FollowupKEPacket alloc]);
        SEL v40 = objc_alloc_init(NEIKEv2KeyExchangePayload);
        id v42 = v40;
        if (v39)
        {
          objc_setProperty_atomic(v39, v41, v40, 88);

          id v44 = objc_getProperty(v39, v43, 88, 1);
          SEL v46 = v44;
          if (v44) {
            objc_setProperty_atomic(v44, v45, v38, 24);
          }
        }
        else
        {

          SEL v46 = 0;
        }

        if (v14)
        {
          id v48 = objc_getProperty(v14, v47, 112, 1);
          SEL v49 = v48;
          if (v48)
          {
            SEL v50 = (void *)*((void *)v48 + 2);
LABEL_28:
            id v52 = v50;
            if (v39)
            {
              id v53 = objc_getProperty(v39, v51, 88, 1);
              id v55 = v53;
              if (v53) {
                objc_setProperty_atomic(v53, v54, v52, 32);
              }
            }
            else
            {
              id v55 = 0;
            }

            if (v14) {
              id v57 = objc_getProperty(v14, v56, 128, 1);
            }
            else {
              id v57 = 0;
            }
            id v58 = v57;
            int v60 = v58;
            if (v39)
            {
              objc_setProperty_atomic(v39, v59, v58, 96);

              id v62 = objc_getProperty(v39, v61, 88, 1);
            }
            else
            {

              id v62 = 0;
            }
            id v63 = v62;
            char v64 = -[NEIKEv2Payload isValid]((uint64_t)v63);

            if (v64)
            {
              v109[0] = MEMORY[0x1E4F143A8];
              v109[1] = 3221225472;
              v109[2] = __87__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAInitiator_iteration_handler___block_invoke;
              v109[3] = &unk_1E5990800;
              v109[4] = a1;
              id v65 = v7;
              id v110 = v65;
              id v111 = v14;
              id v112 = v38;
              unint64_t v114 = a3;
              uint64_t v113 = v9;
              if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v39, v109) == -1)
              {
                [v65 sendCallbackSuccess:0 session:a1];
                id v67 = objc_getProperty(a1, v66, 336, 1);
                ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator rekey child FOLLOWUP_KE #%zu", v68, v69, v70, v71, v72, v73, v74, a3 + 1);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

                [(NEIKEv2Session *)a1 reportState];
                [(NEIKEv2Session *)(uint64_t)a1 resetAll];
              }

              id v33 = v108;
            }
            else
            {
              uint64_t v78 = ne_log_obj();
              id v33 = v108;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v116 = a1;
                _os_log_error_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_ERROR, "%@ Failed to create FOLLOWUP_KE packet (initiator rekey child followup KE)", buf, 0xCu);
              }

              [v7 sendCallbackSuccess:0 session:a1];
              uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create FOLLOWUP_KE packet (initiator rekey child followup KE)", v79, v80, v81, v82, v83, v84, v85, v107);
              -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorInternal);

              [(NEIKEv2Session *)a1 reportState];
              -[NEIKEv2Session resetChild:]((char *)a1, v14);
            }

            goto LABEL_46;
          }
        }
        else
        {
          SEL v49 = 0;
        }
        SEL v50 = 0;
        goto LABEL_28;
      }
      uint64_t v97 = ne_log_obj();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v116 = a1;
        __int16 v117 = 2112;
        uint64_t v118 = v38;
        _os_log_error_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (initiator rekey child followup KE)", buf, 0x16u);
      }

      [v7 sendCallbackSuccess:0 session:a1];
      uint64_t v96 = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (initiator rekey child followup KE)", v98, v99, v100, v101, v102, v103, v104, (uint64_t)v38);
    }
    else
    {
      uint64_t v88 = ne_log_obj();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v116 = a1;
        __int16 v117 = 2112;
        uint64_t v118 = v33;
        _os_log_error_impl(&dword_19DDAF000, v88, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (initiator rekey child followup KE)", buf, 0x16u);
      }

      [v7 sendCallbackSuccess:0 session:a1];
      uint64_t v96 = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (initiator rekey child followup KE)", v89, v90, v91, v92, v93, v94, v95, (uint64_t)v33);
    }
    uint64_t v105 = v96;
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, v96);

    [(NEIKEv2Session *)a1 reportState];
    -[NEIKEv2Session resetChild:]((char *)a1, v14);
LABEL_46:

LABEL_47:
  }
}

void __87__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAInitiator_iteration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id Property = v3;
    uint64_t v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24, 1);
        }
      }
      else
      {
        uint64_t v11 = 0;
        id v9 = 0;
      }
      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88, 1);
          uint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32, 1);
          }
        }
        else
        {
          uint64_t v16 = 0;
          id v14 = 0;
        }
        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88, 1);
            uint64_t v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24, 1);
            }
          }
          else
          {
            uint64_t v21 = 0;
            id v19 = 0;
          }
          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 56) method];

          if (v23 != v24)
          {
            id v63 = ne_log_obj();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              uint64_t v91 = *(const char **)(a1 + 32);
              if (v6)
              {
                id v92 = objc_getProperty(v6, v64, 88, 1);
                uint64_t v94 = v92;
                if (v92) {
                  id v92 = objc_getProperty(v92, v93, 24, 1);
                }
              }
              else
              {
                uint64_t v94 = 0;
                id v92 = 0;
              }
              id v95 = v92;
              uint64_t v96 = [v95 method];
              uint64_t v97 = [*(id *)(a1 + 56) method];
              *(_DWORD *)buf = 138412802;
              id v112 = v91;
              __int16 v113 = 2048;
              uint64_t v114 = v96;
              __int16 v115 = 2048;
              uint64_t v116 = v97;
              _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (initiator rekey child followup KE)", buf, 0x20u);
            }
            [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
            uint64_t v66 = *(void *)(a1 + 48);
            if (v6)
            {
              id v67 = objc_getProperty(v6, v65, 88, 1);
              SEL v61 = v67;
              if (v67) {
                id v67 = objc_getProperty(v67, v68, 24, 1);
              }
            }
            else
            {
              SEL v61 = 0;
              id v67 = 0;
            }
            id v69 = v67;
            uint64_t v70 = [v69 method];
            [*(id *)(a1 + 56) method];
            uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (initiator rekey child followup KE)", v71, v72, v73, v74, v75, v76, v77, v70);
            -[NEIKEv2ChildSA setState:error:](v66, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_43;
          }
          if (v6)
          {
            id v26 = objc_getProperty(v6, v25, 88, 1);
            id v28 = v26;
            if (v26) {
              id v26 = objc_getProperty(v26, v27, 32, 1);
            }
          }
          else
          {
            id v28 = 0;
            id v26 = 0;
          }
          id v30 = v26;
          SEL v31 = *(void **)(a1 + 48);
          if (v31) {
            objc_setProperty_atomic(v31, v29, v30, 104);
          }

          id v33 = *(void **)(a1 + 48);
          if (v33)
          {
            id v34 = objc_getProperty(*(id *)(a1 + 48), v32, 136, 1);

            if (v34)
            {
              if ([(NEIKEv2ChildSA *)v33 processCurrentKeyExchange])
              {
                id v37 = objc_getProperty(v33, v36, 136, 1);
                uint64_t v39 = (uint64_t *)objc_getProperty(v33, v38, 112, 1);
                SEL v40 = v39;
                if (v39) {
                  uint64_t v41 = v39[3];
                }
                else {
                  uint64_t v41 = 0;
                }
                [v37 addObject:v41];

                objc_setProperty_atomic(v33, v42, 0, 112);
                if (v6) {
                  id v44 = objc_getProperty(v6, v43, 96, 1);
                }
                else {
                  id v44 = 0;
                }
                id v46 = v44;
                id v47 = *(void **)(a1 + 48);
                if (v47) {
                  objc_setProperty_atomic(v47, v45, v46, 128);
                }

                -[NEIKEv2Session handleFollowupKEForRekeyChildSAInitiator:iteration:handler:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 72) + 1, *(void *)(a1 + 64));
                goto LABEL_44;
              }
            }
            else
            {
              uint64_t v79 = ne_log_obj();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                id v112 = "-[NEIKEv2ChildSA(Crypto) processFollowupKeyExchange]";
                _os_log_fault_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_FAULT, "%s called with null self.followupSharedSecrets", buf, 0xCu);
              }
            }
          }
          uint64_t v80 = ne_log_obj();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "Failed to process KE data (initiator rekey child followup KE)", buf, 2u);
          }

          [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
          uint64_t v56 = *(void *)(a1 + 48);
          uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data (initiator rekey child followup KE)", v81, v82, v83, v84, v85, v86, v87, v110);
LABEL_42:
          SEL v61 = ErrorCrypto;
          -[NEIKEv2ChildSA setState:error:](v56, 3uLL, ErrorCrypto);
LABEL_43:

          [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
          -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
LABEL_44:

          goto LABEL_45;
        }
        id v59 = ne_log_obj();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v90 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          id v112 = v90;
          _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (initiator rekey child followup KE)", buf, 0xCu);
        }

        [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
        uint64_t v56 = *(void *)(a1 + 48);
        id v57 = @"Did not receive data in KE payload (initiator rekey child followup KE)";
      }
      else
      {
        id v58 = ne_log_obj();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          uint64_t v89 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          id v112 = v89;
          _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (initiator rekey child followup KE)", buf, 0xCu);
        }

        [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
        uint64_t v56 = *(void *)(a1 + 48);
        id v57 = @"Did not receive method in KE payload (initiator rekey child followup KE)";
      }
    }
    else
    {
      id v48 = ne_log_obj();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v88 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v112 = v88;
        _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (initiator rekey child followup KE)", buf, 0xCu);
      }

      [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
      uint64_t v56 = *(void *)(a1 + 48);
      id v57 = @"Did not receive KE payload (initiator rekey child followup KE)";
    }
    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v57, v49, v50, v51, v52, v53, v54, v55, v110);
    goto LABEL_42;
  }
  uint64_t v98 = ne_log_obj();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
  {
    SEL v109 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v112 = v109;
    _os_log_error_impl(&dword_19DDAF000, v98, OS_LOG_TYPE_ERROR, "%@ Failed to receive FOLLOWUP_KE reply (initiator rekey child followup KE)", buf, 0xCu);
  }

  [*(id *)(a1 + 40) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
  uint64_t v99 = *(void *)(a1 + 48);
  uint64_t v107 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive FOLLOWUP_KE reply (initiator rekey child followup KE)", v100, v101, v102, v103, v104, v105, v106, v110);
  -[NEIKEv2ChildSA setState:error:](v99, 3uLL, v107);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 48));
LABEL_45:
}

- (void)handleFollowupKEForRekeyChildSAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    uint64_t v16 = objc_getProperty(a1, v15, 368, 1);
    dispatch_assert_queue_V2(v16);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __122__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v27[3] = &unk_1E5990620;
    uint64_t v31 = a3;
    id v17 = v11;
    id v28 = v17;
    id v29 = a1;
    id v30 = v13;
    LOBYTE(v16) = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v27);

    if ((v16 & 1) == 0)
    {
      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"%@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v12);
      -[NEIKEv2ChildSA setState:error:]((uint64_t)v17, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      -[NEIKEv2Session resetChild:]((char *)a1, v17);
    }
  }
}

void __122__NEIKEv2Session_Exchange__handleFollowupKEForRekeyChildSAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v271 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  unint64_t v5 = a1[7];
  uint64_t v6 = (void *)a1[4];
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 184, 1);
    id v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120, 1);
    }
  }
  else
  {
    id v9 = 0;
    id Property = 0;
  }
  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    if (!a1[7])
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v14 = (void *)a1[4];
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 184, 1);
        id v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120, 1);
        }
      }
      else
      {
        id v17 = 0;
        id v15 = 0;
      }
      id v18 = v15;
      uint64_t v20 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v18, "count"));
      uint64_t v21 = (void *)a1[4];
      if (v21) {
        objc_setProperty_atomic(v21, v19, v20, 136);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v4;
      uint64_t v24 = (void *)a1[4];
      if (v24)
      {
        id v25 = objc_getProperty(v24, v22, 184, 1);
        uint64_t v27 = v25;
        if (v25) {
          id v25 = objc_getProperty(v25, v26, 120, 1);
        }
      }
      else
      {
        uint64_t v27 = 0;
        id v25 = 0;
      }
      id v28 = v25;
      id v29 = [v28 objectAtIndexedSubscript:a1[7]];

      id v31 = (id)a1[4];
      if (v31) {
        id v31 = objc_getProperty(v31, v30, 184, 1);
      }
      id v32 = v31;
      id v33 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v32);
      id v34 = [v33 objectForKeyedSubscript:v29];

      if (!v34)
      {
        int v252 = ne_log_obj();
        if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
        {
          uint64_t v262 = a1[5];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v262;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v29;
          _os_log_error_impl(&dword_19DDAF000, v252, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (responder rekey child followup KE)", buf, 0x16u);
        }

        uint64_t v79 = a1[4];
        uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (responder rekey child followup KE)", v253, v254, v255, v256, v257, v258, v259, (uint64_t)v29);
        goto LABEL_68;
      }
      if (v23) {
        id v36 = objc_getProperty(v23, v35, 88, 1);
      }
      else {
        id v36 = 0;
      }
      id v37 = v36;

      if (v37)
      {
        if (v23)
        {
          id v39 = objc_getProperty(v23, v38, 88, 1);
          uint64_t v41 = v39;
          if (v39) {
            id v39 = objc_getProperty(v39, v40, 24, 1);
          }
        }
        else
        {
          uint64_t v41 = 0;
          id v39 = 0;
        }
        id v42 = v39;

        if (v42)
        {
          if (v23)
          {
            id v44 = objc_getProperty(v23, v43, 88, 1);
            id v46 = v44;
            if (v44) {
              id v44 = objc_getProperty(v44, v45, 32, 1);
            }
          }
          else
          {
            id v46 = 0;
            id v44 = 0;
          }
          id v47 = v44;

          if (v47)
          {
            if (v23)
            {
              id v49 = objc_getProperty(v23, v48, 88, 1);
              uint64_t v51 = v49;
              if (v49) {
                id v49 = objc_getProperty(v49, v50, 24, 1);
              }
            }
            else
            {
              uint64_t v51 = 0;
              id v49 = 0;
            }
            id v52 = v49;
            uint64_t v53 = [v52 method];
            uint64_t v54 = [v34 method];

            if (v53 != v54)
            {
              __int16 v113 = ne_log_obj();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                long long v267 = v29;
                uint64_t v183 = a1[5];
                if (v23)
                {
                  id v184 = objc_getProperty(v23, v114, 88, 1);
                  id v186 = v184;
                  if (v184) {
                    id v184 = objc_getProperty(v184, v185, 24, 1);
                  }
                }
                else
                {
                  id v186 = 0;
                  id v184 = 0;
                }
                id v187 = v184;
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v183;
                *(_WORD *)&unsigned char buf[12] = 2048;
                *(void *)&buf[14] = [v187 method];
                __int16 v269 = 2048;
                uint64_t v270 = [v34 method];
                _os_log_error_impl(&dword_19DDAF000, v113, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (responder rekey child followup KE)", buf, 0x20u);

                id v29 = v267;
              }

              uint64_t v116 = a1[4];
              if (v23)
              {
                id v117 = objc_getProperty(v23, v115, 88, 1);
                id v111 = v117;
                if (v117) {
                  id v117 = objc_getProperty(v117, v118, 24, 1);
                }
              }
              else
              {
                id v111 = 0;
                id v117 = 0;
              }
              id v119 = v117;
              uint64_t v120 = [v119 method];
              [v34 method];
              uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (responder rekey child followup KE)", v121, v122, v123, v124, v125, v126, v127, v120);
              -[NEIKEv2ChildSA setState:error:](v116, 3uLL, ErrorPeerInvalidSyntax);

              goto LABEL_69;
            }
            if (v23)
            {
              id v56 = objc_getProperty(v23, v55, 96, 1);
              id v58 = v56;
              if (v56) {
                id v56 = objc_getProperty(v56, v57, 32, 1);
              }
            }
            else
            {
              id v58 = 0;
              id v56 = 0;
            }
            id v60 = v56;
            SEL v61 = (void *)a1[4];
            id v266 = v29;
            if (v61)
            {
              id v62 = objc_getProperty(v61, v59, 128, 1);
              char v64 = v62;
              if (v62) {
                id v62 = objc_getProperty(v62, v63, 32, 1);
              }
            }
            else
            {
              char v64 = 0;
              id v62 = 0;
            }
            id v65 = v62;
            char v66 = [v60 isEqualToData:v65];

            if ((v66 & 1) == 0)
            {
              uint64_t v129 = ne_log_obj();
              uint64_t v131 = &off_1E598D000;
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                uint64_t v239 = a1[5];
                if (v23)
                {
                  id v240 = objc_getProperty(v23, v130, 96, 1);
                  SEL v242 = v240;
                  if (v240) {
                    id v240 = objc_getProperty(v240, v241, 32, 1);
                  }
                }
                else
                {
                  SEL v242 = 0;
                  id v240 = 0;
                }
                id v244 = v240;
                uint64_t v245 = (void *)a1[4];
                if (v245)
                {
                  id v246 = objc_getProperty(v245, v243, 128, 1);
                  char v248 = v246;
                  if (v246) {
                    id v246 = objc_getProperty(v246, v247, 32, 1);
                  }
                }
                else
                {
                  char v248 = 0;
                  id v246 = 0;
                }
                id v249 = v246;
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v239;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v244;
                __int16 v269 = 2112;
                uint64_t v270 = (uint64_t)v249;
                _os_log_error_impl(&dword_19DDAF000, v129, OS_LOG_TYPE_ERROR, "%@ ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey child followup KE)", buf, 0x20u);

                uint64_t v131 = &off_1E598D000;
              }

              uint64_t v132 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc((Class)v131[121]), v23);
              uint64_t v133 = v132;
              id v29 = v266;
              if (v132) {
                -[NEIKEv2Packet addNotification:data:](v132, 0x2FuLL, 0);
              }
              char v134 = -[NEIKEv2Session sendReply:replyHandler:](a1[5], v133, 0);
              uint64_t v142 = a1[4];
              if (v134)
              {
                uint64_t v265 = a1[4];
                if (v23)
                {
                  id v143 = objc_getProperty(v23, v135, 96, 1);
                  ErrorFailedToSend = v143;
                  if (v143) {
                    id v143 = objc_getProperty(v143, v144, 32, 1);
                  }
                }
                else
                {
                  ErrorFailedToSend = 0;
                  id v143 = 0;
                }
                id v147 = v143;
                id v148 = (void *)a1[4];
                if (v148)
                {
                  id v149 = objc_getProperty(v148, v146, 128, 1);
                  char v151 = v149;
                  if (v149) {
                    id v149 = objc_getProperty(v149, v150, 32, 1);
                  }
                }
                else
                {
                  char v151 = 0;
                  id v149 = 0;
                }
                id v264 = v149;
                uint64_t v159 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey child followup KE)", v152, v153, v154, v155, v156, v157, v158, (uint64_t)v147);
                -[NEIKEv2ChildSA setState:error:](v265, 3uLL, v159);

                id v29 = v266;
                goto LABEL_90;
              }
              ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"responder rekey child followup KE mismatched link", (uint64_t)v135, v136, v137, v138, v139, v140, v141, v263);
              uint64_t v160 = v142;
LABEL_89:
              -[NEIKEv2ChildSA setState:error:](v160, 3uLL, ErrorFailedToSend);
LABEL_90:

              [(NEIKEv2Session *)(void *)a1[5] reportState];
              -[NEIKEv2Session resetChild:]((char *)a1[5], (void *)a1[4]);
LABEL_91:

              goto LABEL_70;
            }
            uint64_t v68 = (void *)a1[4];
            if (v23)
            {
              id v69 = objc_getProperty(v23, v67, 88, 1);
              uint64_t v71 = v69;
              id v29 = v266;
              if (v69) {
                id v69 = objc_getProperty(v69, v70, 32, 1);
              }
            }
            else
            {
              uint64_t v71 = 0;
              id v69 = 0;
              id v29 = v266;
            }
            id v72 = v69;
            id v73 = v34;
            id v75 = v72;
            if (!v68) {
              goto LABEL_49;
            }
            id v76 = objc_getProperty(v68, v74, 112, 1);

            if (v76)
            {
              uint64_t v77 = ne_log_obj();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[NEIKEv2ChildSA(Crypto) generateLocalValuesForKEMProtocol:peerPayload:]";
                _os_log_fault_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", buf, 0xCu);
              }
LABEL_48:
              id v29 = v266;

LABEL_49:
              uint64_t v78 = ne_log_obj();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                uint64_t v250 = a1[5];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v250;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v73;
                _os_log_error_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (responder rekey child followup KE)", buf, 0x16u);
              }

              uint64_t v79 = a1[4];
              uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (responder rekey child followup KE)", v80, v81, v82, v83, v84, v85, v86, (uint64_t)v73);
              goto LABEL_68;
            }
            uint64_t v162 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:peerPayload:]((uint64_t)NEIKEv2KeyExchangeHandler, [v73 method], v75);
            objc_setProperty_atomic(v68, v163, v162, 112);

            id v165 = objc_getProperty(v68, v164, 112, 1);
            if (!v165)
            {
              uint64_t v77 = ne_log_obj();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v73;
                _os_log_error_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", buf, 0xCu);
              }
              goto LABEL_48;
            }

            unint64_t v167 = a1[7] + 1;
            uint64_t v168 = (void *)a1[4];
            if (v168)
            {
              id v169 = objc_getProperty(v168, v166, 184, 1);
              SEL v171 = v169;
              if (v169) {
                id v169 = objc_getProperty(v169, v170, 120, 1);
              }
            }
            else
            {
              SEL v171 = 0;
              id v169 = 0;
            }
            id v172 = v169;
            unint64_t v173 = [v172 count];

            if (v167 >= v173)
            {
              uint64_t v188 = (void *)a1[4];
              id v29 = v266;
              if (v188) {
                objc_setProperty_atomic(v188, v174, 0, 128);
              }
            }
            else
            {
              id v175 = [MEMORY[0x1E4F29128] UUID];
              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = 0;
              [v175 getUUIDBytes:buf];
              SEL v176 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:16];
              id v178 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4039uLL, v176);
              id v179 = (void *)a1[4];
              id v29 = v266;
              if (v179) {
                objc_setProperty_atomic(v179, v177, v178, 128);
              }
            }
            uint64_t v133 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2FollowupKEPacket alloc], v23);
            id v189 = objc_alloc_init(NEIKEv2KeyExchangePayload);
            id v191 = v189;
            if (v133)
            {
              objc_setProperty_atomic(v133, v190, v189, 88);

              id v193 = objc_getProperty(v133, v192, 88, 1);
              id v195 = v193;
              if (v193) {
                objc_setProperty_atomic(v193, v194, v73, 24);
              }
            }
            else
            {

              id v195 = 0;
            }

            id v197 = (void *)a1[4];
            if (v197)
            {
              id v198 = objc_getProperty(v197, v196, 112, 1);
              id v199 = v198;
              if (v198)
              {
                id v200 = (void *)*((void *)v198 + 2);
LABEL_114:
                id v202 = v200;
                if (v133)
                {
                  id v203 = objc_getProperty(v133, v201, 88, 1);
                  SEL v205 = v203;
                  if (v203) {
                    objc_setProperty_atomic(v203, v204, v202, 32);
                  }
                }
                else
                {
                  SEL v205 = 0;
                }

                id v207 = (id)a1[4];
                if (v207) {
                  id v207 = objc_getProperty(v207, v206, 128, 1);
                }
                id v208 = v207;
                SEL v210 = v208;
                if (v133)
                {
                  objc_setProperty_atomic(v133, v209, v208, 96);

                  id v212 = objc_getProperty(v133, v211, 88, 1);
                }
                else
                {

                  id v212 = 0;
                }
                id v213 = v212;
                char v214 = -[NEIKEv2Payload isValid]((uint64_t)v213);

                if (v214)
                {
                  id v216 = (id)a1[4];
                  if (v216) {
                    id v216 = objc_getProperty(v216, v215, 136, 1);
                  }
                  id v218 = v216;
                  id v219 = (void *)a1[4];
                  if (v219)
                  {
                    id v220 = objc_getProperty(v219, v217, 112, 1);
                    SEL v221 = v220;
                    if (v220)
                    {
                      SEL v222 = (void *)*((void *)v220 + 3);
LABEL_127:
                      id v223 = v222;
                      [v218 addObject:v223];

                      SEL v225 = (void *)a1[4];
                      if (v225)
                      {
                        objc_setProperty_atomic(v225, v224, 0, 112);
                        uint64_t v226 = a1[4];
                      }
                      else
                      {
                        uint64_t v226 = 0;
                      }
                      uint64_t v227 = a1[5];
                      uint64_t v228 = a1[7] + 1;
                      id v229 = objc_msgSend([NSString alloc], "initWithFormat:", @"responder rekey child FOLLOWUP_KE #%zu", a1[7]);
                      -[NEIKEv2Session handleFollowupKEForRekeyChildSAResponder:iteration:replyPacket:replyPacketDescription:handler:](v227, v226, v228, v133, v229, a1[6]);

                      id v29 = v266;
                      goto LABEL_91;
                    }
                  }
                  else
                  {
                    SEL v221 = 0;
                  }
                  SEL v222 = 0;
                  goto LABEL_127;
                }
                id v230 = ne_log_obj();
                if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v260 = a1[5];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v260;
                  _os_log_error_impl(&dword_19DDAF000, v230, OS_LOG_TYPE_ERROR, "%@ Failed to create FOLLOWUP_KE packet (responder rekey child followup KE)", buf, 0xCu);
                }

                uint64_t v231 = a1[4];
                ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal(@"Failed to create FOLLOWUP_KE packet (responder rekey child followup KE)", v232, v233, v234, v235, v236, v237, v238, v263);
                uint64_t v160 = v231;
                goto LABEL_89;
              }
            }
            else
            {
              id v199 = 0;
            }
            id v200 = 0;
            goto LABEL_114;
          }
          uint64_t v110 = ne_log_obj();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            uint64_t v182 = a1[5];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v182;
            _os_log_error_impl(&dword_19DDAF000, v110, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (responder rekey child followup KE)", buf, 0xCu);
          }

          uint64_t v79 = a1[4];
          uint32_t v108 = @"Did not receive data in KE payload (responder rekey child followup KE)";
        }
        else
        {
          SEL v109 = ne_log_obj();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          {
            uint64_t v181 = a1[5];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v181;
            _os_log_error_impl(&dword_19DDAF000, v109, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (responder rekey child followup KE)", buf, 0xCu);
          }

          uint64_t v79 = a1[4];
          uint32_t v108 = @"Did not receive method in KE payload (responder rekey child followup KE)";
        }
      }
      else
      {
        uint64_t v100 = ne_log_obj();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          uint64_t v180 = a1[5];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v180;
          _os_log_error_impl(&dword_19DDAF000, v100, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (responder rekey child followup KE)", buf, 0xCu);
        }

        uint64_t v79 = a1[4];
        uint32_t v108 = @"Did not receive KE payload (responder rekey child followup KE)";
      }
      uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v108, v101, v102, v103, v104, v105, v106, v107, v263);
LABEL_68:
      id v111 = ErrorInternal;
      -[NEIKEv2ChildSA setState:error:](v79, 3uLL, ErrorInternal);
LABEL_69:

      [(NEIKEv2Session *)(void *)a1[5] reportState];
      -[NEIKEv2Session resetChild:]((char *)a1[5], (void *)a1[4]);
LABEL_70:

      goto LABEL_71;
    }
    id v251 = ne_log_obj();
    if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
    {
      uint64_t v261 = a1[5];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v261;
      _os_log_error_impl(&dword_19DDAF000, v251, OS_LOG_TYPE_ERROR, "%@ Failed to receive FOLLOWUP_KE packet (responder rekey child followup KE)", buf, 0xCu);
    }

    uint64_t v96 = a1[4];
    uint64_t v97 = @"Failed to receive FOLLOWUP_KE packet (responder rekey child followup KE)";
    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v88 = ne_log_obj();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v88, OS_LOG_TYPE_ERROR, "Failed to receive Rekey Child SA Delete packet", buf, 2u);
    }

    uint64_t v96 = a1[4];
    uint64_t v97 = @"Failed to receive Rekey Child SA Delete packet";
LABEL_57:
    uint64_t v98 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v97, v89, v90, v91, v92, v93, v94, v95, v263);
    -[NEIKEv2ChildSA setState:error:](v96, 3uLL, v98);

    [(NEIKEv2Session *)(void *)a1[5] reportState];
    -[NEIKEv2Session resetChild:]((char *)a1[5], (void *)a1[4]);
    goto LABEL_71;
  }
  (*(void (**)(void))(a1[6] + 16))();
LABEL_71:
}

- (void)initiateRekeyChildSA:(unsigned char *)a1
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v6 = Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn("-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]", "NEIKEv2Exchange.m", 2024, "self.hasOutboundRequestInFlight");
  }
  id v8 = objc_getProperty(a1, v7, 336, 1);
  if (v4) {
    id v9 = (const char *)v4[6];
  }
  else {
    id v9 = 0;
  }
  id v10 = -[NEIKEv2Session copyChildWithID:](a1, v9);
  id v12 = v10;
  if (!v8)
  {
    uint64_t v55 = ne_log_obj();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null ikeSA";
    goto LABEL_70;
  }
  if (!v10)
  {
    uint64_t v55 = ne_log_obj();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null childSA";
    goto LABEL_70;
  }
  BOOL v13 = [(NEIKEv2ChildSA *)v10 isRekeying];
  id v14 = ne_log_large_obj();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v121 = a1;
      __int16 v122 = 2112;
      uint64_t v123 = v12;
      _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ Child SA %@ already rekeying, skipping", buf, 0x16u);
    }

    uint64_t v16 = v4;
    uint64_t v17 = 1;
    goto LABEL_40;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v121 = a1;
    __int16 v122 = 2112;
    uint64_t v123 = v12;
    _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_INFO, "%@ Rekey Child SA %@", buf, 0x16u);
  }

  id v19 = objc_getProperty(v12, v18, 56, 1);
  if (v19)
  {
    id v21 = objc_getProperty(v12, v20, 56, 1);
    id v23 = v21;
    if (v21) {
      id v21 = objc_getProperty(v21, v22, 80, 1);
    }
    id v24 = v21;

    id v26 = objc_getProperty(v12, v25, 56, 1);
    id v28 = v26;
    if (v26) {
      id v26 = objc_getProperty(v26, v27, 88, 1);
    }
    id v29 = v26;

    id v31 = objc_getProperty(v12, v30, 48, 1);
    id v32 = [v31 proposals];

    uint64_t v107 = v32;
    if ([v32 count] == 1
      && (id v34 = objc_getProperty(v12, v33, 48, 1),
          char v35 = [v34 opportunisticPFS],
          v34,
          (v35 & 1) == 0))
    {
      id v56 = [v107 objectAtIndexedSubscript:0];
      SEL v38 = -[NEIKEv2ChildSAProposal copyForRekey](v56);

      if (v38) {
        v38[8] = 1;
      }
      id v119 = v38;
      id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
      objc_setProperty_atomic(v12, v57, v39, 176);
    }
    else
    {
      id v103 = v29;
      id v104 = v24;
      id v105 = v8;
      uint64_t v106 = v4;
      id v36 = objc_getProperty(v12, v33, 56, 1);
      id v37 = -[NEIKEv2ChildSAProposal copyForRekey](v36);
      SEL v38 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v37);

      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v40 = v107;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v114 objects:v118 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v115;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v115 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = -[NEIKEv2ChildSAProposal copyForRekey](*(void **)(*((void *)&v114 + 1) + 8 * i));
            id v46 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v45);
            if ([v46 isEqual:v38])
            {
              char v47 = [v39 count];
              if (v45) {
                v45[8] = v47 + 1;
              }
              objc_msgSend(v39, "addObject:", v45, v103);
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v114 objects:v118 count:16];
        }
        while (v42);
      }

      id v49 = objc_getProperty(v12, v48, 48, 1);
      int v50 = [v49 opportunisticPFS];

      id v8 = v105;
      id v4 = v106;
      id v29 = v103;
      id v24 = v104;
      if (v50)
      {
        char v51 = [v39 count];
        if (v38) {
          v38[8] = v51 + 1;
        }
        objc_msgSend(v39, "addObject:", v38, v103);
      }
      if (objc_msgSend(v39, "count", v103))
      {
        id v52 = [v39 array];
        uint64_t v53 = (void *)[v52 copy];
        objc_setProperty_atomic(v12, v54, v53, 176);
      }
    }

    id v59 = objc_getProperty(v12, v58, 176, 1);
    if (!v59)
    {
      uint64_t v78 = ne_log_obj();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
        _os_log_fault_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_FAULT, "%s called with null childSA.rekeyRequestProposals", buf, 0xCu);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      goto LABEL_67;
    }
    id v61 = objc_getProperty(v12, v60, 176, 1);
    char v62 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v12, v61);

    if (v62)
    {
      if (-[NEIKEv2ChildSA generateInitialValues]((id *)v12))
      {
        id v63 = +[NEIKEv2CreateChildPacket createRekeyRequestChildSA:]((uint64_t)NEIKEv2CreateChildPacket, v12);
        if (v63)
        {
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke;
          v108[3] = &unk_1E59908A0;
          char v64 = v4;
          SEL v109 = v64;
          uint64_t v110 = a1;
          id v111 = v12;
          id v112 = v24;
          id v113 = v29;
          if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v63, v108) == -1)
          {
            [v64 sendCallbackSuccess:0 session:a1];
            if (a1) {
              id v66 = objc_getProperty(a1, v65, 336, 1);
            }
            else {
              id v66 = 0;
            }
            id v67 = v66;
            ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator rekey child SA", v68, v69, v70, v71, v72, v73, v74, v102);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

            [(NEIKEv2Session *)a1 reportState];
            [(NEIKEv2Session *)(uint64_t)a1 resetAll];
          }
        }
        else
        {
          uint64_t v91 = ne_log_obj();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19DDAF000, v91, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", buf, 2u);
          }

          [v4 sendCallbackSuccess:0 session:a1];
          uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v92, v93, v94, v95, v96, v97, v98, v102);
          -[NEIKEv2ChildSA setState:error:]((uint64_t)v12, 3uLL, ErrorInternal);

          [(NEIKEv2Session *)a1 reportState];
          -[NEIKEv2Session resetChild:](a1, v12);
        }

        goto LABEL_67;
      }
      uint64_t v88 = ne_log_obj();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v88, OS_LOG_TYPE_ERROR, "Failed to generate local Child crypto values", buf, 2u);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v87 = @"Failed to generate local Child crypto values";
    }
    else
    {
      uint64_t v79 = ne_log_obj();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", buf, 2u);
      }

      [v4 sendCallbackSuccess:0 session:a1];
      uint64_t v87 = @"Failed to generate Child SA SPI";
    }
    uint64_t ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v87, v80, v81, v82, v83, v84, v85, v86, v102);
    -[NEIKEv2ChildSA setState:error:]((uint64_t)v12, 3uLL, ErrorCrypto);

    [(NEIKEv2Session *)a1 reportState];
    -[NEIKEv2Session resetChild:](a1, v12);
LABEL_67:

    goto LABEL_68;
  }
  uint64_t v55 = ne_log_obj();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v121 = "-[NEIKEv2Session(Exchange) initiateRekeyChildSA:]";
    uint64_t v101 = "%s called with null childSA.chosenProposal";
LABEL_70:
    _os_log_fault_impl(&dword_19DDAF000, v55, OS_LOG_TYPE_FAULT, v101, buf, 0xCu);
  }
LABEL_39:

  uint64_t v16 = v4;
  uint64_t v17 = 0;
LABEL_40:
  [v16 sendCallbackSuccess:v17 session:a1];
LABEL_68:
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = -[NEIKEv2CreateChildPacket validateRekeyResponseChildSA:]((uint64_t)v3, *(void **)(a1 + 48));
    unint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    uint64_t v106 = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_445;
    uint64_t v107 = &unk_1E5990878;
    uint32_t v108 = v6;
    id v109 = *(id *)(a1 + 48);
    id v110 = *(id *)(a1 + 32);
    id v111 = *(id *)(a1 + 56);
    id v112 = *(id *)(a1 + 64);
    id v7 = v5;
    id v9 = v105;
    if (v6)
    {
      id v10 = objc_getProperty(v6, v8, 368, 1);
      dispatch_assert_queue_V2(v10);

      if (v7) {
        unint64_t v11 = (const char *)v7[6];
      }
      else {
        unint64_t v11 = 0;
      }
      id v12 = -[NEIKEv2Session copyChildWithID:](v6, v11);
      id v14 = v12;
      if ((v4 & 1) != 0
        || (!v12 ? (id v15 = 0) : (id v15 = objc_getProperty(v12, v13, 96, 1)),
            id v16 = v15,
            v16,
            !v16))
      {
        v106((uint64_t)v9, (const char *)v4);
      }
      else
      {
        if (v14) {
          objc_setProperty_atomic(v14, v17, 0, 112);
        }
        SEL v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          if (v14) {
            id Property = objc_getProperty(v14, v19, 96, 1);
          }
          else {
            id Property = 0;
          }
          id v21 = Property;
          uint64_t v22 = [v21 method];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v22;
          _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "%@ Received KE method preference %tu, retrying rekey Child SA (child rekey retry KE)", buf, 0x16u);
        }
        id v103 = v9;
        id v104 = v7;

        if (v14) {
          id v24 = objc_getProperty(v14, v23, 96, 1);
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;
        uint64_t v27 = [v25 method];
        if (v14) {
          id v28 = objc_getProperty(v14, v26, 176, 1);
        }
        else {
          id v28 = 0;
        }
        id v29 = v28;
        self;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v30 = v29;
        uint64_t v102 = [v30 countByEnumeratingWithState:&v117 objects:buf count:16];
        if (v102)
        {
          uint64_t v31 = *(void *)v118;
          uint64_t v100 = *(void *)v118;
          uint64_t v101 = v25;
          while (2)
          {
            for (uint64_t i = 0; i != v102; ++i)
            {
              if (*(void *)v118 != v31) {
                objc_enumerationMutation(v30);
              }
              id v33 = *(void **)(*((void *)&v117 + 1) + 8 * i);
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              id v34 = [v33 kemProtocols];
              uint64_t v35 = [v34 countByEnumeratingWithState:&v113 objects:v121 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v114;
LABEL_26:
                uint64_t v38 = 0;
                while (1)
                {
                  if (*(void *)v114 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  if ([*(id *)(*((void *)&v113 + 1) + 8 * v38) method] == v27) {
                    break;
                  }
                  if (v36 == ++v38)
                  {
                    uint64_t v36 = [v34 countByEnumeratingWithState:&v113 objects:v121 count:16];
                    if (v36) {
                      goto LABEL_26;
                    }
                    goto LABEL_32;
                  }
                }

                if (-[NEIKEv2ChildSA generateInitialValues]((id *)v14))
                {
                  char v64 = +[NEIKEv2CreateChildPacket createRekeyRequestChildSA:]((uint64_t)NEIKEv2CreateChildPacket, v14);
                  id v9 = v103;
                  id v7 = v104;
                  if (v64)
                  {
                    *(void *)buf = MEMORY[0x1E4F143A8];
                    *(void *)&uint8_t buf[8] = 3221225472;
                    *(void *)&uint8_t buf[16] = __69__NEIKEv2Session_Exchange__retryKEForRekeyChildSA_validated_handler___block_invoke;
                    uint64_t v123 = &unk_1E59907D8;
                    uint64_t v124 = v6;
                    uint64_t v125 = v104;
                    id v126 = v14;
                    uint64_t v127 = v103;
                    if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)v6, v64, buf) == -1)
                    {
                      id v66 = objc_getProperty(v6, v65, 336, 1);
                      ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"child rekey retry KE", v67, v68, v69, v70, v71, v72, v73, v99);
                      -[NEIKEv2IKESA setState:error:]((uint64_t)v66, 3uLL, ErrorFailedToSend);

                      [(NEIKEv2Session *)v6 reportState];
                      [(NEIKEv2Session *)(uint64_t)v6 resetAll];
                    }
                  }
                  else
                  {
                    uint64_t v86 = ne_log_obj();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v6;
                      _os_log_error_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_ERROR, "%@ Failed to create Create Child SA packet (child rekey retry KE)", buf, 0xCu);
                    }

                    [v104 sendCallbackSuccess:0 session:v6];
                    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet (child rekey retry KE)", v87, v88, v89, v90, v91, v92, v93, v99);
                    -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorInternal);

                    [(NEIKEv2Session *)v6 reportState];
                    -[NEIKEv2Session resetChild:]((char *)v6, v14);
                  }

                  goto LABEL_55;
                }
                uint64_t v77 = ne_log_obj();
                id v9 = v103;
                id v7 = v104;
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v6;
                  _os_log_error_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_ERROR, "%@ Failed to generate local Child crypto values (child rekey retry KE)", buf, 0xCu);
                }

                [v104 sendCallbackSuccess:0 session:v6];
                id ErrorCrypto = (id)NEIKEv2CreateErrorCrypto(@"Failed to generate local Child crypto values (child rekey retry KE)", v78, v79, v80, v81, v82, v83, v84, v99);
                -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorCrypto);
                goto LABEL_50;
              }
LABEL_32:

              uint64_t v31 = v100;
            }
            id v25 = v101;
            uint64_t v102 = [v30 countByEnumeratingWithState:&v117 objects:buf count:16];
            if (v102) {
              continue;
            }
            break;
          }
        }

        id v39 = ne_log_obj();
        id v9 = v103;
        id v7 = v104;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          if (v14) {
            id v96 = objc_getProperty(v14, v40, 96, 1);
          }
          else {
            id v96 = 0;
          }
          id v97 = v96;
          uint64_t v98 = [v97 method];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v98;
          _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, "%@ Received KE method preference %tu is not in Child rekey proposal (child rekey retry KE)", buf, 0x16u);
        }
        [v104 sendCallbackSuccess:0 session:v6];
        if (v14) {
          id v42 = objc_getProperty(v14, v41, 96, 1);
        }
        else {
          id v42 = 0;
        }
        id ErrorCrypto = v42;
        uint64_t v44 = [ErrorCrypto method];
        uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received KE method preference %tu is not in Child rekey proposal (child rekey retry KE)", v45, v46, v47, v48, v49, v50, v51, v44);
        -[NEIKEv2ChildSA setState:error:]((uint64_t)v14, 3uLL, ErrorPeerInvalidSyntax);

LABEL_50:
        [(NEIKEv2Session *)v6 reportState];
        -[NEIKEv2Session resetChild:]((char *)v6, v14);
      }
LABEL_55:
    }
  }
  else
  {
    uint64_t v53 = ne_log_obj();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "Failed to receive Create Child SA packet", buf, 2u);
    }

    [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
    uint64_t v54 = *(void *)(a1 + 48);
    char v62 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive Create Child SA packet", v55, v56, v57, v58, v59, v60, v61, v99);
    -[NEIKEv2ChildSA setState:error:](v54, 3uLL, v62);

    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 40), *(void **)(a1 + 48));
  }
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_445(uint64_t a1, const char *a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA packet", buf, 2u);
    }

    uint64_t v20 = *(void **)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    if (v19)
    {
      id Property = objc_getProperty(v19, v18, 56, 1);
      id v16 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v22, 80, 1);
      }
    }
    else
    {
      id v16 = 0;
      id Property = 0;
    }
    id v24 = Property;
    id v25 = *(void **)(a1 + 40);
    if (v25)
    {
      id v26 = objc_getProperty(v25, v23, 56, 1);
      id v28 = v26;
      if (v26) {
        id v26 = objc_getProperty(v26, v27, 88, 1);
      }
    }
    else
    {
      id v28 = 0;
      id v26 = 0;
    }
    id v29 = v26;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_446;
    v54[3] = &unk_1E5990788;
    unint64_t v11 = (id *)v55;
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 32);
    id v32 = *(void **)(a1 + 40);
    v55[0] = v30;
    v55[1] = v31;
    id v15 = &v56;
    id v56 = v32;
    id v33 = v54;
    goto LABEL_17;
  }
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 56, 1);
    uint64_t v6 = v4;
    if (v4) {
      id v4 = objc_getProperty(v4, v5, 112, 1);
    }
  }
  else
  {
    uint64_t v6 = 0;
    id v4 = 0;
  }
  id v7 = v4;
  uint64_t v8 = [v7 method];

  if (v8 && ([(NEIKEv2ChildSA *)*(void *)(a1 + 40) processPrimaryKeyExchange] & 1) == 0)
  {
    id v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "Failed to process KE data", buf, 2u);
    }

    uint64_t v20 = *(void **)(a1 + 32);
    uint64_t v36 = *(void **)(a1 + 40);
    if (v36)
    {
      id v37 = objc_getProperty(v36, v35, 56, 1);
      id v16 = v37;
      if (v37) {
        id v37 = objc_getProperty(v37, v38, 80, 1);
      }
    }
    else
    {
      id v16 = 0;
      id v37 = 0;
    }
    id v24 = v37;
    id v40 = *(void **)(a1 + 40);
    if (v40)
    {
      id v41 = objc_getProperty(v40, v39, 56, 1);
      id v28 = v41;
      if (v41) {
        id v41 = objc_getProperty(v41, v42, 88, 1);
      }
    }
    else
    {
      id v28 = 0;
      id v41 = 0;
    }
    id v29 = v41;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_447;
    v51[3] = &unk_1E5990788;
    unint64_t v11 = (id *)v52;
    id v43 = *(id *)(a1 + 48);
    uint64_t v44 = *(void *)(a1 + 32);
    uint64_t v45 = *(void **)(a1 + 40);
    v52[0] = v43;
    v52[1] = v44;
    id v15 = &v53;
    id v53 = v45;
    id v33 = v51;
LABEL_17:
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v20, v24, v29, v33);

    goto LABEL_18;
  }
  id v10 = *(void **)(a1 + 48);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2;
  v46[3] = &unk_1E5990850;
  unint64_t v11 = (id *)v47;
  id v12 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  v47[0] = v13;
  v47[1] = v14;
  id v15 = &v48;
  id v48 = *(id *)(a1 + 48);
  id v49 = *(id *)(a1 + 56);
  id v50 = *(id *)(a1 + 64);
  -[NEIKEv2Session handleFollowupKEForRekeyChildSAInitiator:iteration:handler:](v12, v10, 0, v46);

  id v16 = v49;
LABEL_18:
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_446(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Create Child SA packet", v3, v4, v5, v6, v7, v8, v9, v14);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v12 = *(char **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_447(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data", v3, v4, v5, v6, v7, v8, v9, v14);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v12 = *(char **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2(void **a1)
{
  if (-[NEIKEv2ChildSA generateAllValues]((uint64_t)a1[4]))
  {
    id v2 = -[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:](a1[5], a1[4]);
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = a1[4];
      if (v5)
      {
        objc_setProperty_atomic(v5, v3, a1[7], 192);
        uint64_t v7 = a1[4];
        if (v7) {
          objc_setProperty_atomic(v7, v6, a1[8], 200);
        }
      }
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[7];
      id v10 = a1[8];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2_450;
      v44[3] = &unk_1E5990828;
      v44[4] = v8;
      id v11 = v4;
      id v45 = v11;
      id v46 = a1[4];
      id v47 = a1[6];
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v8, v9, v10, v44);
    }
    else
    {
      uint64_t v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "Failed to install Child SA", buf, 2u);
      }

      id v29 = a1[4];
      id v30 = a1[5];
      if (v29)
      {
        id Property = objc_getProperty(v29, v28, 56, 1);
        id v33 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v32, 80, 1);
        }
      }
      else
      {
        id v33 = 0;
        id Property = 0;
      }
      id v35 = Property;
      uint64_t v36 = a1[4];
      if (v36)
      {
        id v37 = objc_getProperty(v36, v34, 56, 1);
        id v39 = v37;
        if (v37) {
          id v37 = objc_getProperty(v37, v38, 88, 1);
        }
      }
      else
      {
        id v39 = 0;
        id v37 = 0;
      }
      id v40 = v37;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_449;
      v48[3] = &unk_1E5990788;
      id v49 = a1[6];
      int8x16_t v43 = *((int8x16_t *)a1 + 2);
      id v41 = (id)v43.i64[0];
      int8x16_t v50 = vextq_s8(v43, v43, 8uLL);
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v30, v35, v40, v48);

      id v11 = 0;
    }
  }
  else
  {
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", buf, 2u);
    }

    uint64_t v14 = a1[4];
    id v15 = a1[5];
    if (v14)
    {
      id v16 = objc_getProperty(v14, v13, 56, 1);
      SEL v18 = v16;
      if (v16) {
        id v16 = objc_getProperty(v16, v17, 80, 1);
      }
    }
    else
    {
      SEL v18 = 0;
      id v16 = 0;
    }
    id v20 = v16;
    id v21 = a1[4];
    if (v21)
    {
      id v22 = objc_getProperty(v21, v19, 56, 1);
      id v24 = v22;
      if (v22) {
        id v22 = objc_getProperty(v22, v23, 88, 1);
      }
    }
    else
    {
      id v24 = 0;
      id v22 = 0;
    }
    id v25 = v22;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_448;
    v51[3] = &unk_1E5990788;
    id v52 = a1[6];
    int8x16_t v42 = *((int8x16_t *)a1 + 2);
    id v26 = (id)v42.i64[0];
    int8x16_t v53 = vextq_s8(v42, v42, 8uLL);
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v15, v20, v25, v51);

    id v11 = v52;
  }
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_448(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA crypto values", v3, v4, v5, v6, v7, v8, v9, v14);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v12 = *(char **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_449(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA", v3, v4, v5, v6, v7, v8, v9, v14);
  -[NEIKEv2ChildSA setState:error:](v2, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  id v12 = *(char **)(a1 + 40);
  id v13 = *(void **)(a1 + 48);

  -[NEIKEv2Session resetChild:](v12, v13);
}

void __49__NEIKEv2Session_Exchange__initiateRekeyChildSA___block_invoke_2_450(uint64_t a1, int a2)
{
  if (a2)
  {
    -[NEIKEv2Session uninstallOldRekeyedChildSAs:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4)
    {
      objc_setProperty_atomic(v4, v3, 0, 192);
      uint64_t v6 = *(void **)(a1 + 48);
      if (v6) {
        objc_setProperty_atomic(v6, v5, 0, 200);
      }
    }
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "Rekeyed Child SA", (uint8_t *)&v21, 2u);
    }

    -[NEIKEv2ChildSA setState:error:](*(void *)(a1 + 48), 2uLL, 0);
    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    [*(id *)(a1 + 56) sendCallbackSuccess:1 session:*(void *)(a1 + 32)];
  }
  else
  {
    [*(id *)(a1 + 56) sendCallbackSuccess:0 session:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to delete old Child SA", v10, v11, v12, v13, v14, v15, v16, v21);
    -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

    [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
    id v19 = *(char **)(a1 + 32);
    id v20 = *(void **)(a1 + 48);
    -[NEIKEv2Session resetChild:](v19, v20);
  }
}

- (void)receiveRekeyChildSA:(void *)a3 packet:
{
  uint64_t v372 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = objc_getProperty(a1, v6, 368, 1);
    dispatch_assert_queue_V2(v8);

    id v11 = objc_getProperty(a1, v9, 336, 1);
    if (v11)
    {
      if (v5)
      {
        if ([(NEIKEv2ChildSA *)v5 isRekeying])
        {
          uint64_t v13 = ne_log_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "Child SA already rekeying, skipping", buf, 2u);
          }
          goto LABEL_68;
        }
        id v14 = objc_getProperty(v5, v12, 56, 1);

        if (v14)
        {
          id Property = objc_getProperty(v5, v15, 56, 1);
          SEL v18 = Property;
          if (Property) {
            id Property = objc_getProperty(Property, v17, 80, 1);
          }
          uint64_t v13 = Property;

          id v20 = objc_getProperty(v5, v19, 56, 1);
          id v22 = v20;
          if (v20) {
            id v20 = objc_getProperty(v20, v21, 88, 1);
          }
          id v353 = v20;

          objc_setProperty_atomic(v5, v23, 0, 184);
          id v24 = (id *)v5;
          if (-[NEIKEv2Packet hasNotification:](v7, (const char *)0x4007)) {
            uint64_t v26 = 1;
          }
          else {
            uint64_t v26 = 2;
          }
          id v27 = objc_getProperty(v24, v25, 48, 1);
          uint64_t v28 = [v27 mode];

          if (v26 != v28)
          {
            uint64_t v80 = ne_log_obj();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              uint64_t v107 = (void *)[v7 copyShortDescription];
              *(_DWORD *)id v361 = 138412290;
              uint64_t v362 = v107;
              _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA did not match", v361, 0xCu);
            }
            unint64_t v81 = 7;
            goto LABEL_51;
          }
          id v30 = objc_getProperty(v7, v29, 96, 1);
          id v32 = v30;
          self = v7;
          if (v30) {
            id v30 = objc_getProperty(v30, v31, 24, 1);
          }
          id v33 = v30;

          id v35 = objc_getProperty(v24, v34, 48, 1);
          id v36 = [v35 proposals];

          if ([v33 count])
          {
            id v38 = objc_getProperty(v24, v37, 48, 1);
            int v39 = [v38 opportunisticPFS];

            id v351 = v33;
            if (v39)
            {
              SEL v349 = v13;
              id v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v36];
              *(_OWORD *)SEL v368 = 0u;
              long long v369 = 0u;
              long long v370 = 0u;
              long long v371 = 0u;
              id v36 = v36;
              uint64_t v42 = [v36 countByEnumeratingWithState:v368 objects:buf count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v369;
                do
                {
                  for (uint64_t i = 0; i != v43; ++i)
                  {
                    if (*(void *)v369 != v44) {
                      objc_enumerationMutation(v36);
                    }
                    id v46 = -[NEIKEv2ChildSAProposal copyWithoutKEM](*(void **)(*(void *)&v368[8] + 8 * i));
                    char v47 = [v41 count];
                    if (v46) {
                      v46[8] = v47 + 1;
                    }
                    [v41 addObject:v46];
                  }
                  uint64_t v43 = [v36 countByEnumeratingWithState:v368 objects:buf count:16];
                }
                while (v43);
              }

              uint64_t v48 = [v36 count];
              if (v48 != [v41 count])
              {
                uint64_t v49 = [v41 array];

                id v36 = (id)v49;
              }
              id v33 = v351;

              uint64_t v13 = v349;
            }
            id v50 = objc_getProperty(v24, v40, 48, 1);
            uint64_t v51 = +[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]((uint64_t)NEIKEv2ChildSAProposal, v36, v33, [v50 preferInitiatorProposalOrder], 1);
            objc_setProperty_atomic(v24, v52, v51, 184);

            id v54 = objc_getProperty(v24, v53, 184, 1);
            if (v54)
            {
              id v56 = &OBJC_IVAR___NEIKEv2IKESA__error;
              uint64_t v57 = objc_getProperty(self, v55, 112, 1);

              if (v57)
              {
                uint64_t v59 = objc_getProperty(self, v58, 112, 1);
                uint64_t v61 = v59;
                if (v59) {
                  uint64_t v59 = objc_getProperty(v59, v60, 24, 1);
                }
                id v33 = v351;
                id v62 = v59;

                if (v62)
                {
                  id WeakRetained = objc_loadWeakRetained(v24 + 3);
                  id v350 = WeakRetained;
                  if (WeakRetained) {
                    id WeakRetained = objc_getProperty(WeakRetained, v64, 80, 1);
                  }
                  id v65 = WeakRetained;
                  int v66 = [v65 strictNonceSizeChecks];

                  if (v66)
                  {
                    uint64_t v68 = objc_getProperty(self, v67, 112, 1);
                    uint64_t v70 = v68;
                    if (v68) {
                      uint64_t v68 = objc_getProperty(v68, v69, 24, 1);
                    }
                    id v71 = v68;
                    uint64_t v72 = [v71 length];

                    unint64_t v346 = v72;
                    if ((unint64_t)(v72 - 257) <= 0xFFFFFFFFFFFFFF0ELL)
                    {
                      uint64_t v74 = ne_log_obj();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        id v75 = (void *)[self copyShortDescription];
                        *(_DWORD *)id v361 = 138412546;
                        uint64_t v362 = v75;
                        __int16 v363 = 2048;
                        unint64_t v364 = v72;
                        id v76 = "%@ NONCE data length %zu is out of bounds";
                        uint64_t v77 = v74;
                        uint32_t v78 = 22;
LABEL_113:
                        _os_log_error_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_ERROR, v76, v361, v78);
LABEL_114:
                      }
LABEL_115:

                      char v359 = 0;
                      unint64_t v81 = 7;
                      goto LABEL_122;
                    }
                    id v108 = v350;
                    if (v350) {
                      id v108 = objc_getProperty(v350, v73, 96, 1);
                    }
                    id v56 = &OBJC_IVAR___NEIKEv2IKESA__error;
                    id v109 = v108;
                    id v111 = [(NEIKEv2IKESAProposal *)v109 prfProtocol];
                    unsigned int v343 = [v111 nonceSize];

                    if (v346 < v343)
                    {
                      uint64_t v74 = ne_log_obj();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        id v75 = (void *)[self copyShortDescription];
                        id v113 = v350;
                        if (v350) {
                          id v113 = objc_getProperty(v350, v112, 96, 1);
                        }
                        id v340 = v113;
                        long long v115 = [(NEIKEv2IKESAProposal *)v340 prfProtocol];
                        *(_DWORD *)id v361 = 138412802;
                        uint64_t v362 = v75;
                        __int16 v363 = 2048;
                        unint64_t v364 = v346;
                        __int16 v365 = 2112;
                        uint64_t v366 = (uint64_t)v115;
                        _os_log_error_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", v361, 0x20u);

                        goto LABEL_114;
                      }
                      goto LABEL_115;
                    }
                  }
                  long long v116 = objc_getProperty(self, v67, v56[147], 1);
                  long long v118 = v116;
                  if (v116) {
                    long long v116 = objc_getProperty(v116, v117, 24, 1);
                  }
                  id v119 = v116;
                  objc_setProperty_atomic(v24, v120, v119, 88);

                  id v122 = objc_getProperty(v24, v121, 184, 1);
                  uint64_t v124 = v122;
                  if (v122) {
                    id v122 = objc_getProperty(v122, v123, 112, 1);
                  }
                  id v125 = v122;
                  uint64_t v126 = [v125 method];

                  if (!v126)
                  {
LABEL_102:
                    char v359 = 1;
                    unint64_t v81 = 7;
                    id v33 = v351;
LABEL_122:

                    goto LABEL_123;
                  }
                  uint64_t v128 = objc_getProperty(self, v127, 104, 1);

                  if (v128)
                  {
                    uint64_t v130 = objc_getProperty(self, v129, 104, 1);
                    uint64_t v132 = v130;
                    if (v130) {
                      uint64_t v130 = objc_getProperty(v130, v131, 24, 1);
                    }
                    id v33 = v351;
                    id v133 = v130;

                    if (v133)
                    {
                      id v135 = objc_getProperty(self, v134, 104, 1);
                      uint64_t v137 = v135;
                      if (v135) {
                        id v135 = objc_getProperty(v135, v136, 32, 1);
                      }
                      id v138 = v135;

                      if (v138)
                      {
                        uint64_t v140 = objc_getProperty(self, v139, 104, 1);
                        id v347 = v140;
                        if (v140) {
                          uint64_t v140 = objc_getProperty(v140, v141, 24, 1);
                        }
                        id v142 = v140;
                        uint64_t v143 = [v142 method];
                        id v145 = objc_getProperty(v24, v144, 184, 1);
                        id v147 = v145;
                        id v341 = v142;
                        uint64_t v344 = v143;
                        if (v145) {
                          id v145 = objc_getProperty(v145, v146, 112, 1);
                        }
                        id v148 = v145;
                        uint64_t v149 = [v148 method];

                        if (v344 == v149)
                        {
                          char v151 = objc_getProperty(self, v150, 104, 1);
                          uint64_t v153 = v151;
                          if (v151) {
                            char v151 = objc_getProperty(v151, v152, 32, 1);
                          }
                          id v154 = v151;
                          objc_setProperty_atomic(v24, v155, v154, 104);

                          goto LABEL_102;
                        }
                        uint64_t v159 = ne_log_obj();
                        if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v160 = [self copyShortDescription];
                          uint64_t v162 = objc_getProperty(self, v161, 104, 1);
                          SEL v348 = v162;
                          SEL v164 = (void *)v160;
                          if (v162) {
                            uint64_t v162 = objc_getProperty(v162, v163, 24, 1);
                          }
                          id v345 = v162;
                          uint64_t v342 = [v345 method];
                          id v166 = objc_getProperty(v24, v165, 184, 1);
                          uint64_t v168 = [(NEIKEv2IKESAProposal *)v166 kemProtocol];
                          *(_DWORD *)id v361 = 138412802;
                          uint64_t v362 = v164;
                          __int16 v363 = 2048;
                          unint64_t v364 = v342;
                          __int16 v365 = 2048;
                          uint64_t v366 = [v168 method];
                          _os_log_impl(&dword_19DDAF000, v159, OS_LOG_TYPE_INFO, "%@ Received KE method %zu does not match KE method %zu in CHILD SA rekey proposal", v361, 0x20u);

                          id v33 = v351;
                        }

LABEL_121:
                        char v359 = 0;
                        unint64_t v81 = 17;
                        goto LABEL_122;
                      }
                      uint64_t v74 = ne_log_obj();
                      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_115;
                      }
                      id v75 = (void *)[self copyShortDescription];
                      *(_DWORD *)id v361 = 138412290;
                      uint64_t v362 = v75;
                      id v76 = "%@ Did not receive data in KE payload";
                    }
                    else
                    {
                      uint64_t v74 = ne_log_obj();
                      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_115;
                      }
                      id v75 = (void *)[self copyShortDescription];
                      *(_DWORD *)id v361 = 138412290;
                      uint64_t v362 = v75;
                      id v76 = "%@ Did not receive method in KE payload";
                    }
                    uint64_t v77 = v74;
                    uint32_t v78 = 12;
                    goto LABEL_113;
                  }
                  uint64_t v156 = ne_log_obj();
                  id v33 = v351;
                  if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                  {
                    SEL v337 = (void *)[self copyShortDescription];
                    *(_DWORD *)id v361 = 138412290;
                    uint64_t v362 = v337;
                    _os_log_error_impl(&dword_19DDAF000, v156, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", v361, 0xCu);
                  }
                  goto LABEL_121;
                }
                uint64_t v100 = ne_log_obj();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                {
                  id v105 = (void *)[self copyShortDescription];
                  *(_DWORD *)id v361 = 138412290;
                  uint64_t v362 = v105;
                  uint64_t v106 = "%@ Did not receive NONCE data";
LABEL_107:
                  _os_log_error_impl(&dword_19DDAF000, v100, OS_LOG_TYPE_ERROR, v106, v361, 0xCu);

                  goto LABEL_60;
                }
                goto LABEL_60;
              }
              id v104 = ne_log_obj();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                uint64_t v158 = (void *)[self copyShortDescription];
                *(_DWORD *)id v361 = 138412290;
                uint64_t v362 = v158;
                _os_log_error_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", v361, 0xCu);
              }
              char v359 = 0;
              unint64_t v81 = 7;
              id v33 = v351;
            }
            else
            {
              uint64_t v101 = ne_log_obj();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              {
                uint64_t v157 = (void *)[self copyShortDescription];
                *(_DWORD *)id v361 = 138412290;
                uint64_t v362 = v157;
                _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ No matching rekey proposal found", v361, 0xCu);
              }
              char v359 = 0;
              unint64_t v81 = 14;
            }
LABEL_123:

            if (v359)
            {
              id v7 = self;
              if ((-[NEIKEv2ChildSA generateInitialValues](v24) & 1) == 0)
              {
                uint64_t v284 = ne_log_obj();
                if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v284, OS_LOG_TYPE_ERROR, "Failed to generate local Child crypto values", buf, 2u);
                }

                id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate local Child crypto values", v285, v286, v287, v288, v289, v290, v291, v339);
                -[NEIKEv2ChildSA setState:error:]((uint64_t)v24, 3uLL, ErrorCrypto);

                [(NEIKEv2Session *)a1 reportState];
                -[NEIKEv2Session resetChild:]((char *)a1, v24);
                goto LABEL_67;
              }
              id v171 = objc_getProperty(v24, v170, 184, 1);
              unint64_t v173 = v171;
              if (v171) {
                id v171 = objc_getProperty(v171, v172, 112, 1);
              }
              id v174 = v171;
              uint64_t v175 = [v174 method];

              if (v175 && ([(NEIKEv2ChildSA *)v24 processCurrentKeyExchange] & 1) == 0)
              {
                id v338 = ne_log_obj();
                if (os_log_type_enabled(v338, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v338, OS_LOG_TYPE_ERROR, "Failed to process KE data", buf, 2u);
                }

                uint64_t v302 = @"ailed to process KE data";
              }
              else
              {
                id v177 = objc_getProperty(v24, v176, 184, 1);
                id v360 = v177;
                id v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v360 count:1];
                char v179 = -[NEIKEv2Session generateSPIForChild:proposals:](a1, v24, v178);

                if (v179)
                {
                  id v180 = self;
                  uint64_t v181 = v24;
                  self;
                  uint64_t v182 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2CreateChildPacket alloc], v180);
                  if (!v182)
                  {
                    id v314 = ne_log_obj();
                    if (os_log_type_enabled(v314, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, v314, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed", buf, 2u);
                    }

                    id v184 = 0;
                    uint64_t v270 = 0;
                    goto LABEL_186;
                  }
                  id v184 = (id)v182;
                  id v185 = objc_getProperty(v181, v183, 48, 1);
                  uint64_t v186 = [v185 mode];

                  if (v186 == 1 && !-[NEIKEv2Packet addNotification:data:](v184, 0x4007uLL, 0))
                  {
                    uint64_t v315 = ne_log_obj();
                    if (os_log_type_enabled(v315, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      id v316 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
                      id v317 = v315;
                      uint32_t v318 = 2;
LABEL_206:
                      _os_log_fault_impl(&dword_19DDAF000, v317, OS_LOG_TYPE_FAULT, v316, buf, v318);
                      goto LABEL_185;
                    }
                    goto LABEL_185;
                  }
                  id v187 = objc_alloc_init(NEIKEv2ChildSAPayload);
                  objc_setProperty_atomic(v184, v188, v187, 96);

                  id v190 = objc_getProperty(v181, v189, 184, 1);
                  *(void *)SEL v368 = v190;
                  id v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:v368 count:1];
                  id v193 = objc_getProperty(v184, v192, 96, 1);
                  id v195 = v193;
                  if (v193) {
                    objc_setProperty_atomic(v193, v194, v191, 24);
                  }

                  id v197 = objc_getProperty(v181, v196, 184, 1);
                  id v199 = [(NEIKEv2IKESAProposal *)v197 kemProtocol];
                  uint64_t v200 = [v199 method];

                  if (v200)
                  {
                    id v202 = objc_alloc_init(NEIKEv2KeyExchangePayload);
                    objc_setProperty_atomic(v184, v203, v202, 104);

                    id v205 = objc_getProperty(v181, v204, 184, 1);
                    id v207 = [(NEIKEv2IKESAProposal *)v205 kemProtocol];
                    uint64_t v209 = objc_getProperty(v184, v208, 104, 1);
                    SEL v211 = v209;
                    if (v209) {
                      objc_setProperty_atomic(v209, v210, v207, 24);
                    }

                    id v213 = objc_getProperty(v181, v212, 112, 1);
                    char v214 = v213;
                    if (v213) {
                      __int16 v215 = (void *)*((void *)v213 + 2);
                    }
                    else {
                      __int16 v215 = 0;
                    }
                    id v216 = v215;
                    id v218 = objc_getProperty(v184, v217, 104, 1);
                    id v220 = v218;
                    if (v218) {
                      objc_setProperty_atomic(v218, v219, v216, 32);
                    }

                    SEL v222 = objc_getProperty(v184, v221, 104, 1);
                    char v223 = -[NEIKEv2Payload isValid]((uint64_t)v222);

                    if ((v223 & 1) == 0)
                    {
                      uint64_t v315 = ne_log_obj();
                      if (os_log_type_enabled(v315, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:childSA:]";
                        id v316 = "%s called with null packet.ke.isValid";
                        goto LABEL_205;
                      }
                      goto LABEL_185;
                    }
                  }
                  uint64_t v224 = objc_getProperty(v184, v201, 96, 1);
                  char v225 = -[NEIKEv2Payload isValid]((uint64_t)v224);

                  if (v225)
                  {
                    uint64_t v226 = objc_alloc_init(NEIKEv2NoncePayload);
                    objc_setProperty_atomic(v184, v227, v226, 112);

                    id v229 = objc_getProperty(v181, v228, 80, 1);
                    uint64_t v231 = objc_getProperty(v184, v230, 112, 1);
                    uint64_t v233 = v231;
                    if (v231) {
                      objc_setProperty_atomic(v231, v232, v229, 24);
                    }

                    uint64_t v235 = objc_getProperty(v184, v234, 112, 1);
                    char v236 = -[NEIKEv2Payload isValid]((uint64_t)v235);

                    if (v236)
                    {
                      uint64_t v237 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
                      objc_setProperty_atomic(v184, v238, v237, 128);

                      id v240 = objc_getProperty(v181, v239, 72, 1);
                      SEL v242 = objc_getProperty(v184, v241, 128, 1);
                      id v244 = v242;
                      if (v242) {
                        objc_setProperty_atomic(v242, v243, v240, 24);
                      }

                      id v246 = objc_getProperty(v184, v245, 128, 1);
                      char v247 = -[NEIKEv2Payload isValid]((uint64_t)v246);

                      if (v247)
                      {
                        char v248 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
                        objc_setProperty_atomic(v184, v249, v248, 136);

                        id v251 = objc_getProperty(v181, v250, 64, 1);
                        uint64_t v253 = objc_getProperty(v184, v252, 136, 1);
                        uint64_t v255 = v253;
                        if (v253) {
                          objc_setProperty_atomic(v253, v254, v251, 24);
                        }

                        uint64_t v257 = objc_getProperty(v184, v256, 136, 1);
                        char v258 = -[NEIKEv2Payload isValid]((uint64_t)v257);

                        if (v258)
                        {
                          id v260 = objc_getProperty(v181, v259, 184, 1);
                          uint64_t v262 = v260;
                          if (v260) {
                            id v260 = objc_getProperty(v260, v261, 120, 1);
                          }
                          id v263 = v260;

                          if (v263)
                          {
                            id v264 = [MEMORY[0x1E4F29128] UUID];
                            *(_OWORD *)buf = 0uLL;
                            [v264 getUUIDBytes:buf];
                            uint64_t v265 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:16];
                            id v266 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4039uLL, v265);
                            objc_setProperty_atomic(v181, v267, v266, 128);

                            id v269 = objc_getProperty(v181, v268, 128, 1);
                            -[NEIKEv2Packet addNotifyPayload:](v184, v269);
                          }
                          id v184 = v184;
                          uint64_t v270 = v184;
                          goto LABEL_186;
                        }
                        uint64_t v315 = ne_log_obj();
                        if (os_log_type_enabled(v315, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 136315138;
                          *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:childSA:]";
                          id v316 = "%s called with null packet.tsr.isValid";
                          goto LABEL_205;
                        }
                        goto LABEL_185;
                      }
                      uint64_t v315 = ne_log_obj();
                      if (!os_log_type_enabled(v315, OS_LOG_TYPE_FAULT)) {
                        goto LABEL_185;
                      }
                      *(_DWORD *)buf = 136315138;
                      *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:childSA:]";
                      int v336 = "%s called with null packet.tsi.isValid";
                    }
                    else
                    {
                      uint64_t v315 = ne_log_obj();
                      if (!os_log_type_enabled(v315, OS_LOG_TYPE_FAULT)) {
                        goto LABEL_185;
                      }
                      *(_DWORD *)buf = 136315138;
                      *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:childSA:]";
                      int v336 = "%s called with null packet.nonce.isValid";
                    }
                    _os_log_fault_impl(&dword_19DDAF000, v315, OS_LOG_TYPE_FAULT, v336, buf, 0xCu);
                    goto LABEL_185;
                  }
                  uint64_t v315 = ne_log_obj();
                  if (os_log_type_enabled(v315, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:childSA:]";
                    id v316 = "%s called with null packet.childSA.isValid";
LABEL_205:
                    id v317 = v315;
                    uint32_t v318 = 12;
                    goto LABEL_206;
                  }
LABEL_185:

                  uint64_t v270 = 0;
LABEL_186:

                  if (v270)
                  {
                    id v320 = objc_getProperty(v181, v319, 112, 1);
                    id v321 = v320;
                    id v7 = self;
                    if (v320) {
                      uint64_t v322 = (void *)*((void *)v320 + 3);
                    }
                    else {
                      uint64_t v322 = 0;
                    }
                    id v323 = v322;
                    objc_setProperty_atomic(v181, v324, v323, 120);

                    objc_setProperty_atomic(v181, v325, 0, 112);
                    v354[0] = MEMORY[0x1E4F143A8];
                    v354[1] = 3221225472;
                    v354[2] = __55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke;
                    v354[3] = &unk_1E59908C8;
                    id v355 = v353;
                    id v356 = v181;
                    id v357 = a1;
                    id v358 = v13;
                    -[NEIKEv2Session handleFollowupKEForRekeyChildSAResponder:iteration:replyPacket:replyPacketDescription:handler:](a1, v356, 0, v270, @"responder rekey child SA reply", v354);
                  }
                  else
                  {
                    id v326 = ne_log_obj();
                    id v7 = self;
                    if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_19DDAF000, v326, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", buf, 2u);
                    }

                    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v327, v328, v329, v330, v331, v332, v333, v339);
                    -[NEIKEv2ChildSA setState:error:]((uint64_t)v181, 3uLL, ErrorInternal);

                    [(NEIKEv2Session *)a1 reportState];
                    -[NEIKEv2Session resetChild:]((char *)a1, v181);
                  }

                  goto LABEL_67;
                }
                id v294 = ne_log_obj();
                if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v294, OS_LOG_TYPE_ERROR, "Failed to generate Child SA SPI", buf, 2u);
                }

                uint64_t v302 = @"Failed to generate Child SA SPI";
              }
              uint64_t v303 = (void *)NEIKEv2CreateErrorCrypto(v302, v295, v296, v297, v298, v299, v300, v301, v339);
              -[NEIKEv2ChildSA setState:error:]((uint64_t)v24, 3uLL, v303);

              [(NEIKEv2Session *)a1 reportState];
              -[NEIKEv2Session resetChild:]((char *)a1, v24);
              id v7 = self;
LABEL_67:

              goto LABEL_68;
            }
            id v7 = self;
            if (v81 == 17)
            {
              id v271 = objc_getProperty(v24, v169, 184, 1);
              uint64_t v273 = v271;
              if (v271) {
                id v271 = objc_getProperty(v271, v272, 112, 1);
              }
              id v274 = v271;
              unsigned int v275 = bswap32([v274 method]) >> 16;

              *(_WORD *)buf = v275;
              unint64_t v276 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:2];
              uint64_t v82 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, self, 0x11uLL, v276);

              if (v82)
              {
                if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v82, 0))
                {

                  id v7 = self;
                  goto LABEL_164;
                }
                uint64_t ErrorFailedToSend = NEIKEv2CreateErrorFailedToSend(@"rekey child SA refusal", v277, v278, v279, v280, v281, v282, v283, v339);
              }
              else
              {
                uint64_t v305 = ne_log_obj();
                if (os_log_type_enabled(v305, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)SEL v368 = 0;
                  _os_log_error_impl(&dword_19DDAF000, v305, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", v368, 2u);
                }

                uint64_t ErrorFailedToSend = NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v306, v307, v308, v309, v310, v311, v312, v339);
              }
              uint64_t v102 = (void *)ErrorFailedToSend;
              id v7 = self;
              goto LABEL_66;
            }
LABEL_51:
            uint64_t v82 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, v7, v81, 0);
            if (v82)
            {
              if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v82, 0))
              {
                if (v81 == 14)
                {

LABEL_164:
                  objc_setProperty_atomic(v24, v90, 0, 184);
                  goto LABEL_67;
                }
                uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Create Child SA packet", v83, v84, v85, v86, v87, v88, v89, v339);
              }
              else
              {
                uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorFailedToSend(@"rekey child SA refusal", v83, v84, v85, v86, v87, v88, v89, v339);
              }
            }
            else
            {
              uint64_t v91 = ne_log_obj();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_19DDAF000, v91, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet", buf, 2u);
              }

              uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet", v92, v93, v94, v95, v96, v97, v98, v339);
            }
            uint64_t v102 = (void *)ErrorPeerInvalidSyntax;
LABEL_66:
            -[NEIKEv2ChildSA setState:error:]((uint64_t)v24, 3uLL, v102);

            [(NEIKEv2Session *)a1 reportState];
            -[NEIKEv2Session resetChild:]((char *)a1, v24);

            goto LABEL_67;
          }
          uint64_t v100 = ne_log_obj();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            id v105 = (void *)[self copyShortDescription];
            *(_DWORD *)id v361 = 138412290;
            uint64_t v362 = v105;
            uint64_t v106 = "%@ Received no SA proposals";
            goto LABEL_107;
          }
LABEL_60:

          char v359 = 0;
          unint64_t v81 = 7;
          goto LABEL_123;
        }
        uint64_t v13 = ne_log_obj();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_68:

          goto LABEL_69;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) receiveRekeyChildSA:packet:]";
        uint64_t v79 = "%s called with null childSA.chosenProposal";
      }
      else
      {
        uint64_t v13 = ne_log_obj();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) receiveRekeyChildSA:packet:]";
        uint64_t v79 = "%s called with null childSA";
      }
    }
    else
    {
      uint64_t v13 = ne_log_obj();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) receiveRekeyChildSA:packet:]";
      uint64_t v79 = "%s called with null ikeSA";
    }
    _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, v79, buf, 0xCu);
    goto LABEL_68;
  }
LABEL_69:
}

void __55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((-[NEIKEv2InformationalPacket validateDeleteChild:]((uint64_t)v3, *(void **)(a1 + 32)) & 1) == 0)
  {
    id v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Failed to process Rekey Child SA Delete packet", buf, 2u);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Rekey Child SA Delete packet", v27, v28, v29, v30, v31, v32, v33, v72[0]);
    goto LABEL_20;
  }
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 184, 1);
  }
  id v7 = Property;
  uint64_t v8 = *(void **)(a1 + 40);
  if (v8) {
    objc_setProperty_atomic(v8, v6, v7, 56);
  }

  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_setProperty_atomic(v10, v9, 0, 184);
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      *(unsigned char *)(v11 + 9) = 0;
      uint64_t v10 = *(void **)(a1 + 40);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  if ((-[NEIKEv2ChildSA generateAllValues]((uint64_t)v10) & 1) == 0)
  {
    id v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "Failed to generate Child SA crypto values", buf, 2u);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA crypto values", v36, v37, v38, v39, v40, v41, v42, v72[0]);
LABEL_20:
    uint64_t v43 = ErrorPeerInvalidSyntax;
    -[NEIKEv2ChildSA setState:error:](v26, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 48) reportState];
    -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
    goto LABEL_34;
  }
  id v12 = -[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:](*(id *)(a1 + 48), *(void **)(a1 + 40));
  if (v12)
  {
    -[NEIKEv2Session uninstallOldRekeyedChildSAs:](*(void **)(a1 + 48), v12);
    uint64_t v13 = +[NEIKEv2InformationalPacket createDeleteResponse:child:]((uint64_t)NEIKEv2InformationalPacket, v3, *(void **)(a1 + 56));
    if (v13)
    {
      id v14 = v13;
      if ((-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 48), v13, 0) & 1) == 0)
      {
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete child SA for rekey", v15, v16, v17, v18, v19, v20, v21, v72[0]);
        -[NEIKEv2ChildSA setState:error:](v22, 3uLL, ErrorFailedToSend);

        [(NEIKEv2Session *)*(void **)(a1 + 48) reportState];
        -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
      }
    }
    else
    {
      uint64_t v61 = ne_log_obj();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v61, OS_LOG_TYPE_ERROR, "Failed to create Child SA Delete packet", buf, 2u);
      }

      uint64_t v62 = *(void *)(a1 + 40);
      uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Child SA Delete packet", v63, v64, v65, v66, v67, v68, v69, v72[0]);
      -[NEIKEv2ChildSA setState:error:](v62, 3uLL, ErrorInternal);

      [(NEIKEv2Session *)*(void **)(a1 + 48) reportState];
      -[NEIKEv2Session resetChild:](*(char **)(a1 + 48), *(void **)(a1 + 40));
      id v14 = 0;
    }
  }
  else
  {
    id v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "Failed to install Child SA", buf, 2u);
    }

    char v47 = *(void **)(a1 + 40);
    uint64_t v48 = *(void **)(a1 + 48);
    if (v47)
    {
      id v49 = objc_getProperty(v47, v46, 56, 1);
      uint64_t v51 = v49;
      if (v49) {
        id v49 = objc_getProperty(v49, v50, 80, 1);
      }
    }
    else
    {
      uint64_t v51 = 0;
      id v49 = 0;
    }
    id v53 = v49;
    id v54 = *(void **)(a1 + 40);
    if (v54)
    {
      id v55 = objc_getProperty(v54, v52, 56, 1);
      uint64_t v57 = v55;
      if (v55) {
        id v55 = objc_getProperty(v55, v56, 88, 1);
      }
    }
    else
    {
      uint64_t v57 = 0;
      id v55 = 0;
    }
    id v58 = v55;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = (uint64_t)__55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke_469;
    v72[3] = (uint64_t)&unk_1E5990580;
    id v59 = *(id *)(a1 + 40);
    uint64_t v60 = *(void *)(a1 + 48);
    id v73 = v59;
    uint64_t v74 = v60;
    -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](v48, v53, v58, v72);

    id v14 = v73;
  }

LABEL_34:
}

void __55__NEIKEv2Session_Exchange__receiveRekeyChildSA_packet___block_invoke_469(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to install Child SA", a2, a3, a4, a5, a6, a7, a8, v14);
  -[NEIKEv2ChildSA setState:error:](v9, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v13 = *(void **)(a1 + 32);
  id v12 = *(char **)(a1 + 40);

  -[NEIKEv2Session resetChild:](v12, v13);
}

- (void)handleFollowupKEForRekeyIKESAInitiator:(void *)a3 rekeyIKEContext:(unint64_t)a4 iteration:(void *)a5 handler:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v12 = a5;
  if (a1)
  {
    uint64_t v13 = objc_getProperty(a1, v11, 368, 1);
    dispatch_assert_queue_V2(v13);

    if (v9)
    {
      id Property = objc_getProperty(v9, v14, 96, 1);
      uint64_t v17 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v16, 120, 1);
      }
    }
    else
    {
      uint64_t v17 = 0;
      id Property = 0;
    }
    id v18 = Property;
    unint64_t v19 = [v18 count];

    if (v19 > a4)
    {
      if (!a4)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
        if (v9)
        {
          id v23 = objc_getProperty(v9, v21, 96, 1);
          id v25 = v23;
          if (v23) {
            id v23 = objc_getProperty(v23, v24, 120, 1);
          }
        }
        else
        {
          id v25 = 0;
          id v23 = 0;
        }
        id v26 = v23;
        uint64_t v28 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v26, "count"));
        if (v9) {
          objc_setProperty_atomic(v9, v27, v28, 184);
        }
      }
      if (v9)
      {
        id v29 = objc_getProperty(v9, v20, 96, 1);
        uint64_t v31 = v29;
        if (v29) {
          id v29 = objc_getProperty(v29, v30, 120, 1);
        }
      }
      else
      {
        uint64_t v31 = 0;
        id v29 = 0;
      }
      id v32 = v29;
      uint64_t v33 = [v32 objectAtIndexedSubscript:a4];

      if (v9) {
        id v35 = objc_getProperty(v9, v34, 96, 1);
      }
      else {
        id v35 = 0;
      }
      id v36 = v35;
      uint64_t v37 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v36);
      uint64_t v38 = [v37 objectForKeyedSubscript:v33];

      if (!v38)
      {
        uint64_t v83 = ne_log_obj();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v112 = a1;
          __int16 v113 = 2112;
          long long v114 = v33;
          _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (initiator rekey followup KE)", buf, 0x16u);
        }

        uint64_t v84 = [NEIKEv2DeleteIKEContext alloc];
        id v86 = objc_getProperty(a1, v85, 368, 1);
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke;
        v107[3] = &unk_1E5990788;
        id v108 = v10;
        id v109 = a1;
        id v110 = v33;
        uint64_t v87 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v84->super.super.isa, 0, v86, v107);

        -[NEIKEv2Session initiateDelete:](a1, v87);
        uint64_t v39 = v108;
        goto LABEL_43;
      }
      if ((-[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v9, v38) & 1) == 0)
      {
        uint64_t v88 = ne_log_obj();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v112 = a1;
          __int16 v113 = 2112;
          long long v114 = v38;
          _os_log_error_impl(&dword_19DDAF000, v88, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (initiator rekey followup KE)", buf, 0x16u);
        }

        uint64_t v89 = [NEIKEv2DeleteIKEContext alloc];
        id v91 = objc_getProperty(a1, v90, 368, 1);
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_480;
        v103[3] = &unk_1E5990788;
        id v104 = v10;
        id v105 = a1;
        id v106 = v38;
        uint64_t v92 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v89->super.super.isa, 0, v91, v103);

        -[NEIKEv2Session initiateDelete:](a1, v92);
        uint64_t v39 = v104;
        goto LABEL_43;
      }
      uint64_t v93 = v33;
      uint64_t v39 = -[NEIKEv2Packet initOutbound]([NEIKEv2FollowupKEPacket alloc]);
      uint64_t v40 = objc_alloc_init(NEIKEv2KeyExchangePayload);
      uint64_t v42 = v40;
      if (v39)
      {
        objc_setProperty_atomic(v39, v41, v40, 88);

        id v44 = objc_getProperty(v39, v43, 88, 1);
        id v46 = v44;
        if (v44) {
          objc_setProperty_atomic(v44, v45, v38, 24);
        }
      }
      else
      {

        id v46 = 0;
      }

      if (v9)
      {
        id v48 = objc_getProperty(v9, v47, 160, 1);
        id v49 = v48;
        if (v48)
        {
          id v50 = (void *)*((void *)v48 + 2);
LABEL_26:
          id v52 = v50;
          if (v39)
          {
            id v53 = objc_getProperty(v39, v51, 88, 1);
            id v55 = v53;
            if (v53) {
              objc_setProperty_atomic(v53, v54, v52, 32);
            }
          }
          else
          {
            id v55 = 0;
          }

          if (v9) {
            id v57 = objc_getProperty(v9, v56, 176, 1);
          }
          else {
            id v57 = 0;
          }
          id v58 = v57;
          uint64_t v60 = v58;
          if (v39)
          {
            objc_setProperty_atomic(v39, v59, v58, 96);

            id v62 = objc_getProperty(v39, v61, 88, 1);
          }
          else
          {

            id v62 = 0;
          }
          id v63 = v62;
          char v64 = -[NEIKEv2Payload isValid]((uint64_t)v63);

          if (v64)
          {
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_2;
            v94[3] = &unk_1E5990800;
            v94[4] = a1;
            id v65 = v10;
            id v95 = v65;
            id v96 = v38;
            id v97 = v9;
            unint64_t v99 = a4;
            uint64_t v98 = v12;
            if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v39, v94) == -1)
            {
              [v65 sendCallbackSuccess:0 session:a1];
              id v67 = objc_getProperty(a1, v66, 336, 1);
              uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator rekey FOLLOWUP_KE #%zu", v68, v69, v70, v71, v72, v73, v74, a4 + 1);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v67, 3uLL, ErrorFailedToSend);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
            }

            uint64_t v33 = v93;
          }
          else
          {
            uint32_t v78 = ne_log_obj();
            uint64_t v33 = v93;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v112 = a1;
              _os_log_error_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_ERROR, "%@ Failed to create FOLLOWUP_KE packet (initiator rekey followup KE)", buf, 0xCu);
            }

            uint64_t v79 = [NEIKEv2DeleteIKEContext alloc];
            id v81 = objc_getProperty(a1, v80, 368, 1);
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_484;
            v100[3] = &unk_1E5990580;
            id v101 = v10;
            uint64_t v102 = a1;
            uint64_t v82 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v79->super.super.isa, 0, v81, v100);

            -[NEIKEv2Session initiateDelete:](a1, v82);
          }
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {
        id v49 = 0;
      }
      id v50 = 0;
      goto LABEL_26;
    }
    if (v9) {
      objc_setProperty_atomic(v9, v20, 0, 176);
    }
    v12[2](v12);
  }
LABEL_44:
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 48));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_480(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 48));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_484(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create FOLLOWUP_KE packet (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id Property = v3;
    id v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88, 1);
    }
    id v7 = Property;

    if (v7)
    {
      if (v6)
      {
        id v9 = objc_getProperty(v6, v8, 88, 1);
        uint64_t v11 = v9;
        if (v9) {
          id v9 = objc_getProperty(v9, v10, 24, 1);
        }
      }
      else
      {
        uint64_t v11 = 0;
        id v9 = 0;
      }
      id v12 = v9;

      if (v12)
      {
        if (v6)
        {
          id v14 = objc_getProperty(v6, v13, 88, 1);
          uint64_t v16 = v14;
          if (v14) {
            id v14 = objc_getProperty(v14, v15, 32, 1);
          }
        }
        else
        {
          uint64_t v16 = 0;
          id v14 = 0;
        }
        id v17 = v14;

        if (v17)
        {
          if (v6)
          {
            id v19 = objc_getProperty(v6, v18, 88, 1);
            uint64_t v21 = v19;
            if (v19) {
              id v19 = objc_getProperty(v19, v20, 24, 1);
            }
          }
          else
          {
            uint64_t v21 = 0;
            id v19 = 0;
          }
          id v22 = v19;
          uint64_t v23 = [v22 method];
          uint64_t v24 = [*(id *)(a1 + 48) method];

          if (v23 == v24)
          {
            if (v6)
            {
              id v26 = objc_getProperty(v6, v25, 88, 1);
              uint64_t v28 = v26;
              if (v26) {
                id v26 = objc_getProperty(v26, v27, 32, 1);
              }
            }
            else
            {
              uint64_t v28 = 0;
              id v26 = 0;
            }
            id v30 = v26;
            uint64_t v31 = *(void **)(a1 + 56);
            if (v31) {
              objc_setProperty_atomic(v31, v29, v30, 152);
            }

            uint64_t v33 = *(void **)(a1 + 56);
            if (v33)
            {
              id v34 = objc_getProperty(*(id *)(a1 + 56), v32, 184, 1);

              if (v34)
              {
                if ([(NEIKEv2IKESA *)v33 processCurrentKeyExchange])
                {
                  id v37 = objc_getProperty(v33, v36, 184, 1);
                  uint64_t v39 = (uint64_t *)objc_getProperty(v33, v38, 160, 1);
                  uint64_t v40 = v39;
                  if (v39) {
                    uint64_t v41 = v39[3];
                  }
                  else {
                    uint64_t v41 = 0;
                  }
                  [v37 addObject:v41];

                  objc_setProperty_atomic(v33, v42, 0, 160);
                  if (v6) {
                    id v44 = objc_getProperty(v6, v43, 96, 1);
                  }
                  else {
                    id v44 = 0;
                  }
                  id v46 = v44;
                  char v47 = *(void **)(a1 + 56);
                  if (v47) {
                    objc_setProperty_atomic(v47, v45, v46, 176);
                  }

                  -[NEIKEv2Session handleFollowupKEForRekeyIKESAInitiator:rekeyIKEContext:iteration:handler:](*(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 72) + 1, *(void *)(a1 + 64));
                  goto LABEL_60;
                }
              }
              else
              {
                uint64_t v82 = ne_log_obj();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v131 = "-[NEIKEv2IKESA(Crypto) processFollowupKeyExchange]";
                  _os_log_fault_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_FAULT, "%s called with null self.followupSharedSecrets", buf, 0xCu);
                }
              }
            }
            uint64_t v83 = ne_log_obj();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, "Failed to process KE data (initiator rekey followup KE)", buf, 2u);
            }

            SEL v85 = [NEIKEv2DeleteIKEContext alloc];
            id v86 = *(id *)(a1 + 32);
            if (v86) {
              id v86 = objc_getProperty(v86, v84, 368, 1);
            }
            id v87 = v86;
            v110[0] = MEMORY[0x1E4F143A8];
            v110[1] = 3221225472;
            v110[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_508;
            v110[3] = &unk_1E5990580;
            id v88 = *(id *)(a1 + 40);
            uint64_t v89 = *(void *)(a1 + 32);
            id v111 = v88;
            uint64_t v112 = v89;
            SEL v90 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v85->super.super.isa, 0, v87, v110);

            -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v90);
            id v56 = v111;
          }
          else
          {
            uint64_t v73 = ne_log_obj();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              uint64_t v94 = *(const char **)(a1 + 32);
              if (v6)
              {
                id v95 = objc_getProperty(v6, v74, 88, 1);
                id v97 = v95;
                if (v95) {
                  id v95 = objc_getProperty(v95, v96, 24, 1);
                }
              }
              else
              {
                id v97 = 0;
                id v95 = 0;
              }
              id v98 = v95;
              uint64_t v99 = [v98 method];
              uint64_t v100 = [*(id *)(a1 + 48) method];
              *(_DWORD *)buf = 138412802;
              uint64_t v131 = v94;
              __int16 v132 = 2048;
              uint64_t v133 = v99;
              __int16 v134 = 2048;
              uint64_t v135 = v100;
              _os_log_error_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (initiator rekey followup KE)", buf, 0x20u);
            }
            id v76 = [NEIKEv2DeleteIKEContext alloc];
            id v77 = *(id *)(a1 + 32);
            if (v77) {
              id v77 = objc_getProperty(v77, v75, 368, 1);
            }
            id v78 = v77;
            v113[0] = MEMORY[0x1E4F143A8];
            v113[1] = 3221225472;
            v113[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_504;
            v113[3] = &unk_1E5990828;
            id v79 = *(id *)(a1 + 40);
            uint64_t v80 = *(void *)(a1 + 32);
            id v114 = v79;
            uint64_t v115 = v80;
            id v6 = v6;
            id v116 = v6;
            id v117 = *(id *)(a1 + 48);
            id v81 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v76->super.super.isa, 0, v78, v113);

            -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v81);
            id v56 = v114;
          }
        }
        else
        {
          id v65 = ne_log_obj();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            uint64_t v93 = *(const char **)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v131 = v93;
            _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (initiator rekey followup KE)", buf, 0xCu);
          }

          id v67 = [NEIKEv2DeleteIKEContext alloc];
          id v68 = *(id *)(a1 + 32);
          if (v68) {
            id v68 = objc_getProperty(v68, v66, 368, 1);
          }
          id v69 = v68;
          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_500;
          v118[3] = &unk_1E5990580;
          id v70 = *(id *)(a1 + 40);
          uint64_t v71 = *(void *)(a1 + 32);
          id v119 = v70;
          uint64_t v120 = v71;
          uint64_t v72 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v67->super.super.isa, 0, v69, v118);

          -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v72);
          id v56 = v119;
        }
      }
      else
      {
        id v57 = ne_log_obj();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          uint64_t v92 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v131 = v92;
          _os_log_error_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (initiator rekey followup KE)", buf, 0xCu);
        }

        id v59 = [NEIKEv2DeleteIKEContext alloc];
        id v60 = *(id *)(a1 + 32);
        if (v60) {
          id v60 = objc_getProperty(v60, v58, 368, 1);
        }
        id v61 = v60;
        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_496;
        v121[3] = &unk_1E5990580;
        id v62 = *(id *)(a1 + 40);
        uint64_t v63 = *(void *)(a1 + 32);
        id v122 = v62;
        uint64_t v123 = v63;
        char v64 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v59->super.super.isa, 0, v61, v121);

        -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v64);
        id v56 = v122;
      }
    }
    else
    {
      id v48 = ne_log_obj();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        id v91 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v131 = v91;
        _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (initiator rekey followup KE)", buf, 0xCu);
      }

      id v50 = [NEIKEv2DeleteIKEContext alloc];
      id v51 = *(id *)(a1 + 32);
      if (v51) {
        id v51 = objc_getProperty(v51, v49, 368, 1);
      }
      id v52 = v51;
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_492;
      v124[3] = &unk_1E5990580;
      id v53 = *(id *)(a1 + 40);
      uint64_t v54 = *(void *)(a1 + 32);
      id v125 = v53;
      uint64_t v126 = v54;
      id v55 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v50->super.super.isa, 0, v52, v124);

      -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v55);
      id v56 = v125;
    }

    goto LABEL_60;
  }
  id v101 = ne_log_obj();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
  {
    id v109 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v131 = v109;
    _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ Failed to receive FOLLOWUP_KE reply (initiator rekey followup KE)", buf, 0xCu);
  }

  id v103 = [NEIKEv2DeleteIKEContext alloc];
  id v104 = *(id *)(a1 + 32);
  if (v104) {
    id v104 = objc_getProperty(v104, v102, 368, 1);
  }
  id v105 = v104;
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_488;
  v127[3] = &unk_1E5990580;
  id v106 = *(id *)(a1 + 40);
  uint64_t v107 = *(void *)(a1 + 32);
  id v128 = v106;
  uint64_t v129 = v107;
  id v108 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v103->super.super.isa, 0, v105, v127);

  -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v108);
  id v6 = v128;
LABEL_60:
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_488(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive FOLLOWUP_KE reply (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_492(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive KE payload (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_496(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive method in KE payload (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_500(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive data in KE payload (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_504(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v5 = Property;
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 88, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 24, 1);
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v7 = 0;
  }
  id v10 = v7;
  uint64_t v11 = [v10 method];
  [*(id *)(a1 + 56) method];
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (initiator rekey followup KE)", v12, v13, v14, v15, v16, v17, v18, v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v22 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v22 resetAll];
}

void __101__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAInitiator_rekeyIKEContext_iteration_handler___block_invoke_508(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data (initiator rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

- (void)handleFollowupKEForRekeyIKESAResponder:(uint64_t)a3 iteration:(void *)a4 replyPacket:(void *)a5 replyPacketDescription:(void *)a6 handler:
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = a4;
    uint64_t v16 = objc_getProperty(a1, v15, 368, 1);
    dispatch_assert_queue_V2(v16);

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke;
    v30[3] = &unk_1E5990620;
    uint64_t v34 = a3;
    id v31 = v11;
    id v32 = a1;
    id v33 = v13;
    char v17 = -[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v14, v30);

    if ((v17 & 1) == 0)
    {
      id v19 = objc_getProperty(a1, v18, 336, 1);
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"%@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v12);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v19, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)a1 reportState];
      [(NEIKEv2Session *)(uint64_t)a1 resetAll];
    }
  }
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  unint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v3, 96, 1);
    uint64_t v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 120, 1);
    }
  }
  else
  {
    uint64_t v9 = 0;
    id Property = 0;
  }
  id v10 = Property;
  unint64_t v11 = [v10 count];

  if (v5 < v11)
  {
    if (!*(void *)(a1 + 56))
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v14 = *(void **)(a1 + 32);
      if (v14)
      {
        id v15 = objc_getProperty(v14, v12, 96, 1);
        char v17 = v15;
        if (v15) {
          id v15 = objc_getProperty(v15, v16, 120, 1);
        }
      }
      else
      {
        char v17 = 0;
        id v15 = 0;
      }
      id v18 = v15;
      uint64_t v20 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v18, "count"));
      uint64_t v21 = *(void **)(a1 + 32);
      if (v21) {
        objc_setProperty_atomic(v21, v19, v20, 184);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = (id *)v4;
      uint64_t v24 = *(void **)(a1 + 32);
      if (v24)
      {
        id v25 = objc_getProperty(v24, v22, 96, 1);
        uint64_t v27 = v25;
        if (v25) {
          id v25 = objc_getProperty(v25, v26, 120, 1);
        }
      }
      else
      {
        uint64_t v27 = 0;
        id v25 = 0;
      }
      id v28 = v25;
      id v29 = [v28 objectAtIndexedSubscript:*(void *)(a1 + 56)];

      id v31 = *(id *)(a1 + 32);
      if (v31) {
        id v31 = objc_getProperty(v31, v30, 96, 1);
      }
      id v32 = v31;
      id v33 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v32);
      uint64_t v34 = [v33 objectForKeyedSubscript:v29];

      if (v34)
      {
        if (v23) {
          id v36 = objc_getProperty(v23, v35, 88, 1);
        }
        else {
          id v36 = 0;
        }
        id v37 = v36;

        if (v37)
        {
          if (v23)
          {
            id v39 = objc_getProperty(v23, v38, 88, 1);
            uint64_t v41 = v39;
            if (v39) {
              id v39 = objc_getProperty(v39, v40, 24, 1);
            }
          }
          else
          {
            uint64_t v41 = 0;
            id v39 = 0;
          }
          id v42 = v39;

          if (v42)
          {
            if (v23)
            {
              id v44 = objc_getProperty(v23, v43, 88, 1);
              id v46 = v44;
              if (v44) {
                id v44 = objc_getProperty(v44, v45, 32, 1);
              }
            }
            else
            {
              id v46 = 0;
              id v44 = 0;
            }
            id v47 = v44;

            if (v47)
            {
              if (v23)
              {
                id v49 = objc_getProperty(v23, v48, 88, 1);
                id v51 = v49;
                if (v49) {
                  id v49 = objc_getProperty(v49, v50, 24, 1);
                }
              }
              else
              {
                id v51 = 0;
                id v49 = 0;
              }
              id v52 = v49;
              uint64_t v53 = [v52 method];
              uint64_t v54 = [v34 method];

              if (v53 == v54)
              {
                if (v23)
                {
                  id v56 = objc_getProperty(v23, v55, 96, 1);
                  id v58 = v56;
                  if (v56) {
                    id v56 = objc_getProperty(v56, v57, 32, 1);
                  }
                }
                else
                {
                  id v58 = 0;
                  id v56 = 0;
                }
                id v60 = v56;
                id v61 = *(void **)(a1 + 32);
                uint64_t v226 = v29;
                if (v61)
                {
                  id v62 = objc_getProperty(v61, v59, 176, 1);
                  char v64 = v62;
                  if (v62) {
                    id v62 = objc_getProperty(v62, v63, 32, 1);
                  }
                }
                else
                {
                  char v64 = 0;
                  id v62 = 0;
                }
                id v65 = v62;
                char v66 = [v60 isEqualToData:v65];

                if ((v66 & 1) == 0)
                {
                  id v116 = ne_log_obj();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v225 = *(void *)(a1 + 40);
                    if (v23)
                    {
                      id v200 = objc_getProperty(v23, v117, 96, 1);
                      id v202 = v200;
                      SEL v203 = &OBJC_IVAR___NEIKEv2IKESA__error;
                      if (v200) {
                        id v200 = objc_getProperty(v200, v201, 32, 1);
                      }
                    }
                    else
                    {
                      id v202 = 0;
                      id v200 = 0;
                      SEL v203 = &OBJC_IVAR___NEIKEv2IKESA__error;
                    }
                    id v205 = v200;
                    id v206 = *(void **)(a1 + 32);
                    if (v206)
                    {
                      id v207 = objc_getProperty(v206, v204, 176, 1);
                      uint64_t v209 = v207;
                      if (v207) {
                        id v207 = objc_getProperty(v207, v208, v203[107], 1);
                      }
                    }
                    else
                    {
                      uint64_t v209 = 0;
                      id v207 = 0;
                    }
                    id v210 = v207;
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v225;
                    *(_WORD *)&unsigned char buf[12] = 2112;
                    *(void *)&buf[14] = v205;
                    __int16 v245 = 2112;
                    uint64_t v246 = (uint64_t)v210;
                    _os_log_error_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_ERROR, "%@ ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey followup KE)", buf, 0x20u);
                  }
                  long long v118 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2FollowupKEPacket alloc], v23);
                  uint64_t v107 = v118;
                  id v29 = v226;
                  if (v118) {
                    -[NEIKEv2Packet addNotification:data:](v118, 0x2FuLL, 0);
                  }
                  if (-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 40), v107, 0))
                  {
                    SEL v121 = [NEIKEv2DeleteIKEContext alloc];
                    id v122 = *(id *)(a1 + 40);
                    if (v122) {
                      id v122 = objc_getProperty(v122, v120, 368, 1);
                    }
                    id v123 = v122;
                    v232[0] = MEMORY[0x1E4F143A8];
                    v232[1] = 3221225472;
                    v232[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_542;
                    v232[3] = &unk_1E5990788;
                    v232[4] = *(void *)(a1 + 40);
                    uint64_t v233 = v23;
                    id v234 = *(id *)(a1 + 32);
                    uint64_t v124 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v121->super.super.isa, 0, v123, v232);

                    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v124);
                  }
                  else
                  {
                    id v131 = *(id *)(a1 + 40);
                    if (v131) {
                      id v131 = objc_getProperty(v131, v119, 336, 1);
                    }
                    id v132 = v131;
                    uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"responder rekey followup KE mismatched link", v133, v134, v135, v136, v137, v138, v139, v224);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v132, 3uLL, ErrorFailedToSend);

                    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
                    [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
                  }
                  goto LABEL_76;
                }
                id v68 = *(void **)(a1 + 32);
                if (v23)
                {
                  id v69 = objc_getProperty(v23, v67, 88, 1);
                  uint64_t v71 = v69;
                  id v29 = v226;
                  if (v69) {
                    id v69 = objc_getProperty(v69, v70, 32, 1);
                  }
                }
                else
                {
                  uint64_t v71 = 0;
                  id v69 = 0;
                  id v29 = v226;
                }
                id v72 = v69;
                char v73 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:peerPayload:](v68, v34, v72);

                if (v73)
                {
                  unint64_t v75 = *(void *)(a1 + 56) + 1;
                  id v76 = *(void **)(a1 + 32);
                  if (v76)
                  {
                    id v77 = objc_getProperty(v76, v74, 96, 1);
                    id v79 = v77;
                    if (v77) {
                      id v77 = objc_getProperty(v77, v78, 120, 1);
                    }
                  }
                  else
                  {
                    id v79 = 0;
                    id v77 = 0;
                  }
                  id v80 = v77;
                  unint64_t v81 = [v80 count];

                  if (v75 >= v81)
                  {
                    SEL v144 = *(void **)(a1 + 32);
                    id v88 = &off_1E598D000;
                    if (v144) {
                      objc_setProperty_atomic(v144, v82, 0, 176);
                    }
                  }
                  else
                  {
                    uint64_t v83 = [MEMORY[0x1E4F29128] UUID];
                    *(void *)buf = 0;
                    *(void *)&uint8_t buf[8] = 0;
                    [v83 getUUIDBytes:buf];
                    uint64_t v84 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:16];
                    id v86 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4039uLL, v84);
                    id v87 = *(void **)(a1 + 32);
                    id v88 = &off_1E598D000;
                    if (v87) {
                      objc_setProperty_atomic(v87, v85, v86, 176);
                    }
                  }
                  uint64_t v107 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc((Class)v88[121]), v23);
                  id v145 = objc_alloc_init(NEIKEv2KeyExchangePayload);
                  id v147 = v145;
                  if (v107)
                  {
                    objc_setProperty_atomic(v107, v146, v145, 88);

                    id v149 = objc_getProperty(v107, v148, 88, 1);
                    char v151 = v149;
                    if (v149) {
                      objc_setProperty_atomic(v149, v150, v34, 24);
                    }
                  }
                  else
                  {

                    char v151 = 0;
                  }

                  uint64_t v153 = *(void **)(a1 + 32);
                  if (v153)
                  {
                    id v154 = objc_getProperty(v153, v152, 160, 1);
                    SEL v155 = v154;
                    if (v154)
                    {
                      uint64_t v156 = (void *)*((void *)v154 + 2);
                      goto LABEL_108;
                    }
                  }
                  else
                  {
                    SEL v155 = 0;
                  }
                  uint64_t v156 = 0;
LABEL_108:
                  id v158 = v156;
                  if (v107)
                  {
                    id v159 = objc_getProperty(v107, v157, 88, 1);
                    SEL v161 = v159;
                    if (v159) {
                      objc_setProperty_atomic(v159, v160, v158, 32);
                    }
                  }
                  else
                  {
                    SEL v161 = 0;
                  }

                  id v163 = *(id *)(a1 + 32);
                  if (v163) {
                    id v163 = objc_getProperty(v163, v162, 176, 1);
                  }
                  id v164 = v163;
                  id v166 = v164;
                  if (v107)
                  {
                    objc_setProperty_atomic(v107, v165, v164, 96);

                    id v168 = objc_getProperty(v107, v167, 88, 1);
                  }
                  else
                  {

                    id v168 = 0;
                  }
                  id v169 = v168;
                  char v170 = -[NEIKEv2Payload isValid]((uint64_t)v169);

                  if ((v170 & 1) == 0)
                  {
                    id v187 = ne_log_obj();
                    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v212 = *(void *)(a1 + 40);
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v212;
                      _os_log_error_impl(&dword_19DDAF000, v187, OS_LOG_TYPE_ERROR, "%@ Failed to create FOLLOWUP_KE packet (responder rekey followup KE)", buf, 0xCu);
                    }

                    SEL v189 = [NEIKEv2DeleteIKEContext alloc];
                    id v190 = *(id *)(a1 + 40);
                    if (v190) {
                      id v190 = objc_getProperty(v190, v188, 368, 1);
                    }
                    id v191 = v190;
                    v229[0] = MEMORY[0x1E4F143A8];
                    v229[1] = 3221225472;
                    v229[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_550;
                    v229[3] = &unk_1E5990AD8;
                    v229[4] = *(void *)(a1 + 40);
                    SEL v192 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v189->super.super.isa, 0, v191, v229);

                    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v192);
                    goto LABEL_76;
                  }
                  id v172 = *(id *)(a1 + 32);
                  if (v172) {
                    id v172 = objc_getProperty(v172, v171, 184, 1);
                  }
                  id v174 = v172;
                  uint64_t v175 = *(void **)(a1 + 32);
                  if (v175)
                  {
                    id v176 = objc_getProperty(v175, v173, 160, 1);
                    id v177 = v176;
                    if (v176)
                    {
                      id v178 = (void *)*((void *)v176 + 3);
LABEL_121:
                      id v179 = v178;
                      [v174 addObject:v179];

                      uint64_t v181 = *(void **)(a1 + 32);
                      uint64_t v182 = v29;
                      if (v181)
                      {
                        objc_setProperty_atomic(v181, v180, 0, 160);
                        uint64_t v183 = *(void *)(a1 + 32);
                      }
                      else
                      {
                        uint64_t v183 = 0;
                      }
                      uint64_t v184 = *(void *)(a1 + 40);
                      uint64_t v185 = *(void *)(a1 + 56) + 1;
                      uint64_t v186 = objc_msgSend([NSString alloc], "initWithFormat:", @"responder rekey FOLLOWUP_KE #%zu", v185);
                      -[NEIKEv2Session handleFollowupKEForRekeyIKESAResponder:iteration:replyPacket:replyPacketDescription:handler:](v184, v183, v185, v107, v186, *(void *)(a1 + 48));

                      id v29 = v182;
                      goto LABEL_76;
                    }
                  }
                  else
                  {
                    id v177 = 0;
                  }
                  id v178 = 0;
                  goto LABEL_121;
                }
                id v125 = ne_log_obj();
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v211 = *(void *)(a1 + 40);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v211;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v34;
                  _os_log_error_impl(&dword_19DDAF000, v125, OS_LOG_TYPE_ERROR, "%@ Failed to generate values for KEM %@ (responder rekey followup KE)", buf, 0x16u);
                }

                uint64_t v127 = [NEIKEv2DeleteIKEContext alloc];
                id v128 = *(id *)(a1 + 40);
                if (v128) {
                  id v128 = objc_getProperty(v128, v126, 368, 1);
                }
                id v129 = v128;
                v230[0] = MEMORY[0x1E4F143A8];
                v230[1] = 3221225472;
                v230[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_546;
                v230[3] = &unk_1E5990580;
                v230[4] = *(void *)(a1 + 40);
                uint64_t v231 = v34;
                uint64_t v130 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v127->super.super.isa, 0, v129, v230);

                -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v130);
                uint64_t v115 = v231;
              }
              else
              {
                id v108 = ne_log_obj();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  SEL v227 = v29;
                  uint64_t v195 = *(void *)(a1 + 40);
                  if (v23)
                  {
                    id v196 = objc_getProperty(v23, v109, 88, 1);
                    id v198 = v196;
                    if (v196) {
                      id v196 = objc_getProperty(v196, v197, 24, 1);
                    }
                  }
                  else
                  {
                    id v198 = 0;
                    id v196 = 0;
                  }
                  id v199 = v196;
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v195;
                  *(_WORD *)&unsigned char buf[12] = 2048;
                  *(void *)&buf[14] = [v199 method];
                  __int16 v245 = 2048;
                  uint64_t v246 = [v34 method];
                  _os_log_error_impl(&dword_19DDAF000, v108, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu) (responder rekey followup KE)", buf, 0x20u);

                  id v29 = v227;
                }

                id v111 = [NEIKEv2DeleteIKEContext alloc];
                id v112 = *(id *)(a1 + 40);
                if (v112) {
                  id v112 = objc_getProperty(v112, v110, 368, 1);
                }
                id v113 = v112;
                v235[0] = MEMORY[0x1E4F143A8];
                v235[1] = 3221225472;
                v235[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_535;
                v235[3] = &unk_1E5990788;
                v235[4] = *(void *)(a1 + 40);
                char v236 = v23;
                id v237 = v34;
                id v114 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v111->super.super.isa, 0, v113, v235);

                -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v114);
                uint64_t v115 = v236;
              }
LABEL_84:

              goto LABEL_77;
            }
            id v104 = ne_log_obj();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              uint64_t v194 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v194;
              _os_log_error_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload (responder rekey followup KE)", buf, 0xCu);
            }

            id v97 = [NEIKEv2DeleteIKEContext alloc];
            id v106 = *(id *)(a1 + 40);
            if (v106) {
              id v106 = objc_getProperty(v106, v105, 368, 1);
            }
            id v99 = v106;
            v238[0] = MEMORY[0x1E4F143A8];
            v238[1] = 3221225472;
            v238[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_531;
            v238[3] = &unk_1E5990AD8;
            v238[4] = *(void *)(a1 + 40);
            uint64_t v100 = v238;
          }
          else
          {
            id v101 = ne_log_obj();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
            {
              uint64_t v193 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v193;
              _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload (responder rekey followup KE)", buf, 0xCu);
            }

            id v97 = [NEIKEv2DeleteIKEContext alloc];
            id v103 = *(id *)(a1 + 40);
            if (v103) {
              id v103 = objc_getProperty(v103, v102, 368, 1);
            }
            id v99 = v103;
            v239[0] = MEMORY[0x1E4F143A8];
            v239[1] = 3221225472;
            v239[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_527;
            v239[3] = &unk_1E5990AD8;
            v239[4] = *(void *)(a1 + 40);
            uint64_t v100 = v239;
          }
        }
        else
        {
          id v95 = ne_log_obj();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            uint64_t v143 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v143;
            _os_log_error_impl(&dword_19DDAF000, v95, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload (responder rekey followup KE)", buf, 0xCu);
          }

          id v97 = [NEIKEv2DeleteIKEContext alloc];
          id v98 = *(id *)(a1 + 40);
          if (v98) {
            id v98 = objc_getProperty(v98, v96, 368, 1);
          }
          id v99 = v98;
          v240[0] = MEMORY[0x1E4F143A8];
          v240[1] = 3221225472;
          v240[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_523;
          v240[3] = &unk_1E5990AD8;
          v240[4] = *(void *)(a1 + 40);
          uint64_t v100 = v240;
        }
        uint64_t v107 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v97->super.super.isa, 0, v99, v100);

        -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v107);
LABEL_76:

LABEL_77:
        goto LABEL_78;
      }
      id v216 = ne_log_obj();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
      {
        uint64_t v223 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v223;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v29;
        _os_log_error_impl(&dword_19DDAF000, v216, OS_LOG_TYPE_ERROR, "%@ No chosen KEM found for transform type %@ (responder rekey followup KE)", buf, 0x16u);
      }

      id v218 = [NEIKEv2DeleteIKEContext alloc];
      id v219 = *(id *)(a1 + 40);
      if (v219) {
        id v219 = objc_getProperty(v219, v217, 368, 1);
      }
      id v220 = v219;
      v241[0] = MEMORY[0x1E4F143A8];
      v241[1] = 3221225472;
      v241[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_519;
      v241[3] = &unk_1E5990580;
      v241[4] = *(void *)(a1 + 40);
      SEL v242 = v29;
      SEL v221 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v218->super.super.isa, 0, v220, v241);

      -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v221);
      uint64_t v115 = v242;
      goto LABEL_84;
    }
    id v213 = ne_log_obj();
    if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
    {
      uint64_t v222 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v222;
      _os_log_error_impl(&dword_19DDAF000, v213, OS_LOG_TYPE_ERROR, "%@ Failed to receive FOLLOWUP_KE packet (responder rekey followup KE)", buf, 0xCu);
    }

    id v91 = [NEIKEv2DeleteIKEContext alloc];
    id v215 = *(id *)(a1 + 40);
    if (v215) {
      id v215 = objc_getProperty(v215, v214, 368, 1);
    }
    id v93 = v215;
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_515;
    v243[3] = &unk_1E5990AD8;
    v243[4] = *(void *)(a1 + 40);
    uint64_t v94 = v243;
LABEL_59:
    uint64_t v23 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v91->super.super.isa, 0, v93, v94);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 40), v23);
LABEL_78:

    goto LABEL_79;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v89 = ne_log_obj();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v89, OS_LOG_TYPE_ERROR, "Failed to receive Rekey IKE Delete packet (receive rekey)", buf, 2u);
    }

    id v91 = [NEIKEv2DeleteIKEContext alloc];
    id v92 = *(id *)(a1 + 40);
    if (v92) {
      id v92 = objc_getProperty(v92, v90, 368, 1);
    }
    id v93 = v92;
    v228[0] = MEMORY[0x1E4F143A8];
    v228[1] = 3221225472;
    v228[2] = __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_557;
    v228[3] = &unk_1E5990AD8;
    v228[4] = *(void *)(a1 + 40);
    uint64_t v94 = v228;
    goto LABEL_59;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_79:
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_515(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive FOLLOWUP_KE packet (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_519(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"No chosen KEM found for transform type %@ (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 40));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_523(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive KE payload (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_527(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive method in KE payload (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_531(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive data in KE payload (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_535(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v5 = Property;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 88, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 24, 1);
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v7 = 0;
  }
  id v10 = v7;
  uint64_t v11 = [v10 method];
  [*(id *)(a1 + 48) method];
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu) (responder rekey followup KE)", v12, v13, v14, v15, v16, v17, v18, v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v22 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v22 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_542(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v5 = Property;
  uint64_t v6 = (void *)a1[5];
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 96, 1);
    uint64_t v9 = v7;
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 32, 1);
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v7 = 0;
  }
  id v11 = v7;
  uint64_t v12 = (void *)a1[6];
  if (v12)
  {
    id v13 = objc_getProperty(v12, v10, 176, 1);
    uint64_t v15 = v13;
    if (v13) {
      id v13 = objc_getProperty(v13, v14, 32, 1);
    }
  }
  else
  {
    uint64_t v15 = 0;
    id v13 = 0;
  }
  id v27 = v13;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"ADDITIONAL_KEY_EXCHANGE in FOLLOWUP_KE request doesn't match expected (%@ != %@) (responder rekey followup KE)", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v11);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)(void *)a1[4] reportState];
  uint64_t v26 = a1[4];

  [(NEIKEv2Session *)v26 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_546(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to generate values for KEM %@ (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 40));
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_550(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create FOLLOWUP_KE packet (responder rekey followup KE)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __120__NEIKEv2Session_Exchange__handleFollowupKEForRekeyIKESAResponder_iteration_replyPacket_replyPacketDescription_handler___block_invoke_557(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive Rekey IKE Delete packet (receive rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

- (void)initiateRekeyIKESA:(unsigned char *)a1
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v6 = Property;
  dispatch_assert_queue_V2(v6);

  if (!a1[15]) {
    __assert_rtn("-[NEIKEv2Session(Exchange) initiateRekeyIKESA:]", "NEIKEv2Exchange.m", 2568, "self.hasOutboundRequestInFlight");
  }
  id v8 = objc_getProperty(a1, v7, 336, 1);
  uint64_t v9 = v8;
  if (v8)
  {
    if ((*((unsigned char *)v8 + 16) & 1) == 0)
    {
      *((unsigned char *)v8 + 16) = 1;
      uint64_t v10 = -[NEIKEv2IKESA copyForRekey]((uint64_t)v8);
      uint64_t v12 = v10;
      if (!v10)
      {
        id v48 = ne_log_obj();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "Failed to create valid IKE SA (initiate rekey)", buf, 2u);
        }

        id v49 = [NEIKEv2DeleteIKEContext alloc];
        id v51 = objc_getProperty(a1, v50, 368, 1);
        v163[0] = MEMORY[0x1E4F143A8];
        v163[1] = 3221225472;
        v163[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke;
        v163[3] = &unk_1E5990580;
        id v164 = v4;
        SEL v165 = a1;
        id v52 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v49->super.super.isa, 0, v51, v163);

        -[NEIKEv2Session initiateDelete:](a1, v52);
        uint64_t v53 = v164;
        goto LABEL_82;
      }
      BYTE1(v10[1].isa) = 1;
      if (([(NEIKEv2IKESA *)v10 generateInitialValues] & 1) == 0)
      {
        uint64_t v54 = ne_log_obj();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "Failed to generate local IKE crypto values", buf, 2u);
        }

        id v55 = [NEIKEv2DeleteIKEContext alloc];
        id v57 = objc_getProperty(a1, v56, 368, 1);
        v160[0] = MEMORY[0x1E4F143A8];
        v160[1] = 3221225472;
        v160[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_564;
        v160[3] = &unk_1E5990580;
        SEL v161 = v4;
        uint64_t v162 = a1;
        id v58 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v55->super.super.isa, 0, v57, v160);

        -[NEIKEv2Session initiateDelete:](a1, v58);
        uint64_t v53 = v161;
        goto LABEL_82;
      }
      id v13 = v12;
      self;
      id v15 = objc_getProperty(v13, v14, 96, 1);

      if (!v15)
      {
        id v59 = ne_log_obj();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
          _os_log_fault_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.chosenProposal", buf, 0xCu);
        }
        goto LABEL_70;
      }
      uint64_t v16 = -[NEIKEv2Packet initOutbound]([NEIKEv2CreateChildPacket alloc]);
      if (!v16)
      {
        id v60 = ne_log_obj();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed", buf, 2u);
        }

        id v59 = 0;
        goto LABEL_70;
      }
      uint64_t v17 = v16;
      uint64_t v18 = objc_alloc_init(NEIKEv2IKESAPayload);
      objc_setProperty_atomic(v17, v19, v18, 88);

      uint64_t v21 = (id *)objc_getProperty(v13, v20, 96, 1);
      self = v13;
      uint64_t v152 = v17;
      if (!v21)
      {
        uint64_t v24 = 0;
LABEL_50:
        char v73 = v24;
        *(void *)&long long v168 = v24;
        uint64_t v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:1];
        id v76 = objc_getProperty(v17, v75, 88, 1);
        id v78 = v76;
        if (v76) {
          objc_setProperty_atomic(v76, v77, v74, 24);
        }

        id v13 = self;
        id v80 = objc_getProperty(self, v79, 32, 1);
        id v59 = v152;
        uint64_t v82 = objc_getProperty(v152, v81, 88, 1);
        uint64_t v84 = v82;
        if (v82) {
          objc_setProperty_atomic(v82, v83, v80, 32);
        }

        id v86 = objc_getProperty(v152, v85, 88, 1);
        char v87 = -[NEIKEv2Payload isValid]((uint64_t)v86);

        if (v87)
        {
          id v88 = objc_alloc_init(NEIKEv2NoncePayload);
          objc_setProperty_atomic(v152, v89, v88, 112);

          id v91 = objc_getProperty(self, v90, 128, 1);
          id v93 = objc_getProperty(v152, v92, 112, 1);
          id v95 = v93;
          if (v93) {
            objc_setProperty_atomic(v93, v94, v91, 24);
          }

          id v97 = objc_getProperty(v152, v96, 112, 1);
          char v98 = -[NEIKEv2Payload isValid]((uint64_t)v97);

          if (v98)
          {
            id v99 = v9;
            id v100 = v4;
            id v101 = objc_alloc_init(NEIKEv2KeyExchangePayload);
            objc_setProperty_atomic(v152, v102, v101, 104);

            id v104 = objc_getProperty(self, v103, 96, 1);
            id v106 = [(NEIKEv2IKESAProposal *)v104 kemProtocol];
            id v108 = objc_getProperty(v152, v107, 104, 1);
            id v110 = v108;
            if (v108) {
              objc_setProperty_atomic(v108, v109, v106, 24);
            }

            id v112 = objc_getProperty(self, v111, 160, 1);
            id v113 = v112;
            if (v112) {
              id v114 = (void *)*((void *)v112 + 2);
            }
            else {
              id v114 = 0;
            }
            id v115 = v114;
            id v117 = objc_getProperty(v152, v116, 104, 1);
            id v119 = v117;
            if (v117) {
              objc_setProperty_atomic(v117, v118, v115, 32);
            }

            SEL v121 = objc_getProperty(v152, v120, 104, 1);
            char v122 = -[NEIKEv2Payload isValid]((uint64_t)v121);

            if (v122)
            {
              uint64_t v53 = v152;
              id v4 = v100;
              uint64_t v9 = v99;
              id v13 = self;
              id v59 = v53;
            }
            else
            {
              id v145 = ne_log_obj();
              id v4 = v100;
              if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
                _os_log_fault_impl(&dword_19DDAF000, v145, OS_LOG_TYPE_FAULT, "%s called with null packet.ke.isValid", buf, 0xCu);
              }

              uint64_t v53 = 0;
              uint64_t v9 = v99;
              id v13 = self;
              id v59 = v152;
            }
            goto LABEL_71;
          }
          id v123 = ne_log_obj();
          if (!os_log_type_enabled(v123, OS_LOG_TYPE_FAULT)) {
            goto LABEL_69;
          }
          *(_DWORD *)buf = 136315138;
          SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
          uint64_t v124 = "%s called with null packet.nonce.isValid";
        }
        else
        {
          id v123 = ne_log_obj();
          if (!os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
          {
LABEL_69:

LABEL_70:
            uint64_t v53 = 0;
LABEL_71:

            if (v53)
            {
              v153[0] = MEMORY[0x1E4F143A8];
              v153[1] = 3221225472;
              v153[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2;
              v153[3] = &unk_1E59908F0;
              v153[4] = a1;
              id v125 = v4;
              id v154 = v125;
              SEL v155 = v13;
              id v156 = v9;
              if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)a1, v53, v153) == -1)
              {
                [v125 sendCallbackSuccess:0 session:a1];
                if (a1) {
                  id v127 = objc_getProperty(a1, v126, 336, 1);
                }
                else {
                  id v127 = 0;
                }
                id v128 = v127;
                uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator rekey IKE SA", v129, v130, v131, v132, v133, v134, v135, v147);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v128, 3uLL, ErrorFailedToSend);

                [(NEIKEv2Session *)a1 reportState];
                [(NEIKEv2Session *)(uint64_t)a1 resetAll];
              }
            }
            else
            {
              uint64_t v139 = ne_log_obj();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_19DDAF000, v139, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet (initiate rekey)", buf, 2u);
              }

              uint64_t v141 = [NEIKEv2DeleteIKEContext alloc];
              if (a1) {
                id v142 = objc_getProperty(a1, v140, 368, 1);
              }
              else {
                id v142 = 0;
              }
              id v143 = v142;
              v157[0] = MEMORY[0x1E4F143A8];
              v157[1] = 3221225472;
              v157[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_568;
              v157[3] = &unk_1E5990580;
              id v158 = v4;
              id v159 = a1;
              SEL v144 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v141->super.super.isa, 0, v143, v157);

              -[NEIKEv2Session initiateDelete:](a1, v144);
              uint64_t v53 = 0;
            }
LABEL_82:

            goto LABEL_83;
          }
          *(_DWORD *)buf = 136315138;
          SEL v167 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyIKESAForInitiator:]";
          uint64_t v124 = "%s called with null packet.ikeSA.isValid";
        }
        _os_log_fault_impl(&dword_19DDAF000, v123, OS_LOG_TYPE_FAULT, v124, buf, 0xCu);
        goto LABEL_69;
      }
      uint64_t v22 = objc_alloc_init(NEIKEv2IKESAProposal);
      uint64_t v24 = v22;
      if (v22) {
        v22->_proposalNumber = 1;
      }
      uint64_t v26 = objc_msgSend(objc_getProperty(v21, v23, 88, 1), "copy");
      if (v24) {
        objc_setProperty_atomic(v24, v25, v26, 88);
      }

      id v29 = objc_msgSend(objc_getProperty(v21, v27, 96, 1), "copy");
      if (v24) {
        objc_setProperty_atomic(v24, v28, v29, 96);
      }

      id v32 = objc_msgSend(objc_getProperty(v21, v30, 104, 1), "copy");
      if (v24) {
        objc_setProperty_atomic(v24, v31, v32, 104);
      }

      id v35 = objc_msgSend(objc_getProperty(v21, v33, 112, 1), "copy");
      if (v24) {
        objc_setProperty_atomic(v24, v34, v35, 112);
      }

      id v36 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v21);

      if (v36)
      {
        id v149 = v24;
        id v150 = v12;
        id v37 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v21);
        uint64_t v38 = [v37 count];
        uint64_t v40 = objc_msgSend(objc_getProperty(v21, v39, 120, 1), "count");

        if (v38 == v40)
        {
          id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          SEL v43 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v21);
          id v44 = (void *)[v42 initWithDictionary:v43 copyItems:1];
          -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v149, v44);

          uint64_t v24 = v149;
LABEL_48:
          uint64_t v12 = v150;
          uint64_t v17 = v152;
          goto LABEL_49;
        }
        uint64_t v24 = v149;
        uint64_t v12 = v150;
        if (objc_getProperty(v21, v41, 120, 1))
        {
          uint64_t v147 = (uint64_t)v9;
          id v148 = v4;
          id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v168 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          id v63 = objc_getProperty(v21, v62, 120, 1);
          uint64_t v64 = [v63 countByEnumeratingWithState:&v168 objects:buf count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v169;
            do
            {
              for (uint64_t i = 0; i != v65; ++i)
              {
                if (*(void *)v169 != v66) {
                  objc_enumerationMutation(v63);
                }
                uint64_t v68 = *(void *)(*((void *)&v168 + 1) + 8 * i);
                id v69 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v21);
                id v70 = [v69 objectForKeyedSubscript:v68];
                [v61 setObject:v70 forKeyedSubscript:v68];
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v168 objects:buf count:16];
            }
            while (v65);
          }

          uint64_t v71 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v61 copyItems:1];
          -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v149, v71);

          uint64_t v24 = v149;
          uint64_t v9 = (void *)v147;
          id v4 = v148;
          goto LABEL_48;
        }
      }
LABEL_49:
      id v72 = objc_msgSend(v21[16], "copy", v147);
      -[NEConfigurationManager setAppGroupMap:]((uint64_t)v24, v72);

      goto LABEL_50;
    }
    id v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_DEBUG, "IKE SA already rekeying, skipping (initiate rekey)", buf, 2u);
    }

    id v46 = v4;
    uint64_t v47 = 1;
  }
  else
  {
    id v146 = ne_log_obj();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      SEL v167 = "-[NEIKEv2Session(Exchange) initiateRekeyIKESA:]";
      _os_log_fault_impl(&dword_19DDAF000, v146, OS_LOG_TYPE_FAULT, "%s called with null oldIKESA", buf, 0xCu);
    }

    id v46 = v4;
    uint64_t v47 = 0;
  }
  [v46 sendCallbackSuccess:v47 session:a1];
LABEL_83:
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create valid IKE SA (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_564(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate local IKE crypto values (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_568(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v284 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v38 = ne_log_obj();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "Failed to receive Create Child SA packet (initiate rekey)", buf, 2u);
    }

    uint64_t v40 = [NEIKEv2DeleteIKEContext alloc];
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v39, 368, 1);
    }
    id v42 = Property;
    v266[0] = MEMORY[0x1E4F143A8];
    v266[1] = 3221225472;
    v266[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_572;
    v266[3] = &unk_1E5990580;
    SEL v43 = (id *)v267;
    id v44 = *(id *)(a1 + 40);
    uint64_t v45 = *(void *)(a1 + 32);
    v267[0] = v44;
    v267[1] = v45;
    id v46 = v266;
    goto LABEL_117;
  }
  id v4 = *(id *)(a1 + 48);
  uint64_t v6 = v4;
  if (!v3) {
    goto LABEL_112;
  }
  if (!v4)
  {
    uint64_t ErrorPeerInvalidSyntax = ne_log_obj();
    if (os_log_type_enabled(ErrorPeerInvalidSyntax, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)unint64_t v276 = 136315138;
      uint64_t v277 = "-[NEIKEv2CreateChildPacket(Exchange) validateRekeyIKESA:]";
      _os_log_fault_impl(&dword_19DDAF000, ErrorPeerInvalidSyntax, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v276, 0xCu);
    }
    goto LABEL_111;
  }
  if (![(NEIKEv2Packet *)v3 hasErrors]) {
    goto LABEL_15;
  }
  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  uint64_t ErrorPeerInvalidSyntax = objc_getProperty(v3, v7, 64, 1);
  uint64_t v9 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:&v272 objects:buf count:16];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v273;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v273 != v11) {
        objc_enumerationMutation(ErrorPeerInvalidSyntax);
      }
      id v13 = *(__CFString **)(*((void *)&v272 + 1) + 8 * i);
      if (v13 && (unint64_t)(v13->length - 1) <= 0x3FFE)
      {
        id v28 = -[NEIKEv2NotifyPayload copyError](v13);
        uint64_t v47 = ne_log_obj();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v153 = (char *)[v3 copyShortDescription];
          *(_DWORD *)unint64_t v276 = 138412546;
          uint64_t v277 = v153;
          __int16 v278 = 2112;
          uint64_t v279 = v28;
          _os_log_error_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_ERROR, "%@ Rekey IKE received notify error %@", v276, 0x16u);
        }
LABEL_47:
        -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v28);
LABEL_110:

LABEL_111:
LABEL_112:

        uint64_t v209 = ne_log_obj();
        if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v209, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA packet (initiate rekey)", buf, 2u);
        }

        uint64_t v40 = [NEIKEv2DeleteIKEContext alloc];
        id v211 = *(id *)(a1 + 32);
        if (v211) {
          id v211 = objc_getProperty(v211, v210, 368, 1);
        }
        id v42 = v211;
        v264[0] = MEMORY[0x1E4F143A8];
        v264[1] = 3221225472;
        v264[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_576;
        v264[3] = &unk_1E5990580;
        SEL v43 = (id *)v265;
        id v212 = *(id *)(a1 + 40);
        uint64_t v213 = *(void *)(a1 + 32);
        v265[0] = v212;
        v265[1] = v213;
        id v46 = v264;
        goto LABEL_117;
      }
    }
    uint64_t v10 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:&v272 objects:buf count:16];
  }
  while (v10);
LABEL_14:

LABEL_15:
  SEL v14 = objc_getProperty(v3, v7, 88, 1);
  uint64_t v16 = v14;
  if (v14) {
    SEL v14 = objc_getProperty(v14, v15, 32, 1);
  }
  id v17 = v14;
  uint64_t v18 = [v17 value];

  if (!v18)
  {
    id v48 = ne_log_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v163 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v163;
      _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@ SA proposal missing rekey SPI", v276, 0xCu);
    }
    uint64_t ErrorPeerInvalidSyntax = NEIKEv2CreateErrorPeerInvalidSyntax(@"SA proposal missing rekey SPI", v49, v50, v51, v52, v53, v54, v55, v247);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, ErrorPeerInvalidSyntax);
    goto LABEL_111;
  }
  SEL v20 = objc_getProperty(v3, v19, 88, 1);
  uint64_t v22 = v20;
  if (v20) {
    SEL v20 = objc_getProperty(v20, v21, 32, 1);
  }
  id v23 = v20;
  -[NEIKEv2IKESA assignRemoteSPI:](v6, v23);

  id v25 = objc_getProperty(v3, v24, 88, 1);
  SEL v27 = v25;
  if (v25) {
    id v25 = objc_getProperty(v25, v26, 24, 1);
  }
  uint64_t ErrorPeerInvalidSyntax = v25;

  if ([ErrorPeerInvalidSyntax count] != 1)
  {
    SEL v56 = ne_log_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      id v164 = (char *)[v3 copyShortDescription];
      uint64_t v165 = [ErrorPeerInvalidSyntax count];
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v164;
      __int16 v278 = 2048;
      uint64_t v279 = (unsigned char *)v165;
      _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ Received %zu SA proposals, require 1", v276, 0x16u);
    }
    uint64_t v57 = [ErrorPeerInvalidSyntax count];
    id v28 = (unsigned char *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received %zu SA proposals, require 1", v58, v59, v60, v61, v62, v63, v64, v57);
    goto LABEL_47;
  }
  id v28 = [ErrorPeerInvalidSyntax firstObject];
  if (([(NEIKEv2IKESAProposal *)v28 isAValidResponse] & 1) == 0)
  {
    uint64_t v65 = ne_log_obj();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      SEL v167 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v167;
      __int16 v278 = 2112;
      uint64_t v279 = v28;
      _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "%@ Received invalid SA proposal for rekey %@", v276, 0x16u);
    }
    id v73 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received invalid SA proposal for rekey", v66, v67, v68, v69, v70, v71, v72, v247);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v73);
    goto LABEL_109;
  }
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  id v31 = objc_getProperty(v6, v30, 80, 1);
  id v32 = [v31 proposals];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v268 objects:v282 count:16];
  if (!v33)
  {
LABEL_32:

LABEL_77:
    id v143 = ne_log_obj();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      long long v169 = (char *)[v3 copyShortDescription];
      id v171 = objc_getProperty(v6, v170, 80, 1);
      uint64_t v172 = [v171 proposals];
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v169;
      __int16 v278 = 2112;
      uint64_t v279 = v28;
      __int16 v280 = 2112;
      uint64_t v281 = (uint64_t)v172;
      _os_log_error_impl(&dword_19DDAF000, v143, OS_LOG_TYPE_ERROR, "%@ Received proposal for rekey %@ does not match config %@", v276, 0x20u);
    }
    id v73 = objc_getProperty(v6, v144, 80, 1);
    id v133 = [v73 proposals];
    uint64_t v152 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received proposal for rekey %@ does not match config %@", v145, v146, v147, v148, v149, v150, v151, (uint64_t)v28);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v152);

    goto LABEL_108;
  }
  uint64_t v34 = v33;
  uint64_t v35 = *(void *)v269;
LABEL_26:
  uint64_t v36 = 0;
  while (1)
  {
    if (*(void *)v269 != v35) {
      objc_enumerationMutation(v32);
    }
    id v37 = *(void **)(*((void *)&v268 + 1) + 8 * v36);
    if (-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](v37, v28, 0)) {
      break;
    }
    if (v34 == ++v36)
    {
      uint64_t v34 = [v32 countByEnumeratingWithState:&v268 objects:v282 count:16];
      if (v34) {
        goto LABEL_26;
      }
      goto LABEL_32;
    }
  }
  id v73 = v37;

  if (!v73) {
    goto LABEL_77;
  }
  uint64_t v74 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v73, v28, 0);
  objc_setProperty_atomic(v6, v75, v74, 96);

  id v77 = objc_getProperty(v6, v76, 96, 1);
  if (!v77)
  {
    id v154 = ne_log_obj();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      id v206 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v206;
      _os_log_error_impl(&dword_19DDAF000, v154, OS_LOG_TYPE_ERROR, "%@ Could not set chosen proposal values", v276, 0xCu);
    }
    uint64_t v162 = @"Could not set chosen proposal values";
    goto LABEL_106;
  }
  SEL v79 = objc_getProperty(v3, v78, 104, 1);

  if (!v79)
  {
    id v166 = ne_log_obj();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      id v215 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v215;
      _os_log_error_impl(&dword_19DDAF000, v166, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", v276, 0xCu);
    }
    uint64_t v162 = @"Did not receive KE payload";
    goto LABEL_106;
  }
  SEL v81 = objc_getProperty(v3, v80, 104, 1);
  uint64_t v83 = v81;
  if (v81) {
    SEL v81 = objc_getProperty(v81, v82, 24, 1);
  }
  id v84 = v81;

  if (!v84)
  {
    long long v168 = ne_log_obj();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
    {
      id v216 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v216;
      _os_log_error_impl(&dword_19DDAF000, v168, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", v276, 0xCu);
    }
    uint64_t v162 = @"Did not receive method in KE payload";
    goto LABEL_106;
  }
  id v86 = objc_getProperty(v3, v85, 104, 1);
  id v88 = v86;
  if (v86) {
    id v86 = objc_getProperty(v86, v87, 32, 1);
  }
  id v89 = v86;

  if (!v89)
  {
    unint64_t v173 = ne_log_obj();
    if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
    {
      SEL v217 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v217;
      _os_log_error_impl(&dword_19DDAF000, v173, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", v276, 0xCu);
    }
    uint64_t v162 = @"Did not receive data in KE payload";
    goto LABEL_106;
  }
  id v91 = objc_getProperty(v3, v90, 104, 1);
  uint64_t v253 = v91;
  if (v91) {
    id v91 = objc_getProperty(v91, v92, 24, 1);
  }
  id v93 = v91;
  uint64_t v251 = [v93 method];
  id v95 = objc_getProperty(v6, v94, 96, 1);
  id v97 = [(NEIKEv2IKESAProposal *)v95 kemProtocol];
  uint64_t v98 = [v97 method];

  if (v251 != v98)
  {
    id v174 = ne_log_obj();
    uint64_t v175 = &OBJC_IVAR___NEIKEv2IKESA__error;
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
    {
      SEL v252 = (char *)[v3 copyShortDescription];
      id v219 = objc_getProperty(v3, v218, 104, 1);
      uint64_t v255 = v219;
      if (v219) {
        id v219 = objc_getProperty(v219, v220, 24, 1);
      }
      id v250 = v219;
      uint64_t v249 = [v250 method];
      id v222 = objc_getProperty(v6, v221, 96, 1);
      uint64_t v224 = [(NEIKEv2IKESAProposal *)v222 kemProtocol];
      uint64_t v225 = [v224 method];
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v252;
      __int16 v278 = 2048;
      uint64_t v279 = (unsigned char *)v249;
      __int16 v280 = 2048;
      uint64_t v281 = v225;
      _os_log_error_impl(&dword_19DDAF000, v174, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu)", v276, 0x20u);

      uint64_t v175 = &OBJC_IVAR___NEIKEv2IKESA__error;
    }

    id v177 = objc_getProperty(v3, v176, v175[146], 1);
    id v133 = v177;
    if (v177) {
      id v177 = objc_getProperty(v177, v178, 24, 1);
    }
    id v254 = v177;
    uint64_t v179 = [v254 method];
    id v181 = objc_getProperty(v6, v180, 96, 1);
    uint64_t v183 = [(NEIKEv2IKESAProposal *)v181 kemProtocol];
    [v183 method];
    id v191 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu)", v184, v185, v186, v187, v188, v189, v190, v179);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v191);

LABEL_108:
LABEL_109:

    goto LABEL_110;
  }
  id v100 = objc_getProperty(v3, v99, 104, 1);
  SEL v102 = v100;
  if (v100) {
    id v100 = objc_getProperty(v100, v101, 32, 1);
  }
  id v103 = v100;
  objc_setProperty_atomic(v6, v104, v103, 152);

  id v105 = -[NEIKEv2Packet copyNotification:](v3, (const char *)0x4039);
  objc_setProperty_atomic(v6, v106, v105, 176);

  SEL v107 = &OBJC_IVAR___NEIKEv2IKESA__error;
  id v109 = objc_getProperty(v3, v108, 112, 1);

  if (!v109)
  {
    SEL v192 = ne_log_obj();
    if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
    {
      uint64_t v226 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v226;
      _os_log_error_impl(&dword_19DDAF000, v192, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", v276, 0xCu);
    }
    uint64_t v162 = @"Did not receive NONCE payload";
    goto LABEL_106;
  }
  SEL v111 = objc_getProperty(v3, v110, 112, 1);
  id v113 = v111;
  id v114 = &OBJC_IVAR___NEIKEv2IKESA__error;
  if (v111) {
    SEL v111 = objc_getProperty(v111, v112, 24, 1);
  }
  id v115 = v111;

  if (!v115)
  {
    id v207 = ne_log_obj();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
    {
      SEL v227 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412290;
      uint64_t v277 = v227;
      _os_log_error_impl(&dword_19DDAF000, v207, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", v276, 0xCu);
    }
    uint64_t v162 = @"Did not receive NONCE data";
LABEL_106:
    SEL v208 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v162, v155, v156, v157, v158, v159, v160, v161, v247);
LABEL_107:
    id v133 = v208;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v208);
    goto LABEL_108;
  }
  id v117 = objc_getProperty(v6, v116, 80, 1);
  int v118 = [v117 strictNonceSizeChecks];

  if (!v118) {
    goto LABEL_99;
  }
  SEL v120 = objc_getProperty(v3, v119, 112, 1);
  char v122 = v120;
  if (v120) {
    SEL v120 = objc_getProperty(v120, v121, 24, 1);
  }
  id v123 = v120;
  unint64_t v124 = [v123 length];

  if (v124 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
  {
    SEL v238 = ne_log_obj();
    if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
    {
      uint64_t v246 = (char *)[v3 copyShortDescription];
      *(_DWORD *)unint64_t v276 = 138412546;
      uint64_t v277 = v246;
      __int16 v278 = 2048;
      uint64_t v279 = (unsigned char *)v124;
      _os_log_error_impl(&dword_19DDAF000, v238, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", v276, 0x16u);
    }
    SEL v208 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is out of bounds", v239, v240, v241, v242, v243, v244, v245, v124);
    goto LABEL_107;
  }
  id v126 = objc_getProperty(v6, v125, 96, 1);
  id v128 = [(NEIKEv2IKESAProposal *)v126 prfProtocol];
  unsigned int v129 = [v128 nonceSize];

  BOOL v130 = v124 >= v129;
  SEL v107 = &OBJC_IVAR___NEIKEv2IKESA__error;
  id v114 = &OBJC_IVAR___NEIKEv2IKESA__error;
  if (!v130)
  {
    uint64_t v131 = ne_log_obj();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      SEL v228 = (char *)[v3 copyShortDescription];
      unint64_t v256 = v124;
      id v230 = objc_getProperty(v6, v229, 96, 1);
      uint64_t v232 = [(NEIKEv2IKESAProposal *)v230 prfProtocol];
      *(_DWORD *)unint64_t v276 = 138412802;
      uint64_t v277 = v228;
      __int16 v278 = 2048;
      uint64_t v279 = (unsigned char *)v256;
      __int16 v280 = 2112;
      uint64_t v281 = (uint64_t)v232;
      _os_log_error_impl(&dword_19DDAF000, v131, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", v276, 0x20u);

      unint64_t v124 = v256;
    }

    id v133 = objc_getProperty(v6, v132, 96, 1);
    char v248 = [(NEIKEv2IKESAProposal *)v133 prfProtocol];
    id v142 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is shorter than the minimum for PRF protocol %@", v135, v136, v137, v138, v139, v140, v141, v124);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v6, 3uLL, v142);

    goto LABEL_108;
  }
LABEL_99:
  uint64_t v193 = objc_getProperty(v3, v119, v107[147], 1);
  uint64_t v195 = v193;
  if (v193) {
    uint64_t v193 = objc_getProperty(v193, v194, v114[94], 1);
  }
  id v196 = v193;
  objc_setProperty_atomic(v6, v197, v196, 136);

  if ([(NEIKEv2IKESA *)*(void *)(a1 + 48) processPrimaryKeyExchange])
  {
    id v200 = *(void **)(a1 + 40);
    id v199 = *(void **)(a1 + 48);
    id v201 = *(void **)(a1 + 32);
    v257[0] = MEMORY[0x1E4F143A8];
    v257[1] = 3221225472;
    v257[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_584;
    v257[3] = &unk_1E5991A80;
    SEL v43 = &v258;
    id v202 = v199;
    id v258 = v202;
    id v203 = *(id *)(a1 + 56);
    uint64_t v204 = *(void *)(a1 + 32);
    id v205 = *(void **)(a1 + 40);
    id v259 = v203;
    uint64_t v260 = v204;
    id v261 = v205;
    -[NEIKEv2Session handleFollowupKEForRekeyIKESAInitiator:rekeyIKEContext:iteration:handler:](v201, v202, v200, 0, v257);

    goto LABEL_118;
  }
  uint64_t v233 = ne_log_obj();
  if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v233, OS_LOG_TYPE_ERROR, "Failed to process KE data (initiate rekey)", buf, 2u);
  }

  uint64_t v40 = [NEIKEv2DeleteIKEContext alloc];
  id v235 = *(id *)(a1 + 32);
  if (v235) {
    id v235 = objc_getProperty(v235, v234, 368, 1);
  }
  id v42 = v235;
  v262[0] = MEMORY[0x1E4F143A8];
  v262[1] = 3221225472;
  v262[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_580;
  v262[3] = &unk_1E5990580;
  SEL v43 = (id *)v263;
  id v236 = *(id *)(a1 + 40);
  uint64_t v237 = *(void *)(a1 + 32);
  v263[0] = v236;
  v263[1] = v237;
  id v46 = v262;
LABEL_117:
  char v214 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v40->super.super.isa, 0, v42, v46);

  -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 32), v214);
LABEL_118:
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_572(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to receive Create Child SA packet (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_576(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Create Child SA packet (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_580(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to process KE data (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_584(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2 && (-[NEIKEv2IKESA generateAllValuesUsingSA:](v2, *(void **)(a1 + 40)) & 1) != 0)
  {
    id v4 = [NEIKEv2DeleteIKEContext alloc];
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 368, 1);
    }
    id v6 = Property;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_589;
    v20[3] = &unk_1E5990788;
    uint64_t v7 = (id *)v21;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void **)(a1 + 56);
    v21[0] = v8;
    v21[1] = v9;
    uint64_t v22 = v10;
    uint64_t v11 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v4->super.super.isa, 1, v6, v20);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v11);
    uint64_t v12 = v22;
  }
  else
  {
    id v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Failed to generate IKE SA crypto values (initiate rekey)", buf, 2u);
    }

    uint64_t v15 = [NEIKEv2DeleteIKEContext alloc];
    id v16 = *(id *)(a1 + 48);
    if (v16) {
      id v16 = objc_getProperty(v16, v14, 368, 1);
    }
    id v17 = v16;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_585;
    v23[3] = &unk_1E5990580;
    uint64_t v7 = (id *)v24;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 48);
    v24[0] = v18;
    v24[1] = v19;
    uint64_t v12 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v15->super.super.isa, 0, v17, v23);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v12);
  }
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_585(uint64_t a1)
{
  [*(id *)(a1 + 32) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate IKE SA crypto values (initiate rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
  uint64_t v15 = *(void *)(a1 + 40);

  [(NEIKEv2Session *)v15 resetAll];
}

void __47__NEIKEv2Session_Exchange__initiateRekeyIKESA___block_invoke_2_589(uint64_t a1, int a2)
{
  if (a2)
  {
    -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 2uLL, 0);
    -[NEIKEv2Session setIKESA:](*(void *)(a1 + 40), *(void **)(a1 + 32));
    [*(id *)(a1 + 48) sendCallbackSuccess:1 session:*(void *)(a1 + 40)];
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "Rekeyed IKE SA", buf, 2u);
    }
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to process Create Child SA Delete packet response (initiate rekey)", (uint8_t *)&v18, 2u);
    }

    [*(id *)(a1 + 48) sendCallbackSuccess:0 session:*(void *)(a1 + 40)];
    id Property = *(id *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 336, 1);
    }
    id v7 = Property;
    uint64_t ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Create Child SA Delete packet response (initiate rekey)", v8, v9, v10, v11, v12, v13, v14, v18);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorPeerInvalidSyntax);

    [(NEIKEv2Session *)*(void **)(a1 + 40) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 40) resetAll];
  }
}

- (void)receiveRekeyIKESA:(void *)a1
{
  uint64_t v384 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336, 1);
    uint64_t v8 = v7;
    if (!v7)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[NEIKEv2Session(Exchange) receiveRekeyIKESA:]";
        _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null oldIKESA", buf, 0xCu);
      }
      goto LABEL_69;
    }
    if (v7[16])
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "IKE SA already rekeying, skipping (receive rekey)", buf, 2u);
      }
      goto LABEL_69;
    }
    v7[16] = 1;
    uint64_t v9 = -[NEIKEv2IKESA copyForRekey]((uint64_t)v7);
    if (!v9)
    {
      id v103 = ne_log_obj();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_ERROR, "Failed to create valid IKE SA (receive rekey)", buf, 2u);
      }

      SEL v104 = [NEIKEv2DeleteIKEContext alloc];
      id v106 = objc_getProperty(a1, v105, 368, 1);
      v372[0] = MEMORY[0x1E4F143A8];
      v372[1] = 3221225472;
      v372[2] = __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke;
      v372[3] = &unk_1E5990AD8;
      v372[4] = a1;
      SEL v107 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v104->super.super.isa, 0, v106, v372);

      -[NEIKEv2Session initiateDelete:](a1, v107);
      uint64_t v10 = 0;
      goto LABEL_69;
    }
    BYTE1(v9[1].isa) = 0;
    uint64_t v10 = v9;
    if ([(NEIKEv2Packet *)v4 hasErrors])
    {
      long long v382 = 0u;
      long long v383 = 0u;
      *(_OWORD *)__int16 v380 = 0u;
      long long v381 = 0u;
      if (v4) {
        id Property = objc_getProperty(v4, v12, 64, 1);
      }
      else {
        id Property = 0;
      }
      id ErrorPeerInvalidSyntax = Property;
      uint64_t v15 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:v380 objects:buf count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v381;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v381 != v17) {
              objc_enumerationMutation(ErrorPeerInvalidSyntax);
            }
            uint64_t v19 = *(__CFString **)(*(void *)&v380[8] + 8 * i);
            if (v19 && (unint64_t)(v19->length - 1) <= 0x3FFE)
            {
              SEL v108 = -[NEIKEv2NotifyPayload copyError](v19);
              id v109 = ne_log_obj();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              {
                long long v271 = (void *)[v4 copyShortDescription];
                *(_DWORD *)uint64_t v373 = 138412546;
                long long v374 = v271;
                __int16 v375 = 2112;
                unint64_t v376 = (unint64_t)v108;
                _os_log_error_impl(&dword_19DDAF000, v109, OS_LOG_TYPE_ERROR, "%@ Responder rekey IKE received notify error %@", v373, 0x16u);
              }
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v108);

              goto LABEL_61;
            }
          }
          uint64_t v16 = [ErrorPeerInvalidSyntax countByEnumeratingWithState:v380 objects:buf count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
    SEL v20 = &OBJC_IVAR___NEIKEv2IKESA__error;
    uint64_t v21 = objc_getProperty(v4, v12, 88, 1);
    id v23 = v21;
    if (v21) {
      uint64_t v21 = objc_getProperty(v21, v22, 32, 1);
    }
    id v24 = v21;
    uint64_t v25 = [v24 value];

    if (!v25)
    {
      id v110 = ne_log_obj();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        long long v272 = (void *)[v4 copyShortDescription];
        *(_DWORD *)uint64_t v373 = 138412290;
        long long v374 = v272;
        _os_log_error_impl(&dword_19DDAF000, v110, OS_LOG_TYPE_ERROR, "%@ SA proposal missing rekey SPI", v373, 0xCu);
      }
      id ErrorPeerInvalidSyntax = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"SA proposal missing rekey SPI", v111, v112, v113, v114, v115, v116, v117, v361);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, ErrorPeerInvalidSyntax);
LABEL_61:

      v8[16] = 0;
      unint64_t v102 = 7;
      goto LABEL_62;
    }
    SEL v27 = objc_getProperty(v4, v26, 88, 1);
    id v29 = v27;
    if (v27) {
      SEL v27 = objc_getProperty(v27, v28, 32, 1);
    }
    id v30 = v27;
    -[NEIKEv2IKESA assignRemoteSPI:](v10, v30);

    id v32 = objc_getProperty(v4, v31, 88, 1);
    uint64_t v34 = v32;
    if (v32) {
      id v32 = objc_getProperty(v32, v33, 24, 1);
    }
    id v35 = v32;

    uint64_t v36 = v35;
    id v38 = objc_getProperty(v10, v37, 80, 1);
    SEL v39 = [v38 proposals];

    uint64_t v366 = v39;
    if ([v36 count])
    {
      id v41 = objc_getProperty(v10, v40, 80, 1);
      id v42 = +[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]((uint64_t)NEIKEv2IKESAProposal, v39, v36, [v41 preferInitiatorProposalOrder]);
      objc_setProperty_atomic(v10, v43, v42, 96);

      id v45 = objc_getProperty(v10, v44, 96, 1);
      if (!v45)
      {
        uint64_t v148 = ne_log_obj();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          uint64_t v282 = (void *)[v4 copyShortDescription];
          *(_DWORD *)uint64_t v373 = 138412290;
          long long v374 = v282;
          _os_log_error_impl(&dword_19DDAF000, v148, OS_LOG_TYPE_ERROR, "%@ No matching proposal found", v373, 0xCu);
        }
        id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"No matching proposal found", v149, v150, v151, v152, v153, v154, v155, v361);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
        char v101 = 0;
        unint64_t v102 = 14;
        goto LABEL_87;
      }
      uint64_t v47 = objc_getProperty(v4, v46, 104, 1);

      if (v47)
      {
        uint64_t v49 = objc_getProperty(v4, v48, 104, 1);
        uint64_t v51 = v49;
        if (v49) {
          uint64_t v49 = objc_getProperty(v49, v50, 24, 1);
        }
        id v52 = v49;

        if (v52)
        {
          uint64_t v54 = objc_getProperty(v4, v53, 104, 1);
          SEL v56 = v54;
          if (v54) {
            uint64_t v54 = objc_getProperty(v54, v55, 32, 1);
          }
          id v57 = v54;

          if (v57)
          {
            uint64_t v59 = objc_getProperty(v4, v58, 104, 1);
            uint64_t v61 = v59;
            __int16 v365 = v36;
            if (v59) {
              uint64_t v59 = objc_getProperty(v59, v60, 24, 1);
            }
            id v62 = v59;
            uint64_t v63 = [v62 method];
            id v65 = objc_getProperty(v10, v64, 96, 1);
            uint64_t v67 = [(NEIKEv2IKESAProposal *)v65 kemProtocol];
            uint64_t v68 = [v67 method];

            if (v63 != v68)
            {
              SEL v252 = ne_log_obj();
              uint64_t v253 = &OBJC_IVAR___NEIKEv2IKESA__error;
              if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
              {
                unint64_t v364 = (void *)[v4 copyShortDescription];
                uint64_t v334 = objc_getProperty(v4, v333, 104, 1);
                int v336 = v334;
                if (v334) {
                  uint64_t v334 = objc_getProperty(v334, v335, 24, 1);
                }
                id v363 = v334;
                uint64_t v337 = [v363 method];
                id v339 = objc_getProperty(v10, v338, 96, 1);
                id v341 = [(NEIKEv2IKESAProposal *)v339 kemProtocol];
                *(_DWORD *)uint64_t v373 = 138412802;
                long long v374 = v364;
                __int16 v375 = 2048;
                unint64_t v376 = v337;
                __int16 v377 = 2048;
                uint64_t v378 = [v341 method];
                _os_log_error_impl(&dword_19DDAF000, v252, OS_LOG_TYPE_ERROR, "%@ Received KE method %zu does not match KE method %zu in SA rekey proposal", v373, 0x20u);

                uint64_t v253 = &OBJC_IVAR___NEIKEv2IKESA__error;
              }

              id v100 = (id)[v4 copyShortDescription];
              uint64_t v255 = objc_getProperty(v4, v254, v253[146], 1);
              uint64_t v257 = v255;
              if (v255) {
                uint64_t v255 = objc_getProperty(v255, v256, 24, 1);
              }
              id v258 = v255;
              [v258 method];
              id v260 = objc_getProperty(v10, v259, 96, 1);
              uint64_t v262 = [(NEIKEv2IKESAProposal *)v260 kemProtocol];
              [v262 method];
              long long v270 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received KE method %zu does not match KE method %zu in SA rekey proposal", v263, v264, v265, v266, v267, v268, v269, (uint64_t)v100);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v270);

              char v101 = 0;
              unint64_t v102 = 17;
              goto LABEL_155;
            }
            uint64_t v70 = objc_getProperty(v4, v69, 104, 1);
            uint64_t v72 = v70;
            uint64_t v36 = v365;
            if (v70) {
              uint64_t v70 = objc_getProperty(v70, v71, 32, 1);
            }
            id v73 = v70;
            objc_setProperty_atomic(v10, v74, v73, 152);

            SEL v76 = objc_getProperty(v4, v75, 112, 1);

            if (!v76)
            {
              long long v274 = ne_log_obj();
              if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
              {
                uint64_t v342 = (void *)[v4 copyShortDescription];
                *(_DWORD *)uint64_t v373 = 138412290;
                long long v374 = v342;
                _os_log_error_impl(&dword_19DDAF000, v274, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", v373, 0xCu);
              }
              id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive NONCE payload", v275, v276, v277, v278, v279, v280, v281, v361);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
              char v101 = 0;
              unint64_t v102 = 7;
              goto LABEL_137;
            }
            id v78 = objc_getProperty(v4, v77, 112, 1);
            id v80 = v78;
            if (v78) {
              id v78 = objc_getProperty(v78, v79, 24, 1);
            }
            id v81 = v78;

            if (!v81)
            {
              uint64_t v303 = ne_log_obj();
              if (os_log_type_enabled(v303, OS_LOG_TYPE_ERROR))
              {
                id v352 = (void *)[v4 copyShortDescription];
                *(_DWORD *)uint64_t v373 = 138412290;
                long long v374 = v352;
                _os_log_error_impl(&dword_19DDAF000, v303, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", v373, 0xCu);
              }
              id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive NONCE data", v304, v305, v306, v307, v308, v309, v310, v361);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
              goto LABEL_154;
            }
            id v83 = objc_getProperty(v10, v82, 80, 1);
            int v84 = [v83 strictNonceSizeChecks];

            if (v84)
            {
              id v86 = objc_getProperty(v4, v85, 112, 1);
              id v88 = v86;
              if (v86) {
                id v86 = objc_getProperty(v86, v87, 24, 1);
              }
              id v89 = v86;
              unint64_t v90 = [v89 length];

              if (v90 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
              {
                SEL v92 = ne_log_obj();
                uint64_t v36 = v365;
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  id v353 = (void *)[v4 copyShortDescription];
                  *(_DWORD *)uint64_t v373 = 138412546;
                  long long v374 = v353;
                  __int16 v375 = 2048;
                  unint64_t v376 = v90;
                  _os_log_error_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", v373, 0x16u);
                }
                id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is out of bounds", v93, v94, v95, v96, v97, v98, v99, v90);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
                char v101 = 0;
                unint64_t v102 = 7;
LABEL_137:
                SEL v20 = &OBJC_IVAR___NEIKEv2IKESA__error;
                goto LABEL_87;
              }
              id v313 = objc_getProperty(v10, v91, 96, 1);
              uint64_t v315 = [(NEIKEv2IKESAProposal *)v313 prfProtocol];
              unsigned int v316 = [v315 nonceSize];

              if (v90 < v316)
              {
                id v317 = ne_log_obj();
                if (os_log_type_enabled(v317, OS_LOG_TYPE_ERROR))
                {
                  SEL v354 = (void *)[v4 copyShortDescription];
                  id v356 = objc_getProperty(v10, v355, 96, 1);
                  id v358 = [(NEIKEv2IKESAProposal *)v356 prfProtocol];
                  *(_DWORD *)uint64_t v373 = 138412802;
                  long long v374 = v354;
                  __int16 v375 = 2048;
                  unint64_t v376 = v90;
                  __int16 v377 = 2112;
                  uint64_t v378 = (uint64_t)v358;
                  _os_log_error_impl(&dword_19DDAF000, v317, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", v373, 0x20u);
                }
                id v100 = objc_getProperty(v10, v318, 96, 1);
                uint64_t v362 = [(NEIKEv2IKESAProposal *)v100 prfProtocol];
                uint64_t v327 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is shorter than the minimum for PRF protocol %@", v320, v321, v322, v323, v324, v325, v326, v90);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v327);

LABEL_154:
                char v101 = 0;
                unint64_t v102 = 7;
LABEL_155:
                SEL v20 = &OBJC_IVAR___NEIKEv2IKESA__error;
                uint64_t v36 = v365;
                goto LABEL_87;
              }
            }
            uint64_t v328 = objc_getProperty(v4, v85, 112, 1);
            id v100 = v328;
            uint64_t v36 = v365;
            if (v328) {
              uint64_t v328 = objc_getProperty(v328, v329, 24, 1);
            }
            SEL v20 = &OBJC_IVAR___NEIKEv2IKESA__error;
            id v330 = v328;
            objc_setProperty_atomic(v10, v331, v330, 136);

            char v101 = 1;
            unint64_t v102 = 7;
LABEL_87:

            if (v101)
            {
              if ([(NEIKEv2IKESA *)v10 generateInitialValues])
              {
                if ([(NEIKEv2IKESA *)v10 processCurrentKeyExchange])
                {
                  id v161 = v4;
                  uint64_t v10 = v10;
                  self;
                  id v163 = objc_getProperty(v10, v162, 96, 1);

                  if (v163)
                  {
                    uint64_t v164 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2CreateChildPacket alloc], v161);
                    if (v164)
                    {
                      uint64_t v165 = v164;
                      id v367 = v161;
                      id v166 = objc_alloc_init(NEIKEv2IKESAPayload);
                      objc_setProperty_atomic(v165, v167, v166, v20[144]);

                      id v169 = objc_getProperty(v10, v168, 96, 1);
                      *(void *)__int16 v380 = v169;
                      SEL v170 = [MEMORY[0x1E4F1C978] arrayWithObjects:v380 count:1];
                      id v171 = v20;
                      unint64_t v173 = objc_getProperty(v165, v172, v20[144], 1);
                      uint64_t v175 = v173;
                      if (v173) {
                        objc_setProperty_atomic(v173, v174, v170, 24);
                      }

                      id v177 = objc_getProperty(v10, v176, 32, 1);
                      uint64_t v179 = objc_getProperty(v165, v178, v171[144], 1);
                      id v181 = v179;
                      if (v179) {
                        objc_setProperty_atomic(v179, v180, v177, 32);
                      }

                      uint64_t v183 = objc_getProperty(v165, v182, v171[144], 1);
                      char v184 = -[NEIKEv2Payload isValid]((uint64_t)v183);

                      if (v184)
                      {
                        uint64_t v185 = objc_alloc_init(NEIKEv2NoncePayload);
                        objc_setProperty_atomic(v165, v186, v185, 112);

                        id v188 = objc_getProperty(v10, v187, 128, 1);
                        uint64_t v190 = objc_getProperty(v165, v189, 112, 1);
                        SEL v192 = v190;
                        if (v190) {
                          objc_setProperty_atomic(v190, v191, v188, 24);
                        }

                        uint64_t v194 = objc_getProperty(v165, v193, 112, 1);
                        char v195 = -[NEIKEv2Payload isValid]((uint64_t)v194);

                        if (v195)
                        {
                          id v196 = objc_alloc_init(NEIKEv2KeyExchangePayload);
                          objc_setProperty_atomic(v165, v197, v196, 104);

                          id v199 = objc_getProperty(v10, v198, 96, 1);
                          id v201 = [(NEIKEv2IKESAProposal *)v199 kemProtocol];
                          id v203 = objc_getProperty(v165, v202, 104, 1);
                          id v205 = v203;
                          if (v203) {
                            objc_setProperty_atomic(v203, v204, v201, 24);
                          }

                          id v207 = objc_getProperty(v10, v206, 160, 1);
                          SEL v208 = v207;
                          if (v207) {
                            uint64_t v209 = (void *)*((void *)v207 + 2);
                          }
                          else {
                            uint64_t v209 = 0;
                          }
                          id v210 = v209;
                          id v212 = objc_getProperty(v165, v211, 104, 1);
                          char v214 = v212;
                          if (v212) {
                            objc_setProperty_atomic(v212, v213, v210, 32);
                          }

                          id v216 = objc_getProperty(v165, v215, 104, 1);
                          char v217 = -[NEIKEv2Payload isValid]((uint64_t)v216);

                          if (v217)
                          {
                            id v219 = objc_getProperty(v10, v218, 96, 1);
                            SEL v221 = v219;
                            if (v219) {
                              id v219 = objc_getProperty(v219, v220, 120, 1);
                            }
                            id v222 = v219;

                            if (v222)
                            {
                              uint64_t v223 = [MEMORY[0x1E4F29128] UUID];
                              *(_OWORD *)buf = 0uLL;
                              [v223 getUUIDBytes:buf];
                              uint64_t v224 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:16];
                              uint64_t v225 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4039uLL, v224);
                              objc_setProperty_atomic(v10, v226, v225, 176);

                              id v228 = objc_getProperty(v10, v227, 176, 1);
                              -[NEIKEv2Packet addNotifyPayload:](v165, v228);
                            }
                            uint64_t v165 = v165;
                            SEL v229 = v165;
                            goto LABEL_142;
                          }
                          id v250 = ne_log_obj();
                          if (os_log_type_enabled(v250, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 136315138;
                            *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:ikeSA:]";
                            uint64_t v251 = "%s called with null packet.ke.isValid";
                            goto LABEL_140;
                          }
LABEL_141:

                          SEL v229 = 0;
LABEL_142:
                          id v161 = v367;
                          goto LABEL_143;
                        }
                        id v250 = ne_log_obj();
                        if (!os_log_type_enabled(v250, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_141;
                        }
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:ikeSA:]";
                        uint64_t v251 = "%s called with null packet.nonce.isValid";
                      }
                      else
                      {
                        id v250 = ne_log_obj();
                        if (!os_log_type_enabled(v250, OS_LOG_TYPE_FAULT)) {
                          goto LABEL_141;
                        }
                        *(_DWORD *)buf = 136315138;
                        *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:ikeSA:]";
                        uint64_t v251 = "%s called with null packet.ikeSA.isValid";
                      }
LABEL_140:
                      _os_log_fault_impl(&dword_19DDAF000, v250, OS_LOG_TYPE_FAULT, v251, buf, 0xCu);
                      goto LABEL_141;
                    }
                    uint64_t v249 = ne_log_obj();
                    if (os_log_type_enabled(v249, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, v249, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed", buf, 2u);
                    }

                    uint64_t v165 = 0;
                  }
                  else
                  {
                    uint64_t v165 = ne_log_obj();
                    if (os_log_type_enabled(v165, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      *(void *)&uint8_t buf[4] = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyResponse:ikeSA:]";
                      _os_log_fault_impl(&dword_19DDAF000, v165, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.chosenProposal", buf, 0xCu);
                    }
                  }
                  SEL v229 = 0;
LABEL_143:

                  if (v229)
                  {
                    id v284 = objc_getProperty(v10, v283, 160, 1);
                    uint64_t v285 = v284;
                    if (v284) {
                      uint64_t v286 = (void *)*((void *)v284 + 3);
                    }
                    else {
                      uint64_t v286 = 0;
                    }
                    id v287 = v286;
                    objc_setProperty_atomic(v10, v288, v287, 168);

                    objc_setProperty_atomic(v10, v289, 0, 160);
                    v368[0] = MEMORY[0x1E4F143A8];
                    v368[1] = 3221225472;
                    v368[2] = __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_617;
                    v368[3] = &unk_1E5990918;
                    long long v369 = v10;
                    long long v370 = v8;
                    long long v371 = a1;
                    -[NEIKEv2Session handleFollowupKEForRekeyIKESAResponder:iteration:replyPacket:replyPacketDescription:handler:](a1, v369, 0, v229, @"rekey IKE SA reply", v368);
                  }
                  else
                  {
                    uint64_t v290 = ne_log_obj();
                    if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_19DDAF000, v290, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet (receive rekey)", buf, 2u);
                    }

                    id v292 = objc_getProperty(a1, v291, 336, 1);
                    uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet (receive rekey)", v293, v294, v295, v296, v297, v298, v299, v361);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v292, 3uLL, ErrorInternal);

                    [(NEIKEv2Session *)a1 reportState];
                    [(NEIKEv2Session *)(uint64_t)a1 resetAll];
                  }

                  goto LABEL_69;
                }
                char v359 = ne_log_obj();
                if (os_log_type_enabled(v359, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v359, OS_LOG_TYPE_ERROR, "Failed to process KE data (receive rekey)", buf, 2u);
                }

                id v244 = objc_getProperty(a1, v360, 336, 1);
                uint64_t v245 = @"Failed to process KE data (receive rekey)";
              }
              else
              {
                id v235 = ne_log_obj();
                if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19DDAF000, v235, OS_LOG_TYPE_ERROR, "Failed to generate local IKE crypto values (receive rekey)", buf, 2u);
                }

                id v244 = objc_getProperty(a1, v236, 336, 1);
                uint64_t v245 = @"Failed to generate local IKE crypto values (receive rekey)";
              }
              id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(v245, v237, v238, v239, v240, v241, v242, v243, v361);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v244, 3uLL, ErrorCrypto);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
LABEL_69:

              goto LABEL_70;
            }
            v8[16] = 0;
            if (v102 == 17)
            {
              id v230 = objc_getProperty(v10, v159, 96, 1);
              uint64_t v232 = [(NEIKEv2IKESAProposal *)v230 kemProtocol];
              unsigned int v233 = bswap32([v232 method]) >> 16;

              *(_WORD *)buf = v233;
              id v234 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:2];
              int v118 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, v4, 0x11uLL, v234);

              if (v118)
              {
                if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v118, 0)) {
                  goto LABEL_68;
                }
                goto LABEL_66;
              }
              unsigned int v343 = ne_log_obj();
              if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)__int16 v380 = 0;
                _os_log_error_impl(&dword_19DDAF000, v343, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet (receive rekey)", v380, 2u);
              }
              goto LABEL_170;
            }
LABEL_62:
            int v118 = +[NEIKEv2CreateChildPacket createChildSAResponse:errorCode:errorData:]((uint64_t)NEIKEv2CreateChildPacket, v4, v102, 0);
            if (v118)
            {
              if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v118, 0))
              {
                if (v102 == 14)
                {
LABEL_68:

                  goto LABEL_69;
                }
                id v120 = objc_getProperty(a1, v119, 336, 1);
                uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Create Child SA packet (receive rekey)", v121, v122, v123, v124, v125, v126, v127, v361);
LABEL_67:
                uint64_t v136 = ErrorFailedToSend;
                -[NEIKEv2IKESA setState:error:]((uint64_t)v120, 3uLL, ErrorFailedToSend);

                [(NEIKEv2Session *)a1 reportState];
                [(NEIKEv2Session *)(uint64_t)a1 resetAll];
                goto LABEL_68;
              }
LABEL_66:
              id v120 = objc_getProperty(a1, v119, 336, 1);
              uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"rekey IKE SA refusal", v129, v130, v131, v132, v133, v134, v135, v361);
              goto LABEL_67;
            }
            unsigned int v343 = ne_log_obj();
            if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v343, OS_LOG_TYPE_ERROR, "Failed to create Create Child SA packet (receive rekey)", buf, 2u);
            }
LABEL_170:

            id v120 = objc_getProperty(a1, v344, 336, 1);
            uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal(@"Failed to create Create Child SA packet (receive rekey)", v345, v346, v347, v348, v349, v350, v351, v361);
            goto LABEL_67;
          }
          uint64_t v158 = ne_log_obj();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
          {
            uint64_t v332 = (void *)[v4 copyShortDescription];
            *(_DWORD *)uint64_t v373 = 138412290;
            long long v374 = v332;
            _os_log_error_impl(&dword_19DDAF000, v158, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", v373, 0xCu);
          }
          uint64_t v147 = @"Did not receive data in KE payload";
        }
        else
        {
          uint64_t v157 = ne_log_obj();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            uint64_t v312 = (void *)[v4 copyShortDescription];
            *(_DWORD *)uint64_t v373 = 138412290;
            long long v374 = v312;
            _os_log_error_impl(&dword_19DDAF000, v157, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", v373, 0xCu);
          }
          uint64_t v147 = @"Did not receive method in KE payload";
        }
      }
      else
      {
        uint64_t v156 = ne_log_obj();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        {
          uint64_t v311 = (void *)[v4 copyShortDescription];
          *(_DWORD *)uint64_t v373 = 138412290;
          long long v374 = v311;
          _os_log_error_impl(&dword_19DDAF000, v156, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", v373, 0xCu);
        }
        uint64_t v147 = @"Did not receive KE payload";
      }
    }
    else
    {
      uint64_t v139 = ne_log_obj();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        long long v273 = (void *)[v4 copyShortDescription];
        *(_DWORD *)uint64_t v373 = 138412290;
        long long v374 = v273;
        _os_log_error_impl(&dword_19DDAF000, v139, OS_LOG_TYPE_ERROR, "%@ Received no SA proposals", v373, 0xCu);
      }
      uint64_t v147 = @"Received no SA proposals";
    }
    id v100 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(v147, v140, v141, v142, v143, v144, v145, v146, v361);
    -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, v100);
    char v101 = 0;
    unint64_t v102 = 7;
    goto LABEL_87;
  }
LABEL_70:
}

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  uint64_t ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Failed to create valid IKE SA (receive rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorInternal);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_617(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4 || (-[NEIKEv2IKESA generateAllValuesUsingSA:](v4, *(void **)(a1 + 40)) & 1) == 0)
  {
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Failed to generate IKE SA crypto values (receive rekey)", buf, 2u);
    }

    uint64_t v11 = [NEIKEv2DeleteIKEContext alloc];
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v10, 368, 1);
    }
    id v13 = Property;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_618;
    v53[3] = &unk_1E5990AD8;
    v53[4] = *(void *)(a1 + 48);
    uint64_t v6 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v11->super.super.isa, 0, v13, v53);

    -[NEIKEv2Session initiateDelete:](*(void **)(a1 + 48), v6);
    goto LABEL_29;
  }
  if (v3 && ([(NEIKEv2InformationalPacket *)v3 isDeleteIKE] & 1) != 0)
  {
    uint64_t v6 = +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]((uint64_t)NEIKEv2InformationalPacket, v3, 0);
    if (v6)
    {
      if (-[NEIKEv2Session sendReply:replyHandler:](*(void *)(a1 + 48), v6, 0))
      {
        -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 32), 2uLL, 0);
        -[NEIKEv2Session setIKESA:](*(void *)(a1 + 48), *(void **)(a1 + 32));
        uint64_t v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "Rekeyed IKE SA", buf, 2u);
        }

        goto LABEL_29;
      }
      id v40 = *(id *)(a1 + 48);
      if (v40) {
        id v40 = objc_getProperty(v40, v7, 336, 1);
      }
      id v31 = v40;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete reply", v41, v42, v43, v44, v45, v46, v47, v52);
    }
    else
    {
      id v28 = ne_log_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v51;
        _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE Delete response packet", buf, 0xCu);
      }

      id v30 = *(id *)(a1 + 48);
      if (v30) {
        id v30 = objc_getProperty(v30, v29, 336, 1);
      }
      id v31 = v30;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE Delete response packet (receive rekey)", v32, v33, v34, v35, v36, v37, v38, v52);
    }
    id v48 = ErrorFailedToSend;
    -[NEIKEv2IKESA setState:error:]((uint64_t)v31, 3uLL, ErrorFailedToSend);

    [(NEIKEv2Session *)*(void **)(a1 + 48) reportState];
    [(NEIKEv2Session *)*(void *)(a1 + 48) resetAll];
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Failed to process Rekey IKE Delete packet (receive rekey)", buf, 2u);
  }

  id v16 = *(id *)(a1 + 48);
  if (v16) {
    id v16 = objc_getProperty(v16, v15, 336, 1);
  }
  id v17 = v16;
  id ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Failed to process Rekey IKE Delete packet (receive rekey)", v18, v19, v20, v21, v22, v23, v24, v52);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v17, 3uLL, ErrorPeerInvalidSyntax);

  [(NEIKEv2Session *)*(void **)(a1 + 48) reportState];
  [(NEIKEv2Session *)*(void *)(a1 + 48) resetAll];
LABEL_30:
}

void __46__NEIKEv2Session_Exchange__receiveRekeyIKESA___block_invoke_618(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  id v4 = Property;
  id ErrorCrypto = (void *)NEIKEv2CreateErrorCrypto(@"Failed to generate IKE SA crypto values (receive rekey)", v5, v6, v7, v8, v9, v10, v11, v16);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v4, 3uLL, ErrorCrypto);

  [(NEIKEv2Session *)*(void **)(a1 + 32) reportState];
  uint64_t v15 = *(void *)(a1 + 32);

  [(NEIKEv2Session *)v15 resetAll];
}

- (void)receiveMOBIKE:(void *)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336, 1);
    if (!v7)
    {
      uint64_t v35 = ne_log_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v65 = "-[NEIKEv2Session(Exchange) receiveMOBIKE:]";
        _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (-[NEIKEv2InformationalPacket isMOBIKE](v4) & 1) == 0)
    {
      uint64_t v35 = ne_log_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v37 = "Failed to receive MOBIKE packet";
LABEL_39:
        _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }
      goto LABEL_29;
    }
    id v8 = v7;
    if ([(NEIKEv2Packet *)v4 hasErrors])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v55 = v8;
      if (v4) {
        id Property = objc_getProperty(v4, v10, 64, 1);
      }
      else {
        id Property = 0;
      }
      id v12 = Property;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v57;
LABEL_10:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * v16);
          if (v17)
          {
            if ((unint64_t)(*(void *)(v17 + 24) - 1) <= 0x3FFE) {
              break;
            }
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v14) {
              goto LABEL_10;
            }
            goto LABEL_17;
          }
        }
        uint64_t v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = (void *)[v4 copyShortDescription];
          *(_DWORD *)uint64_t v60 = 138412546;
          uint64_t v61 = v53;
          __int16 v62 = 2112;
          uint64_t v63 = v17;
          _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%@ MOBIKE received notify error %@", v60, 0x16u);
        }
        uint64_t v35 = ne_log_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v37 = "Failed to process MOBIKE packet";
          goto LABEL_39;
        }
        goto LABEL_29;
      }
LABEL_17:

      id v8 = v55;
    }
    uint64_t v18 = -[NEIKEv2Packet copyNotification:](v4, (const char *)0x4011);
    uint64_t v20 = v18;
    if (v18) {
      uint64_t v18 = objc_getProperty(v18, v19, 32, 1);
    }
    id v21 = v18;

    if (v21)
    {
      if (v20) {
        id v23 = objc_getProperty(v20, v22, 32, 1);
      }
      else {
        id v23 = 0;
      }
      id v24 = v23;
      objc_setProperty_atomic(v8, v25, v24, 288);
    }
    id v26 = v4;
    id v27 = v8;
    self;
    uint64_t v28 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2InformationalPacket alloc], v26);
    if (v28)
    {
      id v30 = v28;
      id v31 = objc_getProperty(v27, v29, 288, 1);

      if (!v31
        || (objc_getProperty(v27, v32, 288, 1),
            uint64_t v33 = objc_claimAutoreleasedReturnValue(),
            BOOL v34 = -[NEIKEv2Packet addNotification:data:](v30, 0x4011uLL, v33),
            v33,
            v34))
      {
        id v30 = v30;
        uint64_t v35 = v30;
        goto LABEL_44;
      }
      SEL v39 = ne_log_obj();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeCookie2] failed", buf, 2u);
      }
    }
    else
    {
      uint64_t v38 = ne_log_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
      }

      id v30 = 0;
    }
    uint64_t v35 = 0;
LABEL_44:

    if (v35)
    {
      if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v35, 0) & 1) == 0)
      {
        id v41 = objc_getProperty(a1, v40, 336, 1);
        uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"MOBIKE reply", v42, v43, v44, v45, v46, v47, v48, v54);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v41, 3uLL, ErrorFailedToSend);

        [(NEIKEv2Session *)a1 reportState];
        [(NEIKEv2Session *)(uint64_t)a1 resetAll];
      }
    }
    else
    {
      uint64_t v52 = ne_log_obj();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, "Failed to create MOBIKE packet", buf, 2u);
      }

      uint64_t v35 = 0;
    }
LABEL_29:
  }
}

- (void)receiveRedirect:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (-[NEIKEv2Packet hasNotification:](v4, (const char *)0x4017))
    {
      if (v4)
      {
        int v7 = [(NEIKEv2Packet *)v4 hasErrors];
        id v8 = ne_log_obj();
        uint64_t v9 = v8;
        if (!v7)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Received server redirect", buf, 2u);
          }

          -[NEIKEv2Session reportServerRedirect:](a1, v4);
          id v12 = +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]((uint64_t)NEIKEv2InformationalPacket, v4, 0);
          if (v12)
          {
            uint64_t v9 = v12;
            if ((-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v12, 0) & 1) == 0)
            {
              id v14 = objc_getProperty(a1, v13, 336, 1);
              uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"redirect reply", v15, v16, v17, v18, v19, v20, v21, v26);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v14, 3uLL, ErrorFailedToSend);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
            }
          }
          else
          {
            SEL v25 = ne_log_obj();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v26) = 0;
              _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Failed to create REDIRECT response packet", (uint8_t *)&v26, 2u);
            }

            uint64_t v9 = 0;
          }
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v9 = ne_log_obj();
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = 0;
        uint64_t v10 = "Failed to process redirect packet";
        uint64_t v11 = (uint8_t *)&v28;
LABEL_20:
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      }
    }
    else
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v29 = 0;
        uint64_t v10 = "Failed to receive redirect packet";
        uint64_t v11 = v29;
        goto LABEL_20;
      }
    }
LABEL_9:
  }
}

- (void)receiveDeleteIKESA:(void *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v7 = objc_getProperty(a1, v6, 336, 1);
    if (!v7)
    {
      BOOL v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v35 = 136315138;
        *(void *)&v35[4] = "-[NEIKEv2Session(Exchange) receiveDeleteIKESA:]";
        _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v35, 0xCu);
      }

      goto LABEL_17;
    }
    id v8 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v8 && ![(NEIKEv2Packet *)v8 hasErrors])
      {
        uint64_t v20 = +[NEIKEv2InformationalPacket createInformationalResponse:ikeSA:]((uint64_t)NEIKEv2InformationalPacket, v8, 0);
        if (v20)
        {
          uint64_t v10 = v20;
          if (-[NEIKEv2Session sendReply:replyHandler:]((uint64_t)a1, v20, 0))
          {
            char v12 = 1;
LABEL_10:

            uint64_t v13 = ne_log_large_obj();
            id v14 = v13;
            if (v12)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v35 = 138412546;
                *(void *)&v35[4] = a1;
                __int16 v36 = 2112;
                id v37 = v7;
                _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEFAULT, "%@ Received IKE SA Delete %@", v35, 0x16u);
              }

              id v16 = objc_getProperty(a1, v15, 336, 1);
              id Error = (void *)NEIKEv2CreateError(14);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v16, 3uLL, Error);

              [(NEIKEv2Session *)a1 reportState];
              [(NEIKEv2Session *)(uint64_t)a1 resetAll];
            }
            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint64_t v35 = 138412546;
                *(void *)&v35[4] = a1;
                __int16 v36 = 2112;
                id v37 = v7;
                _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to process received IKE SA Delete %@", v35, 0x16u);
              }
            }
LABEL_17:

            goto LABEL_18;
          }
          id v23 = objc_getProperty(a1, v21, 336, 1);
          uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"delete reply", v24, v25, v26, v27, v28, v29, v30, *(uint64_t *)v35);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v23, 3uLL, ErrorFailedToSend);

          [(NEIKEv2Session *)a1 reportState];
          [(NEIKEv2Session *)(uint64_t)a1 resetAll];
        }
        else
        {
          uint64_t v22 = ne_log_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v35 = 138412290;
            *(void *)&v35[4] = a1;
            _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@ Failed to create Delete packet", v35, 0xCu);
          }

          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v35 = 138412290;
          *(void *)&v35[4] = a1;
          uint64_t v11 = "%@ Failed to process Delete packet";
LABEL_27:
          _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, v11, v35, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v35 = 138412290;
        *(void *)&v35[4] = a1;
        uint64_t v11 = "%@ Failed to receive Delete packet";
        goto LABEL_27;
      }
    }
    char v12 = 0;
    goto LABEL_10;
  }
LABEL_18:
}

- (void)receiveDeleteChildSA:(void *)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(v5);

    id v8 = objc_getProperty(a1, v6, 336, 1);
    if (!v8)
    {
      char v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v69 = "-[NEIKEv2Session(Exchange) receiveDeleteChildSA:]";
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
      }
      goto LABEL_44;
    }
    uint64_t v9 = objc_getProperty(v4, v7, 88, 1);
    uint64_t v10 = [v9 firstObject];

    char v12 = v10;
    if (v10) {
      id Property = objc_getProperty(v10, v11, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v14 = Property;
    SEL v15 = [v14 firstObject];

    id v16 = -[NEIKEv2Session copyChildWithSPI:](a1, v15);
    id v63 = v8;
    if (v16)
    {
      uint64_t v18 = v16;
      id v19 = objc_getProperty(v16, v17, 56, 1);
      uint64_t v21 = v19;
      if (v19) {
        id v19 = objc_getProperty(v19, v20, 80, 1);
      }
      id v22 = v19;
      id v24 = objc_getProperty(v18, v23, 56, 1);
      uint64_t v26 = v24;
      if (v24) {
        id v24 = objc_getProperty(v24, v25, 88, 1);
      }
      id v27 = v24;
      char v28 = -[NEIKEv2Session receiveDeleteChildSPI:remoteSPI:packet:](a1, v22, v27, v4);

      uint64_t v29 = ne_log_large_obj();
      uint64_t v30 = v29;
      if (v28)
      {
        uint64_t v32 = v15;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = objc_getProperty(v18, v31, 56, 1);
          uint64_t v35 = v33;
          if (v33) {
            id v33 = objc_getProperty(v33, v34, 88, 1);
          }
          __int16 v36 = v33;
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          uint64_t v71 = v36;
          _os_log_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_DEFAULT, "%@ Received Child SA Delete for remote SPI %@", buf, 0x16u);
        }
        -[NEIKEv2ChildSA setState:error:]((uint64_t)v18, 3uLL, 0);
        [(NEIKEv2Session *)a1 reportState];
        -[NEIKEv2Session resetChild:]((char *)a1, v18);
        id v8 = v63;
        goto LABEL_43;
      }
      id v8 = v63;
      uint64_t v32 = v15;
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

LABEL_43:
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v61 = v15;
      __int16 v62 = v12;
      uint64_t v38 = v15;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v40 = objc_getProperty(a1, v39, 288, 1);
      uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:buf count:16];
      if (!v41)
      {
LABEL_32:

LABEL_40:
        uint64_t v18 = ne_log_obj();
        char v12 = v62;
        id v8 = v63;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          uint64_t v71 = v38;
          _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@ Failed to find child SA for spi %@", buf, 0x16u);
        }
        uint64_t v32 = v61;
        goto LABEL_43;
      }
      uint64_t v43 = v41;
      uint64_t v44 = *(void *)v65;
      uint64_t v60 = v4;
LABEL_18:
      uint64_t v45 = 0;
      while (1)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v40);
        }
        uint64_t v46 = *(void **)(*((void *)&v64 + 1) + 8 * v45);
        id v47 = v46 ? objc_getProperty(*(id *)(*((void *)&v64 + 1) + 8 * v45), v42, 192, 1) : 0;
        id v48 = v47;
        if ([v48 isEqual:v38]) {
          break;
        }
        if (v46) {
          id v50 = objc_getProperty(v46, v49, 200, 1);
        }
        else {
          id v50 = 0;
        }
        id v51 = v50;
        char v52 = [v51 isEqual:v38];

        if (v52) {
          goto LABEL_36;
        }
        if (v43 == ++v45)
        {
          uint64_t v53 = [v40 countByEnumeratingWithState:&v64 objects:buf count:16];
          uint64_t v43 = v53;
          id v4 = v60;
          if (v53) {
            goto LABEL_18;
          }
          goto LABEL_32;
        }
      }

LABEL_36:
      uint64_t v18 = v46;

      id v4 = v60;
      if (!v46) {
        goto LABEL_40;
      }
      char v12 = v62;
      id v8 = v63;
      id v55 = objc_getProperty(v18, v54, 200, 1);
      char v56 = -[NEIKEv2Session receiveDeleteChildSPI:remoteSPI:packet:](a1, 0, v55, v60);

      long long v57 = ne_log_large_obj();
      uint64_t v30 = v57;
      if (v56)
      {
        uint64_t v32 = v61;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          long long v59 = objc_getProperty(v18, v58, 200, 1);
          *(_DWORD *)buf = 138412546;
          uint64_t v69 = (const char *)a1;
          __int16 v70 = 2112;
          uint64_t v71 = v59;
          _os_log_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_DEFAULT, "%@ Received Child SA Delete for remote SPI %@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      uint64_t v32 = v61;
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v69 = (const char *)a1;
    __int16 v70 = 2112;
    uint64_t v71 = v18;
    _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ Failed to process received Child SA Delete %@", buf, 0x16u);
    goto LABEL_34;
  }
LABEL_45:
}

- (void)initiateDeleteChildSA:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  SEL v6 = Property;
  dispatch_assert_queue_V2(v6);

  id v7 = -[NEIKEv2Session copyChildWithID:](a1, (const char *)*((unsigned int *)v4 + 6));
  if (v7)
  {
    id v8 = v7;
    if (*((void *)v7 + 4) == 3)
    {
      [v4 sendCallbackSuccess:1 session:a1];
    }
    else
    {
      uint64_t v9 = ne_log_large_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = (const char *)a1;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@ initiate delete Child SA %@", buf, 0x16u);
      }

      id v10 = v4[4];
      -[NEIKEv2ChildSA setState:error:]((uint64_t)v8, 3uLL, v10);

      [(NEIKEv2Session *)a1 reportState];
      id v13 = objc_getProperty(v8, v12, 56, 1);
      SEL v15 = v13;
      if (v13) {
        id v13 = objc_getProperty(v13, v14, 80, 1);
      }
      id v16 = v13;
      id v18 = objc_getProperty(v8, v17, 56, 1);
      uint64_t v20 = v18;
      if (v18) {
        id v18 = objc_getProperty(v18, v19, 88, 1);
      }
      id v21 = v18;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__NEIKEv2Session_Exchange__initiateDeleteChildSA___block_invoke;
      v23[3] = &unk_1E5990788;
      void v23[4] = a1;
      id v8 = v8;
      id v24 = v8;
      uint64_t v25 = v4;
      -[NEIKEv2Session initiateDeleteChildSPI:remoteSPI:deleteCompletionCallback:](a1, v16, v21, v23);
    }
  }
  else
  {
    id v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[NEIKEv2Session(Exchange) initiateDeleteChildSA:]";
      _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
    }

    [v4 sendCallbackSuccess:0 session:a1];
    id v8 = 0;
  }
}

uint64_t __50__NEIKEv2Session_Exchange__initiateDeleteChildSA___block_invoke(uint64_t a1, uint64_t a2)
{
  -[NEIKEv2Session resetChild:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);

  return [v4 sendCallbackSuccess:a2 session:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPrivateNotifies, 0);
  objc_storeStrong((id *)&self->_ikeConfig, 0);
  objc_storeStrong((id *)&self->_previousMOBIKERequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rttState, 0);
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_storeStrong((id *)&self->_ikeSA, 0);
  objc_storeStrong((id *)&self->_pendingRequestContexts, 0);
  objc_storeStrong((id *)&self->_receiveTimer, 0);
  objc_storeStrong((id *)&self->_sendTimer, 0);
  objc_storeStrong((id *)&self->_childSAs, 0);
  objc_storeStrong((id *)&self->_dpdDispatchTimer, 0);
  objc_storeStrong((id *)&self->_dpdTimer, 0);
  objc_storeStrong((id *)&self->_ikeLifetimeTimer, 0);
  objc_storeStrong((id *)&self->_replyFragmentMaps, 0);
  objc_storeStrong((id *)&self->_requestFragmentMaps, 0);
  objc_storeStrong((id *)&self->_receivedReplies, 0);
  objc_storeStrong((id *)&self->_receivedRequests, 0);
  objc_storeStrong((id *)&self->_sentReplies, 0);
  objc_storeStrong((id *)&self->_sentRequests, 0);
  objc_storeStrong(&self->_waitingRequestHandler, 0);
  objc_storeStrong(&self->_lastRequestReplyHandler, 0);
  objc_storeStrong((id *)&self->_databaseSAs, 0);
  objc_storeStrong((id *)&self->_databaseLarvalSAs, 0);
  objc_storeStrong((id *)&self->_databaseSession, 0);
  objc_storeStrong((id *)&self->_listenChildSAUserConfig, 0);
  objc_storeStrong(&self->_ikeSocketHandler, 0);
  objc_storeStrong(&self->_privateNotifyStatusEvent, 0);
  objc_storeStrong(&self->_redirectEventBlock, 0);
  objc_storeStrong(&self->_shortDPDEventBlock, 0);
  objc_storeStrong(&self->_additionalAddressesUpdateBlock, 0);
  objc_storeStrong(&self->_trafficSelectorUpdateBlock, 0);
  objc_storeStrong(&self->_configurationUpdateBlock, 0);
  objc_storeStrong(&self->_childStateUpdateBlock, 0);
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_ikeInterfaceName, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_assignedConfiguration, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (void)setPrivateNotifyStatusEvent:(id)a3
{
}

- (id)privateNotifyStatusEvent
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setRedirectEventBlock:(id)a3
{
}

- (id)redirectEventBlock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setShortDPDEventBlock:(id)a3
{
}

- (id)shortDPDEventBlock
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setAdditionalAddressesUpdateBlock:(id)a3
{
}

- (id)additionalAddressesUpdateBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setTrafficSelectorUpdateBlock:(id)a3
{
}

- (id)trafficSelectorUpdateBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setConfigurationUpdateBlock:(id)a3
{
}

- (id)configurationUpdateBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setChildStateUpdateBlock:(id)a3
{
}

- (id)childStateUpdateBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setStateUpdateBlock:(id)a3
{
}

- (id)stateUpdateBlock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setClientCallbackInfo:(void *)a3
{
  self->_clientCallbackInfo = a3;
}

- (void)clientCallbackInfo
{
  return self->_clientCallbackInfo;
}

- (void)setClientCallback:(void *)a3
{
  self->_clientCallback = a3;
}

- (void)clientCallback
{
  return self->_clientCallback;
}

- (NSString)ikeInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 56, 1);
}

- (NEIKEv2ConfigurationMessage)assignedConfiguration
{
  return (NEIKEv2ConfigurationMessage *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)checkSelectedChildSAProposal:(id)a3
{
  id v4 = a3;
  id Property = [(NEIKEv2Session *)self firstChildSA];
  id v8 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v7, 56, 1);
  }
  id v9 = Property;

  id v10 = [v4 encryptionProtocols];
  uint64_t v11 = [v10 firstObject];

  if (!v11) {
    goto LABEL_9;
  }
  if (v9) {
    id v13 = objc_getProperty(v9, v12, 96, 1);
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  char v15 = [v11 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    id v19 = ne_log_obj();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_26:
      BOOL v29 = 0;
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    uint64_t v30 = "Incorrect encryption algorithm chosen";
    id v31 = buf;
LABEL_21:
    _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_26;
  }
  unint64_t v17 = v11[2];
  if (v17 <= 0x1F && ((0xD01C0000 >> v17) & 1) != 0)
  {
    if (v9) {
      id v36 = objc_getProperty(v9, v16, 104, 1);
    }
    else {
      id v36 = 0;
    }
    id v37 = v36;

    if (!v37) {
      goto LABEL_14;
    }
    id v19 = ne_log_obj();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    __int16 v39 = 0;
    uint64_t v30 = "Integrity algorithm chosen with authenticated encryption";
    id v31 = (uint8_t *)&v39;
    goto LABEL_21;
  }
LABEL_9:
  id v18 = [v4 integrityProtocols];
  id v19 = [v18 firstObject];

  if (v19)
  {
    id v21 = v9 ? objc_getProperty(v9, v20, 104, 1) : 0;
    id v22 = v21;
    char v23 = [v19 isEqual:v22];

    if ((v23 & 1) == 0)
    {
      uint64_t v32 = ne_log_obj();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
      __int16 v40 = 0;
      id v33 = "Incorrect integrity algorithm chosen";
      BOOL v34 = (uint8_t *)&v40;
LABEL_34:
      _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, v33, v34, 2u);
      goto LABEL_25;
    }
  }

LABEL_14:
  id v24 = [v4 kemProtocols];
  id v19 = [v24 firstObject];

  if (v19)
  {
    id v26 = v9 ? objc_getProperty(v9, v25, 112, 1) : 0;
    id v27 = v26;
    char v28 = [v19 isEqual:v27];

    if ((v28 & 1) == 0)
    {
      uint64_t v32 = ne_log_obj();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      __int16 v38 = 0;
      id v33 = "Incorrect KE method chosen";
      BOOL v34 = (uint8_t *)&v38;
      goto LABEL_34;
    }
  }
  BOOL v29 = 1;
LABEL_27:

  return v29;
}

- (id)firstChildSA
{
  if (a1)
  {
    a1 = objc_msgSend(objc_getProperty(a1, a2, 288, 1), "firstObject");
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)checkSelectedIKEProposal:(id)a3
{
  id v5 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 336, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 96, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = [v5 encryptionProtocols];
  id v10 = [v9 firstObject];

  if (!v10) {
    goto LABEL_10;
  }
  if (v8) {
    id v12 = objc_getProperty(v8, v11, 88, 1);
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  char v14 = [v10 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    id v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    uint64_t v35 = "Incorrect encryption algorithm chosen";
    id v36 = buf;
LABEL_26:
    _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, v35, v36, 2u);
    goto LABEL_30;
  }
  unint64_t v16 = v10[2];
  if (v16 > 0x1F || ((0xD01C0000 >> v16) & 1) == 0)
  {
LABEL_10:
    unint64_t v17 = [v5 integrityProtocols];
    id v18 = [v17 firstObject];

    if (!v18
      || (!v8 ? (id v20 = 0) : (id v20 = objc_getProperty(v8, v19, 96, 1)),
          id v21 = v20,
          char v22 = [v18 isEqual:v21],
          v21,
          (v22 & 1) != 0))
    {

      goto LABEL_15;
    }
    id v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v45 = 0;
      _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, "Incorrect integrity algorithm chosen", v45, 2u);
    }

    goto LABEL_30;
  }
  if (v8) {
    id v40 = objc_getProperty(v8, v15, 96, 1);
  }
  else {
    id v40 = 0;
  }
  id v41 = v40;

  if (!v41)
  {
LABEL_15:
    char v23 = [v5 prfProtocols];
    id v18 = [v23 firstObject];

    if (v18
      && (!v8 ? (id v25 = 0) : (id v25 = objc_getProperty(v8, v24, 104, 1)),
          id v26 = v25,
          char v27 = [v18 isEqual:v26],
          v26,
          (v27 & 1) == 0))
    {
      BOOL v29 = ne_log_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Incorrect PRF algorithm chosen", v43, 2u);
      }
    }
    else
    {
      char v28 = [v5 kemProtocols];
      BOOL v29 = [v28 firstObject];

      if (!v29
        || (!v8 ? (id v31 = 0) : (id v31 = objc_getProperty(v8, v30, 112, 1)),
            id v32 = v31,
            char v33 = [v29 isEqual:v32],
            v32,
            (v33 & 1) != 0))
      {
        BOOL v34 = 1;
LABEL_37:

        goto LABEL_38;
      }
      __int16 v38 = ne_log_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v42 = 0;
        _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "Incorrect KE method chosen", v42, 2u);
      }
    }
    BOOL v34 = 0;
    goto LABEL_37;
  }
  id v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v44 = 0;
    uint64_t v35 = "Integrity algorithm chosen with authenticated encryption";
    id v36 = (uint8_t *)&v44;
    goto LABEL_26;
  }
LABEL_30:
  BOOL v34 = 0;
LABEL_38:

  return v34;
}

- (void)invalidate
{
}

- (void)invalidateWithCompletionHandler:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v15 = self;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating %@", buf, 0xCu);
  }

  if (self)
  {
    self->_isInvalidated = 1;
    id Property = objc_getProperty(self, v8, 368, 1);
  }
  else
  {
    id Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_1E59922D8;
  BOOL v13 = a3;
  block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(Property, block);
}

void __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id Property = objc_getProperty(*(id *)(a1 + 32), a2, 368, 1);
      dispatch_assert_queue_V2(Property);
      if ([*(id *)(v3 + 320) count])
      {
        id v5 = ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v3;
          _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@ flushed all pending requests", buf, 0xCu);
        }

        [*(id *)(v3 + 320) removeAllObjects];
      }
    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v7 = [NEIKEv2DeleteIKEContext alloc];
  int v8 = *(unsigned __int8 *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  if (v9) {
    id v9 = objc_getProperty(v9, v6, 368, 1);
  }
  id v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5990F00;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = *(id *)(a1 + 40);
  uint64_t v11 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v7->super.super.isa, v8 == 0, v10, v13);

  [(NEIKEv2Session *)*(unsigned char **)(a1 + 32) abort];
  -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

uint64_t __68__NEIKEv2Session_invalidateWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    self = WeakRetained;
    [(NEIKEv2Session *)(uint64_t)WeakRetained resetAll];
    id Property = objc_getProperty(self, v4, 336, 1);
    if (Property && Property[6] == 2)
    {
      id v7 = objc_getProperty(self, v6, 336, 1);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, 0);
    }
    if (objc_getProperty(self, v6, 176, 1))
    {
      id v9 = self;
      if (self[9])
      {
        objc_msgSend(objc_getProperty(self, v8, 176, 1), "invalidate");
        id v9 = self;
      }
      objc_setProperty_atomic(v9, v8, 0, 176);
    }
    id WeakRetained = *(unsigned char **)(a1 + 32);
    uint64_t v3 = self;
    if (WeakRetained)
    {
      id WeakRetained = (unsigned char *)(*((uint64_t (**)(unsigned char *, unsigned char *))WeakRetained + 2))(WeakRetained, self);
      uint64_t v3 = self;
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (_BYTE)abort
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    id Property = objc_getProperty(result, a2, 368, 1);
    dispatch_assert_queue_V2(Property);
    SEL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v2;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Aborting session %@", (uint8_t *)&v7, 0xCu);
    }

    v2[11] = 1;
    [v2 setConfigurationUpdateBlock:0];
    [v2 setTrafficSelectorUpdateBlock:0];
    [(NEIKEv2Session *)v2 cancelSendTimer];
    [(NEIKEv2Session *)v2 invalidateDPDTimer];
    return (unsigned char *)-[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](v2, 0);
  }
  return result;
}

- (void)enqueuePendingRequestContext:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  SEL v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(Property);
    id v6 = ne_log_obj();
    int v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        char v22 = (const char *)a1;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@ Enqueueing %@", buf, 0x16u);
      }

      int v8 = (void *)a1[40];
      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v10 = (void *)a1[40];
        a1[40] = v9;

        int v8 = (void *)a1[40];
      }
      [v8 addObject:v4];
      uint64_t v11 = a1;
      if (*((unsigned char *)v4 + 9) && objc_opt_class())
      {
        id v12 = [NSString alloc];
        BOOL v13 = [v11 description];
        id v14 = [v4 description];
        id v15 = (void *)[v12 initWithFormat:@"com.apple.networkextension[%@ %@]", v13, v14];

        uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA9990]) initWithIdentifier:v15];
        id v17 = v4[2];
        v4[2] = (id)v16;

        [v4[2] acquireWithTimeout:0 handler:0.0];
        uint64_t v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = (const char *)v4[2];
          *(_DWORD *)buf = 138412290;
          char v22 = v19;
          _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEFAULT, "Took power assertion %@", buf, 0xCu);
        }
      }
      if (!v11[15]) {
        [(NEIKEv2Session *)(uint64_t)v11 sendPendingRequestContext];
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v22 = "-[NEIKEv2Session enqueuePendingRequestContext:]";
        _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null requestContext", buf, 0xCu);
      }
    }
  }
}

- (void)sendPendingRequestContext
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id Property = objc_getProperty((id)a1, a2, 368, 1);
    dispatch_assert_queue_V2(Property);
    if (!*(unsigned char *)(a1 + 15))
    {
      id v4 = *(id *)(a1 + 320);
      uint64_t v5 = [v4 firstObject];

      if (v5)
      {
        id v6 = (id *)(a1 + 320);
        int v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412546;
          id v15 = (__CFString *)a1;
          __int16 v16 = 2112;
          uint64_t v17 = v5;
          _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@ Dequeueing %@", (uint8_t *)&v14, 0x16u);
        }

        [*v6 removeObjectAtIndex:0];
        if (![*v6 count]) {
          objc_storeStrong((id *)(a1 + 320), 0);
        }
        *(unsigned char *)(v5 + 8) = 1;
        *(unsigned char *)(a1 + 15) = 1;
        int v9 = *(_DWORD *)(v5 + 12);
        if (*(unsigned char *)(a1 + 11))
        {
          if (v9 == 7)
          {
LABEL_12:
            id v10 = objc_getProperty((id)a1, v8, 336, 1);
            if (v10 && v10[6] == 2) {
              -[NEIKEv2Session initiateDelete:]((void *)a1, (void *)v5);
            }
            else {
              [(id)v5 sendCallbackSuccess:0 session:a1];
            }
          }
          else
          {
            uint64_t v11 = ne_log_obj();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412546;
              id v15 = (__CFString *)a1;
              __int16 v16 = 2112;
              uint64_t v17 = v5;
              _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_INFO, "%@ Session aborted, skip request %@", (uint8_t *)&v14, 0x16u);
            }

            [(id)v5 sendCallbackSuccess:0 session:a1];
            -[NEIKEv2Session sendPendingRequestContext](a1);
          }
        }
        else
        {
          switch(v9)
          {
            case 1:
              -[NEIKEv2Session initiateRekeyIKESA:]((unsigned char *)a1, (void *)v5);
              break;
            case 2:
              -[NEIKEv2Session initiateRekeyChildSA:]((unsigned char *)a1, (void *)v5);
              break;
            case 3:
              -[NEIKEv2Session initiateInformational:]((unsigned char *)a1, (void *)v5);
              break;
            case 4:
              -[NEIKEv2Session initiateMOBIKE:]((unsigned char *)a1, (void *)v5);
              break;
            case 5:
              -[NEIKEv2Session initiateNewChildSA:]((unsigned char *)a1, (void *)v5);
              break;
            case 6:
              -[NEIKEv2Session initiateDeleteChildSA:]((void *)a1, (void *)v5);
              break;
            case 7:
              goto LABEL_12;
            default:
              id v12 = ne_log_obj();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                BOOL v13 = NEIKEv2RequestContextTypeString(*(_DWORD *)(v5 + 12));
                int v14 = 138412290;
                id v15 = v13;
                _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "bad request type %@", (uint8_t *)&v14, 0xCu);
              }
              break;
          }
        }
      }
    }
  }
}

- (void)cancelSendTimer
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 296, 1))
    {
      id Property = objc_getProperty(a1, v3, 296, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0, 296);
    }
    if (objc_getProperty(a1, v3, 360, 1))
    {
      int v7 = objc_getProperty(a1, v6, 360, 1);
      if (v7)
      {
        v7[8] = 1000;
        *((_DWORD *)v7 + 3) = -1;
        v7[2] = 0;
        v7[3] = 0;
        *((_OWORD *)v7 + 2) = xmmword_19DF9BF00;
        *((_OWORD *)v7 + 3) = xmmword_19DF9BF10;
        *((_WORD *)v7 + 4) = 0;
      }
    }
    if (objc_getProperty(a1, v6, 200, 1))
    {
      id v10 = (void (**)(id, void))objc_getProperty(a1, v8, 200, 1);
      objc_setProperty_atomic_copy(a1, v9, 0, 200);
      v10[2](v10, 0);
    }
  }
}

- (void)invalidateDPDTimer
{
  if (objc_getProperty(a1, a2, 272, 1))
  {
    objc_msgSend(objc_getProperty(a1, v3, 272, 1), "invalidate");
    objc_setProperty_atomic(a1, v4, 0, 272);
  }
  if (objc_getProperty(a1, v3, 280, 1))
  {
    id Property = objc_getProperty(a1, v5, 280, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v7, 0, 280);
  }
}

- (uint64_t)fireWaitingRequestHandlerWithPacket:(void *)a1
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_6;
  }
  SEL v5 = a1[38];
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v6 = (void *)a1[38];
    a1[38] = 0;
  }
  if (objc_getProperty(a1, v3, 208, 1))
  {
    uint64_t v8 = 1;
    SEL v9 = (void (**)(id, id))objc_getProperty(a1, v7, 208, 1);
    objc_setProperty_atomic_copy(a1, v10, 0, 208);
    v9[2](v9, v4);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)resetAll
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id Property = objc_getProperty((id)a1, a2, 368, 1);
    dispatch_assert_queue_V2(Property);
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412290;
      uint64_t v54 = a1;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Resetting %@", (uint8_t *)&v53, 0xCu);
    }

    [(NEIKEv2Session *)(unsigned char *)a1 abort];
    -[NEIKEv2Session uninstallAllChildSAs](a1);
    if (objc_getProperty((id)a1, v6, 264, 1))
    {
      uint64_t v8 = objc_getProperty((id)a1, v7, 264, 1);
      dispatch_source_cancel(v8);
      objc_setProperty_atomic((id)a1, v9, 0, 264);
    }
    [(NEIKEv2Session *)(void *)a1 invalidateDPDTimer];
    if (*(unsigned char *)(a1 + 10))
    {
      uint64_t v11 = *(const void **)(a1 + 328);
      if (v11)
      {
        CFRelease(v11);
        *(void *)(a1 + 328) = 0;
      }
    }
    [(NEIKEv2Session *)(_DWORD *)a1 resetMessages];
    id v13 = objc_getProperty((id)a1, v12, 336, 1);
    if (v13)
    {
      id v15 = v13;
      -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v13, 0);
      *((unsigned char *)v15 + 9) = 1;
      *((unsigned char *)v15 + 16) = 0;
      __int16 v16 = objc_alloc_init(NEIKEv2IKESPI);
      objc_setProperty_atomic(v15, v17, v16, 32);

      objc_setProperty_atomic(v15, v18, 0, 40);
      objc_setProperty_atomic(v15, v19, 0, 152);
      objc_setProperty_atomic(v15, v20, 0, 160);
      objc_setProperty_atomic(v15, v21, 0, 168);
      objc_setProperty_atomic(v15, v22, 0, 176);
      objc_setProperty_atomic(v15, v23, 0, 184);
      objc_setProperty_atomic(v15, v24, 0, 128);
      objc_setProperty_atomic(v15, v25, 0, 136);
      objc_setProperty_atomic(v15, v26, 0, 192);
      objc_setProperty_atomic(v15, v27, 0, 200);
      objc_setProperty_atomic(v15, v28, 0, 208);
      objc_setProperty_atomic(v15, v29, 0, 216);
      objc_setProperty_atomic(v15, v30, 0, 224);
      objc_setProperty_atomic(v15, v31, 0, 232);
      objc_setProperty_atomic(v15, v32, 0, 240);
      objc_setProperty_atomic(v15, v33, 0, 248);
      objc_setProperty_atomic(v15, v34, 0, 256);
      objc_setProperty_atomic(v15, v35, 0, 264);
      objc_setProperty_atomic(v15, v36, 0, 512);
      objc_setProperty_atomic(v15, v37, 0, 520);
      objc_setProperty_atomic(v15, v38, 0, 528);
      objc_setProperty_atomic(v15, v39, 0, 488);
      objc_setProperty_atomic(v15, v40, 0, 96);
      objc_setProperty_atomic(v15, v41, 0, 312);
      objc_setProperty_atomic(v15, v42, 0, 320);
      objc_setProperty_atomic(v15, v43, 0, 504);
      objc_setProperty_atomic(v15, v44, 0, 448);
      objc_setProperty_atomic(v15, v45, 0, 456);
      objc_storeStrong((id *)v15 + 14, 0);
    }
    uint64_t v46 = objc_getProperty((id)a1, v14, 360, 1);
    if (v46)
    {
      v46[8] = 1000;
      *((_DWORD *)v46 + 3) = -1;
      v46[2] = 0;
      v46[3] = 0;
      *((_OWORD *)v46 + 2) = xmmword_19DF9BF00;
      *((_OWORD *)v46 + 3) = xmmword_19DF9BF10;
      *((_WORD *)v46 + 4) = 0;
    }
    if (objc_msgSend(objc_getProperty((id)a1, v47, 288, 1), "count"))
    {
      objc_msgSend(objc_getProperty((id)a1, v48, 288, 1), "firstObject");
      uint64_t v49 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty((id)a1, v50, 288, 1), "removeAllObjects");
      if (v49)
      {
        [(NEIKEv2ChildSA *)v49 reset];
        objc_msgSend(objc_getProperty((id)a1, v52, 288, 1), "addObject:", v49);
      }
    }
  }
}

- (uint64_t)uninstallAllChildSAs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      SEL v30 = v1;
      __int16 v31 = 2112;
      id Property = objc_getProperty(v1, v3, 176, 1);
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@ %@ Uninstalling all child SAs", buf, 0x16u);
    }

    objc_msgSend(objc_getProperty(v1, v4, 176, 1), "removeAllSAs");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = objc_getProperty(v1, v5, 184, 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v10++) invalidate];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }

    objc_msgSend(objc_getProperty(v1, v11, 184, 1), "removeAllObjects");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = objc_getProperty(v1, v12, 192, 1);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "invalidate", (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    return objc_msgSend(objc_getProperty(v1, v18, 192, 1), "removeAllObjects");
  }
  return result;
}

- (void)resetMessages
{
  [(NEIKEv2Session *)a1 cancelSendTimer];
  -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](a1, 0);
  a1[4] = -1;
  a1[5] = -1;
  a1[6] = -1;
  objc_msgSend(objc_getProperty(a1, v3, 216, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v4, 224, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v5, 232, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v6, 240, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v7, 248, 1), "removeAllObjects");
  objc_msgSend(objc_getProperty(a1, v8, 256, 1), "removeAllObjects");

  objc_setProperty_atomic(a1, v9, 0, 376);
}

- (void)receivePacket:(id)a3
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  SEL v7 = a3;
  if (self) {
    id Property = objc_getProperty(self, v6, 368, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  if (v7)
  {
    unsigned int v158 = *((_DWORD *)v7 + 6);
    if (self)
    {
      if (v7[10]) {
        ptrdiff_t v10 = 240;
      }
      else {
        ptrdiff_t v10 = 232;
      }
      id v11 = objc_getProperty(self, v9, v10, 1);
    }
    else
    {
      id v11 = 0;
    }
    SEL v12 = v11;
    id v13 = ne_log_large_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      SEL v3 = self;
      uint64_t v14 = (void *)[(id)objc_opt_class() copyTypeDescription];
      id v15 = v14;
      uint64_t v156 = v15;
      if (v7[10]) {
        uint64_t v16 = "Reply";
      }
      else {
        uint64_t v16 = "Request";
      }
      SEL v4 = (NEIKEv2Session *)v158;
      uint64_t v155 = objc_msgSend(NSNumber, "numberWithInt:", v158, v16);

      uint64_t v154 = [v12 objectForKeyedSubscript:v155];
      if (v154) {
        SEL v18 = " retransmission";
      }
      else {
        SEL v18 = "";
      }
      uint64_t v157 = v12;
      long long v19 = (void *)[(NEIKEv2Packet *)v7 copyUnifiedData];
      int v20 = [v19 length];
      long long v22 = objc_getProperty(v7, v21, 32, 1);
      id v24 = objc_getProperty(v7, v23, 40, 1);
      *(_DWORD *)buf = 138414082;
      uint64_t v160 = v3;
      __int16 v161 = 2112;
      *(void *)SEL v162 = v14;
      self = v3;
      *(_WORD *)&v162[8] = 2080;
      *(void *)id v163 = v153;
      *(_WORD *)&v163[8] = 2080;
      uint64_t v164 = v18;
      __int16 v165 = 1024;
      *(_DWORD *)id v166 = v20;
      *(_WORD *)&v166[4] = 1024;
      *(_DWORD *)&v166[6] = v158;
      __int16 v167 = 2112;
      SEL v168 = v22;
      __int16 v169 = 2112;
      id v170 = v24;
      _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_INFO, "%@ Receiving %@ %s%s, length %u, ID %u (%@->%@)", buf, 0x4Au);

      SEL v12 = v157;
    }

    if (v7[11])
    {
      id v26 = objc_getProperty(v7, v25, 40, 1);
    }
    else
    {
      objc_getProperty(v7, v25, 32, 1);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    SEL v27 = v26;
    uint64_t v29 = [v26 value];
    if (!v29)
    {
      if (self)
      {
        SEL v30 = (NEIKEv2Session *)objc_getProperty(self, v28, 336, 1);
        SEL v3 = v30;
        if (v30) {
          SEL v30 = (NEIKEv2Session *)objc_getProperty(v30, v31, 80, 1);
        }
      }
      else
      {
        SEL v3 = 0;
        SEL v30 = 0;
      }
      SEL v4 = v30;
      if ([(NEIKEv2Session *)v4 serverMode])
      {

        goto LABEL_31;
      }
    }
    if (self)
    {
      id v33 = objc_getProperty(self, v28, 336, 1);
      if (v33) {
        id v33 = objc_getProperty(v33, v34, 32, 1);
      }
    }
    else
    {
      id v33 = 0;
    }
    id v35 = v33;
    char v36 = [v35 isEqual:v27];

    if (v29)
    {
      if (v36) {
        goto LABEL_31;
      }
    }
    else
    {

      if (v36)
      {
LABEL_31:
        if (v7[9])
        {
          if (self)
          {
            id v37 = objc_getProperty(self, v32, 336, 1);
            if (v37) {
              id v37 = objc_getProperty(v37, v38, 96, 1);
            }
          }
          else
          {
            id v37 = 0;
          }
          id v39 = v37;

          if (!v39)
          {
            __int16 v62 = ne_log_obj();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v160 = self;
              _os_log_error_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_ERROR, "%@ Ignoring fragment received before security established", buf, 0xCu);
            }
            goto LABEL_63;
          }
          SEL v40 = ne_log_large_obj();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            int v41 = *((_DWORD *)v7 + 4);
            int v42 = *((_DWORD *)v7 + 5);
            *(_DWORD *)buf = 138413058;
            uint64_t v160 = self;
            __int16 v161 = 1024;
            *(_DWORD *)SEL v162 = v41;
            *(_WORD *)&v162[4] = 1024;
            *(_DWORD *)&v162[6] = v42;
            *(_WORD *)id v163 = 2112;
            *(void *)&v163[2] = v7;
            _os_log_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_INFO, "%@ Received fragment %u/%u: %@", buf, 0x22u);
          }
        }
        char v43 = v7[10];
        if (v43)
        {
          if (self) {
            id v44 = objc_getProperty(self, v32, 240, 1);
          }
          else {
            id v44 = 0;
          }
          SEL v45 = NSNumber;
          id v46 = v44;
          id v47 = [v45 numberWithInt:v158];
          id v48 = [v46 objectForKeyedSubscript:v47];

          if (!v48)
          {
            if ((v7[9] & 1) == 0)
            {
              if (self && objc_getProperty(self, v32, 336, 1))
              {
                id v64 = objc_getProperty(self, v63, 336, 1);
                if (!-[NEIKEv2Packet processReceivedPacketForIKESA:](v7, v64)) {
                  goto LABEL_100;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && -[NEIKEv2Packet hasNotification:](v7, (const char *)0x4017))
                {
                  long long v65 = -[NEIKEv2Packet copyNotification:](v7, (const char *)0x4017);
                  uint64_t v68 = [(NEIKEv2NotifyPayload *)v65 copyServerRedirectNonce];
                  if (!v68) {
                    goto LABEL_125;
                  }
                  id v69 = objc_getProperty(self, v67, 336, 1);
                  if (v69) {
                    id v69 = objc_getProperty(v69, v70, 128, 1);
                  }
                  id v71 = v69;
                  char v72 = [v68 isEqualToData:v71];

                  if ((v72 & 1) == 0)
                  {
LABEL_125:
                    uint64_t v129 = ne_log_large_obj();
                    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v160 = self;
                      __int16 v161 = 2112;
                      *(void *)SEL v162 = v7;
                      _os_log_error_impl(&dword_19DDAF000, v129, OS_LOG_TYPE_ERROR, "%@ Ignoring received packet (nonce check failed): %@", buf, 0x16u);
                    }

                    goto LABEL_100;
                  }
                }
              }
              id v73 = ne_log_large_obj();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v160 = self;
                __int16 v161 = 2112;
                *(void *)SEL v162 = v7;
                _os_log_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_INFO, "%@ Received response: %@", buf, 0x16u);
              }

              if (self)
              {
                if (!self->_lastRequestMessageID)
                {
                  SEL v75 = (void *)[(NEIKEv2Packet *)v7 copyUnifiedData];
                  id v77 = objc_getProperty(self, v76, 336, 1);
                  if (v77) {
                    objc_setProperty_atomic(v77, v78, v75, 320);
                  }
                }
                -[NEIKEv2Session setReceivedReply:messageID:](self, v7, v158);
                id v80 = objc_getProperty(self, v79, 200, 1);
                if (v80)
                {
                  int lastRequestMessageID = self->_lastRequestMessageID;

                  if (lastRequestMessageID == v158)
                  {
                    uint64_t v82 = ne_log_obj();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                    {
                      int v83 = self->_lastRequestMessageID;
                      *(_DWORD *)buf = 138412546;
                      uint64_t v160 = self;
                      __int16 v161 = 1024;
                      *(_DWORD *)SEL v162 = v83;
                      _os_log_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_INFO, "%@ Processing response for message %u", buf, 0x12u);
                    }

                    id v85 = objc_getProperty(self, v84, 360, 1);
                    -[NEIKEv2RTT updateRTT:responseMessageID:]((uint64_t)v85, self, v158);
                    char v87 = (void (**)(id, id))objc_getProperty(self, v86, 200, 1);
                    objc_setProperty_atomic_copy(self, v88, 0, 200);
                    [(NEIKEv2Session *)self cancelSendTimer];
                    v87[2](v87, v7);
                  }
                }
              }
              else
              {

                -[NEIKEv2Session setReceivedReply:messageID:](0, v7, v158);
              }
              goto LABEL_100;
            }
            goto LABEL_99;
          }
          char v43 = v7[10];
        }
        if (v43)
        {
LABEL_49:
          if ((v43 & 1) == 0)
          {
            id v54 = self ? objc_getProperty(self, v32, 224, 1) : 0;
            uint64_t v55 = NSNumber;
            id v56 = v54;
            long long v57 = [v55 numberWithInt:v158];
            long long v58 = [v56 objectForKeyedSubscript:v57];

            if (v58)
            {
              if ((v7[9] & 1) == 0 || *((_DWORD *)v7 + 4) == 1)
              {
                long long v59 = ne_log_obj();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v160 = self;
                  __int16 v161 = 1024;
                  *(_DWORD *)SEL v162 = v158;
                  _os_log_debug_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_DEBUG, "%@ Received duplicate for message %d, re-sending reply", buf, 0x12u);
                }

                -[NEIKEv2Session sendReplyForMessageID:](self, (const char *)v158);
              }
            }
          }
          goto LABEL_100;
        }
        if (self) {
          id v49 = objc_getProperty(self, v32, 232, 1);
        }
        else {
          id v49 = 0;
        }
        SEL v50 = NSNumber;
        id v51 = v49;
        SEL v52 = [v50 numberWithInt:v158];
        int v53 = [v51 objectForKeyedSubscript:v52];

        if (v53)
        {
          char v43 = v7[10];
          goto LABEL_49;
        }
        if ((v7[9] & 1) == 0)
        {
          if (self)
          {
            if (objc_getProperty(self, v32, 336, 1))
            {
              id v91 = objc_getProperty(self, v90, 336, 1);
              if (!-[NEIKEv2Packet processReceivedPacketForIKESA:](v7, v91)) {
                goto LABEL_100;
              }
            }
          }
          SEL v92 = ne_log_large_obj();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v160 = self;
            __int16 v161 = 2112;
            *(void *)SEL v162 = v7;
            _os_log_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_INFO, "%@ Received request: %@", buf, 0x16u);
          }

          uint64_t v93 = v7;
          uint64_t v95 = v93;
          if (self)
          {
            int lastReceivedMessageID = self->_lastReceivedMessageID;
            if (lastReceivedMessageID < (int)v158)
            {
              int lastReceivedMessageID = v158;
              self->_int lastReceivedMessageID = v158;
            }
            int v97 = lastReceivedMessageID - 4;
            if (lastReceivedMessageID < 4)
            {
              id v122 = objc_getProperty(self, v94, 232, 1);
              uint64_t v123 = NSNumber;
              id v124 = v122;
              uint64_t v125 = [v123 numberWithInt:v158];
              [v124 setObject:v95 forKeyedSubscript:v125];

LABEL_116:
              if (-[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](self, v95)) {
                goto LABEL_100;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v60 = v95;
                if ([(NEIKEv2CreateChildPacket *)v60 isRekeyIKE])
                {
                  -[NEIKEv2Session receiveRekeyIKESA:](self, v60);
                }
                else if (-[NEIKEv2Packet hasNotification:](v60, (const char *)0x4009))
                {
                  uint64_t v131 = -[NEIKEv2Packet copyNotification:](v60, (const char *)0x4009);
                  uint64_t v133 = v131;
                  if (v131) {
                    uint64_t v131 = objc_getProperty(v131, v132, 40, 1);
                  }
                  id v134 = v131;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if (v133) {
                      id v136 = objc_getProperty(v133, v135, 40, 1);
                    }
                    else {
                      id v136 = 0;
                    }
                    id v137 = v136;
                  }
                  else
                  {
                    id v137 = 0;
                  }

                  id v145 = -[NEIKEv2Session copyChildWithSPI:](self, v137);
                  -[NEIKEv2Session receiveRekeyChildSA:packet:](self, v145, v60);
                }
                else
                {
                  if (objc_getProperty(self, v130, 168, 1))
                  {
                    uint64_t v138 = [NEIKEv2ChildSA alloc];
                    id v140 = objc_getProperty(self, v139, 168, 1);
                    self;
                    int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
                    if (!add_explicit) {
                      int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
                    }
                    id v143 = objc_getProperty(self, v141, 336, 1);
                    id v144 = -[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](&v138->super, v140, add_explicit, v143);
                  }
                  else
                  {
                    id v144 = 0;
                  }
                  -[NEIKEv2Session receiveNewChildSA:packet:](self, v144, v60);
                }
                goto LABEL_60;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  -[NEIKEv2Session receiveConnection:](self, v95);
                }
                goto LABEL_100;
              }
              uint64_t v60 = v95;
              if ([(NEIKEv2InformationalPacket *)v60 isDeleteIKE])
              {
                -[NEIKEv2Session receiveDeleteIKESA:](self, v60);
              }
              else if ([(NEIKEv2InformationalPacket *)v60 isDeleteChild])
              {
                -[NEIKEv2Session receiveDeleteChildSA:](self, v60);
              }
              else
              {
                if (!-[NEIKEv2InformationalPacket isMOBIKE](v60))
                {
                  id v147 = objc_getProperty(self, v146, 336, 1);
                  if (v147) {
                    id v147 = objc_getProperty(v147, v148, 80, 1);
                  }
                  id v149 = v147;
                  if ([v149 allowRedirect]
                    && (uint64_t v151 = objc_getProperty(self, v150, 336, 1)) != 0
                    && v151[6] == 2)
                  {
                    int v152 = -[NEIKEv2Packet hasNotification:](v60, (const char *)0x4017);

                    if (v152)
                    {
                      -[NEIKEv2Session receiveRedirect:](self, v60);
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                  }
                  -[NEIKEv2Session receiveInformational:](self, v60);
                  goto LABEL_60;
                }
                -[NEIKEv2Session receiveMOBIKE:](self, v60);
              }
LABEL_60:

LABEL_100:
              goto LABEL_101;
            }
            if (v97 < (int)v158)
            {
              id v98 = objc_getProperty(self, v94, 232, 1);
              uint64_t v99 = NSNumber;
              id v100 = v98;
              char v101 = [v99 numberWithInt:v158];
              [v100 setObject:v95 forKeyedSubscript:v101];

              id v103 = objc_getProperty(self, v102, 232, 1);
              +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v103, v97);
              id v105 = objc_getProperty(self, v104, 224, 1);
              +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v105, v97);
              id v107 = objc_getProperty(self, v106, 248, 1);
              +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v107, v97);
              goto LABEL_116;
            }
          }

          __int16 v62 = ne_log_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v160 = self;
            _os_log_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_INFO, "%@ Discarding stale request", buf, 0xCu);
          }
LABEL_63:

          goto LABEL_100;
        }
LABEL_99:
        -[NEIKEv2Session processFragment:](self, v7);
        goto LABEL_100;
      }
    }
    uint64_t v60 = ne_log_large_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        id v108 = objc_getProperty(self, v61, 336, 1);
        if (v108) {
          id v108 = objc_getProperty(v108, v109, 80, 1);
        }
      }
      else
      {
        id v108 = 0;
      }
      id v110 = v108;
      if ([v110 serverMode]) {
        uint64_t v112 = "Responder";
      }
      else {
        uint64_t v112 = "Initiator";
      }
      if (self)
      {
        id v113 = objc_getProperty(self, v111, 336, 1);
        if (v113) {
          id v113 = objc_getProperty(v113, v114, 32, 1);
        }
        uint64_t v115 = v12;
        id v116 = v113;
        id v118 = objc_getProperty(self, v117, 336, 1);
        if (v118) {
          id v118 = objc_getProperty(v118, v119, 40, 1);
        }
        id v120 = v116;
      }
      else
      {
        uint64_t v115 = v12;
        id v116 = 0;
        id v120 = 0;
        id v118 = 0;
      }
      uint64_t v121 = (char *)v118;
      *(_DWORD *)buf = 138413314;
      uint64_t v160 = self;
      __int16 v161 = 2080;
      *(void *)SEL v162 = v112;
      *(_WORD *)&v162[8] = 2112;
      *(void *)id v163 = v120;
      *(_WORD *)&v163[8] = 2112;
      uint64_t v164 = v121;
      __int16 v165 = 2112;
      *(void *)id v166 = v7;
      _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "%@ %s ignoring received packet: (Local %@, Remote %@): %@", buf, 0x34u);

      SEL v12 = v115;
    }
    goto LABEL_60;
  }
  SEL v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v160 = (NEIKEv2Session *)"-[NEIKEv2Session receivePacket:]";
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null packet", buf, 0xCu);
  }
LABEL_101:
}

- (void)processFragment:(_DWORD *)a1
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  SEL v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 368, 1);
    dispatch_assert_queue_V2(Property);
    if ((v4[9] & 1) == 0)
    {
      uint64_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v90 = "-[NEIKEv2Session processFragment:]";
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "%s called with null fragment.isFragmented", buf, 0xCu);
      }
      goto LABEL_37;
    }
    uint64_t v7 = *((unsigned int *)v4 + 6);
    if (v4[10])
    {
      ptrdiff_t v10 = objc_getProperty(a1, v6, 336, 1);
      int v11 = 4;
      if (v10)
      {
        if (v10[17]) {
          int v11 = 6;
        }
        else {
          int v11 = 4;
        }
      }
      int v12 = a1[4];
      BOOL v13 = __OFSUB__(v12, v11);
      int v8 = v12 - v11;
      if (v8 < 0 != v13)
      {
        if ((int)v7 > v12)
        {
          uint64_t v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v90 = (const char *)a1;
            id v15 = "%@ Discarding too new fragment";
LABEL_20:
            _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
          }
LABEL_37:

          goto LABEL_38;
        }
        ptrdiff_t v9 = 256;
LABEL_22:
        id v81 = objc_getProperty(a1, v6, v9, 1);
        uint64_t v16 = [NSNumber numberWithInt:v7];
        uint64_t v17 = [v81 objectForKeyedSubscript:v16];

        if (v17 || (uint64_t v17 = objc_alloc_init(NEIKEv2FragmentMap)) != 0)
        {
          self = v17;
          id v83 = objc_getProperty(v17, v18, 16, 1);
          char v19 = 0;
          unsigned int expectedCount = v17->_expectedCount;
        }
        else
        {
          self = 0;
          id v83 = 0;
          unsigned int expectedCount = 0;
          char v19 = 1;
        }
        int v21 = *((_DWORD *)v4 + 4);
        int v22 = *((_DWORD *)v4 + 5);
        unsigned int v23 = (unsigned __int16)v22;
        if ((_WORD)v22
          && (unsigned __int16)*((_DWORD *)v4 + 4)
          && (unsigned __int16)v21 <= (unsigned __int16)v22)
        {
          unsigned int obj = v7;
          if (!expectedCount) {
            goto LABEL_42;
          }
          char v24 = v19;
          if ((unsigned __int16)v22 == expectedCount)
          {
            long long v25 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v21];
            id v26 = [v83 objectForKeyedSubscript:v25];

            if (v26)
            {
              SEL v27 = ne_log_obj();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v90 = (const char *)a1;
                __int16 v91 = 1024;
                int v92 = (unsigned __int16)v21;
                __int16 v93 = 1024;
                unsigned int v94 = obj;
                _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, "%@ Received duplicate fragment %u for message %d", buf, 0x18u);
              }
              goto LABEL_34;
            }
          }
          char v19 = v24;
          if ((unsigned __int16)v22 >= expectedCount)
          {
LABEL_42:
            id v29 = objc_getProperty(a1, v18, 336, 1);
            if (-[NEIKEv2Packet processReceivedPacketForIKESA:](v4, v29))
            {
              uint64_t v14 = v81;
              if (expectedCount && (unsigned __int16)v22 > expectedCount)
              {
                SEL v30 = ne_log_obj();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  unint64_t v90 = (const char *)a1;
                  __int16 v91 = 1024;
                  int v92 = (unsigned __int16)v22;
                  __int16 v93 = 1024;
                  unsigned int v94 = expectedCount;
                  _os_log_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_INFO, "%@ Fragment count %u > last received count %u, discarding stored fragments", buf, 0x18u);
                }

                if (v19) {
                  id v32 = 0;
                }
                else {
                  id v32 = objc_getProperty(self, v31, 16, 1);
                }
                [v32 removeAllObjects];
              }
              id v33 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v21];
              [v83 setObject:v4 forKeyedSubscript:v33];

              if ([v83 count] == 1)
              {
                if ((v19 & 1) == 0) {
                  self->_unsigned int expectedCount = v22;
                }
                SEL v34 = [NSNumber numberWithInt:obj];
                id v35 = [v81 objectForKeyedSubscript:v34];

                if (!v35)
                {
                  char v36 = [NSNumber numberWithInt:obj];
                  [v81 setObject:self forKeyedSubscript:v36];
                }
              }
              uint64_t v37 = [v83 count];
              if (v37 != (unsigned __int16)v22) {
                goto LABEL_36;
              }
              uint64_t v38 = v37;
              id v39 = ne_log_obj();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v90 = (const char *)a1;
                __int16 v91 = 1024;
                int v92 = (unsigned __int16)v22;
                _os_log_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_INFO, "%@ Received all %u fragments", buf, 0x12u);
              }

              SEL v27 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v38];
              uint64_t v40 = 0;
              while (1)
              {
                int v41 = [NSNumber numberWithUnsignedInteger:++v40];
                int v42 = [v83 objectForKeyedSubscript:v41];

                if (!v42) {
                  break;
                }
                [v27 addObject:v42];

                if (v38 == v40)
                {
                  char v43 = [NSNumber numberWithInt:obj];
                  [v81 setObject:0 forKeyedSubscript:v43];

                  id v45 = objc_getProperty(a1, v44, 336, 1);
                  SEL v27 = v27;
                  id v46 = v45;
                  self;
                  if (v27)
                  {
                    if (v46)
                    {
                      id v47 = [v27 firstObject];
                      id v48 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
                      long long v85 = 0u;
                      long long v86 = 0u;
                      long long v87 = 0u;
                      long long v88 = 0u;
                      id obja = v27;
                      uint64_t v49 = [obja countByEnumeratingWithState:&v85 objects:buf count:16];
                      if (v49)
                      {
                        uint64_t v51 = v49;
                        uint64_t v52 = *(void *)v86;
                        id v77 = v47;
                        id v78 = v46;
                        do
                        {
                          uint64_t v53 = 0;
                          do
                          {
                            if (*(void *)v86 != v52) {
                              objc_enumerationMutation(obja);
                            }
                            id v54 = *(void **)(*((void *)&v85 + 1) + 8 * v53);
                            if (v54) {
                              id v55 = objc_getProperty(*(id *)(*((void *)&v85 + 1) + 8 * v53), v50, 48, 1);
                            }
                            else {
                              id v55 = 0;
                            }
                            id v56 = v55;
                            objc_opt_class();
                            char isKindOfClass = objc_opt_isKindOfClass();

                            if ((isKindOfClass & 1) == 0)
                            {
                              SEL v74 = ne_log_obj();
                              if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                              {
                                *(_WORD *)SEL v84 = 0;
                                SEL v75 = "Attempted to process non-fragment payload";
                                goto LABEL_110;
                              }
LABEL_105:
                              uint64_t v14 = v81;
                              id v47 = v77;
                              id v46 = v78;

                              id v73 = 0;
                              goto LABEL_106;
                            }
                            if (!v54
                              || (id v59 = objc_getProperty(v54, v58, 48, 1)) == 0
                              || (uint64_t v61 = v59, v62 = objc_getProperty(v59, v60, 16, 1), v61, !v62))
                            {
                              SEL v74 = ne_log_obj();
                              if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                              {
                                *(_WORD *)SEL v84 = 0;
                                SEL v75 = "Fragment missing decrypted data";
LABEL_110:
                                _os_log_fault_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_FAULT, v75, v84, 2u);
                              }
                              goto LABEL_105;
                            }
                            id v64 = objc_getProperty(v54, v63, 48, 1);
                            long long v66 = v64;
                            if (v64) {
                              id v67 = objc_getProperty(v64, v65, 16, 1);
                            }
                            else {
                              id v67 = 0;
                            }
                            objc_msgSend(v48, "appendData:", v67, v77, v78);

                            ++v53;
                          }
                          while (v51 != v53);
                          uint64_t v68 = [obja countByEnumeratingWithState:&v85 objects:buf count:16];
                          uint64_t v51 = v68;
                          id v47 = v77;
                          id v46 = v78;
                        }
                        while (v68);
                      }

                      if (v47)
                      {
                        id v70 = objc_getProperty(v47, v69, 48, 1);
                        if (v70)
                        {
                          char v72 = v70;
                          objc_setProperty_atomic(v70, v71, v48, 16);
                        }
                      }
                      if (-[NEIKEv2Packet processDecryptedPacketForIKESA:](v47, v46)) {
                        id v73 = v47;
                      }
                      else {
                        id v73 = 0;
                      }
                      uint64_t v14 = v81;
LABEL_106:

                      goto LABEL_107;
                    }
                    id v47 = ne_log_obj();
                    if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
                    {
LABEL_101:
                      id v73 = 0;
                      uint64_t v14 = v81;
LABEL_107:

                      [a1 receivePacket:v73];
                      goto LABEL_108;
                    }
                    *(_DWORD *)buf = 136315138;
                    unint64_t v90 = "+[NEIKEv2Packet createPacketFromReceivedFragments:ikeSA:]";
                    SEL v76 = "%s called with null ikeSA";
                  }
                  else
                  {
                    id v47 = ne_log_obj();
                    if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_101;
                    }
                    *(_DWORD *)buf = 136315138;
                    unint64_t v90 = "+[NEIKEv2Packet createPacketFromReceivedFragments:ikeSA:]";
                    SEL v76 = "%s called with null receivedFragments";
                  }
                  _os_log_fault_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_FAULT, v76, buf, 0xCu);
                  goto LABEL_101;
                }
              }
              id v73 = ne_log_obj();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v90 = (const char *)a1;
                __int16 v91 = 1024;
                int v92 = (unsigned __int16)v40;
                __int16 v93 = 1024;
                unsigned int v94 = v23;
                _os_log_fault_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_FAULT, "%@ Missing fragment %u/%u, skipping reassembly", buf, 0x18u);
              }
LABEL_108:
            }
            else
            {
              SEL v27 = ne_log_obj();
              uint64_t v14 = v81;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v90 = (const char *)a1;
                _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "%@ Discarding undecrypted fragment", buf, 0xCu);
              }
            }
LABEL_35:

LABEL_36:
            goto LABEL_37;
          }
          SEL v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            unint64_t v90 = (const char *)a1;
            __int16 v91 = 1024;
            int v92 = (unsigned __int16)v22;
            __int16 v93 = 1024;
            unsigned int v94 = expectedCount;
            SEL v28 = "%@ Fragment count %u < last received count %u";
LABEL_89:
            _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x18u);
          }
        }
        else
        {
          SEL v27 = ne_log_obj();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            unint64_t v90 = (const char *)a1;
            __int16 v91 = 1024;
            int v92 = (unsigned __int16)v21;
            __int16 v93 = 1024;
            unsigned int v94 = (unsigned __int16)v22;
            SEL v28 = "%@ Invalid fragment numbers %u/%u";
            goto LABEL_89;
          }
        }
LABEL_34:
        uint64_t v14 = v81;
        goto LABEL_35;
      }
      ptrdiff_t v9 = 256;
    }
    else
    {
      if ((int)a1[5] <= 3)
      {
        ptrdiff_t v9 = 248;
        goto LABEL_22;
      }
      int v8 = a1[4] - 4;
      ptrdiff_t v9 = 248;
    }
    if (v8 != -1 && (int)v7 <= v8)
    {
      uint64_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v90 = (const char *)a1;
        id v15 = "%@ Discarding stale fragment";
        goto LABEL_20;
      }
      goto LABEL_37;
    }
    goto LABEL_22;
  }
LABEL_38:
}

- (void)setReceivedReply:(uint64_t)a3 messageID:
{
  if (a1)
  {
    id v5 = a2;
    id Property = objc_getProperty(a1, v6, 240, 1);
    int v8 = NSNumber;
    id v9 = Property;
    id v10 = [v8 numberWithInt:a3];
    [v9 setObject:v5 forKeyedSubscript:v10];
  }
}

- (id)copyChildWithSPI:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = objc_getProperty(a1, v3, 288, 1);
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v26;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
          if (v10)
          {
            id Property = objc_getProperty(*(id *)(*((void *)&v25 + 1) + 8 * v9), v6, 56, 1);
            BOOL v13 = Property;
            if (Property) {
              id Property = objc_getProperty(Property, v12, 80, 1);
            }
          }
          else
          {
            BOOL v13 = 0;
            id Property = 0;
          }
          id v14 = Property;
          if ([v14 isEqual:v4])
          {

LABEL_23:
            id v22 = v10;
            goto LABEL_24;
          }
          if (v10)
          {
            id v16 = objc_getProperty(v10, v15, 56, 1);
            SEL v18 = v16;
            if (v16) {
              id v16 = objc_getProperty(v16, v17, 88, 1);
            }
          }
          else
          {
            SEL v18 = 0;
            id v16 = 0;
          }
          id v19 = v16;
          char v20 = [v19 isEqual:v4];

          if (v20) {
            goto LABEL_23;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v21 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v7 = v21;
        id v22 = 0;
      }
      while (v21);
    }
    else
    {
      id v22 = 0;
    }
LABEL_24:
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (uint64_t)sendReplyForMessageID:(unsigned char *)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id Property = objc_getProperty(a1, a2, 368, 1);
  dispatch_assert_queue_V2(Property);
  if (a1[12])
  {
    int v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      SEL v50 = a1;
      __int16 v51 = 1024;
      *(_DWORD *)uint64_t v52 = a2;
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEFAULT, "%@ Skipping sending reply %d on invalidated session", buf, 0x12u);
    }
    goto LABEL_17;
  }
  if (!objc_getProperty(a1, v5, 336, 1))
  {
    int v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    SEL v50 = "-[NEIKEv2Session sendReplyForMessageID:]";
    long long v26 = "%s called with null self.ikeSA";
LABEL_42:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_17;
  }
  uint64_t v7 = objc_getProperty(a1, v6, 336, 1);
  if ([(NEIKEv2IKESA *)v7 hasTransport])
  {
    id v10 = (id *)objc_getProperty(a1, v9, 336, 1);
    int v12 = [(NEIKEv2IKESA *)v10 copyTransport];
    id v14 = objc_getProperty(a1, v13, 224, 1);
    id v15 = NSNumber;
    id v16 = v14;
    uint64_t v17 = [v15 numberWithInt:a2];
    SEL v18 = [v16 objectForKeyedSubscript:v17];

    if ([v18 count] == 1)
    {
      id v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int v41 = [v18 firstObject];
        *(_DWORD *)buf = 138413058;
        SEL v50 = a1;
        __int16 v51 = 1024;
        *(_DWORD *)uint64_t v52 = [v41 length];
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = a2;
        __int16 v53 = 2112;
        *(void *)id v54 = v12;
        _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%@ Sending reply of length %u with ID %u on %@\n", buf, 0x22u);
      }
      char v20 = [v18 firstObject];
      char v21 = -[NEIKEv2Transport sendData:sendCompletionHandler:]((id *)&v12->isa, v20, 0);

      if ((v21 & 1) == 0)
      {
        id v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "Sending reply data failed", buf, 2u);
        }

        id v24 = objc_getProperty(a1, v23, 336, 1);
        -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v24, 1);
        uint64_t v25 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      if ([v18 count])
      {
        char v43 = v18;
        int v44 = [v18 count];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v28 = v18;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v46;
          int v32 = 1;
          id v42 = v28;
          while (2)
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v46 != v31) {
                objc_enumerationMutation(v28);
              }
              SEL v34 = *(void **)(*((void *)&v45 + 1) + 8 * v33);
              id v35 = ne_log_obj();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                int v36 = [v34 length];
                *(_DWORD *)buf = 138413570;
                SEL v50 = a1;
                __int16 v51 = 1024;
                *(_DWORD *)uint64_t v52 = v32 + v33;
                id v28 = v42;
                *(_WORD *)&v52[4] = 1024;
                *(_DWORD *)&v52[6] = v44;
                __int16 v53 = 1024;
                *(_DWORD *)id v54 = v36;
                *(_WORD *)&void v54[4] = 1024;
                *(_DWORD *)&v54[6] = a2;
                __int16 v55 = 2112;
                id v56 = v12;
                _os_log_debug_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_DEBUG, "%@ Sending reply fragment %u/%u of length %u with ID %u on %@\n", buf, 0x2Eu);
              }

              if ((-[NEIKEv2Transport sendData:sendCompletionHandler:]((id *)&v12->isa, v34, 0) & 1) == 0)
              {
                uint64_t v37 = ne_log_obj();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  SEL v50 = a1;
                  _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, "%@ Sending fragment reply data failed", buf, 0xCu);
                }

                id v39 = objc_getProperty(a1, v38, 336, 1);
                -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v39, 1);

                uint64_t v25 = 0;
                goto LABEL_35;
              }
              ++v33;
            }
            while (v30 != v33);
            v32 += v33;
            uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        uint64_t v25 = 1;
LABEL_35:
        SEL v18 = v43;
        goto LABEL_40;
      }
      uint64_t v40 = ne_log_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        SEL v50 = a1;
        __int16 v51 = 2112;
        *(void *)uint64_t v52 = v18;
        _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%@ Sending reply had unexpected sendValue %@", buf, 0x16u);
      }
    }
    uint64_t v25 = 1;
LABEL_40:

    goto LABEL_18;
  }
  int v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    SEL v50 = "-[NEIKEv2Session sendReplyForMessageID:]";
    long long v26 = "%s called with null self.ikeSA.hasTransport";
    goto LABEL_42;
  }
LABEL_17:
  uint64_t v25 = 0;
LABEL_18:

  return v25;
}

+ (void)removeItemsFromDictionary:(int)a3 lowerEdge:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  uint64_t v5 = [v4 allKeys];
  SEL v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    uint64_t v11 = a3;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        SEL v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            char v20 = v13;
            _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "Key %@ is not NSNumber", buf, 0xCu);
          }
LABEL_13:

          goto LABEL_14;
        }
        id v14 = v13;
        if ([v14 integerValue] > v11) {
          goto LABEL_13;
        }
        [v4 setObject:0 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (BOOL)ppkAuthenticated
{
  if (self)
  {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336, 1);
    if (self) {
      LOBYTE(self) = HIBYTE(self->_lastRequestMessageID) & 1;
    }
  }
  return (char)self;
}

- (BOOL)peerAuthenticated
{
  if (self)
  {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336, 1);
    if (self) {
      LOBYTE(self) = BYTE2(self->_lastRequestMessageID) & 1;
    }
  }
  return (char)self;
}

- (unsigned)addChild:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    self;
    unsigned int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
    if (!add_explicit) {
      unsigned int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
    }
    id v7 = [NEIKEv2ChildSA alloc];
    if (self) {
      id Property = objc_getProperty(self, v6, 336, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = -[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](&v7->super, v4, add_explicit, Property);
    uint64_t v10 = [NEIKEv2NewChildContext alloc];
    id v11 = v9;
    if (v10)
    {
      v21.receiver = v10;
      v21.super_class = (Class)NEIKEv2NewChildContext;
      id v12 = [(NEIKEv2Session *)&v21 initWithRequestType:5];
      uint64_t v10 = (NEIKEv2NewChildContext *)v12;
      if (v12) {
        objc_storeStrong((id *)v12 + 3, v9);
      }
    }

    if (self) {
      id v14 = objc_getProperty(self, v13, 368, 1);
    }
    else {
      id v14 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__NEIKEv2Session_addChild___block_invoke;
    block[3] = &unk_1E59929B0;
    block[4] = self;
    id v19 = v11;
    char v20 = v10;
    long long v15 = v10;
    long long v16 = v11;
    dispatch_async(v14, block);
  }
  else
  {
    long long v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v21.receiver) = 136315138;
      *(id *)((char *)&v21.receiver + 4) = "-[NEIKEv2Session addChild:]";
      _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "%s called with null configuration", (uint8_t *)&v21, 0xCu);
    }
    unsigned int add_explicit = 0;
  }

  return add_explicit;
}

void __27__NEIKEv2Session_addChild___block_invoke(void *a1, const char *a2)
{
  id Property = (unsigned char *)a1[4];
  if (Property)
  {
    if (Property[11]) {
      return;
    }
    id Property = objc_getProperty(Property, a2, 288, 1);
  }
  [Property addObject:a1[5]];
  id v4 = (void *)a1[4];
  uint64_t v5 = (void *)a1[6];

  -[NEIKEv2Session enqueuePendingRequestContext:](v4, v5);
}

- (void)sendMOBIKEWithRetries:(unsigned int)a3 retryInterval:(unint64_t)a4 interfaceName:(id)a5 invalidateTransport:(BOOL)a6 resetEndpoint:(id)a7 callbackQueue:(id)a8 callback:(id)a9
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  if (v15)
  {
    char v20 = -[NEIKEv2MOBIKEContext initWithMOBIKEInterface:mobikeEndpoint:invalidateTransport:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]((id *)[NEIKEv2MOBIKEContext alloc], v15, v16, a6, a3, (void *)a4, v17, v18);
    if (self) {
      id Property = objc_getProperty(self, v19, 368, 1);
    }
    else {
      id Property = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __125__NEIKEv2Session_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback___block_invoke;
    v23[3] = &unk_1E5992328;
    void v23[4] = self;
    id v24 = v20;
    uint64_t v22 = v20;
    dispatch_async(Property, v23);
  }
  else
  {
    uint64_t v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v26 = "-[NEIKEv2Session sendMOBIKEWithRetries:retryInterval:interfaceName:invalidateTransport:resetEndpoint:callbac"
            "kQueue:callback:]";
      _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "%s called with null interfaceName", buf, 0xCu);
    }
  }
}

void __125__NEIKEv2Session_sendMOBIKEWithRetries_retryInterval_interfaceName_invalidateTransport_resetEndpoint_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (void)sendPrivateNotifies:(id)a3 maxRetries:(unsigned int)a4 retryIntervalInMilliseconds:(unint64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = (objc_class *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = (void *)[[v12 alloc] initWithArray:v15 copyItems:1];

  id v17 = -[NEIKEv2InformationalContext initWithPrivateNotifies:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]((id *)[NEIKEv2InformationalContext alloc], v16, a4, (void *)a5, v14, v13);
  if (self) {
    id Property = objc_getProperty(self, v18, 368, 1);
  }
  else {
    id Property = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __100__NEIKEv2Session_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke;
  v21[3] = &unk_1E5992328;
  v21[4] = self;
  uint64_t v22 = v17;
  char v20 = v17;
  dispatch_async(Property, v21);
}

void __100__NEIKEv2Session_sendPrivateNotifies_maxRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (void)sendKeepaliveWithRetries:(unsigned int)a3 retryIntervalInMilliseconds:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = -[NEIKEv2InformationalContext initWithPrivateNotifies:maxRetries:retryIntervalMilliseconds:callbackQueue:callback:]((id *)[NEIKEv2InformationalContext alloc], 0, a3, (void *)a4, v11, v10);

  if (v12) {
    *((unsigned char *)v12 + 9) = 1;
  }
  if (self) {
    id Property = objc_getProperty(self, v13, 368, 1);
  }
  else {
    id Property = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__NEIKEv2Session_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke;
  v16[3] = &unk_1E5992328;
  v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  dispatch_async(Property, v16);
}

void __94__NEIKEv2Session_sendKeepaliveWithRetries_retryIntervalInMilliseconds_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (BOOL)updateConfiguration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 368, 1);
    }
    else {
      id Property = 0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__NEIKEv2Session_updateConfiguration___block_invoke;
    v9[3] = &unk_1E5992328;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(Property, v9);
  }
  else
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[NEIKEv2Session updateConfiguration:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null sessionConfig", buf, 0xCu);
    }
  }
  return v5 != 0;
}

void __38__NEIKEv2Session_updateConfiguration___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  SEL v3 = *(unsigned char **)(a1 + 32);
  if (!v3) {
    goto LABEL_10;
  }
  if (v3[11]) {
    return;
  }
  if (objc_getProperty(v3, a2, 336, 1))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id Property = objc_getProperty(v5, v4, 336, 1);
      if (Property) {
        objc_setProperty_atomic(Property, v4, *(id *)(a1 + 40), 88);
      }
    }
    id v7 = *(void **)(a1 + 32);
    [(NEIKEv2Session *)v7 startDPDTimer];
  }
  else
  {
LABEL_10:
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NEIKEv2Session updateConfiguration:]_block_invoke";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)startDPDTimer
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (objc_getProperty(a1, a2, 336, 1))
    {
      id Property = objc_getProperty(a1, v3, 336, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v5, 88, 1);
      }
      SEL v6 = Property;
      if ([v6 deadPeerDetectionEnabled]
        && [v6 deadPeerDetectionInterval])
      {
        unint64_t v7 = [v6 deadPeerDetectionInterval];
        unint64_t v8 = v7;
        double v9 = 5.0;
        if (v7 >= 0x12D)
        {
          double v9 = 15.0;
          if (v7 <= 0x383) {
            double v9 = (double)v7 / 60.0;
          }
        }
        if (objc_opt_class())
        {
          if (objc_getProperty(a1, v10, 272, 1))
          {
            objc_msgSend(objc_getProperty(a1, v11, 272, 1), "cancel");
          }
          else
          {
            id v12 = [NSString alloc];
            uint64_t v13 = [a1 description];
            id v14 = (void *)[v12 initWithFormat:@"com.apple.networkextension[%@ Periodic Dead Peer Detection]", v13];

            id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA99A8]) initWithIdentifier:v14];
            objc_setProperty_atomic(a1, v16, v15, 272);
          }
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = (void *)NEGetSystemWakeTime();
            *(_DWORD *)buf = 138413058;
            long long v46 = (const char *)a1;
            __int16 v47 = 2048;
            unint64_t v48 = v8;
            __int16 v49 = 2048;
            double v50 = v9;
            __int16 v51 = 2112;
            uint64_t v52 = v18;
            _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "%@: Setting DPD timer for %llu seconds, leeway %f seconds, last wake date %@", buf, 0x2Au);
          }
          objc_initWeak((id *)buf, a1);
          id v20 = objc_getProperty(a1, v19, 272, 1);
          id v22 = objc_getProperty(a1, v21, 368, 1);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __31__NEIKEv2Session_startDPDTimer__block_invoke;
          v43[3] = &unk_1E5990DE8;
          objc_copyWeak(&v44, (id *)buf);
          [v20 scheduleWithFireInterval:v22 leewayInterval:v43 queue:(double)v8 handler:v9];

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          if (objc_getProperty(a1, v10, 280, 1))
          {
            id v24 = objc_getProperty(a1, v23, 280, 1);
            dispatch_source_cancel(v24);
            objc_setProperty_atomic(a1, v25, 0, 280);
          }
          long long v26 = ne_log_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            long long v46 = (const char *)a1;
            __int16 v47 = 2048;
            unint64_t v48 = v8;
            __int16 v49 = 2048;
            double v50 = v9;
            _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "%@: Setting DPD timer for %llu seconds, leeway %f seconds", buf, 0x20u);
          }

          id v28 = objc_getProperty(a1, v27, 368, 1);
          dispatch_source_t v29 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v28);
          objc_setProperty_atomic(a1, v30, v29, 280);

          if (objc_getProperty(a1, v31, 280, 1))
          {
            uint64_t v33 = objc_getProperty(a1, v32, 280, 1);
            dispatch_time_t v34 = dispatch_time(0x8000000000000000, 1000000000 * v8);
            dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

            objc_initWeak((id *)buf, a1);
            id v36 = objc_getProperty(a1, v35, 280, 1);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __31__NEIKEv2Session_startDPDTimer__block_invoke_63;
            handler[3] = &unk_1E5992C58;
            uint64_t v37 = v36;
            objc_copyWeak(&v42, (id *)buf);
            dispatch_source_set_event_handler(v37, handler);

            id v39 = objc_getProperty(a1, v38, 280, 1);
            dispatch_activate(v39);
            objc_destroyWeak(&v42);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            uint64_t v40 = ne_log_obj();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
            }
          }
        }
      }
    }
    else
    {
      SEL v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v46 = "-[NEIKEv2Session startDPDTimer]";
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", buf, 0xCu);
      }
    }
  }
}

void __31__NEIKEv2Session_startDPDTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v3 = WeakRetained;
    [(NEIKEv2Session *)WeakRetained dpdTimerFired];
    id WeakRetained = v3;
  }
}

void __31__NEIKEv2Session_startDPDTimer__block_invoke_63(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v3 = WeakRetained;
    [(NEIKEv2Session *)WeakRetained dpdTimerFired];
    id WeakRetained = v3;
  }
}

- (void)dpdTimerFired
{
  id Property = objc_getProperty(a1, a2, 336, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 88, 1);
  }
  id v5 = Property;
  objc_msgSend(a1, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", objc_msgSend(v5, "deadPeerDetectionMaxRetryCount"), objc_msgSend(v5, "deadPeerDetectionRetryIntervalMilliseconds"), 0, 0);
  -[NEIKEv2Session startDPDTimer](a1);
}

- (void)removeChild:(unsigned int)a3
{
}

- (void)removeChild:(void *)a3 withReason:
{
  if (a1)
  {
    id v6 = a3;
    unint64_t v7 = [NEIKEv2DeleteChildContext alloc];
    id v8 = v6;
    if (v7)
    {
      v15.receiver = v7;
      v15.super_class = (Class)NEIKEv2DeleteChildContext;
      double v9 = (NEIKEv2DeleteChildContext *)objc_msgSendSuper2(&v15, sel_initWithRequestType_, 6);
      unint64_t v7 = v9;
      if (v9)
      {
        v9->_childID = a2;
        objc_storeStrong((id *)&v9->_reasonError, a3);
      }
    }

    id Property = objc_getProperty(a1, v10, 368, 1);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__NEIKEv2Session_removeChild_withReason___block_invoke;
    v13[3] = &unk_1E5992328;
    void v13[4] = a1;
    id v14 = v7;
    id v12 = v7;
    dispatch_async(Property, v13);
  }
}

void __41__NEIKEv2Session_removeChild_withReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (void)forceRekeyChild:(unsigned int)a3
{
  id v5 = [NEIKEv2RekeyChildContext alloc];
  if (v5)
  {
    v13.receiver = v5;
    v13.super_class = (Class)NEIKEv2RekeyChildContext;
    unint64_t v7 = [(NEIKEv2Session *)&v13 initWithRequestType:2];
    id v8 = v7;
    if (v7) {
      v7->_previousMOBIKEMessageID = a3;
    }
    if (self) {
      goto LABEL_5;
    }
LABEL_8:
    id Property = 0;
    goto LABEL_6;
  }
  id v8 = 0;
  if (!self) {
    goto LABEL_8;
  }
LABEL_5:
  id Property = objc_getProperty(self, v6, 368, 1);
LABEL_6:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__NEIKEv2Session_forceRekeyChild___block_invoke;
  v11[3] = &unk_1E5992328;
  v11[4] = self;
  id v12 = v8;
  SEL v10 = v8;
  dispatch_async(Property, v11);
}

void __34__NEIKEv2Session_forceRekeyChild___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (void)forceRekeyIKE
{
  id v4 = [(NEIKEv2RequestContext *)[NEIKEv2RekeyIKEContext alloc] initWithRequestType:1];
  if (self) {
    id Property = objc_getProperty(self, v3, 368, 1);
  }
  else {
    id Property = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__NEIKEv2Session_forceRekeyIKE__block_invoke;
  v7[3] = &unk_1E5992328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(Property, v7);
}

void __31__NEIKEv2Session_forceRekeyIKE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 11) & 1) == 0) {
      -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  else
  {
    -[NEIKEv2Session enqueuePendingRequestContext:](0, *(void **)(a1 + 40));
  }
}

- (void)disconnect
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 368, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NEIKEv2Session_disconnect__block_invoke;
  block[3] = &unk_1E59932C0;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

void __28__NEIKEv2Session_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Disconnect %@", buf, 0xCu);
  }

  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4 || (v4[11] & 1) == 0)
  {
    objc_initWeak((id *)buf, v4);
    id v6 = [NEIKEv2DeleteIKEContext alloc];
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 368, 1);
    }
    id v8 = Property;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __28__NEIKEv2Session_disconnect__block_invoke_47;
    v11[3] = &unk_1E5990DC0;
    objc_copyWeak(&v12, (id *)buf);
    double v9 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v6->super.super.isa, 1, v8, v11);

    [(NEIKEv2Session *)*(unsigned char **)(a1 + 32) abort];
    -[NEIKEv2Session enqueuePendingRequestContext:](*(void **)(a1 + 32), v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __28__NEIKEv2Session_disconnect__block_invoke_47(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [(NEIKEv2Session *)(uint64_t)WeakRetained resetAll];
    id Property = objc_getProperty(v3, v4, 336, 1);
    if (Property && Property[6] == 2)
    {
      id v7 = objc_getProperty(v3, v6, 336, 1);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, 0);
      [(NEIKEv2Session *)v3 reportState];
    }
    double v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Disconnected %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)reportState
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id Property = objc_getProperty(a1, a2, 336, 1);
  if (Property) {
    unint64_t v5 = Property[6];
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = objc_getProperty(a1, v4, 336, 1);
  id v44 = (id *)a1;
  if (v6) {
    id v6 = objc_getProperty(v6, v7, 56, 1);
  }
  id v8 = v6;
  double v9 = ne_log_obj();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  char v43 = v8;
  if (v8)
  {
    if (!v10) {
      goto LABEL_12;
    }
    SessionStateString = NEIKEv2CreateSessionStateString(v5);
    *(_DWORD *)buf = 138412802;
    id v62 = a1;
    __int16 v63 = 2112;
    id v64 = SessionStateString;
    __int16 v65 = 2112;
    id v66 = v8;
    uint64_t v12 = "%@ Reporting state %@ error %@";
    objc_super v13 = v9;
    uint32_t v14 = 32;
  }
  else
  {
    if (!v10) {
      goto LABEL_12;
    }
    SessionStateString = NEIKEv2CreateSessionStateString(v5);
    *(_DWORD *)buf = 138412546;
    id v62 = a1;
    __int16 v63 = 2112;
    id v64 = SessionStateString;
    uint64_t v12 = "%@ Reporting state %@";
    objc_super v13 = v9;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);

LABEL_12:
  uint64_t v15 = (id *)a1;
  a1[5] = v5;
  [(NEIKEv2Session *)a1 updateEndpointState];
  id v17 = [a1 stateUpdateBlock];
  id v18 = [a1 clientQueue];

  if (v18 && v17)
  {
    id v20 = [a1 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__NEIKEv2Session_reportState__block_invoke;
    block[3] = &unk_1E5991588;
    block[4] = a1;
    id v58 = v17;
    unint64_t v59 = v5;
    id v57 = v43;
    dispatch_async(v20, block);

    id v22 = objc_getProperty(a1, v21, 336, 1);
    if (v22) {
      v22[8] = 0;
    }
  }
  int v41 = v17;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = objc_getProperty(a1, v19, 288, 1);
  uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v53;
    id v42 = v47;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v53 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if (v27)
        {
          int v28 = *(_DWORD *)(v27 + 16);
          if (v28)
          {
            unint64_t v29 = *(void *)(v27 + 32);
            if (v5 == 3)
            {
              if (v29) {
                BOOL v30 = v29 == 3;
              }
              else {
                BOOL v30 = 1;
              }
              if (!v30)
              {
                unint64_t v29 = 3;
                goto LABEL_33;
              }
            }
            else if (!v5 && v29)
            {
              unint64_t v29 = 0;
LABEL_33:
              -[NEIKEv2ChildSA setState:error:](*(void *)(*((void *)&v52 + 1) + 8 * i), v29, v43);
            }
            if (*(unsigned char *)(v27 + 8))
            {
              unint64_t v31 = v5;
              int v32 = objc_msgSend(v15, "childStateUpdateBlock", v41, v42);
              uint64_t v33 = [v15 clientQueue];

              if (v33 && v32)
              {
                id v35 = objc_getProperty((id)v27, v34, 40, 1);
                id v36 = [v15 clientQueue];
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v47[0] = __29__NEIKEv2Session_reportState__block_invoke_2;
                v47[1] = &unk_1E5990E88;
                void v47[2] = v44;
                id v37 = v32;
                int v51 = v28;
                id v49 = v37;
                unint64_t v50 = v29;
                id v48 = v35;
                id v38 = v35;
                dispatch_async(v36, v46);

                uint64_t v15 = v44;
                *(unsigned char *)(v27 + 8) = 0;
              }
              unint64_t v5 = v31;
            }
            continue;
          }
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v24);
  }

  id WeakRetained = objc_loadWeakRetained(v15 + 43);
  uint64_t v40 = WeakRetained;
  if (WeakRetained && v5 == 3 && !*((unsigned char *)v15 + 14))
  {
    *((unsigned char *)v15 + 14) = 1;
    [WeakRetained sessionFailedBeforeRequestingConfiguration:v15];
  }
}

- (void)updateEndpointState
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 336, 1);
    if ([(NEIKEv2IKESA *)Property hasTransport])
    {
      id v6 = (id *)objc_getProperty(a1, v5, 336, 1);
      id v8 = [(NEIKEv2IKESA *)v6 copyTransport];
      self = v8;
      if (v8)
      {
        id v10 = objc_getProperty(v8, v9, 16, 1);
        objc_setProperty_atomic(a1, v11, v10, 56);

        id v13 = objc_getProperty(self, v12, 24, 1);
      }
      else
      {
        objc_setProperty_atomic(a1, v9, 0, 56);
        id v13 = 0;
      }
      id v14 = v13;
      objc_setProperty_atomic(a1, v15, v14, 64);

      id v17 = self;
      if (self) {
        id v17 = objc_getProperty(self, v16, 32, 1);
      }
      id v18 = v17;
      SEL v19 = [v18 interfaceName];
      objc_setProperty_atomic(a1, v20, v19, 72);
    }
    else
    {
      objc_setProperty_atomic(a1, v5, 0, 56);
      objc_setProperty_atomic(a1, v21, 0, 64);
      objc_setProperty_atomic(a1, v22, 0, 72);
    }
  }
}

void *__29__NEIKEv2Session_reportState__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[6] + 16))(result[6], result[7], result[5]);
  }
  return result;
}

uint64_t __29__NEIKEv2Session_reportState__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(result + 48) + 16))(*(void *)(result + 48), *(unsigned int *)(result + 64), *(void *)(result + 56), *(void *)(result + 40));
  }
  return result;
}

- (void)connect
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 368, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NEIKEv2Session_connect__block_invoke;
  block[3] = &unk_1E59932C0;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

void __25__NEIKEv2Session_connect__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Connect %@", buf, 0xCu);
  }

  id Property = *(unsigned char **)(a1 + 32);
  if (Property)
  {
    if (Property[11]) {
      return;
    }
    id Property = objc_getProperty(Property, v4, 336, 1);
  }
  id v6 = [(NEIKEv2IKESA *)(id *)Property copyTransport];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__NEIKEv2Session_connect__block_invoke_45;
  v7[3] = &unk_1E59932C0;
  v7[4] = *(void *)(a1 + 32);
  -[NEIKEv2Transport waitForTransport:]((uint64_t)v6, v7);
}

void __25__NEIKEv2Session_connect__block_invoke_45(uint64_t a1, const char *a2)
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  [(NEIKEv2IKESA *)(id *)Property resyncAddress];
  unint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = objc_getProperty(*(id *)(a1 + 32), v4, 368, 1);
    dispatch_assert_queue_V2(v6);

    id v8 = objc_getProperty(v5, v7, 336, 1);
    uint64_t v164 = 0;
    __int16 v165 = &v164;
    uint64_t v166 = 0x3032000000;
    __int16 v167 = __Block_byref_object_copy__9363;
    SEL v168 = __Block_byref_object_dispose__9364;
    id v169 = [(NEIKEv2Session *)v5 firstChildSA];
    if (!v8)
    {
      unint64_t v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2Session(Exchange) initiateConnect]";
      BOOL v30 = "%s called with null ikeSA";
      goto LABEL_69;
    }
    id v11 = objc_getProperty(v8, v10, 80, 1);
    char v12 = [v11 requestChildlessSA];

    id v14 = (void *)v165[5];
    if (v12)
    {
      if (!v14)
      {
LABEL_11:
        SEL v20 = ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEFAULT, "%@ Initiating IKEv2 connection", (uint8_t *)&buf, 0xCu);
        }

        id v22 = objc_getProperty(v8, v21, 80, 1);
        int v23 = [v22 serverMode];

        if (v23)
        {
          uint64_t v25 = ne_log_obj();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "%@ Cannot initiate connection while in server mode (connect)", (uint8_t *)&buf, 0xCu);
          }

          id v27 = objc_getProperty(v5, v26, 336, 1);
          id Error = (id)NEIKEv2CreateError(9);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
LABEL_82:

          [(NEIKEv2Session *)v5 reportState];
          [(NEIKEv2Session *)(uint64_t)v5 resetAll];
          goto LABEL_83;
        }
        if (v8[13])
        {
          ptrdiff_t v31 = 480;
        }
        else if (v8[12])
        {
          ptrdiff_t v31 = 472;
        }
        else
        {
          ptrdiff_t v31 = 464;
        }
        int v32 = objc_getProperty(v8, v24, v31, 1);
        if (!v32 || (v32[8] & 1) == 0)
        {
          uint64_t v33 = ne_log_obj();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "%@ Cannot initiate connection as transport is not connected (connect)", (uint8_t *)&buf, 0xCu);
          }

          id v27 = objc_getProperty(v5, v34, 336, 1);
          id Error = objc_getProperty(v8, v35, 56, 1);
          if (Error) {
            id ErrorInternal = objc_getProperty(v8, v36, 56, 1);
          }
          else {
            id ErrorInternal = (id)NEIKEv2CreateErrorInternal(@"Transport is not connected (connect)", (uint64_t)v36, v37, v38, v39, v40, v41, v42, v156);
          }
          uint64_t v67 = ErrorInternal;
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, ErrorInternal);

          goto LABEL_82;
        }
        -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 1uLL, 0);
        [(NEIKEv2Session *)v5 reportState];
        long long v46 = (void *)v165[5];
        if (v46)
        {
          __int16 v47 = [(NEIKEv2ChildSA *)(id)v165[5] configProposalsWithoutKEM];
          char v48 = -[NEIKEv2Session generateSPIForChild:proposals:](v5, v46, v47);

          if ((v48 & 1) == 0)
          {
            id v77 = ne_log_obj();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v5;
              _os_log_error_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_ERROR, "%@ Failed to generate Child SA SPI (connect)", (uint8_t *)&buf, 0xCu);
            }

            id v27 = objc_getProperty(v5, v78, 336, 1);
            id Error = (id)NEIKEv2CreateErrorCrypto(@"Failed to generate Child SA SPI (connect)", v79, v80, v81, v82, v83, v84, v85, v156);
            -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
            goto LABEL_82;
          }
        }
        if (([(NEIKEv2IKESA *)v8 generateInitialValues] & 1) == 0)
        {
          uint64_t v68 = ne_log_obj();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl(&dword_19DDAF000, v68, OS_LOG_TYPE_ERROR, "%@ Failed to generate local crypto values (connect)", (uint8_t *)&buf, 0xCu);
          }

          id v27 = objc_getProperty(v5, v69, 336, 1);
          id Error = (id)NEIKEv2CreateErrorCrypto(@"Failed to generate local crypto values (connect)", v70, v71, v72, v73, v74, v75, v76, v156);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
          goto LABEL_82;
        }
        id v50 = objc_getProperty(v8, v49, 88, 1);
        int v51 = [v50 localCertificateReference];

        id v53 = objc_getProperty(v8, v52, 88, 1);
        id v163 = [v53 localCertificateKeyReference];

        id v55 = objc_getProperty(v8, v54, 88, 1);
        int v162 = [v55 localCertificateIsModernSystem];

        id v56 = ne_log_obj();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v51;
          _os_log_debug_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_DEBUG, "fetchLocalCertificateIdentity: certIdentityPersistentData %@", (uint8_t *)&buf, 0xCu);
        }

        if (v51)
        {
LABEL_38:
          CFDataRef v58 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v51);
          CFDataRef v59 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v163);
          uint64_t v60 = (__SecIdentity *)+[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]((uint64_t)NEIKEv2Crypto, v58, v59, v162);
          uint64_t v61 = v60;
          if (v60)
          {
            certificateRef[0] = 0;
            OSStatus v62 = SecIdentityCopyCertificate(v60, certificateRef);
            CFRelease(v61);
            if (!v62 && certificateRef[0])
            {
              int IsValid = NECertificateDateIsValid((uint64_t)certificateRef[0]);
              if (certificateRef[0])
              {
                CFRelease(certificateRef[0]);
                certificateRef[0] = 0;
              }
              if (IsValid != 1)
              {
                if (IsValid == 3)
                {
                  uint64_t v151 = ne_log_obj();
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(buf) = 0;
                    _os_log_error_impl(&dword_19DDAF000, v151, OS_LOG_TYPE_ERROR, "local certificate is expired", (uint8_t *)&buf, 2u);
                  }

                  int v152 = (void *)NEIKEv2CreateError(12);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v152);
                }
                else if (IsValid == 2)
                {
                  __int16 v65 = ne_log_obj();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(buf) = 0;
                    _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "local certificate is not yet valid", (uint8_t *)&buf, 2u);
                  }

                  id v66 = (void *)NEIKEv2CreateError(11);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v66);
                }
                else
                {
                  uint64_t v153 = ne_log_obj();
                  if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v155 = off_1E5992FC8[IsValid - 1];
                    LODWORD(buf) = 136315138;
                    *(void *)((char *)&buf + 4) = v155;
                    _os_log_error_impl(&dword_19DDAF000, v153, OS_LOG_TYPE_ERROR, "local certificate status %s", (uint8_t *)&buf, 0xCu);
                  }

                  uint64_t v154 = (void *)NEIKEv2CreateError(13);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v8, 3uLL, v154);
                }
LABEL_78:
                char v170 = 0;

                char v100 = v170;
                if ((v100 & 1) == 0)
                {
LABEL_79:
                  char v101 = ne_log_obj();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v5;
                    _os_log_error_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_ERROR, "%@ Failed to fetch local certificate identity (connect)", (uint8_t *)&buf, 0xCu);
                  }

                  id v27 = objc_getProperty(v5, v102, 336, 1);
                  id Error = (id)NEIKEv2CreateErrorInternal(@"Failed to fetch local certificate identity (connect)", v103, v104, v105, v106, v107, v108, v109, v156);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 3uLL, Error);
                  goto LABEL_82;
                }
                goto LABEL_122;
              }
              objc_setProperty_atomic(v8, v63, v58, 264);
              objc_setProperty_atomic(v8, v125, v59, 272);
              v8[22] = v162;

LABEL_121:
LABEL_122:
              unint64_t v29 = +[NEIKEv2IKESAInitPacket createIKESAInitForInitiatorIKESA:]((uint64_t)NEIKEv2IKESAInitPacket, v8);
              if (v29)
              {
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                SEL v178 = __43__NEIKEv2Session_Exchange__initiateConnect__block_invoke;
                uint64_t v179 = &unk_1E5990670;
                SEL v180 = v5;
                id v181 = v8;
                SEL v182 = &v164;
                if (-[NEIKEv2Session sendRequest:retry:replyHandler:]((uint64_t)v5, v29, &buf) == -1)
                {
                  id v127 = objc_getProperty(v5, v126, 336, 1);
                  uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"initiator SA INIT", v128, v129, v130, v131, v132, v133, v134, v156);
                  -[NEIKEv2IKESA setState:error:]((uint64_t)v127, 3uLL, ErrorFailedToSend);

                  [(NEIKEv2Session *)v5 reportState];
                  [(NEIKEv2Session *)(uint64_t)v5 resetAll];
                }
              }
              else
              {
                uint64_t v138 = ne_log_obj();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v5;
                  _os_log_error_impl(&dword_19DDAF000, v138, OS_LOG_TYPE_ERROR, "%@ Failed to create IKE SA Init packet (connect)", (uint8_t *)&buf, 0xCu);
                }

                id v140 = objc_getProperty(v5, v139, 336, 1);
                uint64_t v148 = (void *)NEIKEv2CreateErrorInternal(@"Failed to create IKE SA Init packet (connect)", v141, v142, v143, v144, v145, v146, v147, v156);
                -[NEIKEv2IKESA setState:error:]((uint64_t)v140, 3uLL, v148);

                [(NEIKEv2Session *)v5 reportState];
                [(NEIKEv2Session *)(uint64_t)v5 resetAll];
                unint64_t v29 = 0;
              }
              goto LABEL_24;
            }
            if (certificateRef[0])
            {
              CFRelease(certificateRef[0]);
              certificateRef[0] = 0;
            }
            uint64_t v99 = ne_log_obj();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_FAULT, "SecIdentityCopyCertificate failed", (uint8_t *)&buf, 2u);
            }
          }
          else
          {
            uint64_t v99 = ne_log_obj();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_ERROR, "failed to get identity from persistent reference", (uint8_t *)&buf, 2u);
            }
          }

          goto LABEL_78;
        }
        id v86 = objc_getProperty(v8, v57, 88, 1);
        long long v87 = [v86 localCertificateName];

        if (!v87) {
          goto LABEL_121;
        }
        id value = v87;
        self;
        self;
        uint64_t v88 = *MEMORY[0x1E4F3B990];
        uint64_t v89 = *MEMORY[0x1E4F3BC80];
        uint64_t v184 = *MEMORY[0x1E4F3B978];
        uint64_t v185 = v89;
        uint64_t v90 = *MEMORY[0x1E4F1CFD0];
        *(void *)&long long v188 = v88;
        *((void *)&v188 + 1) = v90;
        uint64_t v91 = *MEMORY[0x1E4F3BB88];
        uint64_t v92 = *MEMORY[0x1E4F3BD20];
        uint64_t v186 = *MEMORY[0x1E4F3BB80];
        uint64_t v187 = v92;
        uint64_t v159 = v92;
        uint64_t v160 = v90;
        uint64_t v189 = v91;
        uint64_t v190 = v90;
        CFDictionaryRef v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v184 count:4];
        CFTypeRef result = 0;
        OSStatus v94 = SecItemCopyMatching(v93, &result);
        uint64_t v95 = (void *)result;
        if (v94 || ![(id)result count])
        {
          uint64_t v96 = ne_log_obj();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v183[0]) = 67109120;
            HIDWORD(v183[0]) = v94;
            _os_log_error_impl(&dword_19DDAF000, v96, OS_LOG_TYPE_ERROR, "failed to retrieve all certificate identities (%d)", (uint8_t *)v183, 8u);
          }
        }
        else
        {
          id v112 = v95;

          if (v112)
          {
            long long v173 = 0u;
            long long v174 = 0u;
            *(_OWORD *)certificateRef = 0u;
            long long v172 = 0u;
            id v113 = v112;
            uint64_t v114 = [v113 countByEnumeratingWithState:certificateRef objects:&buf count:16];
            if (v114)
            {
              uint64_t v115 = *(void *)v172;
              uint64_t v157 = *MEMORY[0x1E4F3BD48];
              uint64_t v158 = *MEMORY[0x1E4F3BC78];
              uint64_t v156 = 136315138;
              do
              {
                uint64_t v116 = 0;
                do
                {
                  if (*(void *)v172 != v115) {
                    objc_enumerationMutation(v113);
                  }
                  SEL v117 = (__SecIdentity *)*((void *)certificateRef[1] + v116);
                  v183[0] = 0;
                  if (SecIdentityCopyCertificate(v117, v183))
                  {
                    if (v183[0]) {
                      CFRelease(v183[0]);
                    }
                  }
                  else
                  {
                    CFArrayRef v118 = (const __CFArray *)SecCertificateCopyCommonNames();
                    CFArrayRef v119 = v118;
                    if (v118)
                    {
                      v192.unint64_t length = CFArrayGetCount(v118);
                      v192.location = 0;
                      if (CFArrayContainsValue(v119, v192, value))
                      {
                        self;
                        if (v117)
                        {
                          uint64_t v184 = v158;
                          uint64_t v185 = v157;
                          *(void *)&long long v188 = v160;
                          *((void *)&v188 + 1) = v117;
                          uint64_t v186 = v159;
                          uint64_t v189 = v160;
                          CFDictionaryRef v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v184 count:3];
                          CFTypeRef result = 0;
                          OSStatus v121 = SecItemCopyMatching(v120, &result);
                          id v122 = (void *)result;
                          if (v121)
                          {
                            uint64_t v123 = ne_log_obj();
                            if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT))
                            {
                              *(_WORD *)uint64_t v175 = 0;
                              _os_log_fault_impl(&dword_19DDAF000, v123, OS_LOG_TYPE_FAULT, "SecItemCopyMatching failed", v175, 2u);
                            }

                            int v51 = 0;
                          }
                          else
                          {
                            int v51 = (id)result;
                          }
                        }
                        else
                        {
                          ne_log_obj();
                          CFDictionaryRef v120 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled((os_log_t)v120, OS_LOG_TYPE_FAULT))
                          {
                            LODWORD(v188) = 136315138;
                            *(void *)((char *)&v188 + 4) = "+[NEIKEv2Crypto copyPersistentDataForIdentity:]";
                            _os_log_fault_impl(&dword_19DDAF000, (os_log_t)v120, OS_LOG_TYPE_FAULT, "%s called with null identity", (uint8_t *)&v188, 0xCu);
                          }
                          int v51 = 0;
                        }
                      }
                      else
                      {
                        int v51 = 0;
                      }
                      CFRelease(v119);
                    }
                    else
                    {
                      int v51 = 0;
                    }
                    if (v183[0]) {
                      CFRelease(v183[0]);
                    }
                    if (v51) {
                      goto LABEL_118;
                    }
                  }
                  ++v116;
                }
                while (v114 != v116);
                uint64_t v124 = [v113 countByEnumeratingWithState:certificateRef objects:&buf count:16];
                uint64_t v114 = v124;
              }
              while (v124);
            }
            int v51 = 0;
LABEL_118:

            if (v51)
            {

              goto LABEL_38;
            }
LABEL_65:
            id v98 = ne_log_obj();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = value;
              _os_log_error_impl(&dword_19DDAF000, v98, OS_LOG_TYPE_ERROR, "failed to fetch persistent reference for Cert %@", (uint8_t *)&buf, 0xCu);
            }

            goto LABEL_79;
          }
        }
        int v97 = ne_log_obj();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v188) = 0;
          _os_log_fault_impl(&dword_19DDAF000, v97, OS_LOG_TYPE_FAULT, "ikev2_crypto_copy_all_cert_identities failed", (uint8_t *)&v188, 2u);
        }

        goto LABEL_65;
      }
    }
    else if (!v14)
    {
      unint64_t v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2Session(Exchange) initiateConnect]";
      BOOL v30 = "%s called with null childSA";
      goto LABEL_69;
    }
    id v15 = objc_getProperty(v14, v13, 48, 1);
    BOOL v16 = v15 == 0;

    if (v16)
    {
      unint64_t v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2Session(Exchange) initiateConnect]";
      BOOL v30 = "%s called with null childSA.configuration";
    }
    else
    {
      id v18 = [(NEIKEv2ChildSA *)(id)v165[5] configProposalsWithoutKEM];
      BOOL v19 = v18 == 0;

      if (!v19) {
        goto LABEL_11;
      }
      unint64_t v29 = ne_log_obj();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

LABEL_83:
        _Block_object_dispose(&v164, 8);

        return;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2Session(Exchange) initiateConnect]";
      BOOL v30 = "%s called with null childSA.configProposalsWithoutKEM";
    }
LABEL_69:
    _os_log_fault_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_FAULT, v30, (uint8_t *)&buf, 0xCu);
    goto LABEL_24;
  }
}

- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 kernelSASessionName:(id)a9 packetDelegate:(id)a10
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v16)
  {
    SEL v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kern"
            "elSASessionName:packetDelegate:]";
      id v27 = "%s called with null ikeConfig";
      goto LABEL_13;
    }
LABEL_11:

    uint64_t v24 = 0;
    goto LABEL_5;
  }
  if (!v21)
  {
    SEL v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kern"
            "elSASessionName:packetDelegate:]";
      id v27 = "%s called with null kernelSASessionName";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v19)
  {
    SEL v26 = ne_log_obj();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)long long buf = 136315138;
    unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kernel"
          "SASessionName:packetDelegate:]";
    id v27 = "%s called with null queue";
LABEL_13:
    _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_11;
  }
  int v23 = [[NEIPSecSAKernelSession alloc] initWithName:v21 delegate:0];
  self = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:](&self->super, v16, v17, v18, v19, (id *)a7, v20, v23, 1, v22, 0, 0);

  uint64_t v24 = self;
LABEL_5:

  return v24;
}

- (NSObject)initWithIKEConfig:(void *)a3 firstChildConfig:(void *)a4 sessionConfig:(void *)a5 queue:(id *)a6 ipsecInterface:(void *)a7 ikeSocketHandler:(void *)a8 saSession:(char)a9 shouldOwnSASession:(void *)a10 packetDelegate:(void *)a11 transport:(void *)a12 configurationDelegate:
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v19 = a3;
  id v93 = a4;
  id v20 = a5;
  id newValue = a7;
  id v21 = a8;
  id v22 = a10;
  id v94 = a11;
  id v23 = a12;
  id v92 = v21;
  if (!a1)
  {
    id v27 = v18;
    goto LABEL_70;
  }
  uint64_t v24 = a1;
  if (v21)
  {
    v101.receiver = a1;
    v101.super_class = (Class)NEIKEv2Session;
    uint64_t v25 = [&v101 init];
    id v27 = v18;
    uint64_t v24 = v25;
    if (v25)
    {
      LODWORD(v25[2].isa) = -1;
      HIDWORD(v25[2].isa) = -1;
      LODWORD(v25[3].isa) = -1;
      v25[39].Class isa = (Class)atomic_fetch_add_explicit(&sNEIKEv2SessionIndex, 1uLL, memory_order_relaxed);
      objc_setProperty_atomic_copy(v25, v26, newValue, 160);
      if (v23) {
        objc_storeWeak((id *)&v24[43].isa, v23);
      }
      int v28 = v24;
      if (v22)
      {
        objc_storeWeak((id *)&v24[44].isa, v22);
        int v28 = v24;
      }
      if (a6)
      {
        if (a6[32] == (id)2)
        {
          unint64_t v29 = (objc_class *)CFRetain(a6);
          int v28 = v24;
          v24[41].Class isa = v29;
        }
        else
        {
          uint64_t v30 = ne_log_obj();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            long long v87 = (const char *)a6[32];
            *(_DWORD *)long long buf = 134217984;
            uint64_t v103 = v87;
            _os_log_fault_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_FAULT, "Passed in virtual interface of bad type %lld", buf, 0xCu);
          }

          int v28 = v24;
        }
      }
      objc_storeStrong((id *)&v28[48].isa, a2);
      objc_setProperty_atomic(v24, v31, v20, 368);
      objc_initWeak(&location, v24);
      int v32 = [NEIKEv2IKESA alloc];
      id v34 = objc_getProperty(v24, v33, 160, 1);
      if (v34)
      {
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke;
        v98[3] = &unk_1E5990D98;
        a6 = &v99;
        objc_copyWeak(&v99, &location);
        SEL v35 = v98;
      }
      else
      {
        SEL v35 = 0;
      }
      id v36 = -[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:](&v32->super, v27, v93, v20, v94, v24, v35, v22, v23, v24[39].isa);
      objc_setProperty_atomic(v24, v37, v36, 336);

      if (!objc_getProperty(v24, v38, 336, 1))
      {
        uint64_t v85 = ne_log_obj();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v103 = (const char *)v24;
          _os_log_error_impl(&dword_19DDAF000, v85, OS_LOG_TYPE_ERROR, "%@ failed to create IKE SA", buf, 0xCu);
        }
        a1 = 0;
        goto LABEL_66;
      }
      uint64_t v40 = (id *)objc_getProperty(v24, v39, 336, 1);
      id v42 = [(NEIKEv2IKESA *)v40 copyTransport];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke_40;
      v96[3] = &unk_1E59932C0;
      char v43 = v24;
      int v97 = v43;
      -[NEIKEv2Transport waitForTransport:]((uint64_t)v42, v96);

      int v44 = [v27 serverMode];
      LOBYTE(v43[1].isa) = v44;
      if (v44) {
        objc_setProperty_atomic(v43, v45, v19, 168);
      }
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_setProperty_atomic(v43, v47, v46, 288);

      if (objc_getProperty(v43, v48, 288, 1))
      {
        if (v19
          && (-[NEIKEv2Session addFirstChild:](v43, v19),
              [(NEIKEv2Session *)v43 firstChildSA],
              id v50 = objc_claimAutoreleasedReturnValue(),
              BOOL v51 = v50 == 0,
              v50,
              v51))
        {
          id v86 = ne_log_obj();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandl"
                   "er:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
            _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.firstChildSA", buf, 0xCu);
          }
        }
        else
        {
          id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_setProperty_atomic(v43, v53, v52, 184);

          if (objc_getProperty(v43, v54, 184, 1))
          {
            id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            objc_setProperty_atomic(v43, v56, v55, 192);

            if (objc_getProperty(v43, v57, 192, 1))
            {
              id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              objc_setProperty_atomic(v43, v59, v58, 216);

              if (objc_getProperty(v43, v60, 216, 1))
              {
                id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                objc_setProperty_atomic(v43, v62, v61, 224);

                if (objc_getProperty(v43, v63, 224, 1))
                {
                  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  objc_setProperty_atomic(v43, v65, v64, 232);

                  if (objc_getProperty(v43, v66, 232, 1))
                  {
                    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    objc_setProperty_atomic(v43, v68, v67, 240);

                    if (objc_getProperty(v43, v69, 240, 1))
                    {
                      id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                      objc_setProperty_atomic(v43, v71, v70, 248);

                      if (objc_getProperty(v43, v72, 248, 1))
                      {
                        id v73 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                        objc_setProperty_atomic(v43, v74, v73, 256);

                        if (objc_getProperty(v43, v75, 256, 1))
                        {
                          BYTE1(v43[1].isa) = a9;
                          objc_setProperty_atomic(v43, v76, v92, 176);
                          id v78 = objc_getProperty(v43, v77, 176, 1);
                          [v78 setDelegate:v43];

                          id v80 = objc_getProperty(v43, v79, 368, 1);
                          id v82 = objc_getProperty(v43, v81, 176, 1);
                          [v82 setDelegateQueue:v80];

                          uint64_t v83 = objc_alloc_init(NEIKEv2RTT);
                          objc_setProperty_atomic(v43, v84, v83, 360);

                          a1 = v43;
LABEL_65:
                          uint64_t v85 = v97;
LABEL_66:

                          if (v34) {
                            objc_destroyWeak(a6);
                          }
                          objc_destroyWeak(&location);
                          goto LABEL_69;
                        }
                        id v86 = ne_log_obj();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)long long buf = 136315138;
                          uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:"
                                 "ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                          _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.replyFragmentMaps", buf, 0xCu);
                        }
                      }
                      else
                      {
                        id v86 = ne_log_obj();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)long long buf = 136315138;
                          uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:"
                                 "ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                          _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.requestFragmentMaps", buf, 0xCu);
                        }
                      }
                    }
                    else
                    {
                      id v86 = ne_log_obj();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)long long buf = 136315138;
                        uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ik"
                               "eSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                        _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.receivedReplies", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    id v86 = ne_log_obj();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)long long buf = 136315138;
                      uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeS"
                             "ocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                      _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.receivedRequests", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  id v86 = ne_log_obj();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)long long buf = 136315138;
                    uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSoc"
                           "ketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                    _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.sentReplies", buf, 0xCu);
                  }
                }
              }
              else
              {
                id v86 = ne_log_obj();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)long long buf = 136315138;
                  uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocke"
                         "tHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                  _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.sentRequests", buf, 0xCu);
                }
              }
            }
            else
            {
              id v86 = ne_log_obj();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketH"
                       "andler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
                _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.databaseSAs", buf, 0xCu);
              }
            }
          }
          else
          {
            id v86 = ne_log_obj();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)long long buf = 136315138;
              uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHan"
                     "dler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
              _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.databaseLarvalSAs", buf, 0xCu);
            }
          }
        }
      }
      else
      {
        id v86 = ne_log_obj();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler"
                 ":saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
          _os_log_fault_impl(&dword_19DDAF000, v86, OS_LOG_TYPE_FAULT, "%s called with null self.childSAs", buf, 0xCu);
        }
      }

      a1 = 0;
      goto LABEL_65;
    }
    uint64_t v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    uint64_t v89 = ne_log_obj();
    id v27 = v18;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v103 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saS"
             "ession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]";
      _os_log_fault_impl(&dword_19DDAF000, v89, OS_LOG_TYPE_FAULT, "%s called with null saSession", buf, 0xCu);
    }
  }
  a1 = 0;
LABEL_69:

LABEL_70:
  return a1;
}

void __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained && (WeakRetained[12] & 1) == 0 && objc_getProperty(WeakRetained, v10, 160, 1))
  {
    id Property = objc_getProperty(v11, v12, 160, 1);
    id v14 = Property;
    int v15 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))Property + 2))(v14, [v11 clientCallbackInfo], a2, a3, a4);

    *a5 = v15;
    id v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = *a5;
      int v18 = 136315394;
      id v19 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSe"
            "ssion:shouldOwnSASession:packetDelegate:transport:configurationDelegate:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%s: Get socket %d\n", (uint8_t *)&v18, 0x12u);
    }
  }
}

void __181__NEIKEv2Session_initWithIKEConfig_firstChildConfig_sessionConfig_queue_ipsecInterface_ikeSocketHandler_saSession_shouldOwnSASession_packetDelegate_transport_configurationDelegate___block_invoke_40(uint64_t a1, const char *a2)
{
}

- (void)addFirstChild:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    unint64_t v5 = [(NEIKEv2Session *)a1 firstChildSA];

    if (v5)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        int v15 = (const char *)a1;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ Already have a first child SA, ignoring request", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      SEL v7 = [NEIKEv2ChildSA alloc];
      self;
      int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
      if (!add_explicit) {
        int add_explicit = atomic_fetch_add_explicit(getNewChildSAID_nextChildSAID, 1u, memory_order_relaxed);
      }
      id Property = objc_getProperty(a1, v8, 336, 1);
      id v11 = -[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:](&v7->super, v4, add_explicit, Property);
      if (v11)
      {
        id v6 = v11;
        objc_msgSend(objc_getProperty(a1, v12, 288, 1), "addObject:", v11);
      }
      else
      {
        id v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          int v14 = 136315138;
          int v15 = "-[NEIKEv2Session addFirstChild:]";
          _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "%s called with null firstChildSA", (uint8_t *)&v14, 0xCu);
        }

        id v6 = 0;
      }
    }
  }
}

- (NEIKEv2Session)initWithIKEConfig:(id)a3 firstChildConfig:(id)a4 sessionConfig:(id)a5 queue:(id)a6 ipsecInterface:(NEVirtualInterface_s *)a7 ikeSocketHandler:(id)a8 saSession:(id)a9 packetDelegate:(id)a10
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = v22;
  if (!v16)
  {
    SEL v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSe"
            "ssion:packetDelegate:]";
      id v27 = "%s called with null ikeConfig";
      goto LABEL_13;
    }
LABEL_11:

    uint64_t v24 = 0;
    goto LABEL_5;
  }
  if (!v21)
  {
    SEL v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSe"
            "ssion:packetDelegate:]";
      id v27 = "%s called with null saSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v19)
  {
    SEL v26 = ne_log_obj();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)long long buf = 136315138;
    unint64_t v29 = "-[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSess"
          "ion:packetDelegate:]";
    id v27 = "%s called with null queue";
LABEL_13:
    _os_log_fault_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_11;
  }
  self = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:](&self->super, v16, v17, v18, v19, (id *)a7, v20, v21, 0, v22, 0, 0);
  uint64_t v24 = self;
LABEL_5:

  return v24;
}

- (NSString)description
{
  uint64_t v2 = self;
  if (self) {
    self = (NEIKEv2Session *)objc_getProperty(self, a2, 336, 1);
  }
  id v4 = [(NEIKEv2IKESA *)self initiatorSPI];
  if (v2) {
    id Property = objc_getProperty(v2, v3, 336, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = [(NEIKEv2IKESA *)Property responderSPI];
  id v7 = [NSString alloc];
  if (v2) {
    unint64_t uniqueIndex = v2->_uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0;
  }
  uint64_t v9 = @"0000000000000000";
  if (v4) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = @"0000000000000000";
  }
  if (v6) {
    uint64_t v9 = v6;
  }
  id v11 = (void *)[v7 initWithFormat:@"IKEv2Session[%llu, %@-%@]", uniqueIndex, v10, v9];

  return (NSString *)v11;
}

- (void)reportError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    BOOL isInvalidated = self->_isInvalidated;
    if (!a3) {
      return;
    }
  }
  else
  {
    BOOL isInvalidated = 0;
    if (!a3) {
      return;
    }
  }
  if (isInvalidated) {
    return;
  }
  if (a3 == 49)
  {
    if (!self || (id v6 = objc_getProperty(self, a2, 336, 1)) == 0 || (v6[11] & 1) == 0)
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v50 = v4;
        __int16 v51 = 1024;
        int v52 = 49;
        _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "%@ Reporting transport error %d", buf, 0x12u);
      }

      if (v4) {
        id Property = objc_getProperty(v4, v8, 336, 1);
      }
      else {
        id Property = 0;
      }
      id v10 = Property;
      uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"Transport error %d", v11, v12, v13, v14, v15, v16, v17, 49);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v10, 3uLL, ErrorFailedToSend);

      [(NEIKEv2Session *)v4 reportState];
      return;
    }
  }
  else if (!self)
  {
    goto LABEL_21;
  }
  id v20 = objc_getProperty(v4, a2, 336, 1);
  if (!v20) {
    goto LABEL_21;
  }
  if (v20[6] != 2) {
    goto LABEL_21;
  }
  if (v4->_lastRequestMessageID == -1) {
    goto LABEL_21;
  }
  id v22 = objc_getProperty(v4, v21, 240, 1);
  id v23 = [NSNumber numberWithInt:v4->_lastRequestMessageID];
  uint64_t v24 = [v22 objectForKeyedSubscript:v23];

  if (!v24)
  {
LABEL_21:
    id v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v50 = v4;
      __int16 v51 = 1024;
      int v52 = v3;
      _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%@ Reporting transport error %d", buf, 0x12u);
    }

    if (v4)
    {
      id v44 = objc_getProperty(v4, v37, 336, 1);
      id v46 = objc_getProperty(v4, v45, 336, 1);
      id v4 = (NEIKEv2Session *)v46;
      if (v46)
      {
        unint64_t v47 = *((void *)v46 + 6);
LABEL_26:
        id ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Transport error %d", (uint64_t)v37, v38, v39, v40, v41, v42, v43, v3);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v44, v47, ErrorInternal);

        return;
      }
    }
    else
    {
      id v44 = 0;
    }
    unint64_t v47 = 0;
    goto LABEL_26;
  }
  uint64_t v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v50 = v4;
    __int16 v51 = 1024;
    int v52 = v3;
    _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "%@ Reporting transport error %d while connected", buf, 0x12u);
  }

  id v27 = objc_getProperty(v4, v26, 336, 1);
  SEL v35 = (void *)NEIKEv2CreateErrorInternal(@"Transport error %d", v28, v29, v30, v31, v32, v33, v34, v3);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v27, 2uLL, v35);
}

- (void)blackholeDetectedSA:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKeyedSubscript:v5];
  id v8 = ne_log_large_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176, 1);
    }
    else {
      id v10 = 0;
    }
    int v11 = 138413058;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ blackhole detected SA %@ childSA %@", (uint8_t *)&v11, 0x2Au);
  }

  if (v7) {
    [(NEIKEv2Session *)self sendKeepaliveWithRetries:4 retryIntervalInMilliseconds:0 callbackQueue:0 callback:0];
  }
}

- (void)idleTimeoutSA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKeyedSubscript:v5];
  id v8 = ne_log_large_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176, 1);
    }
    else {
      id v10 = 0;
    }
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ idle timeout SA %@ childSA %@", (uint8_t *)&v13, 0x2Au);
  }

  if (v7)
  {
    unsigned int v11 = v7[4];
    id Error = (void *)NEIKEv2CreateError(15);
    -[NEIKEv2Session removeChild:withReason:](self, v11, Error);
  }
  [v5 invalidate];
}

- (void)deleteSA:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKeyedSubscript:v5];
  id v8 = ne_log_large_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176, 1);
    }
    else {
      id v10 = 0;
    }
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ delete SA %@ childSA %@", (uint8_t *)&v13, 0x2Au);
  }

  if (v7) {
    [(NEIKEv2Session *)self removeChild:v7[4]];
  }
  if (self) {
    id v12 = objc_getProperty(self, v11, 192, 1);
  }
  else {
    id v12 = 0;
  }
  [v12 setObject:0 forKeyedSubscript:v5];
  [v5 invalidate];
}

- (void)expireSA:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 192, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKeyedSubscript:v5];
  id v8 = ne_log_large_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 176, 1);
    }
    else {
      id v10 = 0;
    }
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ expire SA %@ childSA %@", (uint8_t *)&v11, 0x2Au);
  }

  if (v7 && [v5 direction] == 2) {
    [(NEIKEv2Session *)self forceRekeyChild:v7[4]];
  }
  [v5 invalidate];
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  -[NEIKEv2Session uninstallAllChildSAs]((uint64_t)self);
  if (self)
  {
    if (objc_getProperty(self, v4, 176, 1))
    {
      if (self->_ownsDatabaseSession) {
        objc_msgSend(objc_getProperty(self, v5, 176, 1), "invalidate");
      }
      objc_setProperty_atomic(self, v5, 0, 176);
    }
    ipsecInterface = self->_ipsecInterface;
    if (ipsecInterface)
    {
      CFRelease(ipsecInterface);
      self->_ipsecInterface = 0;
    }
    if (objc_getProperty(self, v5, 264, 1))
    {
      id Property = objc_getProperty(self, v7, 264, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(self, v9, 0, 264);
    }
    if (objc_getProperty(self, v7, 272, 1))
    {
      objc_msgSend(objc_getProperty(self, v10, 272, 1), "invalidate");
      objc_setProperty_atomic(self, v11, 0, 272);
    }
    if (objc_getProperty(self, v10, 280, 1))
    {
      __int16 v13 = objc_getProperty(self, v12, 280, 1);
      dispatch_source_cancel(v13);
      objc_setProperty_atomic(self, v14, 0, 280);
    }
    if (objc_getProperty(self, v12, 296, 1))
    {
      id v16 = objc_getProperty(self, v15, 296, 1);
      dispatch_source_cancel(v16);
      objc_setProperty_atomic(self, v17, 0, 296);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2Session;
  [(NEIKEv2Session *)&v18 dealloc];
}

- (NSObject)initWithIKEConfig:(NSObject *)a1 configurationDelegate:(void *)a2 queue:(void *)a3 saSession:(void *)a4 shouldCopySASession:(void *)a5 transport:(void *)a6 packetDelegate:(void *)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!a1)
  {
    id v20 = 0;
    goto LABEL_7;
  }
  if (!v13)
  {
    id v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:]";
      id v23 = "%s called with null ikeConfig";
      goto LABEL_15;
    }
LABEL_13:

    id v20 = 0;
    goto LABEL_6;
  }
  if (!v16)
  {
    id v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:]";
      id v23 = "%s called with null saSession";
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!v15)
  {
    id v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:]";
    id v23 = "%s called with null queue";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_13;
  }
  uint64_t v19 = (void *)[v16 copyEmptySASession];
  a1 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:](a1, v13, 0, 0, v15, 0, 0, v19, 1, v18, v17, v14);

  id v20 = a1;
LABEL_6:

LABEL_7:
  return v20;
}

- (NSObject)initWithIKEConfig:(void *)a3 configurationDelegate:(void *)a4 queue:(void *)a5 kernelSASessionName:(void *)a6 transport:(void *)a7 packetDelegate:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!a1)
  {
    id v20 = 0;
    goto LABEL_7;
  }
  if (!v13)
  {
    id v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:]";
      id v23 = "%s called with null ikeConfig";
      goto LABEL_15;
    }
LABEL_13:

    id v20 = 0;
    goto LABEL_6;
  }
  if (!v16)
  {
    id v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:]";
      id v23 = "%s called with null kernelSASessionName";
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!v15)
  {
    id v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v25 = "-[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:]";
    id v23 = "%s called with null queue";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_13;
  }
  uint64_t v19 = [[NEIPSecSAKernelSession alloc] initWithName:v16 delegate:0];
  a1 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:shouldOwnSASession:packetDelegate:transport:configurationDelegate:](a1, v13, 0, 0, v15, 0, 0, v19, 1, v18, v17, v14);

  id v20 = a1;
LABEL_6:

LABEL_7:
  return v20;
}

- (void)removeFirstChild
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = [(NEIKEv2Session *)(void *)a1 firstChildSA];
    if (v3)
    {
      -[NEIKEv2Session resetChild:]((char *)a1, v3);
      objc_msgSend(objc_getProperty((id)a1, v4, 288, 1), "removeObject:", v3);
      if (*(unsigned char *)(a1 + 10))
      {
        id v5 = *(const void **)(a1 + 328);
        if (v5)
        {
          CFRelease(v5);
          *(void *)(a1 + 328) = 0;
        }
        *(unsigned char *)(a1 + 10) = 0;
      }
    }
    else
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        uint64_t v8 = a1;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ No first child SA, ignoring request", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)resetChild:(char *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    SEL v4 = ne_log_obj();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412546;
        uint64_t v29 = a1;
        __int16 v30 = 2112;
        id v31 = v3;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@ reset child SA %@", (uint8_t *)&v28, 0x16u);
      }

      id v6 = v3;
      int v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id Property = objc_getProperty(a1, v8, 176, 1);
        int v28 = 138412802;
        uint64_t v29 = a1;
        __int16 v30 = 2112;
        id v31 = Property;
        __int16 v32 = 2112;
        uint64_t v33 = v6;
        _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ Uninstalling child SA %@", (uint8_t *)&v28, 0x20u);
      }

      id v11 = objc_getProperty(a1, v10, 192, 1);
      id v12 = -[NEIKEv2Session copySAFromDictionary:forChild:](v11, v6);
      if (v12)
      {
        id v14 = v12;
        do
        {
          objc_msgSend(objc_getProperty(a1, v13, 176, 1), "removeSA:", v14);
          objc_msgSend(objc_getProperty(a1, v15, 192, 1), "setObject:forKeyedSubscript:", 0, v14);
          id v17 = objc_getProperty(a1, v16, 192, 1);
          id v18 = -[NEIKEv2Session copySAFromDictionary:forChild:](v17, v6);

          id v14 = v18;
        }
        while (v18);
      }
      id v19 = objc_getProperty(a1, v13, 184, 1);
      id v20 = -[NEIKEv2Session copySAFromDictionary:forChild:](v19, v6);
      if (v20)
      {
        id v22 = v20;
        do
        {
          objc_msgSend(objc_getProperty(a1, v21, 176, 1), "removeSA:", v22);
          objc_msgSend(objc_getProperty(a1, v23, 184, 1), "setObject:forKeyedSubscript:", 0, v22);
          id v25 = objc_getProperty(a1, v24, 192, 1);
          id v26 = -[NEIKEv2Session copySAFromDictionary:forChild:](v25, v6);

          id v22 = v26;
        }
        while (v26);
      }

      [(NEIKEv2ChildSA *)v6 reset];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        int v28 = 136315138;
        uint64_t v29 = "-[NEIKEv2Session resetChild:]";
        _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null childSA", (uint8_t *)&v28, 0xCu);
      }
    }
  }
}

- (id)copySAFromDictionary:(void *)a1 forChild:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)startIKELifetimeTimer
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_getProperty(a1, a2, 336, 1))
  {
    if (objc_getProperty(a1, v3, 264, 1))
    {
      id Property = objc_getProperty(a1, v4, 264, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v6, 0, 264);
    }
    id v7 = objc_getProperty(a1, v4, 336, 1);
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 96, 1);
    }
    id v9 = v7;

    if (v9)
    {
      id v11 = objc_getProperty(a1, v10, 336, 1);
      if (v11) {
        id v11 = objc_getProperty(v11, v12, 96, 1);
      }
      long long v13 = (char *)v11;
      long long v15 = objc_getProperty(a1, v14, 336, 1);
      if (v15) {
        int v16 = v15[9] & 1;
      }
      else {
        int v16 = 0;
      }
      uint64_t v17 = -[NEIKEv2IKESAProposal softLifetimeSecondsForInitiator:](v13, v16);

      if (v17)
      {
        id v19 = objc_getProperty(a1, v18, 368, 1);
        dispatch_source_t v20 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v19);
        objc_setProperty_atomic(a1, v21, v20, 264);

        BOOL v23 = objc_getProperty(a1, v22, 264, 1) == 0;
        SEL v24 = ne_log_obj();
        id v25 = v24;
        if (v23)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
          }
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v38 = (const char *)a1;
            __int16 v39 = 2048;
            uint64_t v40 = v17;
            _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_INFO, "%@: Setting IKE soft lifetime timer for %llu seconds", buf, 0x16u);
          }

          id v27 = objc_getProperty(a1, v26, 264, 1);
          dispatch_time_t v28 = dispatch_time(0x8000000000000000, 1000000000 * (void)v17);
          dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);

          objc_initWeak((id *)buf, a1);
          id v30 = objc_getProperty(a1, v29, 264, 1);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke;
          handler[3] = &unk_1E5992C58;
          id v31 = v30;
          objc_copyWeak(&v36, (id *)buf);
          dispatch_source_set_event_handler(v31, handler);

          uint64_t v33 = objc_getProperty(a1, v32, 264, 1);
          dispatch_activate(v33);
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
  else
  {
    uint64_t v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v38 = "-[NEIKEv2Session startIKELifetimeTimer]";
      _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", buf, 0xCu);
    }
  }
}

void __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    [WeakRetained forceRekeyIKE];
    id Property = objc_getProperty(v3, v4, 336, 1);
    if (Property)
    {
      id v8 = objc_getProperty(Property, v6, 96, 1);
      if (v8)
      {
        id v9 = objc_getProperty(v3, v7, 336, 1);
        if (v9) {
          int v10 = v9[9] & 1;
        }
        else {
          int v10 = 0;
        }
        uint64_t v11 = [v8 lifetimeSeconds];
        long long v12 = -[NEIKEv2IKESAProposal softLifetimeSecondsForInitiator:]((char *)v8, v10);
        if (objc_getProperty(v3, v13, 264, 1))
        {
          long long v15 = objc_getProperty(v3, v14, 264, 1);
          dispatch_source_cancel(v15);
          objc_setProperty_atomic(v3, v16, 0, 264);
        }
        uint64_t v17 = objc_getProperty(v3, v14, 368, 1);
        dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v17);
        objc_setProperty_atomic(v3, v19, v18, 264);

        BOOL v21 = objc_getProperty(v3, v20, 264, 1) == 0;
        SEL v22 = ne_log_obj();
        BOOL v23 = v22;
        if (v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
          }
        }
        else
        {
          uint64_t v24 = v11 - (void)v12;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            id v36 = v3;
            __int16 v37 = 2048;
            uint64_t v38 = v24;
            _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_INFO, "%@: Setting IKE hard lifetime timer for %llu seconds", buf, 0x16u);
          }

          SEL v26 = objc_getProperty(v3, v25, 264, 1);
          dispatch_time_t v27 = dispatch_time(0x8000000000000000, 1000000000 * v24);
          dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);

          id v29 = objc_getProperty(v3, v28, 264, 1);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_64;
          handler[3] = &unk_1E5992C58;
          id v30 = v29;
          objc_copyWeak(&v34, v1);
          dispatch_source_set_event_handler(v30, handler);

          SEL v32 = objc_getProperty(v3, v31, 264, 1);
          dispatch_activate(v32);
          objc_destroyWeak(&v34);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
}

void __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_64(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && (WeakRetained[11] & 1) == 0)
  {
    SEL v4 = [NEIKEv2DeleteIKEContext alloc];
    id v6 = objc_getProperty(v3, v5, 368, 1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_2;
    v9[3] = &unk_1E5990DC0;
    objc_copyWeak(&v10, v1);
    id v7 = -[NEIKEv2DeleteIKEContext initDeleteIKEWithResponse:callbackQueue:callback:]((id *)&v4->super.super.isa, 1, v6, v9);

    [(NEIKEv2Session *)v3 abort];
    -[NEIKEv2Session enqueuePendingRequestContext:](v3, v7);

    objc_destroyWeak(&v10);
  }
}

uint64_t __39__NEIKEv2Session_startIKELifetimeTimer__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    self = WeakRetained;
    id WeakRetained = (char *)objc_getProperty(WeakRetained, WeakRetained, 336, 1);
    uint64_t v2 = self;
    if (WeakRetained)
    {
      if (*((void *)WeakRetained + 6) == 2)
      {
        [(NEIKEv2Session *)(uint64_t)self resetAll];
        id Property = objc_getProperty(self, v3, 336, 1);
        -[NEIKEv2IKESA setState:error:]((uint64_t)Property, 3uLL, 0);
        [(NEIKEv2Session *)self reportState];
        uint64_t v2 = self;
      }
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)setIKESA:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v5 = v3;
  if (a1)
  {
    if (v3)
    {
      if ((*(unsigned char *)(a1 + 11) & 1) == 0)
      {
        [(NEIKEv2Session *)(_DWORD *)a1 resetMessages];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = objc_getProperty((id)a1, v6, 288, 1);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              if (v12) {
                objc_storeWeak((id *)(v12 + 24), v5);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v9);
        }

        objc_setProperty_atomic((id)a1, v13, v5, 336);
        [(NEIKEv2Session *)(void *)a1 startIKELifetimeTimer];
        [(NEIKEv2Session *)(void *)a1 invalidateDPDTimer];
        [(NEIKEv2Session *)(void *)a1 startDPDTimer];
      }
    }
    else
    {
      uint64_t v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v24 = "-[NEIKEv2Session setIKESA:]";
        _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "%s called with null newIKESA", buf, 0xCu);
      }
    }
  }
}

- copyChildWithID:(void *)a1
{
  int v2 = (int)a2;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_getProperty(a1, a2, 288, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(_DWORD **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8) {
          int v9 = v8[4];
        }
        else {
          int v9 = 0;
        }
        if (v9 == v2)
        {
          uint64_t v11 = v8;
          goto LABEL_15;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }
  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (_OWORD)addEmptyInterface
{
  int v2 = *(const void **)(a1 + 328);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 328) = 0;
  }
  CFTypeRef result = NEVirtualInterfaceCreateNexusExtendedWithOptions((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  *(void *)(a1 + 328) = result;
  *(unsigned char *)(a1 + 10) = 1;
  return result;
}

- (__CFString)interfaceName
{
  uint64_t v1 = *(void *)(a1 + 328);
  if (v1)
  {
    int v2 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)(v1 + 265), 0x600u);
    if (v2) {
      goto LABEL_7;
    }
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "NEVirtualInterfaceCopyName failed", v5, 2u);
    }
  }
  int v2 = 0;
LABEL_7:

  return v2;
}

- (uint64_t)interfaceIndex
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 328);
    if (v2)
    {
      CFTypeRef result = *(unsigned int *)(v2 + 292);
      if (result) {
        return result;
      }
      id v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        uint64_t v4 = -[NEIKEv2Session interfaceName](v1);
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "NEVirtualInterfaceGetIndex (interfaceName=%@) failed", (uint8_t *)&v5, 0xCu);
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)copyIPsecInterfaceWithMissingAllowed:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 328);
  if (v3)
  {
    uint64_t v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)(v3 + 265), 0x600u);
    unsigned int Index = NEVirtualInterfaceGetIndex(*(void *)(a1 + 328));
    unsigned int v6 = Index;
    if (v4) {
      BOOL v7 = Index == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (!Index)
      {
        if (v4)
        {
          uint64_t v15 = [objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceName:v4];
          uint64_t v17 = ne_log_obj();
          int v9 = v17;
          if (v15)
          {
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_36;
            }
            int v22 = 138412546;
            *(void *)BOOL v23 = a1;
            *(_WORD *)&v23[8] = 2112;
            *(void *)&v23[10] = v4;
            uint64_t v10 = "Created interface for %@ from name %@";
            uint64_t v11 = v9;
            uint32_t v12 = 22;
            goto LABEL_17;
          }
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          int v22 = 138412290;
          *(void *)BOOL v23 = v4;
          uint64_t v18 = "[NWInterface initWithInterfaceName:%@] failed";
        }
        else
        {
          int v9 = ne_log_obj();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          int v22 = 138412290;
          *(void *)BOOL v23 = a1;
          uint64_t v18 = "%@ has ipsecInterface without index or name";
        }
        long long v19 = v9;
        uint32_t v20 = 12;
        goto LABEL_34;
      }
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceIndex:Index];
      uint64_t v8 = ne_log_obj();
      int v9 = v8;
      if (v15)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 138412546;
          *(void *)BOOL v23 = a1;
          *(_WORD *)&v23[8] = 1024;
          *(_DWORD *)&v23[10] = v6;
          uint64_t v10 = "Created interface for %@ from index %u";
          uint64_t v11 = v9;
          uint32_t v12 = 18;
LABEL_17:
          _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v22, v12);
        }
LABEL_36:

        goto LABEL_37;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v22 = 67109120;
        *(_DWORD *)BOOL v23 = v6;
        uint64_t v18 = "[NWInterface initWithInterfaceIndex:%u] failed";
        long long v19 = v9;
        uint32_t v20 = 8;
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceIndex:Index interfaceName:v4];
      long long v16 = ne_log_obj();
      int v9 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v22 = 138412802;
          *(void *)BOOL v23 = a1;
          *(_WORD *)&v23[8] = 1024;
          *(_DWORD *)&v23[10] = v6;
          *(_WORD *)&v23[14] = 2112;
          *(void *)&v23[16] = v4;
          uint64_t v10 = "Created interface for %@ from index %u and name %@";
          uint64_t v11 = v9;
          uint32_t v12 = 28;
          goto LABEL_17;
        }
        goto LABEL_36;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        int v22 = 67109378;
        *(_DWORD *)BOOL v23 = v6;
        *(_WORD *)&void v23[4] = 2112;
        *(void *)&v23[6] = v4;
        uint64_t v18 = "[NWInterface initWithInterfaceIndex:%u interfaceName:%@] failed";
        long long v19 = v9;
        uint32_t v20 = 18;
LABEL_34:
        _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&v22, v20);
      }
    }
LABEL_35:
    uint64_t v15 = 0;
    goto LABEL_36;
  }
  long long v14 = ne_log_obj();
  uint64_t v4 = v14;
  if (a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 138412290;
      *(void *)BOOL v23 = a1;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ missing ipsecInterface", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    int v22 = 138412290;
    *(void *)BOOL v23 = a1;
    _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "%@ missing ipsecInterface", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v15 = 0;
LABEL_37:

  return v15;
}

- (uint64_t)generateSPIForChild:(void *)a3 proposals:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!v7)
  {
    id v50 = ne_log_obj();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    __int16 v51 = "%s called with null proposals";
    goto LABEL_71;
  }
  if (!objc_getProperty(a1, v6, 336, 1))
  {
    id v50 = ne_log_obj();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
LABEL_44:

LABEL_45:
      uint64_t v52 = 0;
      goto LABEL_69;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    __int16 v51 = "%s called with null self.ikeSA";
LABEL_71:
    _os_log_fault_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_FAULT, v51, buf, 0xCu);
    goto LABEL_44;
  }
  id Property = objc_getProperty(a1, v8, 336, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v10, 64, 1);
  }
  id v11 = Property;

  if (!v11)
  {
    id v50 = ne_log_obj();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
    __int16 v51 = "%s called with null self.ikeSA.localAddress";
    goto LABEL_71;
  }
  id v13 = objc_getProperty(a1, v12, 336, 1);
  if (v13) {
    id v13 = objc_getProperty(v13, v14, 72, 1);
  }
  id v15 = v13;

  long long v16 = ne_log_obj();
  uint64_t v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
      _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA.remoteAddress", buf, 0xCu);
    }

    goto LABEL_45;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v83 = (const char *)a1;
    __int16 v84 = 2112;
    id v85 = objc_getProperty(a1, v18, 176, 1);
    _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "%@ %@ Generating SPI(s) for child", buf, 0x16u);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v69 = v7;
  id obj = v7;
  uint64_t v19 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (!v19)
  {
    long long v21 = 0;
    int v22 = 0;
    goto LABEL_53;
  }
  uint64_t v20 = v19;
  long long v21 = 0;
  int v22 = 0;
  uint64_t v23 = *(void *)v76;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v76 != v23) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v75 + 1) + 8 * v24) protocol] == 2)
      {
        if (v22) {
          goto LABEL_36;
        }
        id v25 = [[NEIPSecSA alloc] initInboundSA];
        [v25 setProtocol:2];
        int v22 = v25;
      }
      else
      {
        if (v21) {
          goto LABEL_36;
        }
        id v25 = [[NEIPSecSA alloc] initInboundSA];
        [v25 setProtocol:1];
        long long v21 = v25;
      }
      id v27 = v25;
      if (v5)
      {
        id v28 = v5;
        id v29 = objc_getProperty(v5, v26, 48, 1);
      }
      else
      {
        id v28 = 0;
        id v29 = 0;
      }
      id v30 = v29;
      uint64_t v31 = [v30 mode];

      if (v31 == 1) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = 2;
      }
      [v27 setMode:v32];
      [v27 setLifetimeSeconds:120];
      id v34 = objc_getProperty(a1, v33, 336, 1);
      if (v34) {
        id v34 = objc_getProperty(v34, v35, 64, 1);
      }
      id v36 = v34;
      [v27 setLocalAddress:v36];

      id v38 = objc_getProperty(a1, v37, 336, 1);
      if (v38) {
        id v38 = objc_getProperty(v38, v39, 72, 1);
      }
      id v40 = v38;
      [v27 setRemoteAddress:v40];

      id v42 = objc_getProperty(a1, v41, 336, 1);
      if (v42) {
        id v42 = objc_getProperty(v42, v43, 304, 1);
      }
      id v44 = v42;
      [v27 setBoundInterfaceName:v44];

      if (!a1[41]) {
        -[NEIKEv2Session addEmptyInterface]((uint64_t)a1);
      }
      SEL v45 = (void *)-[NEIKEv2Session copyIPsecInterfaceWithMissingAllowed:]((uint64_t)a1, 1);
      id v46 = [v45 interfaceName];
      [v27 setTunnelInterfaceName:v46];

      if (!objc_msgSend(objc_getProperty(a1, v47, 176, 1), "addLarvalSA:", v27))
      {
        uint64_t v53 = ne_log_obj();
        id v5 = v28;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          id v68 = objc_getProperty(a1, v54, 176, 1);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v83 = (const char *)a1;
          __int16 v84 = 2112;
          id v85 = v68;
          _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "%@ [%@ addLarvalSA:larvalSA] failed", buf, 0x16u);
        }

        unsigned __int8 v79 = 0;
        goto LABEL_67;
      }
      id v5 = v28;
      objc_msgSend(objc_getProperty(a1, v48, 184, 1), "setObject:forKeyedSubscript:", v28, v27);

LABEL_36:
      ++v24;
    }
    while (v20 != v24);
    uint64_t v49 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    uint64_t v20 = v49;
  }
  while (v49);
LABEL_53:

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v55 = obj;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (!v56) {
    goto LABEL_66;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v72;
  while (2)
  {
    uint64_t v59 = 0;
    while (2)
    {
      if (*(void *)v72 != v58) {
        objc_enumerationMutation(v55);
      }
      SEL v60 = *(void **)(*((void *)&v71 + 1) + 8 * v59);
      if ([v60 protocol] == 2)
      {
        id v61 = v22;
        if (!v22)
        {
          SEL v65 = ne_log_obj();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
            id v67 = "%s called with null ahLarvalSA";
            goto LABEL_77;
          }
          goto LABEL_75;
        }
      }
      else
      {
        id v61 = v21;
        if (!v21)
        {
          SEL v65 = ne_log_obj();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v83 = "-[NEIKEv2Session generateSPIForChild:proposals:]";
            id v67 = "%s called with null espLarvalSA";
LABEL_77:
            _os_log_fault_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_FAULT, v67, buf, 0xCu);
          }
LABEL_75:
          id v7 = v69;

          unsigned __int8 v79 = 0;
          goto LABEL_68;
        }
      }
      SEL v63 = -[NEIKEv2ESPSPI initWithValue:]([NEIKEv2ESPSPI alloc], "initWithValue:", [v61 spi]);
      if (v60) {
        objc_setProperty_atomic(v60, v62, v63, 80);
      }

      if (v57 != ++v59) {
        continue;
      }
      break;
    }
    uint64_t v57 = [v55 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v57) {
      continue;
    }
    break;
  }
LABEL_66:

  unsigned __int8 v79 = 1;
LABEL_67:
  id v7 = v69;
LABEL_68:

  uint64_t v52 = v79;
LABEL_69:

  return v52;
}

- (id)copySAFromDictionary:(void *)a1 forSPI:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "spi", (void)v12);
        if (v10 == [v4 value])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)installChildSA:(uint64_t)a1
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v55 = 0;
    goto LABEL_45;
  }
  if (!objc_getProperty((id)a1, v3, 336, 1))
  {
    int v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA";
LABEL_42:
    _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v54, (uint8_t *)&v206, 0xCu);
    goto LABEL_43;
  }
  if (!v4)
  {
    int v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null childSA";
    goto LABEL_42;
  }
  id Property = objc_getProperty((id)a1, v5, 336, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 64, 1);
  }
  id v8 = Property;

  if (!v8)
  {
    int v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA.localAddress";
    goto LABEL_42;
  }
  id v10 = objc_getProperty((id)a1, v9, 336, 1);
  if (v10) {
    id v10 = objc_getProperty(v10, v11, 72, 1);
  }
  id v12 = v10;

  if (!v12)
  {
    int v22 = ne_log_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null self.ikeSA.remoteAddress";
    goto LABEL_42;
  }
  id v14 = objc_getProperty(v4, v13, 56, 1);

  if (v14)
  {
    id v16 = objc_getProperty((id)a1, v15, 184, 1);
    id v18 = objc_getProperty(v4, v17, 56, 1);
    uint64_t v20 = v18;
    if (v18) {
      id v18 = objc_getProperty(v18, v19, 80, 1);
    }
    id v21 = v18;
    int v22 = -[NEIKEv2Session copySAFromDictionary:forSPI:](v16, v21);

    uint64_t v23 = ne_log_obj();
    uint64_t v24 = v23;
    if (!v22)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
LABEL_148:
        uint64_t v55 = 0;
LABEL_149:

        goto LABEL_44;
      }
      uint64_t v58 = objc_getProperty(v4, v57, 56, 1);
      SEL v60 = v58;
      if (v58) {
        uint64_t v58 = objc_getProperty(v58, v59, 80, 1);
      }
      id v61 = v58;
      int v206 = 138412802;
      id v207 = v61;
      __int16 v208 = 2112;
      id v209 = objc_getProperty((id)a1, v62, 184, 1);
      __int16 v210 = 2112;
      id v211 = objc_getProperty((id)a1, v63, 192, 1);
      _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "copySAFromDictionary incoming %@ databaseLarvalSAs %@ databaseSAs %@ failed", (uint8_t *)&v206, 0x20u);
LABEL_141:

LABEL_147:
      goto LABEL_148;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v206 = 138412802;
      id v207 = (const char *)a1;
      __int16 v208 = 2112;
      id v209 = objc_getProperty((id)a1, v25, 176, 1);
      __int16 v210 = 2112;
      id v211 = v4;
      _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_INFO, "%@ %@ Installing childSA %@", (uint8_t *)&v206, 0x20u);
    }

    SEL v26 = [NEIPSecSA alloc];
    id v28 = objc_getProperty(v4, v27, 56, 1);
    id v30 = v28;
    if (v28) {
      id v28 = objc_getProperty(v28, v29, 88, 1);
    }
    id v31 = v28;
    uint64_t v24 = -[NEIPSecSA initOutboundSAWithSPI:](v26, "initOutboundSAWithSPI:", [v31 value]);

    id v33 = objc_getProperty(v4, v32, 48, 1);
    uint64_t v34 = [v33 mode];

    if (v34 == 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = 2;
    }
    [v24 setMode:v35];
    id v37 = objc_getProperty(v4, v36, 56, 1);
    uint64_t v38 = [v37 protocol];

    if (v38 == 2) {
      uint64_t v39 = 2;
    }
    else {
      uint64_t v39 = 1;
    }
    [v24 setProtocol:v39];
    id v41 = objc_getProperty((id)a1, v40, 336, 1);
    if (v41) {
      id v41 = objc_getProperty(v41, v42, 64, 1);
    }
    id v43 = v41;
    [v24 setLocalAddress:v43];

    id v45 = objc_getProperty((id)a1, v44, 336, 1);
    if (v45) {
      id v45 = objc_getProperty(v45, v46, 72, 1);
    }
    id v47 = v45;
    [v24 setRemoteAddress:v47];

    id v49 = objc_getProperty(v4, v48, 56, 1);
    __int16 v51 = [(NEIKEv2ChildSAProposal *)v49 encryptionProtocol];
    if (v51)
    {
      uint64_t v52 = v51[2];

      if (v52 <= 19)
      {
        if (v52 == 2 || v52 == 3)
        {
LABEL_65:
          uint64_t v78 = 1;
          id v79 = objc_getProperty(v4, v53, 56, 1);
          -[NSObject setLifetimeSeconds:](v22, "setLifetimeSeconds:", [v79 lifetimeSeconds]);

          id v81 = objc_getProperty(v4, v80, 56, 1);
          -[NSObject setLifetimeSeconds:](v24, "setLifetimeSeconds:", [v81 lifetimeSeconds]);

          [v22 setEncryptionAlgorithm:v52];
          [v24 setEncryptionAlgorithm:v52];
          uint64_t v83 = objc_getProperty(v4, v82, 144, 1);
          [v22 setEncryptionKey:v83];

          id v85 = objc_getProperty(v4, v84, 160, 1);
          [v24 setEncryptionKey:v85];

          id v87 = objc_getProperty(v4, v86, 48, 1);
          -[NSObject setReplayWindowSize:](v22, "setReplayWindowSize:", [v87 replayWindowSize]);

          id v89 = objc_getProperty(v4, v88, 48, 1);
          -[NSObject setReplayWindowSize:](v24, "setReplayWindowSize:", [v89 replayWindowSize]);

          [v22 setSequencePerTrafficClass:v4[10] & 1];
          [v24 setSequencePerTrafficClass:v4[10] & 1];
          id v91 = objc_getProperty(v4, v90, 56, 1);
          id v93 = [(NEIKEv2ChildSAProposal *)v91 integrityProtocol];
          uint64_t v94 = [v93 type];

          switch(v94)
          {
            case 0:
              id v96 = objc_getProperty(v4, v95, 56, 1);
              id v98 = [(NEIKEv2ChildSAProposal *)v96 encryptionProtocol];
              if (v98 && (unint64_t v99 = v98[2], v99 < 0x20))
              {
                unsigned int v100 = 0xD01C0000 >> v99;

                if (v100)
                {
                  uint64_t v78 = 0;
                  goto LABEL_76;
                }
              }
              else
              {
              }
              SEL v60 = ne_log_obj();
              if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                goto LABEL_147;
              }
              id v61 = (char *)objc_getProperty(v4, v198, 56, 1);
              uint64_t v103 = [(NEIKEv2ChildSAProposal *)v61 encryptionProtocol];
              int v206 = 138412546;
              id v207 = (const char *)a1;
              __int16 v208 = 2112;
              id v209 = v103;
              uint64_t v105 = "%@ No integrity type selected, but encryption %@ is not authenticated";
              uint64_t v106 = v60;
              uint32_t v107 = 22;
              goto LABEL_140;
            case 1:
              goto LABEL_76;
            case 2:
              uint64_t v78 = 2;
              goto LABEL_76;
            case 12:
              uint64_t v78 = 3;
              goto LABEL_76;
            case 13:
              uint64_t v78 = 4;
              goto LABEL_76;
            case 14:
              uint64_t v78 = 5;
LABEL_76:
              [v22 setAuthenticationAlgorithm:v78];
              [v24 setAuthenticationAlgorithm:v78];
              uint64_t v109 = objc_getProperty(v4, v108, 152, 1);
              [v22 setAuthenticationKey:v109];

              uint64_t v111 = objc_getProperty(v4, v110, 168, 1);
              [v24 setAuthenticationKey:v111];

              id v113 = objc_getProperty((id)a1, v112, 336, 1);
              if (v113) {
                id v113 = objc_getProperty(v113, v114, 80, 1);
              }
              uint64_t v115 = v113;
              if (([v115 forceUDPEncapsulation] & 1) != 0
                || (SEL v117 = objc_getProperty((id)a1, v116, 336, 1)) != 0 && (v117[14] & 1) != 0)
              {
              }
              else
              {
                CFArrayRef v119 = objc_getProperty((id)a1, v118, 336, 1);
                if (!v119) {
                  goto LABEL_103;
                }
                char v120 = v119[15];

                if ((v120 & 1) == 0) {
                  goto LABEL_104;
                }
              }
              id v122 = objc_getProperty((id)a1, v121, 336, 1);
              if (v122) {
                id v122 = objc_getProperty(v122, v123, 80, 1);
              }
              id v124 = v122;
              if ([v124 forceUDPEncapsulation])
              {
              }
              else
              {
                char v125 = [*(id *)(a1 + 384) disableSwitchToNATTPorts];

                if (v125)
                {
                  uint64_t v115 = ne_log_obj();
                  if (!os_log_type_enabled(v115, OS_LOG_TYPE_INFO)) {
                    goto LABEL_103;
                  }
                  int v206 = 138412290;
                  id v207 = (const char *)a1;
                  uint64_t v126 = "%@ Not enabling NAT traversal (install) because disabled";
                  goto LABEL_102;
                }
              }
              [v22 setNatTraversalEnabled:1];
              [v24 setNatTraversalEnabled:1];
              id v128 = objc_getProperty((id)a1, v127, 336, 1);
              if (v128) {
                id v128 = objc_getProperty(v128, v129, 64, 1);
              }
              id v130 = v128;
              uint64_t v131 = [v130 port];
              -[NSObject setNatTraversalPort:](v22, "setNatTraversalPort:", (unsigned __int16)[v131 intValue]);

              id v133 = objc_getProperty((id)a1, v132, 336, 1);
              if (v133) {
                id v133 = objc_getProperty(v133, v134, 72, 1);
              }
              id v135 = v133;
              id v136 = [v135 port];
              -[NSObject setNatTraversalSrcPort:](v22, "setNatTraversalSrcPort:", (unsigned __int16)[v136 intValue]);

              id v138 = objc_getProperty((id)a1, v137, 336, 1);
              if (v138) {
                id v138 = objc_getProperty(v138, v139, 72, 1);
              }
              id v140 = v138;
              uint64_t v141 = [v140 port];
              -[NSObject setNatTraversalPort:](v24, "setNatTraversalPort:", (unsigned __int16)[v141 intValue]);

              id v143 = objc_getProperty((id)a1, v142, 336, 1);
              if (v143) {
                id v143 = objc_getProperty(v143, v144, 64, 1);
              }
              id v145 = v143;
              uint64_t v146 = [v145 port];
              -[NSObject setNatTraversalSrcPort:](v24, "setNatTraversalSrcPort:", (unsigned __int16)[v146 intValue]);

              uint64_t v115 = ne_log_obj();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                int v206 = 138412290;
                id v207 = (const char *)a1;
                uint64_t v126 = "%@ Enabling NAT traversal (install)";
LABEL_102:
                _os_log_impl(&dword_19DDAF000, v115, OS_LOG_TYPE_INFO, v126, (uint8_t *)&v206, 0xCu);
              }
LABEL_103:

LABEL_104:
              uint64_t v147 = objc_getProperty((id)a1, v121, 336, 1);
              if (v147 && (v147[14] & 1) != 0)
              {
                id v149 = objc_getProperty((id)a1, v148, 336, 1);
                if (v149) {
                  id v149 = objc_getProperty(v149, v150, 88, 1);
                }
                id v151 = v149;
                char v152 = [v151 natTraversalKeepaliveDisabled];

                if ((v152 & 1) == 0)
                {
                  [v24 setNatKeepaliveEnabled:1];
                  id v154 = objc_getProperty((id)a1, v153, 336, 1);
                  if (v154) {
                    id v154 = objc_getProperty(v154, v155, 88, 1);
                  }
                  id v156 = v154;
                  int v157 = [v156 natTraversalKeepaliveOffloadEnabled];

                  if (v157)
                  {
                    [v24 setNatKeepaliveOffloadEnabled:1];
                    id v160 = objc_getProperty((id)a1, v159, 336, 1);
                    if (v160) {
                      id v160 = objc_getProperty(v160, v161, 88, 1);
                    }
                    id v162 = v160;
                    -[NSObject setNatKeepaliveOffloadIntervalSeconds:](v24, "setNatKeepaliveOffloadIntervalSeconds:", [v162 natTraversalKeepaliveOffloadInterval]);
                  }
                  id v163 = objc_getProperty((id)a1, v158, 336, 1);
                  if (v163) {
                    id v163 = objc_getProperty(v163, v164, 88, 1);
                  }
                  id v165 = v163;
                  -[NSObject setNatKeepaliveIntervalSeconds:](v24, "setNatKeepaliveIntervalSeconds:", [v165 natTraversalKeepaliveInterval]);
                }
              }
              uint64_t v166 = objc_getProperty((id)a1, v148, 336, 1);
              if (v166 && (v166[15] & 1) != 0) {
                [v22 setNatDetectedOnPeer:1];
              }
              id v168 = objc_getProperty((id)a1, v167, 336, 1);
              if (v168) {
                id v168 = objc_getProperty(v168, v169, 304, 1);
              }
              id v170 = v168;
              [v24 setBoundInterfaceName:v170];

              if (!*(void *)(a1 + 328)) {
                -[NEIKEv2Session addEmptyInterface](a1);
              }
              uint64_t v171 = (void *)-[NEIKEv2Session copyIPsecInterfaceWithMissingAllowed:](a1, 0);
              long long v172 = [v171 interfaceName];
              [v24 setTunnelInterfaceName:v172];

              if (!objc_msgSend(objc_getProperty((id)a1, v173, 176, 1), "addSA:", v24)) {
                goto LABEL_148;
              }
              objc_setProperty_atomic(v4, v174, 0, 160);
              objc_setProperty_atomic(v4, v175, 0, 168);
              [v24 setEncryptionKey:0];
              [v24 setAuthenticationKey:0];
              objc_msgSend(objc_getProperty((id)a1, v176, 192, 1), "setObject:forKeyedSubscript:", v4, v24);
              if (!objc_msgSend(objc_getProperty((id)a1, v177, 176, 1), "updateSA:", v22)) {
                goto LABEL_148;
              }
              objc_setProperty_atomic(v4, v178, 0, 144);
              objc_setProperty_atomic(v4, v179, 0, 152);
              [v22 setEncryptionKey:0];
              [v22 setAuthenticationKey:0];
              objc_msgSend(objc_getProperty((id)a1, v180, 192, 1), "setObject:forKeyedSubscript:", v4, v22);
              objc_msgSend(objc_getProperty((id)a1, v181, 184, 1), "setObject:forKeyedSubscript:", 0, v22);
              id v183 = objc_getProperty((id)a1, v182, 336, 1);
              if (v183) {
                id v183 = objc_getProperty(v183, v184, 88, 1);
              }
              id v185 = v183;
              int v186 = [v185 idleTimeoutEnabled];

              if (v186)
              {
                id v188 = objc_getProperty((id)a1, v187, 176, 1);
                id v190 = objc_getProperty((id)a1, v189, 336, 1);
                if (v190) {
                  id v190 = objc_getProperty(v190, v191, 88, 1);
                }
                id v192 = v190;
                objc_msgSend(v188, "startIdleTimeout:incomingSA:outgoingSA:", objc_msgSend(v192, "idleTimeoutSeconds"), v22, v24);
              }
              id v193 = objc_getProperty((id)a1, v187, 336, 1);
              if (v193) {
                id v193 = objc_getProperty(v193, v194, 88, 1);
              }
              id v195 = v193;
              int v196 = [v195 blackholeDetectionEnabled];

              uint64_t v55 = 1;
              if (v196) {
                objc_msgSend(objc_getProperty((id)a1, v197, 176, 1), "startBlackholeDetection:incomingSA:outgoingSA:", 20, v22, v24);
              }
              break;
            default:
              SEL v60 = ne_log_obj();
              if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                goto LABEL_147;
              }
              id v61 = (char *)objc_getProperty(v4, v101, 56, 1);
              uint64_t v103 = [(NEIKEv2ChildSAProposal *)v61 integrityProtocol];
              int v104 = [v103 type];
              int v206 = 138412546;
              id v207 = (const char *)a1;
              __int16 v208 = 1024;
              LODWORD(v209) = v104;
              uint64_t v105 = "%@ Unsupported integrity type %u";
              uint64_t v106 = v60;
              uint32_t v107 = 18;
LABEL_140:
              _os_log_error_impl(&dword_19DDAF000, v106, OS_LOG_TYPE_ERROR, v105, (uint8_t *)&v206, v107);

              goto LABEL_141;
          }
          goto LABEL_149;
        }
        if (v52 == 12)
        {
          id v64 = objc_getProperty(v4, v53, 56, 1);
          SEL v66 = [(NEIKEv2ChildSAProposal *)v64 encryptionProtocol];
          if (!v66)
          {

            uint64_t v52 = 4;
            goto LABEL_65;
          }
          char v67 = v66[8];

          BOOL v68 = (v67 & 1) == 0;
          unsigned int v69 = 4;
LABEL_62:
          if (v68) {
            uint64_t v52 = v69;
          }
          else {
            uint64_t v52 = v69 + 1;
          }
          goto LABEL_65;
        }
      }
      else
      {
        if (v52 <= 29)
        {
          if (v52 != 20)
          {
            if (v52 == 28)
            {
              uint64_t v52 = 8;
              goto LABEL_65;
            }
            goto LABEL_146;
          }
          id v70 = objc_getProperty(v4, v53, 56, 1);
          long long v72 = [(NEIKEv2ChildSAProposal *)v70 encryptionProtocol];
          if (!v72)
          {

            uint64_t v52 = 6;
            goto LABEL_65;
          }
          char v73 = v72[8];

          BOOL v68 = (v73 & 1) == 0;
          unsigned int v69 = 6;
          goto LABEL_62;
        }
        if (v52 == 30)
        {
          id v74 = objc_getProperty(v4, v53, 56, 1);
          long long v76 = [(NEIKEv2ChildSAProposal *)v74 encryptionProtocol];
          if (!v76)
          {

            uint64_t v52 = 10;
            goto LABEL_65;
          }
          char v77 = v76[8];

          BOOL v68 = (v77 & 1) == 0;
          unsigned int v69 = 10;
          goto LABEL_62;
        }
        if (v52 == 31)
        {
          uint64_t v52 = 9;
          goto LABEL_65;
        }
      }
    }
    else
    {
    }
LABEL_146:
    SEL v60 = ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      id v201 = objc_getProperty(v4, v200, 56, 1);
      unint64_t v203 = [(NEIKEv2ChildSAProposal *)v201 encryptionProtocol];
      uint64_t v204 = (void *)v203;
      if (v203) {
        unint64_t v203 = *(void *)(v203 + 16);
      }
      String = NEIKEv2EncryptionWireTypeCreateString(v203);
      int v206 = 138412546;
      id v207 = (const char *)a1;
      __int16 v208 = 2112;
      id v209 = String;
      _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "%@ Unsupported encryption wire type %@", (uint8_t *)&v206, 0x16u);
    }
    goto LABEL_147;
  }
  int v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    int v206 = 136315138;
    id v207 = "-[NEIKEv2Session installChildSA:]";
    SEL v54 = "%s called with null childSA.chosenProposal";
    goto LABEL_42;
  }
LABEL_43:
  uint64_t v55 = 0;
LABEL_44:

LABEL_45:
  return v55;
}

- (uint64_t)migrateAllChildSAs
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  uint64_t v3 = 1;
  id obj = objc_getProperty((id)a1, a2, 288, 1);
  uint64_t v4 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
  if (!v4) {
    goto LABEL_101;
  }
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)v144;
  *(void *)&long long v5 = 138413058;
  long long v141 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v144 != v7) {
        objc_enumerationMutation(obj);
      }
      int v9 = *(id *)(*((void *)&v143 + 1) + 8 * i);
      if (!objc_getProperty((id)a1, v10, 336, 1))
      {
        int v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          CFArrayRef v118 = "%s called with null self.ikeSA";
          goto LABEL_90;
        }
        goto LABEL_99;
      }
      if (!v9)
      {
        int v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
        }
        int v9 = 0;
        goto LABEL_99;
      }
      id Property = objc_getProperty((id)a1, v11, 336, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v13, 64, 1);
      }
      id v14 = Property;

      if (!v14)
      {
        int v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v149 = "-[NEIKEv2Session migrateChildSA:]";
          CFArrayRef v118 = "%s called with null self.ikeSA.localAddress";
          goto LABEL_90;
        }
LABEL_99:

LABEL_100:
        uint64_t v3 = 0;
        goto LABEL_101;
      }
      id v16 = objc_getProperty((id)a1, v15, 336, 1);
      if (v16) {
        id v16 = objc_getProperty(v16, v17, 72, 1);
      }
      id v18 = v16;

      if (!v18)
      {
        int v22 = ne_log_obj();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          goto LABEL_99;
        }
        *(_DWORD *)long long buf = 136315138;
        id v149 = "-[NEIKEv2Session migrateChildSA:]";
        CFArrayRef v118 = "%s called with null self.ikeSA.remoteAddress";
LABEL_90:
        _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v118, buf, 0xCu);
        goto LABEL_99;
      }
      id v20 = objc_getProperty(v9, v19, 56, 1);

      id v21 = ne_log_obj();
      int v22 = v21;
      if (!v20)
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_99;
        }
        *(_DWORD *)long long buf = 136315138;
        id v149 = "-[NEIKEv2Session migrateChildSA:]";
        CFArrayRef v118 = "%s called with null childSA.chosenProposal";
        goto LABEL_90;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v24 = objc_getProperty((id)a1, v23, 176, 1);
        *(_DWORD *)long long buf = 138412802;
        id v149 = (const char *)a1;
        __int16 v150 = 2112;
        id v151 = v24;
        __int16 v152 = 2112;
        SEL v153 = v9;
        _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_INFO, "%@ %@ Migrating childSA %@", buf, 0x20u);
      }

      id v26 = objc_getProperty((id)a1, v25, 192, 1);
      id v28 = objc_getProperty(v9, v27, 56, 1);
      id v30 = v28;
      if (v28) {
        id v28 = objc_getProperty(v28, v29, 80, 1);
      }
      id v31 = v28;
      int v22 = -[NEIKEv2Session copySAFromDictionary:forSPI:](v26, v31);

      if (!v22)
      {
        uint64_t v39 = ne_log_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          id v124 = objc_getProperty(v9, v119, 56, 1);
          uint64_t v126 = v124;
          if (v124) {
            id v124 = objc_getProperty(v124, v125, 80, 1);
          }
          SEL v127 = (char *)v124;
          id v129 = objc_getProperty((id)a1, v128, 192, 1);
          uint64_t v131 = objc_getProperty((id)a1, v130, 184, 1);
          *(_DWORD *)long long buf = 138412802;
          id v149 = v127;
          __int16 v150 = 2112;
          id v151 = v129;
          __int16 v152 = 2112;
          SEL v153 = v131;
          _os_log_fault_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_FAULT, "copySAFromDictionary incoming %@ databaseSAs %@ databaseLarvalSAs %@ failed", buf, 0x20u);
        }
        int v22 = 0;
        goto LABEL_98;
      }
      id v33 = objc_getProperty((id)a1, v32, 192, 1);
      id v35 = objc_getProperty(v9, v34, 56, 1);
      id v37 = v35;
      if (v35) {
        id v35 = objc_getProperty(v35, v36, 88, 1);
      }
      id v38 = v35;
      uint64_t v39 = -[NEIKEv2Session copySAFromDictionary:forSPI:](v33, v38);

      if (!v39)
      {
        char v120 = ne_log_obj();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
        {
          id v132 = objc_getProperty(v9, v121, 56, 1);
          uint64_t v134 = v132;
          if (v132) {
            id v132 = objc_getProperty(v132, v133, 88, 1);
          }
          id v135 = (char *)v132;
          id v137 = objc_getProperty((id)a1, v136, 192, 1);
          SEL v139 = objc_getProperty((id)a1, v138, 184, 1);
          *(_DWORD *)long long buf = 138412802;
          id v149 = v135;
          __int16 v150 = 2112;
          id v151 = v137;
          __int16 v152 = 2112;
          SEL v153 = v139;
          _os_log_fault_impl(&dword_19DDAF000, v120, OS_LOG_TYPE_FAULT, "copySAFromDictionary outgoing %@ databaseSAs %@ databaseLarvalSAs %@ failed", buf, 0x20u);
        }
        uint64_t v39 = 0;
        goto LABEL_97;
      }
      id v41 = objc_getProperty((id)a1, v40, 336, 1);
      if (v41) {
        id v41 = objc_getProperty(v41, v42, 64, 1);
      }
      id v43 = v41;
      [v22 setLocalAddress:v43];

      id v45 = objc_getProperty((id)a1, v44, 336, 1);
      if (v45) {
        id v45 = objc_getProperty(v45, v46, 72, 1);
      }
      id v47 = v45;
      [v22 setRemoteAddress:v47];

      id v49 = objc_getProperty((id)a1, v48, 336, 1);
      if (v49) {
        id v49 = objc_getProperty(v49, v50, 64, 1);
      }
      id v51 = v49;
      [v39 setLocalAddress:v51];

      id v53 = objc_getProperty((id)a1, v52, 336, 1);
      if (v53) {
        id v53 = objc_getProperty(v53, v54, 72, 1);
      }
      id v55 = v53;
      [v39 setRemoteAddress:v55];

      if (!*(void *)(a1 + 328)) {
        -[NEIKEv2Session addEmptyInterface](a1);
      }
      uint64_t v56 = (void *)-[NEIKEv2Session copyIPsecInterfaceWithMissingAllowed:](a1, 0);
      uint64_t v57 = [v56 interfaceName];
      [v39 setTunnelInterfaceName:v57];

      uint64_t v58 = [v39 tunnelInterfaceName];
      [v22 setTunnelInterfaceName:v58];

      id v60 = objc_getProperty((id)a1, v59, 336, 1);
      if (v60) {
        id v60 = objc_getProperty(v60, v61, 304, 1);
      }
      id v62 = v60;
      [v39 setBoundInterfaceName:v62];

      SEL v63 = [v39 boundInterfaceName];
      [v22 setBoundInterfaceName:v63];

      SEL v65 = objc_getProperty((id)a1, v64, 336, 1);
      if (v65 && (v65[14] & 1) != 0 || (char v67 = objc_getProperty((id)a1, v66, 336, 1)) != 0 && (v67[15] & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 384), "disableSwitchToNATTPorts", v141))
        {
          BOOL v68 = ne_log_obj();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v149 = (const char *)a1;
            unsigned int v69 = v68;
            id v70 = "%@ Not enabling NAT traversal (migrate) because disabled";
            goto LABEL_55;
          }
        }
        else
        {
          [v22 setNatTraversalEnabled:1];
          [v39 setNatTraversalEnabled:1];
          id v72 = objc_getProperty((id)a1, v71, 336, 1);
          if (v72) {
            id v72 = objc_getProperty(v72, v73, 64, 1);
          }
          id v74 = v72;
          long long v75 = [v74 port];
          -[NSObject setNatTraversalPort:](v22, "setNatTraversalPort:", (unsigned __int16)[v75 intValue]);

          id v77 = objc_getProperty((id)a1, v76, 336, 1);
          if (v77) {
            id v77 = objc_getProperty(v77, v78, 72, 1);
          }
          id v79 = v77;
          SEL v80 = [v79 port];
          -[NSObject setNatTraversalSrcPort:](v22, "setNatTraversalSrcPort:", (unsigned __int16)[v80 intValue]);

          id v82 = objc_getProperty((id)a1, v81, 336, 1);
          if (v82) {
            id v82 = objc_getProperty(v82, v83, 72, 1);
          }
          id v84 = v82;
          id v85 = [v84 port];
          -[NSObject setNatTraversalPort:](v39, "setNatTraversalPort:", (unsigned __int16)[v85 intValue]);

          id v87 = objc_getProperty((id)a1, v86, 336, 1);
          if (v87) {
            id v87 = objc_getProperty(v87, v88, 64, 1);
          }
          id v89 = v87;
          SEL v90 = [v89 port];
          -[NSObject setNatTraversalSrcPort:](v39, "setNatTraversalSrcPort:", (unsigned __int16)[v90 intValue]);

          BOOL v68 = ne_log_obj();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v149 = (const char *)a1;
            unsigned int v69 = v68;
            id v70 = "%@ Enabling NAT traversal (migrate)";
            goto LABEL_55;
          }
        }
      }
      else
      {
        -[NSObject setNatTraversalEnabled:](v22, "setNatTraversalEnabled:", 0, v141);
        [v39 setNatTraversalEnabled:0];
        [v22 setNatTraversalPort:0];
        [v22 setNatTraversalSrcPort:0];
        [v39 setNatTraversalPort:0];
        [v39 setNatTraversalSrcPort:0];
        BOOL v68 = ne_log_obj();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v149 = (const char *)a1;
          unsigned int v69 = v68;
          id v70 = "%@ Disabling NAT traversal (migrate)";
LABEL_55:
          _os_log_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_INFO, v70, buf, 0xCu);
        }
      }

      id v92 = objc_getProperty((id)a1, v91, 336, 1);
      if (v92 && (v92[14] & 1) != 0)
      {
        id v94 = objc_getProperty((id)a1, v93, 336, 1);
        if (v94) {
          id v94 = objc_getProperty(v94, v95, 88, 1);
        }
        id v96 = v94;
        char v97 = [v96 natTraversalKeepaliveDisabled];

        if ((v97 & 1) == 0)
        {
          [v39 setNatKeepaliveEnabled:1];
          id v99 = objc_getProperty((id)a1, v98, 336, 1);
          if (v99) {
            id v99 = objc_getProperty(v99, v100, 88, 1);
          }
          id v101 = v99;
          int v102 = [v101 natTraversalKeepaliveOffloadEnabled];

          if (v102)
          {
            [v39 setNatKeepaliveOffloadEnabled:1];
            id v105 = objc_getProperty((id)a1, v104, 336, 1);
            if (v105) {
              id v105 = objc_getProperty(v105, v106, 88, 1);
            }
            id v107 = v105;
            -[NSObject setNatKeepaliveOffloadIntervalSeconds:](v39, "setNatKeepaliveOffloadIntervalSeconds:", [v107 natTraversalKeepaliveOffloadInterval]);
          }
          id v108 = objc_getProperty((id)a1, v103, 336, 1);
          if (v108) {
            id v108 = objc_getProperty(v108, v109, 88, 1);
          }
          id v110 = v108;
          -[NSObject setNatKeepaliveIntervalSeconds:](v39, "setNatKeepaliveIntervalSeconds:", [v110 natTraversalKeepaliveInterval]);
        }
      }
      uint64_t v111 = objc_getProperty((id)a1, v93, 336, 1);
      if (v111 && (v111[15] & 1) != 0) {
        [v22 setNatDetectedOnPeer:1];
      }
      int v114 = objc_msgSend(objc_getProperty((id)a1, v112, 176, 1), "migrateSA:", v22);
      if ((v114 & 1) == 0)
      {
        uint64_t v115 = ne_log_large_obj();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          id v117 = objc_getProperty((id)a1, v116, 176, 1);
          *(_DWORD *)long long buf = v141;
          id v149 = (const char *)a1;
          __int16 v150 = 2112;
          id v151 = v117;
          __int16 v152 = 2112;
          SEL v153 = v22;
          __int16 v154 = 2112;
          uint64_t v155 = v9;
          _os_log_error_impl(&dword_19DDAF000, v115, OS_LOG_TYPE_ERROR, "%@ %@ Failed to migrate incoming SA %@ for %@", buf, 0x2Au);
        }
      }
      if ((objc_msgSend(objc_getProperty((id)a1, v113, 176, 1), "migrateSA:", v39) & 1) == 0)
      {
        char v120 = ne_log_large_obj();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          id v140 = objc_getProperty((id)a1, v122, 176, 1);
          *(_DWORD *)long long buf = v141;
          id v149 = (const char *)a1;
          __int16 v150 = 2112;
          id v151 = v140;
          __int16 v152 = 2112;
          SEL v153 = v39;
          __int16 v154 = 2112;
          uint64_t v155 = v9;
          _os_log_error_impl(&dword_19DDAF000, v120, OS_LOG_TYPE_ERROR, "%@ %@ Failed to migrate outgoing SA %@ for %@", buf, 0x2Au);
        }
LABEL_97:

LABEL_98:
        goto LABEL_99;
      }

      if (!v114) {
        goto LABEL_100;
      }
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v143 objects:v147 count:16];
    uint64_t v3 = 1;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_101:

  return v3;
}

- (void)setSentMOBIKERequest:(int)a3 messageID:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 11) & 1) == 0)
    {
      objc_setProperty_atomic((id)a1, v5, v6, 376);
      *(_DWORD *)(a1 + 24) = a3;
      if (objc_getProperty((id)a1, v7, 376, 1))
      {
        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412802;
          uint64_t v11 = a1;
          __int16 v12 = 1024;
          int v13 = a3;
          __int16 v14 = 2112;
          id Property = objc_getProperty((id)a1, v9, 376, 1);
          _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@ Saving MOBIKE request (message %u) %@\n", (uint8_t *)&v10, 0x1Cu);
        }
      }
    }
  }
}

- (uint64_t)sendCurrentRequest:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  id Property = objc_getProperty((id)a1, v3, 368, 1);
  dispatch_assert_queue_V2(Property);
  SEL v7 = objc_getProperty((id)a1, v6, 336, 1);
  if ([(NEIKEv2IKESA *)v7 hasTransport])
  {
    int v10 = (id *)objc_getProperty((id)a1, v9, 336, 1);
    __int16 v12 = (id *)[(NEIKEv2IKESA *)v10 copyTransport];
    id v14 = objc_getProperty((id)a1, v13, 216, 1);
    long long v15 = NSNumber;
    uint64_t v16 = *(unsigned int *)(a1 + 16);
    id v17 = v14;
    id v18 = [v15 numberWithInt:v16];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];

    if ([v19 count] == 1)
    {
      id v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v45 = [v19 firstObject];
        int v46 = [v45 length];
        int v47 = *(_DWORD *)(a1 + 16);
        *(_DWORD *)long long buf = 138413058;
        uint64_t v60 = a1;
        __int16 v61 = 1024;
        int v62 = v46;
        __int16 v63 = 1024;
        int v64 = v47;
        __int16 v65 = 2112;
        *(void *)SEL v66 = v12;
        _os_log_debug_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEBUG, "%@ Sending request of length %u with ID %u on %@\n", buf, 0x22u);
      }
      id v21 = [v19 firstObject];
      char v22 = -[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v21, v4);

      if ((v22 & 1) == 0)
      {
        uint64_t v23 = ne_log_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v60 = a1;
          _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, "%@ Sending request data failed", buf, 0xCu);
        }

        id v25 = objc_getProperty((id)a1, v24, 336, 1);
        -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v25, 1);
LABEL_38:
        a1 = 0;
        goto LABEL_39;
      }
    }
    else if ([v19 count])
    {
      SEL v48 = v19;
      int v49 = [v19 count];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id obj = v19;
      uint64_t v27 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (!v27) {
        goto LABEL_26;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v54;
      int v30 = -v49;
      int v31 = 1;
LABEL_15:
      uint64_t v32 = 0;
      int v33 = v30 + v31;
      while (1)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(obj);
        }
        SEL v34 = *(void **)(*((void *)&v53 + 1) + 8 * v32);
        id v35 = ne_log_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          int v36 = [v34 length];
          int v37 = *(_DWORD *)(a1 + 16);
          *(_DWORD *)long long buf = 138413570;
          uint64_t v60 = a1;
          __int16 v61 = 1024;
          int v62 = v31 + v32;
          __int16 v63 = 1024;
          int v64 = v49;
          __int16 v65 = 1024;
          *(_DWORD *)SEL v66 = v36;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v37;
          __int16 v67 = 2112;
          BOOL v68 = v12;
          _os_log_debug_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_DEBUG, "%@ Sending request fragment %u/%u of length %u with ID %u on %@\n", buf, 0x2Eu);
        }

        if (v33 + v32)
        {
          if ((-[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v34, 0) & 1) == 0)
          {
            id v38 = ne_log_obj();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v60 = a1;
              _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "%@ Sending fragment request data failed", buf, 0xCu);
            }

            uint64_t v19 = v48;
            if (v4)
            {
              id v41 = objc_getProperty((id)a1, v40, 368, 1);
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __37__NEIKEv2Session_sendCurrentRequest___block_invoke_70;
              v51[3] = &unk_1E5993770;
              SEL v52 = v4;
              dispatch_async(v41, v51);
              id v42 = v52;
              goto LABEL_36;
            }
            goto LABEL_37;
          }
        }
        else if ((-[NEIKEv2Transport sendData:sendCompletionHandler:](v12, v34, v4) & 1) == 0)
        {
          id v42 = ne_log_obj();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v60 = a1;
            _os_log_error_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_ERROR, "%@ Sending fragment request data failed", buf, 0xCu);
          }
          uint64_t v19 = v48;
LABEL_36:

LABEL_37:
          id v43 = objc_getProperty((id)a1, v40, 336, 1);
          -[NEIKEv2IKESA detachTransportWithShouldInvalidate:](v43, 1);

          goto LABEL_38;
        }
        if (v28 == ++v32)
        {
          v31 += v32;
          uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
          int v30 = -v49;
          if (v28) {
            goto LABEL_15;
          }
LABEL_26:

          a1 = 1;
          uint64_t v19 = v48;
LABEL_39:

LABEL_40:
          goto LABEL_41;
        }
      }
    }
    a1 = 1;
    goto LABEL_39;
  }
  if (v4)
  {
    id v26 = objc_getProperty((id)a1, v9, 368, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__NEIKEv2Session_sendCurrentRequest___block_invoke;
    block[3] = &unk_1E5993770;
    uint64_t v58 = (id *)v4;
    dispatch_async(v26, block);
    a1 = 0;
    __int16 v12 = v58;
    goto LABEL_40;
  }
  a1 = 0;
LABEL_41:

  return a1;
}

uint64_t __37__NEIKEv2Session_sendCurrentRequest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__NEIKEv2Session_sendCurrentRequest___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)sendRequest:(unint64_t)a3 retryIntervalInMilliseconds:(int)a4 maxRetries:(void *)a5 timeoutError:(char)a6 resend:(uint64_t)a7 sendMessageID:(void *)a8 sendCompletionHandler:(void *)a9 replyHandler:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v86 = a5;
  id v15 = a8;
  id newValue = a9;
  if (!a1)
  {
    a7 = 0;
    goto LABEL_66;
  }
  id Property = objc_getProperty((id)a1, v16, 368, 1);
  dispatch_assert_queue_V2(Property);
  if (!objc_getProperty((id)a1, v18, 336, 1))
  {
    SEL v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendM"
                           "essageID:sendCompletionHandler:replyHandler:]";
      _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", buf, 0xCu);
    }
    a7 = 0xFFFFFFFFLL;
    goto LABEL_65;
  }
  if (!objc_getProperty((id)a1, v19, 200, 1))
  {
    *(unsigned char *)(a1 + 11) = 0;
    SEL v24 = objc_getProperty((id)a1, v20, 336, 1);
    if (a6)
    {
      *(_DWORD *)(a1 + 16) = a7;
      id v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = a7;
        _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "%@ Re-sending message ID %u", buf, 0x12u);
      }
    }
    else
    {
      a7 = (*(_DWORD *)(a1 + 16) + 1);
      *(_DWORD *)(a1 + 16) = a7;
    }
    [(NEIKEv2Session *)(void *)a1 cancelSendTimer];
    objc_setProperty_atomic_copy((id)a1, v27, newValue, 200);
    v14[6] = a7;
    id v29 = objc_getProperty((id)a1, v28, 336, 1);
    id v83 = -[NEIKEv2Packet copyPacketDatagramsForIKESA:](v14, v29);
    if (!v83)
    {
      long long v56 = ne_log_obj();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ Failed to generate datagrams from packet", buf, 0xCu);
      }

      if (!v15)
      {
        a7 = 0xFFFFFFFFLL;
LABEL_64:

        goto LABEL_65;
      }
      uint64_t v58 = objc_getProperty((id)a1, v57, 368, 1);
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      void v101[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_71;
      v101[3] = &unk_1E5993770;
      int v102 = v15;
      dispatch_async(v58, v101);
      a7 = 0xFFFFFFFFLL;
      SEL v59 = v102;
LABEL_63:

      goto LABEL_64;
    }
    if (v24 && (BYTE1(v24[1].isa) & 1) != 0 && !a7 && [v83 count] == 1)
    {
      int v30 = [v83 firstObject];
      objc_setProperty_atomic(v24, v31, v30, 312);
    }
    uint64_t v32 = ne_log_large_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      int v33 = [v83 count];
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a7;
      LOWORD(v106[0]) = 2112;
      *(void *)((char *)v106 + 2) = v14;
      _os_log_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_INFO, "%@ Sending %u datagrams for packet (message %u): %@", buf, 0x22u);
    }

    if ((a6 & 1) == 0)
    {
      id v82 = v83;
      int v36 = objc_getProperty((id)a1, v35, 336, 1);
      int v38 = 4;
      if (v36)
      {
        if (v36[17]) {
          int v38 = 6;
        }
        else {
          int v38 = 4;
        }
      }
      id v39 = objc_getProperty((id)a1, v37, 216, 1);
      SEL v40 = NSNumber;
      uint64_t v41 = *(unsigned int *)(a1 + 16);
      id v42 = v39;
      id v43 = [v40 numberWithInt:v41];
      [v42 setObject:v82 forKeyedSubscript:v43];

      int v45 = *(_DWORD *)(a1 + 16);
      int v46 = v45 - v38;
      if (v45 >= v38)
      {
        id v47 = objc_getProperty((id)a1, v44, 216, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v47, v46);
        id v49 = objc_getProperty((id)a1, v48, 240, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v49, v46);
        id v51 = objc_getProperty((id)a1, v50, 256, 1);
        +[NEIKEv2Session removeItemsFromDictionary:lowerEdge:]((uint64_t)NEIKEv2Session, v51, v46);
      }

      long long v53 = objc_getProperty((id)a1, v52, 360, 1);
      id v54 = (id)a1;
      if (v53)
      {
        if (v53[3] == -1)
        {
          v53[3] = a7;
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = 0;
          if (-[NEIKEv2RTT getCurrentTime:]((uint64_t)buf))
          {
            *((void *)v53 + 5) = 1000 * *(void *)buf + *(_DWORD *)&buf[8] / 1000;
          }
          else
          {
            uint64_t v60 = ne_log_obj();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v107 = 138412290;
              id v108 = v54;
              _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "%@, failed to start RTT measurement", v107, 0xCu);
            }
          }
        }
        else
        {
          long long v55 = ne_log_obj();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            int v81 = v53[3];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v54;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v81;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = a7;
            _os_log_error_impl(&dword_19DDAF000, v55, OS_LOG_TYPE_ERROR, "%@, bad request message ID old %u new %u", buf, 0x18u);
          }
        }
      }
    }
    unint64_t v61 = a3;
    if (!a3)
    {
      id v62 = objc_getProperty((id)a1, v34, 360, 1);
      unint64_t v61 = -[NEIKEv2RTT nextRetransmissionInterval]((uint64_t)v62);
    }
    if (a4)
    {
      __int16 v63 = objc_getProperty((id)a1, v34, 336, 1);
      if (!v63 || (v63[13] & 1) == 0)
      {
        int v64 = objc_getProperty((id)a1, v34, 368, 1);
        dispatch_source_t v65 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v64);
        objc_setProperty_atomic((id)a1, v66, v65, 296);

        if (!objc_getProperty((id)a1, v67, 296, 1))
        {
          SEL v59 = ne_log_obj();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
          }
          goto LABEL_62;
        }
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        v106[0] = a4;
        int64_t v69 = 1000000 * v61;
        uint64_t v70 = objc_getProperty((id)a1, v68, 296, 1);
        dispatch_time_t v71 = dispatch_time(0x8000000000000000, v69);
        dispatch_source_set_timer(v70, v71, 0xFFFFFFFFFFFFFFFFLL, 0);

        char v73 = objc_getProperty((id)a1, v72, 296, 1);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_72;
        handler[3] = &unk_1E5990E38;
        char v97 = buf;
        void handler[4] = a1;
        int v99 = a7;
        int v100 = a4;
        uint64_t v95 = v24;
        unint64_t v98 = a3;
        id v96 = v86;
        dispatch_source_set_event_handler(v73, handler);
        long long v75 = objc_getProperty((id)a1, v74, 296, 1);
        dispatch_activate(v75);

        _Block_object_dispose(buf, 8);
      }
    }
    SEL v76 = (id *)objc_getProperty((id)a1, v34, 336, 1);
    SEL v59 = [(NEIKEv2IKESA *)v76 copyTransport];
    if (v59)
    {
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_80;
      v90[3] = &unk_1E5990E60;
      v90[4] = a1;
      id v92 = v15;
      SEL v91 = v24;
      int v93 = a7;
      -[NEIKEv2Transport waitForTransport:]((uint64_t)v59, v90);

      goto LABEL_63;
    }
    if (v15)
    {
      id v79 = objc_getProperty((id)a1, v78, 368, 1);
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_2;
      v88[3] = &unk_1E5993770;
      id v89 = v15;
      dispatch_async(v79, v88);
    }
    SEL v59 = 0;
LABEL_62:
    a7 = 0xFFFFFFFFLL;
    goto LABEL_63;
  }
  id v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = a1;
    _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "%@ last request still outstanding", buf, 0xCu);
  }

  if (v15)
  {
    uint64_t v23 = objc_getProperty((id)a1, v22, 368, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke;
    block[3] = &unk_1E5993770;
    SEL v104 = v15;
    dispatch_async(v23, block);
    a7 = 0xFFFFFFFFLL;
    SEL v24 = v104;
LABEL_65:

    goto LABEL_66;
  }
  a7 = 0xFFFFFFFFLL;
LABEL_66:

  return a7;
}

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_72(uint64_t a1, const char *a2)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(a1 + 72);
      int v6 = *(_DWORD *)(a1 + 76);
      int v7 = v6 - *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v5;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v7;
      LOWORD(v89) = 1024;
      *(_DWORD *)((char *)&v89 + 2) = v6;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@ Retry sending request %u (%u/%u), closing", buf, 0x1Eu);
    }

    if (-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), 0))
    {
      unint64_t v15 = *(void *)(a1 + 64);
      if (!v15)
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v8, 360, 1);
        }
        unint64_t v15 = -[NEIKEv2RTT nextRetransmissionInterval]((uint64_t)Property);
      }
      --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      id v17 = *(id *)(a1 + 32);
      if (v17) {
        id v17 = objc_getProperty(v17, v8, 296, 1);
      }
      SEL v18 = v17;
      dispatch_time_t v19 = dispatch_time(0x8000000000000000, 1000000 * v15);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0);

      id v21 = *(NSObject **)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 296, 1);
      }
      dispatch_activate(v21);
      return;
    }
    uint64_t v48 = *(void *)(a1 + 40);
    uint64_t ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"request %u attempt %u/%u", (uint64_t)v8, v9, v10, v11, v12, v13, v14, *(unsigned int *)(a1 + 72));
    -[NEIKEv2IKESA setState:error:](v48, 3uLL, ErrorFailedToSend);

LABEL_40:
    [(NEIKEv2Session *)*(void **)(a1 + 32) cancelSendTimer];
    return;
  }
  if (*(_DWORD *)(a1 + 72))
  {
LABEL_36:
    id v43 = ne_log_obj();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = *(void *)(a1 + 32);
      int v46 = *(_DWORD *)(a1 + 72);
      int v45 = *(_DWORD *)(a1 + 76);
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v45;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v46;
      _os_log_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_INFO, "%@ Hit max send retries (%u) for request %u, closing", buf, 0x18u);
    }

    -[NEIKEv2IKESA setState:error:](*(void *)(a1 + 40), 3uLL, *(void **)(a1 + 48));
    goto LABEL_40;
  }
  id v22 = *(id *)(a1 + 32);
  if (v22)
  {
    id v22 = objc_getProperty(v22, a2, 336, 1);
    if (v22) {
      id v22 = objc_getProperty(v22, v23, 80, 1);
    }
  }
  id v24 = v22;
  if (![v24 allowTCPEncapsulation]
    || (id v26 = *(void **)(a1 + 32)) == 0
    || (SEL v27 = objc_getProperty(v26, v25, 336, 1)) != 0 && (v27[13] & 1) != 0
    || (id v29 = *(void **)(a1 + 32)) == 0
    || (int v30 = (id *)objc_getProperty(v29, v28, 336, 1)) == 0)
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v32 = v30;
  *((unsigned char *)v30 + 13) = 1;
  *((unsigned char *)v30 + 10) = 0;
  int v33 = (unsigned __int8 *)objc_msgSend(objc_getProperty(v30, v31, 72, 1), "address");
  if (!v33)
  {
    SEL v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)SEL v91 = 136315138;
      id v92 = "-[NEIKEv2IKESA switchToTCPEncapsulation]";
      id v84 = "%s called with null remoteAddress";
LABEL_59:
      _os_log_fault_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_FAULT, v84, v91, 0xCu);
    }
LABEL_34:

    goto LABEL_35;
  }
  if (*v33 <= 0xFu)
  {
    SEL v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)SEL v91 = 136315138;
      id v92 = "-[NEIKEv2IKESA switchToTCPEncapsulation]";
      id v84 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
      goto LABEL_59;
    }
    goto LABEL_34;
  }
  SEL v34 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v33];
  __int16 v36 = __rev16(objc_msgSend(objc_getProperty(v32, v35, 80, 1), "tcpEncapsulationPort"));
  *(_WORD *)([v34 address] + 2) = v36;
  if (!*(_WORD *)([v34 address] + 2)) {
    *(_WORD *)([v34 address] + 2) = -27631;
  }
  if (!objc_getProperty(v32, v37, 480, 1))
  {
    id WeakRetained = objc_loadWeakRetained(v32 + 70);
    id v41 = objc_loadWeakRetained(v32 + 68);
    if ((*((unsigned char *)v32 + 25) & 1) != 0 && !WeakRetained)
    {
      id v42 = ne_log_obj();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)SEL v91 = 0;
        _os_log_error_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_ERROR, "Cannot create transport for packet delegate, delegate no longer valid", v91, 2u);
      }

      goto LABEL_34;
    }
    if (objc_msgSend(objc_getProperty(v32, v40, 80, 1), "useTLSForTCPEncapsulation")) {
      unint64_t v51 = 3;
    }
    else {
      unint64_t v51 = 2;
    }
    id v52 = objc_getProperty(v32, v50, 304, 1);
    id v54 = objc_getProperty(v32, v53, 536, 1);
    id v56 = objc_getProperty(v32, v55, 552, 1);
    uint64_t v57 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, v51, v34, 0, 0, v52, v54, v56, WeakRetained);

    objc_setProperty_atomic(v32, v58, v57, 480);
    id v60 = objc_getProperty(v32, v59, 480, 1);
    id v62 = objc_getProperty(v32, v61, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v60, v62, v41);

    id v64 = objc_getProperty(v32, v63, 480, 1);
    if (v64) {
      id v64 = objc_getProperty(v64, v65, 24, 1);
    }
    id v66 = v64;
    objc_setProperty_atomic(v32, v67, v66, 72);

    id v69 = objc_getProperty(v32, v68, 480, 1);
    if (v69) {
      id v69 = objc_getProperty(v69, v70, 16, 1);
    }
    id v71 = v69;
    objc_setProperty_atomic(v32, v72, v71, 64);

    id v74 = objc_getProperty(v32, v73, 480, 1);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __40__NEIKEv2IKESA_switchToTCPEncapsulation__block_invoke;
    id v89 = &unk_1E59932C0;
    SEL v90 = v32;
    -[NEIKEv2Transport waitForTransport:]((uint64_t)v74, buf);
  }
  id v75 = objc_getProperty(v32, v38, 480, 1);

  if (!v75) {
    goto LABEL_36;
  }
  SEL v76 = ne_log_obj();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    uint64_t v77 = *(void *)(a1 + 32);
    int v79 = *(_DWORD *)(a1 + 72);
    int v78 = *(_DWORD *)(a1 + 76);
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v77;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v78;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v79;
    _os_log_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_INFO, "%@ Hit max send retries (%u) for request %u, trying TCP encapsulation", buf, 0x18u);
  }

  id v81 = *(id *)(a1 + 32);
  if (v81) {
    id v81 = objc_getProperty(v81, v80, 336, 1);
  }
  id v82 = [(NEIKEv2IKESA *)(id *)v81 copyTransport];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_76;
  v85[3] = &unk_1E5990E10;
  id v83 = *(void **)(a1 + 40);
  v85[4] = *(void *)(a1 + 32);
  id v86 = v83;
  uint64_t v87 = *(void *)(a1 + 72);
  -[NEIKEv2Transport waitForTransport:]((uint64_t)v82, v85);
}

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_80(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  [(NEIKEv2IKESA *)(id *)Property resyncAddress];
  if ((-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), *(void **)(a1 + 48)) & 1) == 0)
  {
    [(NEIKEv2Session *)*(void **)(a1 + 32) cancelSendTimer];
    uint64_t v5 = *(void *)(a1 + 40);
    id ErrorFailedToSend = (id)NEIKEv2CreateErrorFailedToSend(@"request %u", v6, v7, v8, v9, v10, v11, v12, *(unsigned int *)(a1 + 56));
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, ErrorFailedToSend);
  }
}

uint64_t __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __138__NEIKEv2Session_sendRequest_retryIntervalInMilliseconds_maxRetries_timeoutError_resend_sendMessageID_sendCompletionHandler_replyHandler___block_invoke_76(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 336, 1);
  }
  [(NEIKEv2IKESA *)(id *)Property resyncAddress];
  if ((-[NEIKEv2Session sendCurrentRequest:](*(void *)(a1 + 32), 0) & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id ErrorFailedToSend = (void *)NEIKEv2CreateErrorFailedToSend(@"request %u attempts %u", v4, v5, v6, v7, v8, v9, v10, *(unsigned int *)(a1 + 48));
    -[NEIKEv2IKESA setState:error:](v11, 3uLL, ErrorFailedToSend);

    uint64_t v14 = *(void **)(a1 + 32);
    [(NEIKEv2Session *)v14 cancelSendTimer];
  }
}

- (uint64_t)sendRequest:(uint64_t)a1 retry:(void *)a2 replyHandler:(void *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    if (v5)
    {
      id Property = objc_getProperty((id)a1, v6, 336, 1);
      int v9 = 4;
      if (Property)
      {
        if (Property[17]) {
          int v9 = 12;
        }
        else {
          int v9 = 4;
        }
      }
      id Error = (void *)NEIKEv2CreateError(3);
      a1 = -[NEIKEv2Session sendRequest:retryIntervalInMilliseconds:maxRetries:timeoutError:resend:sendMessageID:sendCompletionHandler:replyHandler:](a1, v5, 0, v9, Error, 0, 0xFFFFFFFFLL, 0, v7);
    }
    else
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v14 = "-[NEIKEv2Session sendRequest:retry:replyHandler:]";
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null packet", buf, 0xCu);
      }

      a1 = 0xFFFFFFFFLL;
    }
  }

  return a1;
}

- (uint64_t)sendReply:(void *)a3 replyHandler:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_12;
  }
  id Property = objc_getProperty((id)a1, v6, 368, 1);
  dispatch_assert_queue_V2(Property);
  if (objc_getProperty((id)a1, v9, 336, 1))
  {
    if (v5)
    {
      if (*((unsigned char *)v5 + 10))
      {
        id v11 = objc_getProperty((id)a1, v10, 224, 1);
        uint64_t v12 = NSNumber;
        id v13 = v11;
        uint64_t v14 = [v12 numberWithInt:v5[6]];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v48 = v5[6];
            *(_DWORD *)long long buf = 138412546;
            id v52 = (const char *)a1;
            __int16 v53 = 1024;
            LODWORD(v54) = v48;
            _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@ Already sent reply %u, skipping new reply", buf, 0x12u);
          }

          if (v7) {
            v7[2](v7, 0);
          }
          goto LABEL_12;
        }
        *(unsigned char *)(a1 + 11) = 0;
        id v20 = objc_getProperty((id)a1, v16, 336, 1);
        id v21 = -[NEIKEv2Packet copyPacketDatagramsForIKESA:](v5, v20);
        if (!v21)
        {
          int v45 = ne_log_obj();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v52 = (const char *)a1;
            _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "%@ Failed to generate datagrams from packet", buf, 0xCu);
          }

          if (v7) {
            v7[2](v7, 0);
          }
          goto LABEL_36;
        }
        id v22 = ne_log_large_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v52 = (const char *)a1;
          __int16 v53 = 2112;
          id v54 = v5;
          _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_INFO, "%@ Sending reply: %@", buf, 0x16u);
        }

        id v24 = objc_getProperty((id)a1, v23, 336, 1);
        if ((!v24 || (v24[9] & 1) == 0) && !v5[6] && [v21 count] == 1)
        {
          id v25 = [v21 firstObject];
          id v27 = objc_getProperty((id)a1, v26, 336, 1);
          if (v27) {
            objc_setProperty_atomic(v27, v28, v25, 312);
          }
        }
        -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:]((void *)a1, 0);
        objc_setProperty_atomic_copy((id)a1, v29, v7, 208);
        if (objc_getProperty((id)a1, v30, 208, 1))
        {
          uint64_t v32 = objc_getProperty((id)a1, v31, 368, 1);
          dispatch_source_t v33 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v32);
          objc_storeStrong((id *)(a1 + 304), v33);

          SEL v34 = *(void **)(a1 + 304);
          if (!v34)
          {
            int v46 = ne_log_obj();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
            }

LABEL_35:
            -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:]((void *)a1, 0);
LABEL_36:
            uint64_t v19 = 0;
LABEL_37:

            goto LABEL_38;
          }
          SEL v35 = v34;
          dispatch_time_t v36 = dispatch_time(0x8000000000000000, 30000000000);
          dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0);

          int v37 = *(NSObject **)(a1 + 304);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __41__NEIKEv2Session_sendReply_replyHandler___block_invoke;
          handler[3] = &unk_1E59932C0;
          void handler[4] = a1;
          dispatch_source_set_event_handler(v37, handler);
          dispatch_activate(*(dispatch_object_t *)(a1 + 304));
        }
        uint64_t v38 = v5[6];
        id v39 = v21;
        uint64_t v19 = 1;
        id v41 = objc_getProperty((id)a1, v40, 224, 1);
        id v42 = NSNumber;
        id v43 = v41;
        uint64_t v44 = [v42 numberWithInt:v38];
        [v43 setObject:v39 forKeyedSubscript:v44];

        if (-[NEIKEv2Session sendReplyForMessageID:]((unsigned char *)a1, (const char *)v5[6])) {
          goto LABEL_37;
        }
        goto LABEL_35;
      }
      SEL v18 = ne_log_obj();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)long long buf = 136315138;
      id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
      id v49 = "%s called with null packet.isResponse";
    }
    else
    {
      SEL v18 = ne_log_obj();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)long long buf = 136315138;
      id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
      id v49 = "%s called with null packet";
    }
    goto LABEL_40;
  }
  SEL v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v52 = "-[NEIKEv2Session sendReply:replyHandler:]";
    id v49 = "%s called with null self.ikeSA";
LABEL_40:
    _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, v49, buf, 0xCu);
  }
LABEL_11:

LABEL_12:
  uint64_t v19 = 0;
LABEL_38:

  return v19;
}

uint64_t __41__NEIKEv2Session_sendReply_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "%@ Timed out waiting for next request", (uint8_t *)&v5, 0xCu);
  }

  return -[NEIKEv2Session fireWaitingRequestHandlerWithPacket:](*(void **)(a1 + 32), 0);
}

- (void)finishConfigurationEstablishment
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (objc_getProperty(a1, a2, 336, 1))
    {
      if ((a1[11] & 1) == 0)
      {
        [(NEIKEv2Session *)a1 startIKELifetimeTimer];
        [(NEIKEv2Session *)a1 startDPDTimer];
      }
    }
    else
    {
      int v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136315138;
        uint64_t v7 = "-[NEIKEv2Session finishConfigurationEstablishment]";
        _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.ikeSA", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

id __48__NEIKEv2Session_sendAnalyticsOfChosenProtocols__block_invoke(void *a1)
{
  v16[14] = *MEMORY[0x1E4F143B8];
  v15[0] = @"ChosenIKESAEncryptionProtocol";
  v15[1] = @"ChosenIKESAIntegrityProtocol";
  uint64_t v1 = @"<unknown>";
  uint64_t v2 = (__CFString *)a1[4];
  uint64_t v3 = (__CFString *)a1[5];
  if (!v2) {
    uint64_t v2 = @"<unknown>";
  }
  if (!v3) {
    uint64_t v3 = @"<unknown>";
  }
  v16[0] = v2;
  v16[1] = v3;
  v15[2] = @"ChosenIKESAPRFProtocol";
  v15[3] = @"ChosenIKESADHProtocol";
  uint64_t v4 = (__CFString *)a1[6];
  int v5 = (__CFString *)a1[7];
  if (!v4) {
    uint64_t v4 = @"<unknown>";
  }
  if (!v5) {
    int v5 = @"<unknown>";
  }
  v16[2] = v4;
  v16[3] = v5;
  v15[4] = @"RemoteHasPreferredIKESADHProtocol";
  v15[5] = @"IsIKESACookieIncluded";
  uint64_t v6 = a1[9];
  v16[4] = a1[8];
  void v16[5] = v6;
  v15[6] = @"ChosenIKEChildSAEncryptionProtocol";
  v15[7] = @"ChosenIKEChildSAIntegrityProtocol";
  uint64_t v7 = (__CFString *)a1[10];
  uint64_t v8 = (__CFString *)a1[11];
  if (!v7) {
    uint64_t v7 = @"<unknown>";
  }
  if (!v8) {
    uint64_t v8 = @"<unknown>";
  }
  v16[6] = v7;
  v16[7] = v8;
  v15[8] = @"LocalAuthProtocolUsed";
  v15[9] = @"RemoteAuthProtocolUsed";
  SEL v9 = (__CFString *)a1[12];
  uint64_t v10 = (__CFString *)a1[13];
  if (!v9) {
    SEL v9 = @"<unknown>";
  }
  if (!v10) {
    uint64_t v10 = @"<unknown>";
  }
  v16[8] = v9;
  v16[9] = v10;
  v15[10] = @"EAPProtocolUsed";
  v15[11] = @"LocalNonceSize";
  id v11 = (__CFString *)a1[14];
  uint64_t v12 = a1[15];
  if (!v11) {
    id v11 = @"<unknown>";
  }
  v16[10] = v11;
  v16[11] = v12;
  v15[12] = @"RemoteNonceSize";
  v15[13] = @"ProcessName";
  if (a1[17]) {
    uint64_t v1 = (__CFString *)a1[17];
  }
  v16[12] = a1[16];
  v16[13] = v1;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:14];

  return v13;
}

- (void)reportConfiguration
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 336, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 488, 1);
    }
    id v5 = Property;
    objc_setProperty_atomic(a1, v6, v5, 48);

    uint64_t v7 = [a1 configurationUpdateBlock];
    if (v7)
    {
      uint64_t v8 = [a1 clientQueue];

      if (v8)
      {
        SEL v9 = [a1 clientQueue];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __37__NEIKEv2Session_reportConfiguration__block_invoke;
        v10[3] = &unk_1E59936F8;
        v10[4] = a1;
        id v11 = v7;
        dispatch_async(v9, v10);
      }
    }
  }
}

void __37__NEIKEv2Session_reportConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2 || (v2[12] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [v2 assignedConfiguration];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void *__50__NEIKEv2Session_reportServerAdditionalAddresses___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16))(result[6], result[5]);
  }
  return result;
}

- (void)reportServerRedirect:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      if (objc_getProperty(a1, v4, 336, 1))
      {
        SEL v6 = -[NEIKEv2Packet copyNotification:](v5, (const char *)0x4017);
        uint64_t v8 = v6;
        if (!v6)
        {
          id v24 = 0;
LABEL_43:
          SEL v29 = [a1 redirectEventBlock];
          SEL v30 = [a1 clientQueue];

          if (v30 && v29)
          {
            SEL v31 = [a1 clientQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __39__NEIKEv2Session_reportServerRedirect___block_invoke;
            block[3] = &unk_1E5992CA0;
            void block[4] = a1;
            id v34 = v29;
            id v33 = v24;
            dispatch_async(v31, block);
          }
          goto LABEL_47;
        }
        if (v6[3].isa != (Class)16407)
        {
          SEL v9 = ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v8;
            _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "Cannot copy server redirect nonce from notification %@", buf, 0xCu);
          }
          goto LABEL_41;
        }
        SEL v9 = objc_getProperty(v6, v7, 32, 1);
        if ((unint64_t)[v9 length] <= 1)
        {
          uint64_t v10 = ne_log_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = [v9 length];
            _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Server redirect has invalid length %llu", buf, 0xCu);
          }

          goto LABEL_41;
        }
        uint64_t v12 = (unsigned __int8 *)[v9 bytes];
        uint64_t v13 = [v9 length];
        unint64_t v14 = v12[1];
        if (v13 - 2 < v14)
        {
          uint64_t v15 = ne_log_obj();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = [v9 length];
            int v17 = v12[1];
            *(_DWORD *)long long buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v16;
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&buf[10] = v17;
            SEL v18 = "Server redirect has invalid length %u (gateway length %u)";
            uint64_t v19 = buf;
            id v20 = v15;
            uint32_t v21 = 14;
LABEL_39:
            _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, v18, v19, v21);
          }
LABEL_40:

LABEL_41:
          id v24 = 0;
          goto LABEL_42;
        }
        int v22 = *v12;
        switch(v22)
        {
          case 3:
            if (v12[1])
            {
              SEL v23 = (void *)[[NSString alloc] initWithBytes:v12 + 2 length:v12[1] encoding:4];
              id v24 = [MEMORY[0x1E4F38BF0] endpointWithHostname:v23 port:@"0"];

LABEL_42:
              goto LABEL_43;
            }
            uint64_t v15 = ne_log_obj();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            int v28 = v12[1];
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v28;
            SEL v18 = "Invalid FQDN length %u";
            break;
          case 2:
            memset(buf, 0, sizeof(buf));
            int v36 = 0;
            if (v14 == 16)
            {
              *(_WORD *)long long buf = 7708;
              *(_OWORD *)&uint8_t buf[8] = *(_OWORD *)(v12 + 2);
              goto LABEL_27;
            }
            uint64_t v15 = ne_log_obj();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            int v27 = v12[1];
            int v37 = 67109120;
            int v38 = v27;
            SEL v18 = "Invalid IPv6 address length %u";
            goto LABEL_34;
          case 1:
            *(void *)long long buf = 0;
            *(void *)&uint8_t buf[8] = 0;
            if (v14 == 4)
            {
              *(_WORD *)long long buf = 528;
              *(_DWORD *)&uint8_t buf[4] = *(_DWORD *)(v12 + 2);
LABEL_27:
              id v24 = [MEMORY[0x1E4F38BC8] endpointWithAddress:buf];
              goto LABEL_42;
            }
            uint64_t v15 = ne_log_obj();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            int v26 = v12[1];
            int v37 = 67109120;
            int v38 = v26;
            SEL v18 = "Invalid IPv4 address length %u";
LABEL_34:
            uint64_t v19 = (uint8_t *)&v37;
LABEL_38:
            id v20 = v15;
            uint32_t v21 = 8;
            goto LABEL_39;
          default:
            uint64_t v15 = ne_log_obj();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              goto LABEL_40;
            }
            int v25 = *v12;
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v25;
            SEL v18 = "Server redirect has invalid type %u";
            break;
        }
        uint64_t v19 = buf;
        goto LABEL_38;
      }
      uint64_t v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Session reportServerRedirect:]";
      id v11 = "%s called with null self.ikeSA";
    }
    else
    {
      uint64_t v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Session reportServerRedirect:]";
      id v11 = "%s called with null packet";
    }
    _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, v11, buf, 0xCu);
    goto LABEL_47;
  }
LABEL_48:
}

void *__39__NEIKEv2Session_reportServerRedirect___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16))(result[6], result[5]);
  }
  return result;
}

uint64_t __32__NEIKEv2Session_reportShortDPD__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

- (void)reportPrivateNotifies:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 privateNotifyStatusEvent];
    id v5 = [a1 clientQueue];

    if (v5 && v4)
    {
      SEL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v3 copyItems:1];
      uint64_t v7 = [a1 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__NEIKEv2Session_reportPrivateNotifies___block_invoke;
      block[3] = &unk_1E5992CA0;
      void block[4] = a1;
      id v10 = v6;
      id v11 = v4;
      id v8 = v6;
      dispatch_async(v7, block);
    }
  }
}

void *__40__NEIKEv2Session_reportPrivateNotifies___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16))(result[6], result[5]);
  }
  return result;
}

- (id)copySAsToDeleteAndInstallRekeyedChildSA:(id)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (!v6) {
        goto LABEL_9;
      }
      id Property = objc_getProperty(a1, v5, 192, 1);
      id v8 = -[NEIKEv2Session copySAFromDictionary:forChild:](Property, v4);
      if (v8)
      {
        SEL v9 = v8;
        do
        {
          [v6 addObject:v9];
          objc_msgSend(objc_getProperty(a1, v10, 192, 1), "setObject:forKeyedSubscript:", 0, v9);
          id v12 = objc_getProperty(a1, v11, 192, 1);
          id v13 = -[NEIKEv2Session copySAFromDictionary:forChild:](v12, v4);

          SEL v9 = v13;
        }
        while (v13);
      }
      if (-[NEIKEv2Session installChildSA:]((uint64_t)a1, v4)) {
        a1 = v6;
      }
      else {
LABEL_9:
      }
        a1 = 0;
    }
    else
    {
      uint64_t v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        int v17 = "-[NEIKEv2Session copySAsToDeleteAndInstallRekeyedChildSA:]";
        _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "%s called with null childSA", (uint8_t *)&v16, 0xCu);
      }

      a1 = 0;
    }
  }

  return a1;
}

- (void)uninstallOldRekeyedChildSAs:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          SEL v10 = ne_log_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id Property = objc_getProperty(a1, v11, 176, 1);
            *(_DWORD *)long long buf = 138412802;
            uint64_t v19 = a1;
            __int16 v20 = 2112;
            id v21 = Property;
            __int16 v22 = 2112;
            uint64_t v23 = v9;
            _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEFAULT, "%@ %@ Uninstalling old rekeyed child SA %@", buf, 0x20u);
          }

          objc_msgSend(objc_getProperty(a1, v13, 176, 1), "removeSA:", v9);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (void)reportTrafficSelectorsForChildSA:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = v3;
  if (a1)
  {
    if (v3)
    {
      int v6 = v3[4];
      uint64_t v7 = objc_getProperty(v3, v4, 64, 1);
      uint64_t v9 = objc_getProperty(v5, v8, 72, 1);
      SEL v10 = [a1 trafficSelectorUpdateBlock];
      if (v10)
      {
        SEL v11 = [a1 clientQueue];

        if (v11)
        {
          id v12 = [a1 clientQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__NEIKEv2Session_reportTrafficSelectorsForChildSA___block_invoke;
          block[3] = &unk_1E5990ED8;
          void block[4] = a1;
          id v16 = v10;
          int v17 = v6;
          long long v14 = v7;
          id v15 = v9;
          dispatch_async(v12, block);
        }
      }
    }
    else
    {
      uint64_t v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v19 = "-[NEIKEv2Session reportTrafficSelectorsForChildSA:]";
        _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__NEIKEv2Session_reportTrafficSelectorsForChildSA___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(result + 56) + 16))(*(void *)(result + 56), *(unsigned int *)(result + 64), *(void *)(result + 40), *(void *)(result + 48));
  }
  return result;
}

- (void)setPendingPrivateNotifies:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

@end