@interface IDSGFTGL
- (BOOL)_IsExtIPDiscoveryNeeded:(sockaddr *)a3 candidatePairList:(id)a4;
- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5;
- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4;
- (BOOL)_processRegisterAckResponse:(id)a3 candidatePairToken:(id)a4;
- (BOOL)_processRegisterIndication:(id)a3 candidatePairToken:(id)a4;
- (BOOL)_processRegisterResponse:(id)a3 candidatePairToken:(id)a4;
- (BOOL)_processReliableUnicastRegistrationErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 candidatePair:(id)a6;
- (BOOL)_processRemovedLocalAddressList:(id)a3;
- (BOOL)_setupNewQRLinkIfNecessary:(id)a3;
- (id)_findVirtualCandidatePair:(id)a3;
- (id)_virtualCandidatePairFromLocalLinkID:(unsigned __int16)a3 remoteRelayLinkID:(unsigned __int16)a4;
- (int64_t)_getQRAllocateType;
- (void)_checkIfQRLinkIsDownButP2PLinkIsUp;
- (void)_destroyVirtualRelayLinksForCandidatePair:(id)a3 withReason:(unsigned __int8)a4;
- (void)_disableE2E;
- (void)_discardCandidatePairsWithOption:(BOOL)a3 isReinitiating:(BOOL)a4;
- (void)_discardKeyMaterialMessage:(int64_t)a3;
- (void)_enableE2E;
- (void)_processCommandRelayInterfaceInfo:(id)a3 candidatePairToken:(id)a4;
- (void)_processReceivedRemoteCandidatePairs:(id)a3;
- (void)_sendConnectionDataWithRemovedAddressList:(id)a3;
- (void)_sendQUICRegisterAckRequest:(id)a3 withOptions:(id)a4;
- (void)_sendQUICRegisterRequest:(id)a3 withOptions:(id)a4;
- (void)_sendRegisterRequest:(id)a3;
- (void)_sendRelayInterfaceInfo:(id)a3;
- (void)_setupVirtualCandidatePairs:(id)a3 remoteCandidatePair:(id)a4;
- (void)didReceiveProtobufPacketForLinkID:(unsigned __int8)a3;
- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4;
- (void)enableUPlusOneSessionForTransition:(BOOL)a3;
- (void)invalidate;
- (void)manageDesignatedDestinations:(id)a3 relayGroupID:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6;
- (void)receiveJoinNotificationFromAParticipant;
- (void)removeParticipantIDs:(id)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)reportLinkMetricsForLinkID:(unsigned __int8)a3 lastPacketReceivedTime:(double)a4 lastPacketSentTime:(double)a5;
- (void)sendKeyMaterialMessageData:(id)a3 relayGroupID:(id)a4 destinationURIs:(id)a5 completionHandler:(id)a6;
- (void)setAllowP2P:(BOOL)a3;
- (void)setCellInterfaceName:(id)a3;
- (void)setDefaultUnderlyingLink:(char)a3;
- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4;
- (void)setIsUPlusOneSession:(BOOL)a3;
- (void)setParticipantType:(unsigned __int16)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5;
- (void)setPluginCache:(id)a3;
- (void)setSharedSessionHasJoined:(BOOL)a3;
- (void)setTimeBase:(id)a3;
- (void)startWithOptions:(id)a3;
- (void)updateURIToParticipantIDs:(id)a3 relaySessionID:(id)a4 sessionInfo:(id)a5;
@end

@implementation IDSGFTGL

- (void)startWithOptions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  v8 = objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v38 = self;
    __int16 v39 = 2112;
    v40 = (__CFString *)idsSessionID;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:YES, isMultiway:YES).", buf, 0x16u);
  }

  Value = 0;
  if (v4 && @"gl-option-timebase") {
    Value = (void *)CFDictionaryGetValue(v4, @"gl-option-timebase");
  }
  objc_storeStrong((id *)&self->super._timeBase, Value);
  self->super._startPort = 16393;
  self->super._portRange = 10;
  v36.receiver = self;
  v36.super_class = (Class)IDSGFTGL;
  [(IDSGlobalLink *)&v36 startWithOptions:v4];
  if (self->super._isUPlusOneSession)
  {
    int v11 = IMGetDomainBoolForKeyWithDefaultValue();
    self->super._allowP2P = v11 ^ 1;
    if (((v11 ^ 1) & 1) == 0)
    {
      v15 = objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "disableP2PLinks default is set to YES.", buf, 2u);
      }
    }
    v16 = 0;
    if (v4)
    {
      v12 = (const char *)@"gl-option-disable-p2p";
      if (@"gl-option-disable-p2p") {
        v16 = (void *)CFDictionaryGetValue(v4, @"gl-option-disable-p2p");
      }
    }
    if ((objc_msgSend_BOOLValue(v16, v12, v13, v14) & 1) != 0 || self->super._isReliableUnicastSession)
    {
      objc_msgSend_setDisableP2P_(self->super._nwLink, v17, 1, v19);
      self->super._allowP2P = 0;
      self->_allowE2E = 1;
      v23 = objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isReliableUnicastSession = self->super._isReliableUnicastSession;
        if (self->super._allowP2P) {
          v25 = @"YES";
        }
        else {
          v25 = @"NO";
        }
        if (self->_allowE2E) {
          v26 = @"YES";
        }
        else {
          v26 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v38 = (IDSGFTGL *)v25;
        if (isReliableUnicastSession) {
          v27 = @"YES";
        }
        else {
          v27 = @"NO";
        }
        __int16 v39 = 2112;
        v40 = v26;
        __int16 v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "disableP2PLinks is set to YES; _allowP2P = %@, _allowE2E = %@, _isReliableUnicastSession: %@",
          buf,
          0x20u);
      }

      if (self->super._isReliableUnicastSession)
      {
        if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
          self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;
        }
        self->super._BOOL receivedRemoteDeviceVersion = 1;
        v30 = objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v19);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = @"YES";
          BOOL receivedRemoteDeviceVersion = self->super._receivedRemoteDeviceVersion;
          if (self->super._allowP2P) {
            v33 = @"YES";
          }
          else {
            v33 = @"NO";
          }
          if (self->_allowE2E) {
            v34 = @"YES";
          }
          else {
            v34 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          v38 = (IDSGFTGL *)v33;
          __int16 v39 = 2112;
          if (!receivedRemoteDeviceVersion) {
            v31 = @"NO";
          }
          v40 = v34;
          __int16 v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "Enabled Reliable Unicast Session - _allowP2P = %@, _allowE2E = %@, _BOOL receivedRemoteDeviceVersion = %@", buf, 0x20u);
        }
      }
    }
    self->super._useSecureControlMessage = 1;
    v35 = objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v19);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "Enable secure control message for U + 1 Session.", buf, 2u);
    }
  }
  else
  {
    self->super._allowP2P = 0;
  }
  self->super._allowOnlyOneQR = 0;
  self->super._enableSKE = 0;
  self->super._allowConcurrentQRSetup = 1;
  self->super._shouldProcessBasebandNotification = 1;
  self->super._supportChannelData = 1;
  self->_keyMaterialDataCounter = -1;
}

- (void)invalidate
{
  remoteCandidatePairs = self->_remoteCandidatePairs;
  self->_remoteCandidatePairs = 0;

  virtualCandidatePairs = self->_virtualCandidatePairs;
  self->_virtualCandidatePairs = 0;

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  v6.receiver = self;
  v6.super_class = (Class)IDSGFTGL;
  [(IDSGlobalLink *)&v6 invalidate];
}

- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IDSGFTGL;
  -[IDSGlobalLink disconnectWithCompletionHandler:isReinitiating:](&v8, sel_disconnectWithCompletionHandler_isReinitiating_, a3);
  objc_msgSend__handleDisconnect_(self, v6, v4, v7);
}

- (void)setDefaultUnderlyingLink:(char)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->super._isUPlusOneSession)
  {
    v10 = objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    LOWORD(v18) = 0;
    double v14 = "setDefaultUnderlyingLink not allowed when not in U+1 mode";
    v15 = v10;
    uint32_t v16 = 2;
LABEL_16:
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
    goto LABEL_17;
  }
  uint64_t v4 = a3;
  if (!self->super._isInitiator)
  {
    v10 = objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    if (self->super._isInitiator) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    int v18 = 67109378;
    int v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    double v14 = "set default underlying link (linkID:%d) failed (isInitiator:%@).";
    v15 = v10;
    uint32_t v16 = 18;
    goto LABEL_16;
  }
  if (!self->super._linkIDToCandidatePairs) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_msgSend_numberWithChar_(NSNumber, a2, a3, v3);
  if (!v6
    || (double v7 = (void *)v6,
        linkIDToCandidatePairs = self->super._linkIDToCandidatePairs,
        objc_msgSend_numberWithChar_(NSNumber, a2, v4, v3),
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = (id)CFDictionaryGetValue((CFDictionaryRef)linkIDToCandidatePairs, v9),
        v9,
        v7,
        !v10))
  {
LABEL_9:
    v10 = objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v18 = 67109120;
    int v19 = v4;
    double v14 = "failed to find candidate pair for linkID:%d.";
    v15 = v10;
    uint32_t v16 = 8;
    goto LABEL_16;
  }
  int v11 = objc_msgSend_candidatePairToken(v10, a2, a3, v3);
  objc_msgSend__nominateCandidatePair_(self, v12, (uint64_t)v11, v13);

LABEL_17:
}

- (void)_setupVirtualCandidatePairs:(id)a3 remoteCandidatePair:(id)a4
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_relayLinkID(v6, v8, v9, v10);
  unsigned int v253 = objc_msgSend_relayLinkID(v7, v12, v13, v14);
  int v18 = objc_msgSend_sessionID(v6, v15, v16, v17);
  uint64_t v22 = objc_msgSend_sessionID(v7, v19, v20, v21);
  char isEqualToString = objc_msgSend_isEqualToString_(v18, v23, (uint64_t)v22, v24);

  if (isEqualToString)
  {
    v251 = self;
    v252 = v7;
    long long v257 = 0u;
    long long v258 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    v29 = self->_virtualCandidatePairs;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v255, v31, v259, 16);
    if (v32)
    {
      uint64_t v36 = v32;
      uint64_t v37 = *(void *)v256;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v256 != v37) {
            objc_enumerationMutation(v29);
          }
          __int16 v39 = *(NSMutableArray **)(*((void *)&v255 + 1) + 8 * i);
          v40 = objc_msgSend_sessionID(v39, v33, v34, v35);
          v44 = objc_msgSend_sessionID(v6, v41, v42, v43);
          if (objc_msgSend_isEqualToString_(v40, v45, (uint64_t)v44, v46)
            && objc_msgSend_relayLinkID(v39, v47, v48, v49) == v11)
          {
            int v53 = objc_msgSend_remoteRelayLinkID(v39, v50, v51, v52);

            if (v53 == v253)
            {
              v149 = objc_msgSend_GFTGL(IDSFoundationLog, v33, v34, v35);
              if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v261 = v39;
                _os_log_impl(&dword_19D9BE000, v149, OS_LOG_TYPE_DEFAULT, "[U+1] Virtual candidate pair exists %@, no need to set up virtual candidate pairs, return", buf, 0xCu);
              }

              goto LABEL_33;
            }
          }
          else
          {
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v33, (uint64_t)&v255, v35, v259, 16);
        if (v36) {
          continue;
        }
        break;
      }
    }

    v57 = objc_msgSend_local(v6, v54, v55, v56);
    v61 = objc_msgSend_remote(v252, v58, v59, v60);
    v65 = objc_msgSend_sessionID(v6, v62, v63, v64);
    v68 = objc_msgSend_candidatePairWithLocalCandidate_remoteCandidate_sessionID_delegate_(IDSStunCandidatePair, v66, (uint64_t)v57, v67, v61, v65, v251);

    uint64_t isNAT64 = objc_msgSend_isNAT64(v6, v69, v70, v71);
    objc_msgSend_setIsNAT64_(v68, v73, isNAT64, v74);
    objc_msgSend_setState_(v68, v75, 4, v76);
    objc_msgSend_setRelayLinkID_(v68, v77, v11, v78);
    objc_msgSend_setRemoteRelayLinkID_(v68, v79, v253, v80);
    objc_msgSend_setLinkUUIDWithRelayLinkIDs(v68, v81, v82, v83);
    uint64_t v87 = objc_msgSend_linkID(v6, v84, v85, v86);
    objc_msgSend_setDelegatedLinkID_(v68, v88, v87, v89);
    uint64_t v93 = objc_msgSend_channelNumber(v6, v90, v91, v92);
    objc_msgSend_setChannelNumber_(v68, v94, v93, v95);
    objc_msgSend_setRelayProviderType_(v68, v96, 2, v97);
    uint64_t IsDegraded = objc_msgSend_serverIsDegraded(v6, v98, v99, v100);
    objc_msgSend_setServerIsDegraded_(v68, v102, IsDegraded, v103);
    v107 = objc_msgSend_remote(v68, v104, v105, v106);
    v111 = objc_msgSend_remote(v6, v108, v109, v110);
    uint64_t v115 = objc_msgSend_address(v111, v112, v113, v114);
    v119 = objc_msgSend_remote(v6, v116, v117, v118);
    uint64_t v123 = objc_msgSend_external(v119, v120, v121, v122);
    objc_msgSend_setAddress_external_(v107, v124, v115, v125, v123);

    virtualCandidatePairs = (__CFArray *)v251->_virtualCandidatePairs;
    if (!virtualCandidatePairs)
    {
      v130 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v131 = v251->_virtualCandidatePairs;
      v251->_virtualCandidatePairs = v130;

      virtualCandidatePairs = (__CFArray *)v251->_virtualCandidatePairs;
    }
    if (virtualCandidatePairs && v68) {
      CFArrayAppendValue(virtualCandidatePairs, v68);
    }
    unsigned int v132 = objc_msgSend_relayLinkID(v6, v126, v127, v128);
    v136 = (const char *)objc_msgSend_relayLinkID(v252, v133, v134, v135);
    localRemoteRelayLinkIDForVirtualStunCandidatePair(v132, v136, v137);
    v138 = (const void *)objc_claimAutoreleasedReturnValue();
    if (!v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      localRemoteRelayLinkIDToVirtualCandidatePairs = v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
      v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs = (NSMutableDictionary *)Mutable;
    }
    v29 = v68;
    if (v68)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs, v138, v29);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB7E0D0((uint64_t)v138, v151, v152, v153, v154, v155, v156, v157);
    }
    v254 = (void *)v138;

    v161 = objc_msgSend_GFTGL(IDSFoundationLog, v158, v159, v160);
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v261 = v29;
      _os_log_impl(&dword_19D9BE000, v161, OS_LOG_TYPE_DEFAULT, "[U+1] set up virtual candidate pair: %@", buf, 0xCu);
    }

    nwLink = v251->super._nwLink;
    v165 = objc_msgSend_local(v29, v162, v163, v164);
    uint64_t v169 = objc_msgSend_address(v165, v166, v167, v168);
    v173 = objc_msgSend_remote(v29, v170, v171, v172);
    uint64_t v177 = objc_msgSend_external(v173, v174, v175, v176);
    v181 = objc_msgSend_sessionID(v29, v178, v179, v180);
    v185 = objc_msgSend_local(v29, v182, v183, v184);
    char isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v185, v186, v187, v188);
    v250 = objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v189, v169, v190, v177, 0, v181, 7, 1, isCellularStunCandidate);

    v191 = v251->super._nwLink;
    v195 = objc_msgSend_local(v29, v192, v193, v194);
    uint64_t v199 = objc_msgSend_address(v195, v196, v197, v198);
    v203 = objc_msgSend_remote(v29, v200, v201, v202);
    uint64_t v207 = objc_msgSend_external(v203, v204, v205, v206);
    v211 = objc_msgSend_sessionID(v29, v208, v209, v210);
    v215 = objc_msgSend_local(v29, v212, v213, v214);
    LOBYTE(v248) = objc_msgSend_isCellularStunCandidate(v215, v216, v217, v218);
    v221 = objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(v191, v219, v199, v220, v207, 0, v211, 0, 1, v248);

    v222 = GLUtilConnectionDictionaryForNWConnectionInfo(v221, 1);
    v226 = objc_msgSend_connections(v29, v223, v224, v225);
    objc_msgSend_setObject_forKeyedSubscript_(v226, v227, (uint64_t)v222, v228, @"udp");

    v229 = GLUtilConnectionDictionaryForNWConnectionInfo(v250, v251->super._allowTLEOverVRLinks);
    v233 = objc_msgSend_connections(v29, v230, v231, v232);
    objc_msgSend_setObject_forKeyedSubscript_(v233, v234, (uint64_t)v229, v235, @"qpod");

    objc_msgSend__setCandidatePairConnected_(v251, v236, (uint64_t)v29, v237);
    v241 = objc_msgSend_linkMetrics(v29, v238, v239, v240);
    objc_msgSend_virtualRelayLinkConnected(v241, v242, v243, v244);

    objc_msgSend__sendRegisterRequest_(v251, v245, (uint64_t)v29, v246);
LABEL_33:
    id v7 = v252;
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v26, v27, v28);
    v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v29->super.super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sessionID(v6, v141, v142, v143);
      v144 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend_sessionID(v7, v145, v146, v147);
      *(_DWORD *)buf = 138412546;
      v261 = v144;
      __int16 v262 = 2112;
      v263 = v148;
      _os_log_impl(&dword_19D9BE000, &v29->super.super, OS_LOG_TYPE_DEFAULT, "[U+1]: _setupVirtualCandidatePairs local sessionID: %@ doesn't match remote sessionID: %@, return", buf, 0x16u);
    }
  }
}

- (void)_sendRegisterRequest:(id)a3
{
  id v4 = a3;
  objc_super v8 = v4;
  if (self->super._isReliableUnicastSession
    && objc_msgSend_isVirtualRelayStunCandidatePair(v4, v5, v6, v7))
  {
    if (self->super._isReliableUnicastClient)
    {
      uint64_t v12 = objc_msgSend_relayLinkID(v8, v9, v10, v11);
      if (v12)
      {
        uint64_t v16 = v12;
        uint64_t v17 = objc_msgSend_remoteRelayLinkID(v8, v13, v14, v15);
        if (v17)
        {
          uint64_t v21 = v17;
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          v25 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v23, v16, v24);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v26, (uint64_t)v25, v27, @"gl-option-reliable-unicast-local-relay-id");

          v30 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, v21, v29);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v31, (uint64_t)v30, v32, @"gl-option-reliable-unicast-remote-relay-id");

          uint64_t v36 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v33, v34, v35);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v37, (uint64_t)v36, v38, @"gl-option-reliable-unicast-reliable-link-uuid");
          uint64_t v42 = objc_msgSend_local(v8, v39, v40, v41);
          uint64_t v46 = objc_msgSend_transport(v42, v43, v44, v45);

          if (v46 == 2)
          {
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = sub_19DAADD34;
            v60[3] = &unk_1E5974100;
            v60[4] = self;
            v47 = &v61;
            id v48 = v8;
            double v49 = (id *)&v62;
            id v61 = v48;
            CFMutableDictionaryRef v62 = Mutable;
            v50 = Mutable;
            objc_msgSend__connectNWLink_disconnectAfterUse_connectedHandler_(self, v51, (uint64_t)v48, v52, 0, v60);
          }
          else
          {
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = sub_19DAADD90;
            v57[3] = &unk_1E5974100;
            v57[4] = self;
            v47 = &v58;
            id v53 = v8;
            double v49 = (id *)&v59;
            id v58 = v53;
            CFMutableDictionaryRef v59 = Mutable;
            v54 = Mutable;
            objc_msgSend__connectNWTCPLink_disconnectAfterUse_connectedHandler_(self, v55, (uint64_t)v53, v56, 0, v57);
          }
        }
        else
        {
          uint64_t v36 = objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E18C();
          }
        }
      }
      else
      {
        uint64_t v36 = objc_msgSend_GFTGL(IDSFoundationLog, v13, v14, v15);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_19DB7E158();
        }
      }
    }
    else
    {
      uint64_t v36 = objc_msgSend_GFTGL(IDSFoundationLog, v9, v10, v11);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "Will not send register request, not a client device. Remote will kick-off registration!", buf, 2u);
      }
    }
  }
}

- (void)_sendQUICRegisterRequest:(id)a3 withOptions:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  if (v6)
  {
    if (self->super._state < 5)
    {
      tokenToCandidatePairs = self->super._tokenToCandidatePairs;
      if (tokenToCandidatePairs
        && (uint64_t v12 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, v6)) != 0)
      {
        uint64_t v13 = v12;
        uint64_t v14 = [IDSQRProtoMessage alloc];
        uint64_t v19 = objc_msgSend_initWithType_candidatePair_options_(v14, v15, 29, v16, v13, v7);
        if (v19)
        {
          uint64_t v21 = objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            idsSessionID = self->super._idsSessionID;
            v26 = objc_msgSend_sessionID(v13, v22, v23, v24);
            *(_DWORD *)buf = 138413314;
            uint64_t v55 = @"register_request";
            __int16 v56 = 2112;
            v57 = v19;
            __int16 v58 = 2112;
            CFMutableDictionaryRef v59 = idsSessionID;
            __int16 v60 = 2112;
            id v61 = v26;
            __int16 v62 = 2112;
            uint64_t v63 = v6;
            _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "Send %@ %@ for IDSSessionID: %@ QRSessionID: %@ candidatePairToken: %@", buf, 0x34u);
          }
          objc_msgSend__sendProtoMessage_candidatePair_(self, v27, (uint64_t)v19, v28, v13);
          uint64_t v32 = objc_msgSend_transactionID(v19, v29, v30, v31);
          objc_msgSend_addProtoRequest_(v13, v33, v32, v34);
          if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
          {
            CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
            self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;
          }
          uint64_t v42 = objc_msgSend_copy(v7, v35, v36, v37);
          if (v42)
          {
            uint64_t v44 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
            double v45 = NSNumber;
            uint64_t v46 = objc_msgSend_transactionID(v19, v40, v41, v43);
            double v49 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v45, v47, v46, v48);
            CFDictionarySetValue((CFMutableDictionaryRef)v44, v49, v42);
          }
        }
        else
        {
          id v53 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v55 = @"register_request";
            _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "failed to create proto message (%@)!", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"failed to create proto message (%@)!");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create proto message (%@)!");
              }
            }
          }
        }
      }
      else
      {
        v50 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidate pair!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Will not send register request due to invalid candidate pair!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request due to invalid candidate pair!");
            }
          }
        }
        uint64_t v51 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          double v52 = self->super._tokenToCandidatePairs;
          *(_DWORD *)buf = 138412546;
          uint64_t v55 = v6;
          __int16 v56 = 2112;
          v57 = v52;
          _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@");
            }
          }
        }
      }
    }
    else
    {
      objc_super v8 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = _IDSLinkStateStrings[self->super._state];
        *(_DWORD *)buf = 138412546;
        uint64_t v55 = v6;
        __int16 v56 = 2080;
        v57 = v9;
        _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Will not send register request for %@, GL state [%s]!", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Will not send register request for %@, GL state [%s]!");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request for %@, GL state [%s]!");
          }
        }
      }
    }
  }
  else
  {
    uint64_t v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"Will not send register request due to invalid candidatePairToken!");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request due to invalid candidatePairToken!");
        }
      }
    }
  }
}

- (BOOL)_processRegisterIndication:(id)a3 candidatePairToken:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v10 = objc_msgSend_registerIndication(a3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v93 = objc_msgSend_txnId(v10, v15, v16, v17);
    __int16 v94 = 2112;
    id v95 = v6;
    _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "received register-indication(%llu) for %@.", buf, 0x16u);
  }

  if (v10)
  {
    if (self->super._isReliableUnicastSession)
    {
      uint64_t v23 = objc_msgSend_e2eChannelUuid(v10, v18, v19, v20);
      if (!v23)
      {
        double v35 = objc_msgSend_GFTGL(IDSFoundationLog, v21, v22, v24);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid channelUUDData!", buf, 2u);
        }
        BOOL v83 = 0;
        goto LABEL_44;
      }
      id v25 = objc_alloc(MEMORY[0x1E4F29128]);
      v26 = v23;
      uint64_t v30 = objc_msgSend_bytes(v26, v27, v28, v29);
      double v35 = objc_msgSend_initWithUUIDBytes_(v25, v31, v30, v32);
      if (!v35)
      {
        __int16 v39 = objc_msgSend_GFTGL(IDSFoundationLog, v33, v34, v36);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid reliableLinkUUID!", buf, 2u);
        }
        BOOL v83 = 0;
        goto LABEL_43;
      }
      __int16 v39 = objc_msgSend_virtualQuicClientConnectionId(v10, v33, v34, v36);
      if (!v39)
      {
        uint64_t v41 = objc_msgSend_GFTGL(IDSFoundationLog, v37, v38, v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid virtualConnectionID!", buf, 2u);
        }
        BOOL v83 = 0;
        goto LABEL_42;
      }
      uint64_t v41 = objc_msgSend_channelInfo(v10, v37, v38, v40);
      v47 = objc_msgSend_quicServerConnectionId(v41, v42, v43, v44);
      if (!v47)
      {
        uint64_t v51 = objc_msgSend_GFTGL(IDSFoundationLog, v45, v46, v48);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid local connection ID!", buf, 2u);
        }
        BOOL v83 = 0;
        goto LABEL_41;
      }
      uint64_t v51 = objc_msgSend_quicClientConnectionId(v41, v45, v46, v48);
      if (!v51)
      {
        uint64_t v82 = objc_msgSend_GFTGL(IDSFoundationLog, v49, v50, v52);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v82, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid remote connection ID!", buf, 2u);
        }
        BOOL v83 = 0;
        goto LABEL_40;
      }
      uint64_t v88 = (uint64_t)v47;
      uint64_t v53 = objc_msgSend_quicServerLinkId(v41, v49, v50, v52);
      if (v53)
      {
        uint64_t v57 = v53;
        unsigned int v58 = objc_msgSend_quicClientLinkId(v41, v54, v55, v56);
        if (v58)
        {
          unsigned int v87 = v58;
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v63, v88, v64, @"gl-option-reliable-unicast-local-connection-id");
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v65, (uint64_t)v51, v66, @"gl-option-reliable-unicast-remote-connection-id");
          v69 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v67, v57, v68);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v70, (uint64_t)v69, v71, @"gl-option-reliable-unicast-local-relay-id");

          double v74 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v72, v87, v73);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v75, (uint64_t)v74, v76, @"gl-option-reliable-unicast-remote-relay-id");

          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v77, (uint64_t)v39, v78, @"gl-option-reliable-unicast-virtual-connection-id");
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v79, (uint64_t)v35, v80, @"gl-option-reliable-unicast-reliable-link-uuid");
          v81 = im_primary_queue();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19DAAEA78;
          block[3] = &unk_1E5974100;
          block[4] = self;
          id v90 = v6;
          CFMutableDictionaryRef v91 = Mutable;
          uint64_t v82 = Mutable;
          dispatch_async(v81, block);

          v47 = (void *)v88;
          BOOL v83 = 1;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
LABEL_44:

          goto LABEL_45;
        }
        uint64_t v82 = objc_msgSend_GFTGL(IDSFoundationLog, v59, v60, v61);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v85 = "processRegisterIndication failed due to invalid remote relay link ID!";
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v82 = objc_msgSend_GFTGL(IDSFoundationLog, v54, v55, v56);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v85 = "processRegisterIndication failed due to invalid local relay link ID!";
LABEL_38:
          _os_log_impl(&dword_19D9BE000, v82, OS_LOG_TYPE_DEFAULT, v85, buf, 2u);
        }
      }
      BOOL v83 = 0;
      v47 = (void *)v88;
      goto LABEL_40;
    }
    uint64_t v23 = objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v84 = "processRegisterIndication failed, not a Reliable Unicast Session!";
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v84 = "processRegisterIndication failed due to invalid registerIndication!";
LABEL_17:
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, v84, buf, 2u);
    }
  }
  BOOL v83 = 0;
LABEL_45:

  return v83;
}

- (void)_sendQUICRegisterAckRequest:(id)a3 withOptions:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      if (self->super._state < 5)
      {
        tokenToCandidatePairs = self->super._tokenToCandidatePairs;
        if (tokenToCandidatePairs
          && (uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, v6)) != 0)
        {
          double v15 = v14;
          uint64_t v16 = [IDSQRProtoMessage alloc];
          uint64_t v21 = (char *)objc_msgSend_initWithType_candidatePair_options_(v16, v17, 32, v18, v15, v8);
          if (v21)
          {
            uint64_t v23 = objc_msgSend_GFTGL(IDSFoundationLog, v19, v20, v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              idsSessionID = self->super._idsSessionID;
              uint64_t v28 = objc_msgSend_sessionID(v15, v24, v25, v26);
              *(_DWORD *)buf = 138413314;
              uint64_t v55 = @"registerAck_request";
              __int16 v56 = 2112;
              uint64_t v57 = v21;
              __int16 v58 = 2112;
              CFMutableDictionaryRef v59 = idsSessionID;
              __int16 v60 = 2112;
              double v61 = v28;
              __int16 v62 = 2112;
              uint64_t v63 = v6;
              _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Send %@ %@ for IDSSessionID: %@ QRSessionID: %@ candidatePairToken: %@", buf, 0x34u);
            }
            objc_msgSend__sendProtoMessage_candidatePair_(self, v29, (uint64_t)v21, v30, v15);
            uint64_t v34 = objc_msgSend_transactionID(v21, v31, v32, v33);
            objc_msgSend_addProtoRequest_(v15, v35, v34, v36);
            if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
            {
              CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
              self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;
            }
            double v44 = objc_msgSend_copy(v8, v37, v38, v39);
            if (v44)
            {
              uint64_t v46 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
              v47 = NSNumber;
              uint64_t v48 = objc_msgSend_transactionID(v21, v42, v43, v45);
              uint64_t v51 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v47, v49, v48, v50);
              CFDictionarySetValue((CFMutableDictionaryRef)v46, v51, v44);
            }
          }
          else
          {
            uint64_t v53 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = @"registerAck_request";
              _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "failed to create proto message (%@).", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to create proto message (%@).");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create proto message (%@).");
                }
              }
            }
          }
        }
        else
        {
          double v52 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v52, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePair!", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request due to invalid candidatePair!");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request due to invalid candidatePair!");
              }
            }
          }
        }
      }
      else
      {
        double v9 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = _IDSLinkStateStrings[self->super._state];
          *(_DWORD *)buf = 138412546;
          uint64_t v55 = v6;
          __int16 v56 = 2080;
          uint64_t v57 = v10;
          _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "Will not send register ack request for %@, GL state [%s]!", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request for %@, GL state [%s]!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request for %@, GL state [%s]!");
            }
          }
        }
      }
    }
    else
    {
      uint64_t v12 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid options!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request due to invalid options!");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request due to invalid options!");
          }
        }
      }
    }
  }
  else
  {
    double v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request due to invalid candidatePairToken!");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request due to invalid candidatePairToken!");
        }
      }
    }
  }
}

- (BOOL)_processRegisterAckResponse:(id)a3 candidatePairToken:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v11 = objc_msgSend_GFTGL(IDSFoundationLog, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v121 = objc_msgSend_transactionID(v6, v12, v13, v14);
    __int16 v122 = 2112;
    id v123 = v7;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "received registerAck-response(%llu) for %@.", buf, 0x16u);
  }

  if (v7)
  {
    if (self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
    {
      double v18 = NSNumber;
      uint64_t v19 = objc_msgSend_transactionID(v6, v15, v16, v17);
      double v24 = objc_msgSend_numberWithUnsignedLongLong_(v18, v20, v19, v21);
      if (v24)
      {
        reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
        double v27 = NSNumber;
        uint64_t v28 = objc_msgSend_transactionID(v6, v22, v23, v25);
        double v31 = objc_msgSend_numberWithUnsignedLongLong_(v27, v29, v28, v30);
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)reliableUnicastServerMaterialToProtoMessageTransactionID, v31);
        double v36 = objc_msgSend_mutableCopy(Value, v33, v34, v35);
      }
      else
      {
        double v36 = objc_msgSend_mutableCopy(0, v22, v23, v25);
      }

      if (!v36)
      {
        double v110 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v110, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid options!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"processRegisterAckResponse failed due to invalid options!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"processRegisterAckResponse failed due to invalid options!");
            }
          }
        }
        BOOL v39 = 0;
        goto LABEL_61;
      }
      uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v36, v40, @"gl-option-reliable-unicast-local-connection-id", v41);
      if (v43)
      {
        double v45 = objc_msgSend_objectForKeyedSubscript_(v36, v42, @"gl-option-reliable-unicast-local-relay-id", v44);
        unsigned __int16 v49 = objc_msgSend_unsignedIntValue(v45, v46, v47, v48);

        if (v49)
        {
          uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v36, v50, @"gl-option-reliable-unicast-remote-relay-id", v52);
          unsigned __int16 v57 = objc_msgSend_unsignedIntValue(v53, v54, v55, v56);

          if (v57)
          {
            double v61 = objc_msgSend__virtualCandidatePairFromLocalLinkID_remoteRelayLinkID_(self, v58, v49, v60, v57);
            v119 = v61;
            BOOL v39 = v61 != 0;
            if (v61)
            {
              v65 = objc_msgSend_remote(v61, v62, v63, v64);
              uint64_t v69 = objc_msgSend_radioAccessTechnology(v65, v66, v67, v68);

              v72 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v70, v69, v71);
              if (v72) {
                CFDictionarySetValue((CFMutableDictionaryRef)v36, @"gl-option-reliable-unicast-remote-type", v72);
              }

              nwLink = self->super._nwLink;
              double v118 = objc_msgSend_local(v119, v73, v74, v75);
              uint64_t v116 = objc_msgSend_address(v118, v76, v77, v78);
              uint64_t v82 = objc_msgSend_remote(v119, v79, v80, v81);
              uint64_t v86 = objc_msgSend_external(v82, v83, v84, v85);
              id v90 = objc_msgSend_sessionID(v119, v87, v88, v89);
              __int16 v94 = objc_msgSend_local(v119, v91, v92, v93);
              char isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v94, v95, v96, v97);
              double v100 = objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v98, v116, v99, v86, 0, v90, 5, 1, isCellularStunCandidate);

              v104 = objc_msgSend_connection(v100, v101, v102, v103);
              if (v104) {
                CFDictionarySetValue((CFMutableDictionaryRef)v36, @"gl-option-reliable-unicast-parent-connection", v104);
              }

              id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
              char v106 = objc_opt_respondsToSelector();

              if (v106)
              {
                id v107 = objc_loadWeakRetained((id *)&self->super._delegate);
                objc_msgSend_link_didReceiveReliableUnicastServerMaterial_(v107, v108, (uint64_t)self, v109, v36);
              }
            }
            else
            {
              uint64_t v113 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D9BE000, v113, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid candidatePair!", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(@"GL", @"IDS", @"processRegisterAckResponse failed due to invalid candidatePair!");
                  if (_IDSShouldLog()) {
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"processRegisterAckResponse failed due to invalid candidatePair!");
                  }
                }
              }
            }

            goto LABEL_60;
          }
          v112 = objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E1F4();
          }
        }
        else
        {
          v112 = objc_msgSend_GFTGL(IDSFoundationLog, v50, v51, v52);
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E1C0();
          }
        }
      }
      else
      {
        v111 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v111, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid localConnectionID!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"processRegisterAckResponse failed due to invalid localConnectionID!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"processRegisterAckResponse failed due to invalid localConnectionID!");
            }
          }
        }
      }
      BOOL v39 = 0;
LABEL_60:

LABEL_61:
      goto LABEL_62;
    }
    uint64_t v38 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!");
        }
      }
    }
  }
  else
  {
    double v37 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v37, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"processRegisterAckResponse failed due to invalid candidatePairToken!");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"processRegisterAckResponse failed due to invalid candidatePairToken!");
        }
      }
    }
  }
  BOOL v39 = 0;
LABEL_62:

  return v39;
}

- (BOOL)_processRegisterResponse:(id)a3 candidatePairToken:(id)a4
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v11 = objc_msgSend_registerResponse(v6, v8, v9, v10);
  double v15 = objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v155 = objc_msgSend_transactionID(v6, v16, v17, v18);
    __int16 v156 = 2112;
    id v157 = v7;
    _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "received register-response(%llu) for %@.", buf, 0x16u);
  }

  if (v11)
  {
    double v24 = objc_msgSend_channelInfo(v11, v19, v20, v21);
    if (self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
    {
      id v26 = v7;
      double v27 = NSNumber;
      uint64_t v28 = objc_msgSend_transactionID(v6, v22, v23, v25);
      double v33 = objc_msgSend_numberWithUnsignedLongLong_(v27, v29, v28, v30);
      if (v33)
      {
        reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
        double v36 = NSNumber;
        uint64_t v37 = objc_msgSend_transactionID(v6, v31, v32, v34);
        double v40 = objc_msgSend_numberWithUnsignedLongLong_(v36, v38, v37, v39);
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)reliableUnicastServerMaterialToProtoMessageTransactionID, v40);
        double v45 = (__CFDictionary *)objc_msgSend_mutableCopy(Value, v42, v43, v44);
      }
      else
      {
        double v45 = (__CFDictionary *)objc_msgSend_mutableCopy(0, v31, v32, v34);
      }

      id v7 = v26;
      if (v45)
      {
LABEL_16:
        double v50 = objc_msgSend_quicClientConnectionId(v24, v47, v48, v49);
        if (!v50)
        {
          uint64_t v153 = objc_msgSend_GFTGL(IDSFoundationLog, v51, v52, v53);
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E228();
          }
          BOOL v46 = 0;
          goto LABEL_45;
        }
        CFDictionarySetValue(v45, @"gl-option-reliable-unicast-local-connection-id", v50);
        unsigned __int16 v57 = objc_msgSend_quicServerConnectionId(v24, v54, v55, v56);
        uint64_t v153 = v57;
        if (!v57)
        {
          uint64_t v96 = objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E25C();
          }
          BOOL v46 = 0;
          goto LABEL_44;
        }
        id v152 = v7;
        CFDictionarySetValue(v45, @"gl-option-reliable-unicast-remote-connection-id", v57);
        double v66 = objc_msgSend_copy(v45, v61, v62, v63);
        if (v66)
        {
          double v68 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
          uint64_t v69 = NSNumber;
          uint64_t v70 = objc_msgSend_transactionID(v6, v64, v65, v67);
          double v73 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v69, v71, v70, v72);
          CFDictionarySetValue((CFMutableDictionaryRef)v68, v73, v66);
        }

        double v76 = objc_msgSend_objectForKeyedSubscript_(v45, v74, @"gl-option-reliable-unicast-local-relay-id", v75);
        unsigned __int16 v80 = objc_msgSend_unsignedIntValue(v76, v77, v78, v79);

        if (v80)
        {
          uint64_t v84 = objc_msgSend_objectForKeyedSubscript_(v45, v81, @"gl-option-reliable-unicast-remote-relay-id", v83);
          unsigned __int16 v88 = objc_msgSend_unsignedIntValue(v84, v85, v86, v87);

          if (v88)
          {
            uint64_t v92 = objc_msgSend__virtualCandidatePairFromLocalLinkID_remoteRelayLinkID_(self, v89, v80, v91, v88);
            uint64_t v96 = v92;
            BOOL v46 = v92 != 0;
            if (v92)
            {
              double v97 = objc_msgSend_remote(v92, v93, v94, v95);
              uint64_t v101 = objc_msgSend_radioAccessTechnology(v97, v98, v99, v100);

              v104 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v102, v101, v103);
              if (v104) {
                CFDictionarySetValue(v45, @"gl-option-reliable-unicast-remote-type", v104);
              }

              nwLink = self->super._nwLink;
              objc_msgSend_local(v96, v105, v106, v107);
              os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
              uint64_t v147 = objc_msgSend_address(loga, v108, v109, v110);
              objc_msgSend_remote(v96, v111, v112, v113);
              location = (id *)objc_claimAutoreleasedReturnValue();
              uint64_t v146 = objc_msgSend_external(location, v114, v115, v116);
              v145 = objc_msgSend_sessionID(v96, v117, v118, v119);
              id v123 = objc_msgSend_local(v96, v120, v121, v122);
              char isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v123, v124, v125, v126);
              v129 = objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v127, v147, v128, v146, 0, v145, 5, 1, isCellularStunCandidate);

              log = v129;
              v133 = objc_msgSend_connection(v129, v130, v131, v132);
              if (v133) {
                CFDictionarySetValue(v45, @"gl-option-reliable-unicast-parent-connection", v133);
              }

              id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
              char v135 = objc_opt_respondsToSelector();

              if (v135)
              {
                id v136 = objc_loadWeakRetained((id *)&self->super._delegate);
                v140 = objc_msgSend_copy(v45, v137, v138, v139);
                objc_msgSend_link_didReceiveReliableUnicastServerMaterial_(v136, v141, (uint64_t)self, v142, v140);
              }
              id v7 = v152;
            }
            else
            {
              log = objc_msgSend_GFTGL(IDSFoundationLog, v93, v94, v95);
              id v7 = v152;
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D9BE000, log, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid candidatePair!", buf, 2u);
              }
            }

            goto LABEL_44;
          }
          uint64_t v96 = objc_msgSend_GFTGL(IDSFoundationLog, v89, v90, v91);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E1F4();
          }
        }
        else
        {
          uint64_t v96 = objc_msgSend_GFTGL(IDSFoundationLog, v81, v82, v83);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
            sub_19DB7E1C0();
          }
        }
        BOOL v46 = 0;
        id v7 = v152;
LABEL_44:

LABEL_45:
LABEL_46:

        goto LABEL_47;
      }
    }
    else
    {
      double v45 = (__CFDictionary *)objc_msgSend_mutableCopy(0, v22, v23, v25);
      if (v45) {
        goto LABEL_16;
      }
    }
    double v50 = objc_msgSend_GFTGL(IDSFoundationLog, v47, v48, v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!", buf, 2u);
    }
    BOOL v46 = 0;
    goto LABEL_46;
  }
  double v24 = objc_msgSend_GFTGL(IDSFoundationLog, v19, v20, v21);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid registerResponse!", buf, 2u);
  }
  BOOL v46 = 0;
LABEL_47:

  return v46;
}

- (BOOL)_processReliableUnicastRegistrationErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 candidatePair:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  unint64_t var31 = a4->var31;
  double v15 = objc_msgSend_stringWithFormat_(NSString, v13, @"%llu", v14, var31);
  int var34_low = LOWORD(a4->var34);
  uint64_t var33_low = LOWORD(a4->var33);
  if (objc_msgSend_removeProtoRequest_(v11, v18, var31, v19))
  {
    if (self->super._state == 2)
    {
      uint64_t v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v24 = objc_msgSend_candidatePairToken(v11, v21, v22, v23);
        *(_DWORD *)buf = 138412546;
        *(void *)double v36 = v24;
        *(_WORD *)&v36[8] = 1024;
        *(_DWORD *)uint64_t v37 = var33_low;
        _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v33 = objc_msgSend_candidatePairToken(v11, v25, v26, v27);
          _IDSLogTransport(@"GL", @"IDS", @"%@ is already in error state, ignore error response %04x.");

          if (_IDSShouldLog())
          {
            double v34 = objc_msgSend_candidatePairToken(v11, v28, v29, v30, v33, var33_low);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"%@ is already in error state, ignore error response %04x.");
          }
        }
      }
    }
    else
    {
      double v31 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)double v36 = var33_low;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = var34_low;
        *(_WORD *)uint64_t v37 = 2112;
        *(void *)&v37[2] = v15;
        __int16 v38 = 2048;
        double v39 = (ids_monotonic_time() - a5) * 1000.0;
        _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms.", buf, 0x22u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          ids_monotonic_time();
          _IDSLogTransport(@"GL", @"IDS", @"receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms.");
          if (_IDSShouldLog())
          {
            ids_monotonic_time();
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms.");
          }
        }
      }
    }
  }

  return 1;
}

- (id)_findVirtualCandidatePair:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_virtualCandidatePairs;
  id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, v7, v24, 16);
  if (v10)
  {
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v5);
        }
        double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v15 = objc_msgSend_candidatePairToken(v14, v8, v9, v11, (void)v20);
        char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v4, v17);

        if (isEqualToString)
        {
          id v10 = v14;
          goto LABEL_11;
        }
      }
      id v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v20, v11, v24, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)_virtualCandidatePairFromLocalLinkID:(unsigned __int16)a3 remoteRelayLinkID:(unsigned __int16)a4
{
  id v6 = localRemoteRelayLinkIDForVirtualStunCandidatePair(a3, (const char *)a4, v4);
  uint64_t v9 = objc_msgSend_objectForKey_(self->super._localRemoteRelayLinkIDToVirtualCandidatePairs, v7, (uint64_t)v6, v8);

  return v9;
}

- (void)_processReceivedRemoteCandidatePairs:(id)a3
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v193 = a3;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  uint64_t v199 = self;
  locatiouint64_t n = (id *)&self->_remoteCandidatePairs;
  obuint64_t j = self->_remoteCandidatePairs;
  uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v228, v5, v245, 16);
  if (v196)
  {
    CFMutableArrayRef theArray = 0;
    id v191 = *(id *)v229;
    uint64_t v8 = 138412290;
    do
    {
      for (uint64_t i = 0; i != v196; ++i)
      {
        if (*(id *)v229 != v191) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(__CFArray **)(*((void *)&v228 + 1) + 8 * i);
        double v11 = objc_msgSend_GFTGL(IDSFoundationLog, v6, v7, *(double *)&v8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v10;
          _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "_processReceivedRemoteCandidatePairs: found existing: %@", buf, 0xCu);
        }

        long long v226 = 0u;
        long long v227 = 0u;
        long long v224 = 0u;
        long long v225 = 0u;
        id v12 = v193;
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v224, v14, v244, 16);
        if (v17)
        {
          uint64_t v19 = *(void *)v225;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v225 != v19) {
                objc_enumerationMutation(v12);
              }
              long long v21 = *(void **)(*((void *)&v224 + 1) + 8 * j);
              long long v22 = objc_msgSend_sessionID(v21, v15, v16, v18);
              uint64_t v26 = objc_msgSend_sessionID(v10, v23, v24, v25);
              if (objc_msgSend_isEqualToString_(v22, v27, (uint64_t)v26, v28))
              {
                int v32 = objc_msgSend_relayLinkID(v10, v29, v30, v31);
                LOBYTE(v32) = v32 == objc_msgSend_relayLinkID(v21, v33, v34, v35);

                if (v32)
                {

                  goto LABEL_24;
                }
              }
              else
              {
              }
            }
            uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v224, v18, v244, 16);
          }
          while (v17);
        }

        double v36 = theArray;
        if (!theArray) {
          double v36 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        CFMutableArrayRef theArray = v36;
        if (v36 && v10) {
          CFArrayAppendValue(v36, v10);
        }
LABEL_24:
        ;
      }
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v228, *(double *)&v8, v245, 16);
    }
    while (v196);
  }
  else
  {
    CFMutableArrayRef theArray = 0;
  }

  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  id v192 = v193;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v37, (uint64_t)&v220, v38, v243, 16);
  if (v41)
  {
    double v194 = 0;
    uint64_t v197 = *(void *)v221;
    uint64_t v42 = 138412290;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v221 != v197) {
          objc_enumerationMutation(v192);
        }
        double v44 = *(__CFArray **)(*((void *)&v220 + 1) + 8 * k);
        double v45 = objc_msgSend_GFTGL(IDSFoundationLog, v39, v40, *(double *)&v42);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v44;
          _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "_processReceivedRemoteCandidatePairs: received: %@", buf, 0xCu);
        }

        long long v218 = 0u;
        long long v219 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        id v46 = *location;
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v216, v48, v242, 16);
        if (v51)
        {
          uint64_t v53 = *(void *)v217;
          do
          {
            for (uint64_t m = 0; m != v51; ++m)
            {
              if (*(void *)v217 != v53) {
                objc_enumerationMutation(v46);
              }
              uint64_t v55 = *(void **)(*((void *)&v216 + 1) + 8 * m);
              double v56 = objc_msgSend_sessionID(v44, v49, v50, v52);
              double v60 = objc_msgSend_sessionID(v55, v57, v58, v59);
              if (objc_msgSend_isEqualToString_(v56, v61, (uint64_t)v60, v62))
              {
                int v66 = objc_msgSend_relayLinkID(v55, v63, v64, v65);
                LOBYTE(v66) = v66 == objc_msgSend_relayLinkID(v44, v67, v68, v69);

                if (v66)
                {

                  goto LABEL_51;
                }
              }
              else
              {
              }
            }
            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v216, v52, v242, 16);
          }
          while (v51);
        }

        uint64_t v70 = v194;
        if (!v194) {
          uint64_t v70 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        double v194 = v70;
        if (v70 && v44) {
          CFArrayAppendValue(v70, v44);
        }
LABEL_51:
        ;
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v39, (uint64_t)&v220, *(double *)&v42, v243, 16);
    }
    while (v41);
  }
  else
  {
    double v194 = 0;
  }

  objc_storeStrong(location, a3);
  if (!objc_msgSend_count(theArray, v71, v72, v73))
  {
    unsigned __int16 v80 = 0;
    goto LABEL_94;
  }
  uint64_t v77 = objc_msgSend_GFTGL(IDSFoundationLog, v74, v75, v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v233 = theArray;
    _os_log_impl(&dword_19D9BE000, v77, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: removed remote candidate pairs: %@", buf, 0xCu);
  }

  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  uint64_t v183 = theArray;
  uint64_t v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v78, (uint64_t)&v212, v79, v241, 16);
  if (!v186)
  {
    unsigned __int16 v80 = 0;
    goto LABEL_93;
  }
  unsigned __int16 v80 = 0;
  id v185 = *(id *)v213;
  do
  {
    uint64_t v81 = 0;
    do
    {
      if (*(id *)v213 != v185)
      {
        uint64_t v82 = v81;
        objc_enumerationMutation(v183);
        uint64_t v81 = v82;
      }
      uint64_t obja = v81;
      double v83 = *(void **)(*((void *)&v212 + 1) + 8 * v81);
      long long v208 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      uint64_t v84 = v199->_virtualCandidatePairs;
      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v208, v86, v240, 16);
      if (v89)
      {
        uint64_t v91 = *(void *)v209;
        do
        {
          for (uint64_t n = 0; n != v89; ++n)
          {
            if (*(void *)v209 != v91) {
              objc_enumerationMutation(v84);
            }
            double v93 = *(void **)(*((void *)&v208 + 1) + 8 * n);
            int v94 = objc_msgSend_remoteRelayLinkID(v93, v87, v88, v90);
            if (v94 == objc_msgSend_relayLinkID(v83, v95, v96, v97))
            {
              v98 = objc_msgSend_sessionID(v93, v87, v88, v90);
              uint64_t v102 = objc_msgSend_sessionID(v83, v99, v100, v101);
              int isEqualToString = objc_msgSend_isEqualToString_(v98, v103, (uint64_t)v102, v104);

              if (isEqualToString)
              {
                if (v80)
                {
                  if (!v93) {
                    goto LABEL_76;
                  }
                }
                else
                {
                  unsigned __int16 v80 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  if (!v93)
                  {
LABEL_76:
                    uint64_t v106 = OSLogHandleForTransportCategory();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_candidatePairToken(v93, v107, v108, v109);
                      double v110 = (__CFArray *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v233 = v110;
                      _os_log_impl(&dword_19D9BE000, v106, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@.", buf, 0xCu);
                    }
                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        v182 = objc_msgSend_candidatePairToken(v93, v111, v113, v112);
                        _IDSLogTransport(@"GL", @"IDS", @"[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@.");

                        if (_IDSShouldLog())
                        {
                          v182 = objc_msgSend_candidatePairToken(v93, v111, v114, v112, v182);
                          _IDSLogV(0, @"IDSFoundation", @"GL", @"[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@.");
                        }
                      }
                    }
                    objc_msgSend__notifyCandidatePairDisconnected_withReason_(v199, v111, (uint64_t)v93, v112, 2, v182);
                    unsigned int v118 = objc_msgSend_relayLinkID(v93, v115, v116, v117);
                    double v122 = (const char *)objc_msgSend_remoteRelayLinkID(v93, v119, v120, v121);
                    uint64_t v124 = localRemoteRelayLinkIDForVirtualStunCandidatePair(v118, v122, v123);
                    if (v124)
                    {
                      localRemoteRelayLinkIDToVirtualCandidatePairs = (__CFDictionary *)v199->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
                      if (localRemoteRelayLinkIDToVirtualCandidatePairs) {
                        CFDictionaryRemoveValue(localRemoteRelayLinkIDToVirtualCandidatePairs, v124);
                      }
                    }

                    continue;
                  }
                }
                if (v80) {
                  CFArrayAppendValue(v80, v93);
                }
                goto LABEL_76;
              }
            }
          }
          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v208, v90, v240, 16);
        }
        while (v89);
      }

      uint64_t v81 = obja + 1;
    }
    while (obja + 1 != v186);
    uint64_t v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v126, (uint64_t)&v212, v127, v241, 16);
  }
  while (v186);
LABEL_93:

  objc_msgSend_removeObjectsInArray_(v199->_virtualCandidatePairs, v128, (uint64_t)v80, v129);
LABEL_94:
  if (objc_msgSend_count(v194, v74, v75, v76))
  {
    v133 = objc_msgSend_GFTGL(IDSFoundationLog, v130, v131, v132);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v233 = v194;
      _os_log_impl(&dword_19D9BE000, v133, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: new remote candidate pairs: %@", buf, 0xCu);
    }

    double v198 = objc_msgSend_allValues(v199->super._tokenToCandidatePairs, v134, v135, v136);
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    objb = v194;
    uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v137, (uint64_t)&v204, v138, v239, 16);
    if (v139)
    {
      uint64_t v140 = *(void *)v205;
      do
      {
        for (iuint64_t i = 0; ii != v139; ++ii)
        {
          if (*(void *)v205 != v140) {
            objc_enumerationMutation(objb);
          }
          uint64_t v142 = *(void *)(*((void *)&v204 + 1) + 8 * ii);
          long long v200 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          long long v203 = 0u;
          id v143 = v198;
          uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v200, v145, v238, 16);
          if (v148)
          {
            uint64_t v150 = *(void *)v201;
            do
            {
              for (juint64_t j = 0; jj != v148; ++jj)
              {
                if (*(void *)v201 != v150) {
                  objc_enumerationMutation(v143);
                }
                id v152 = *(void **)(*((void *)&v200 + 1) + 8 * jj);
                if (objc_msgSend_isSharedQRSession(v152, v146, v147, v149)
                  && objc_msgSend_state(v152, v146, v147, v149) == 4)
                {
                  objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(v199, v146, (uint64_t)v152, v149, v142);
                }
              }
              uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v200, v149, v238, 16);
            }
            while (v148);
          }
        }
        uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v153, (uint64_t)&v204, v154, v239, 16);
      }
      while (v139);
    }
  }
  uint64_t v155 = objc_msgSend_GFTGL(IDSFoundationLog, v130, v131, v132);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v159 = objc_msgSend_allValues(v199->super._tokenToCandidatePairs, v156, v157, v158);
    uint64_t v163 = objc_msgSend_count(v159, v160, v161, v162);
    uint64_t v167 = objc_msgSend_count(*location, v164, v165, v166);
    uint64_t v171 = objc_msgSend_count(v199->_virtualCandidatePairs, v168, v169, v170);
    *(_DWORD *)buf = 134218496;
    v233 = (__CFArray *)v163;
    __int16 v234 = 2048;
    uint64_t v235 = v167;
    __int16 v236 = 2048;
    uint64_t v237 = v171;
    _os_log_impl(&dword_19D9BE000, v155, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: local candidate pairs: %ld, remote candidate pairs: %ld, all virtual candidate pairs: %ld", buf, 0x20u);
  }
  uint64_t v175 = objc_msgSend_GFTGL(IDSFoundationLog, v172, v173, v174);
  if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
  {
    virtualCandidatePairs = v199->_virtualCandidatePairs;
    *(_DWORD *)buf = 138412290;
    v233 = (__CFArray *)virtualCandidatePairs;
    _os_log_impl(&dword_19D9BE000, v175, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: virtual candidate pairs: %@", buf, 0xCu);
  }

  double v180 = objc_msgSend_GFTGL(IDSFoundationLog, v177, v178, v179);
  if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
  {
    v181 = v199->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
    *(_DWORD *)buf = 138412290;
    v233 = (__CFArray *)v181;
    _os_log_impl(&dword_19D9BE000, v180, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: localRemoteRelayLinkID map: %@", buf, 0xCu);
  }
}

- (void)_processCommandRelayInterfaceInfo:(id)a3 candidatePairToken:(id)a4
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id key = a4;
  uint64_t v10 = objc_msgSend_command(v6, v7, v8, v9);
  if (self->super._isUPlusOneSession)
  {
    if (self->super._receivedRemoteDeviceVersion)
    {
      if (!key
        || (uint64_t v14 = v10, (tokenToCandidatePairs = self->super._tokenToCandidatePairs) == 0)
        || (uint64_t v16 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, key)) == 0)
      {
        double v61 = objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "[U+1] failed to find candidate pair.", buf, 2u);
        }
        goto LABEL_158;
      }
      long long v205 = v16;
      unsigned __int16 v229 = 0;
      unsigned int v228 = 0;
      if (GLUtilHasValidUInt16Attr(v6, 12, &v229) && self->super._remoteCapabilityFlag != v229)
      {
        self->super._remoteCapabilityFlag = v229;
        uint64_t v17 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int remoteCapabilityFlag_low = LOWORD(self->super._remoteCapabilityFlag);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = remoteCapabilityFlag_low;
          _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "update remote capability: %04X.", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v196 = LOWORD(self->super._remoteCapabilityFlag);
            _IDSLogTransport(@"GL", @"IDS", @"update remote capability: %04X.");
            if (_IDSShouldLog())
            {
              uint64_t v196 = LOWORD(self->super._remoteCapabilityFlag);
              _IDSLogV(0, @"IDSFoundation", @"GL", @"update remote capability: %04X.");
            }
          }
        }
      }
      if (self->super._isInitiator
        && !self->super._acceptDelayU32
        && GLUtilHasValidUInt32Attr(v6, 7, &v228))
      {
        unsigned int v19 = v228;
        self->super._unsigned int acceptDelayU32 = v228;
        double v20 = (double)(unsigned __int16)v19 * 0.0000152587891 + (double)HIWORD(v19);
        long long v21 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int acceptDelayU32 = self->super._acceptDelayU32;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = acceptDelayU32;
          *(_WORD *)&buf[8] = 2048;
          *(double *)&buf[10] = v20;
          _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "receive accept delay: %08x/%.6f", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            double v197 = v20;
            uint64_t v196 = self->super._acceptDelayU32;
            _IDSLogTransport(@"GL", @"IDS", @"receive accept delay: %08x/%.6f");
            if (_IDSShouldLog())
            {
              double v197 = v20;
              uint64_t v196 = self->super._acceptDelayU32;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"receive accept delay: %08x/%.6f");
            }
          }
        }
      }
      unsigned __int16 v227 = 0;
      if (GLUtilHasValidUInt16Attr(v6, 1, &v227))
      {
        if (v14 != 32774)
        {
          if (v14 != 6)
          {
LABEL_157:
            double v61 = v205;
LABEL_158:

            goto LABEL_159;
          }
          if (!self->super._isUPlusOneSession) {
            objc_msgSend_enableUPlusOneSessionForTransition_(self, v23, 1, v25);
          }
          uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
          double v27 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v23, v227, v25, v196, *(void *)&v197);
          uint64_t v203 = objc_msgSend_dictionaryWithObject_forKey_(v26, v28, (uint64_t)v27, v29, @"gl-attr-counter");

          double v33 = objc_msgSend_GFTGL(IDSFoundationLog, v30, v31, v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v227;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = key;
            _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: send RelayInterfaceInfoAck (counter: %u) using %@", buf, 0x12u);
          }

          objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v34, 32774, v35, 0, v203, key);
          if (self->super._remoteRelayInterfaceCounter >= v227)
          {
            uint64_t v81 = objc_msgSend_GFTGL(IDSFoundationLog, v36, v37, v38);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int remoteRelayInterfaceCounter = self->super._remoteRelayInterfaceCounter;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v227;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = remoteRelayInterfaceCounter;
              _os_log_impl(&dword_19D9BE000, v81, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: received old counter: %u, current counter: %u, ignore", buf, 0xEu);
            }
          }
          else
          {
            self->super._unsigned int remoteRelayInterfaceCounter = v227;
            memset(buf, 170, 0x400uLL);
            unsigned int v226 = 0;
            if (GLUtilHasValidBinaryDataAttr(v6, 21, buf, &v226))
            {
              memset(__b, 170, sizeof(__b));
              int v225 = 0;
              if (!GLUtilHasValidBinaryDataAttr(v6, 22, __b, &v225)
                || !self->super._shouldAcceptIncomingMKMOverQR)
              {
                goto LABEL_122;
              }
              long long v200 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v42, (uint64_t)__b, v44, v225);
              long long v201 = JWDecodeDictionary();
              uint64_t v199 = objc_msgSend__dataForKey_(v201, v45, @"p", v46);
              long long v202 = objc_msgSend__stringForKey_(v201, v47, @"r", v48);
              if (v202)
              {
                if (objc_msgSend_isSharedQRSession(v205, v49, v50, v51))
                {
                  uint64_t v55 = objc_msgSend_groupID(v205, v52, v53, v54);
                  char isEqualToString = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)v202, v57);

                  if (isEqualToString)
                  {
                    double v59 = v205;
LABEL_88:
                    long long v205 = v59;
                    uint64_t v113 = objc_msgSend_participantID(v59, v52, v53, v54);
                    uint64_t v198 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v114, v113, v115);
                    double v119 = objc_msgSend_URIToParticipantIDs(v205, v116, v117, v118);
                    double v123 = objc_msgSend_allValues(v119, v120, v121, v122);

                    double v127 = objc_msgSend_GFTGL(IDSFoundationLog, v124, v125, v126);
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t v235 = 134218242;
                      uint64_t v236 = v113;
                      __int16 v237 = 2112;
                      v238 = v123;
                      _os_log_impl(&dword_19D9BE000, v127, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo localParticipantID = %llu participantIDSets = %@", v235, 0x16u);
                    }

                    long long v219 = 0u;
                    long long v220 = 0u;
                    long long v217 = 0u;
                    long long v218 = 0u;
                    obuint64_t j = v123;
                    uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v217, v129, v242, 16);
                    if (v130)
                    {
                      long long v206 = 0;
                      uint64_t v131 = *(void *)v218;
                      do
                      {
                        for (uint64_t i = 0; i != v130; ++i)
                        {
                          if (*(void *)v218 != v131) {
                            objc_enumerationMutation(obj);
                          }
                          v133 = *(void **)(*((void *)&v217 + 1) + 8 * i);
                          long long v213 = 0u;
                          long long v214 = 0u;
                          long long v215 = 0u;
                          long long v216 = 0u;
                          id v134 = v133;
                          uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v213, v136, v241, 16);
                          if (v139)
                          {
                            uint64_t v141 = *(void *)v214;
                            while (2)
                            {
                              for (uint64_t j = 0; j != v139; ++j)
                              {
                                if (*(void *)v214 != v141) {
                                  objc_enumerationMutation(v134);
                                }
                                if (objc_msgSend_unsignedLongLongValue(*(void **)(*((void *)&v213 + 1) + 8 * j), v137, v138, v140) == v113)
                                {
                                  char v143 = 1;
                                  goto LABEL_105;
                                }
                              }
                              uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v213, v140, v241, 16);
                              if (v139) {
                                continue;
                              }
                              break;
                            }
                          }
                          char v143 = 0;
LABEL_105:

                          if (objc_msgSend_count(v134, v144, v145, v146)) {
                            char v149 = v143;
                          }
                          else {
                            char v149 = 1;
                          }
                          if ((v149 & 1) == 0)
                          {
                            id v150 = v134;

                            long long v206 = v150;
                          }
                        }
                        uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v147, (uint64_t)&v217, v148, v242, 16);
                      }
                      while (v130);

                      if (v206)
                      {
                        double v154 = objc_msgSend_GFTGL(IDSFoundationLog, v151, v152, v153);
                        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t v235 = 138412802;
                          uint64_t v236 = (uint64_t)v201;
                          __int16 v237 = 2112;
                          v238 = v206;
                          __int16 v239 = 2112;
                          uint64_t v240 = v198;
                          _os_log_impl(&dword_19D9BE000, v154, OS_LOG_TYPE_DEFAULT, "[U+1] received remote key material %@ from fromParticipantIDs %@ to local participantIDs %@", v235, 0x20u);
                        }

                        id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
                        objc_msgSend_link_didReceiveKeyMaterialMessageData_fromParticipantIDs_toParticipantID_(WeakRetained, v156, (uint64_t)self, v157, v199, v206, v198);
LABEL_120:

                        double v110 = v198;
                        goto LABEL_121;
                      }
                    }
                    else
                    {
                    }
                    id WeakRetained = objc_msgSend_GFTGL(IDSFoundationLog, v151, v152, v153);
                    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)uint64_t v235 = 0;
                      _os_log_impl(&dword_19D9BE000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo couldn't find fromParticipantID - ignoring this key material message", v235, 2u);
                    }
                    long long v206 = 0;
                    goto LABEL_120;
                  }
                }
                objc_msgSend_allValues(self->super._tokenToCandidatePairs, v52, v53, v54);
                long long v223 = 0u;
                long long v224 = 0u;
                long long v221 = 0u;
                long long v222 = 0u;
                id v90 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v221, v92, v243, 16);
                if (v95)
                {
                  uint64_t v97 = *(void *)v222;
                  do
                  {
                    for (uint64_t k = 0; k != v95; ++k)
                    {
                      if (*(void *)v222 != v97) {
                        objc_enumerationMutation(v90);
                      }
                      uint64_t v99 = *(void **)(*((void *)&v221 + 1) + 8 * k);
                      if (objc_msgSend_isSharedQRSession(v99, v93, v94, v96))
                      {
                        uint64_t v100 = objc_msgSend_groupID(v99, v93, v94, v96);
                        if (objc_msgSend_isEqualToString_(v100, v101, (uint64_t)v202, v102))
                        {
                          BOOL v106 = objc_msgSend_state(v99, v103, v104, v105) == 4;

                          if (v106)
                          {
                            double v112 = v99;

                            double v59 = v112;
                            goto LABEL_88;
                          }
                        }
                        else
                        {
                        }
                      }
                    }
                    uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v221, v96, v243, 16);
                  }
                  while (v95);
                }

                double v110 = objc_msgSend_GFTGL(IDSFoundationLog, v107, v108, v109);
                if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_121;
                }
                *(_DWORD *)uint64_t v235 = 138412290;
                uint64_t v236 = (uint64_t)v202;
                v111 = "[U+1] _processCommandRelayInterfaceInfo couldn't find a matching candidatePair with relayGroupID "
                       "%@ - ignoring this key material message";
              }
              else
              {
                double v110 = objc_msgSend_GFTGL(IDSFoundationLog, v49, v50, v51);
                if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                {
LABEL_121:

LABEL_122:
                  if (objc_msgSend_isSharedQRSession(v205, v42, v43, v44))
                  {
                    objc_msgSend_sessionID(v205, v158, v159, v160);
                    id v163 = (id)objc_claimAutoreleasedReturnValue();
LABEL_124:
                    *(_DWORD *)uint64_t v235 = 0;
                    uint64_t v165 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v161, v162, v164);
                    double v168 = objc_msgSend_candidatePairsFromRelayInterfaceInfo_bufferLength_token_sessionID_error_(v165, v166, (uint64_t)buf, v167, v226, self->super._cbuuid, v163, v235);

                    if (*(_DWORD *)v235)
                    {
                      double v172 = objc_msgSend_GFTGL(IDSFoundationLog, v169, v170, v171);
                      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)long long v208 = 0;
                        _os_log_impl(&dword_19D9BE000, v172, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: couldn't get any candidate pairs, return", v208, 2u);
                      }
                    }
                    else
                    {
                      objc_msgSend__processReceivedRemoteCandidatePairs_(self, v169, (uint64_t)v168, v171);
                    }
                  }
                  else
                  {
                    objc_msgSend_allValues(self->super._tokenToCandidatePairs, v158, v159, v160);
                    long long v211 = 0u;
                    long long v212 = 0u;
                    long long v209 = 0u;
                    long long v210 = 0u;
                    uint64_t v173 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v209, v175, v234, 16);
                    if (v178)
                    {
                      id v163 = 0;
                      uint64_t v180 = *(void *)v210;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v178; ++m)
                        {
                          if (*(void *)v210 != v180) {
                            objc_enumerationMutation(v173);
                          }
                          v182 = *(void **)(*((void *)&v209 + 1) + 8 * m);
                          if (objc_msgSend_isSharedQRSession(v182, v176, v177, v179)
                            && objc_msgSend_state(v182, v176, v177, v179) == 4)
                          {
                            uint64_t v183 = objc_msgSend_sessionID(v182, v176, v177, v179);
                            uint64_t v186 = v183;
                            if (v163)
                            {
                              if ((objc_msgSend_isEqualToString_(v163, v184, (uint64_t)v183, v185) & 1) == 0)
                              {
                                id v193 = objc_msgSend_GFTGL(IDSFoundationLog, v187, v188, v189);
                                if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)uint64_t v235 = 0;
                                  _os_log_impl(&dword_19D9BE000, v193, OS_LOG_TYPE_DEFAULT, "[U+1] There are multiple relaySessionIDs - ignore this relayInterface Info", v235, 2u);
                                }

                                v195 = v173;
                                goto LABEL_153;
                              }
                            }
                            else
                            {
                              id v163 = v183;
                            }
                          }
                        }
                        uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v176, (uint64_t)&v209, v179, v234, 16);
                        if (v178) {
                          continue;
                        }
                        break;
                      }

                      if (v163)
                      {

                        goto LABEL_124;
                      }
                    }
                    else
                    {
                    }
                    v195 = objc_msgSend_GFTGL(IDSFoundationLog, v190, v191, v192);
                    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)uint64_t v235 = 0;
                      _os_log_impl(&dword_19D9BE000, v195, OS_LOG_TYPE_DEFAULT, "[U+1] There is no relaySessionID found - ignore this relayInterface Info", v235, 2u);
                    }
                    id v163 = 0;
LABEL_153:
                  }
                  goto LABEL_155;
                }
                *(_DWORD *)uint64_t v235 = 138412290;
                uint64_t v236 = 0;
                v111 = "[U+1] _processCommandRelayInterfaceInfo bad relayGroupID %@ in key material message";
              }
              _os_log_impl(&dword_19D9BE000, v110, OS_LOG_TYPE_DEFAULT, v111, v235, 0xCu);
              goto LABEL_121;
            }
            uint64_t v89 = objc_msgSend_GFTGL(IDSFoundationLog, v39, v40, v41);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__b = 0;
              _os_log_impl(&dword_19D9BE000, v89, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo failed due to invalid data.", __b, 2u);
            }
          }
LABEL_155:
          double v65 = v203;
          goto LABEL_156;
        }
        unsigned int v69 = v227;
        if (self->_keyMaterialData && self->_keyMaterialDataCounter <= v227)
        {
          uint64_t v70 = objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int keyMaterialDataCounter = self->_keyMaterialDataCounter;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v227;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = keyMaterialDataCounter;
            _os_log_impl(&dword_19D9BE000, v70, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: received relay link interface ack(counter:%u >= %u) - key material data delivery success", buf, 0xEu);
          }

          objc_msgSend__discardKeyMaterialMessage_(self, v72, 0, v73);
          unsigned int v69 = v227;
        }
        unsigned int localRelayInterfaceCounter = self->super._localRelayInterfaceCounter;
        if (localRelayInterfaceCounter > v69)
        {
          double v65 = objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_156;
          }
          unsigned int v75 = self->super._localRelayInterfaceCounter;
          unsigned int v76 = self->_keyMaterialDataCounter;
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&uint8_t buf[4] = v227;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v75;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&uint8_t buf[16] = v76;
          int v66 = "[U+1] _processCommandRelayInterfaceInfo: received old relay link interface ack(counter:%u), _localRelayI"
                "nterfaceCounter: %u, _keyMaterialDataCounter: %u, ignore.";
          double v67 = v65;
          uint32_t v68 = 20;
          goto LABEL_49;
        }
        if (localRelayInterfaceCounter != v69
          || (objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v23, v24, v25),
              uint64_t v77 = objc_claimAutoreleasedReturnValue(),
              BOOL v80 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v77, v78, (uint64_t)self->super._cbuuid, v79) == 3,
              v77,
              !v80))
        {
          double v83 = objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25, v196, *(void *)&v197);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v227;
            _os_log_impl(&dword_19D9BE000, v83, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: receive RelayInterfaceInfoAck (counter:%u).", buf, 8u);
          }

          double v65 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v84, v85, v86);
          objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v65, v87, (uint64_t)self->super._cbuuid, v88, 3);
          goto LABEL_156;
        }
        double v65 = objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v66 = "[U+1] _processCommandRelayInterfaceInfo: current status is success, ignore.";
          goto LABEL_48;
        }
      }
      else
      {
        double v65 = objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          int v66 = "[U+1] _processCommandRelayInterfaceInfo failed due to invalid counter.";
LABEL_48:
          double v67 = v65;
          uint32_t v68 = 2;
LABEL_49:
          _os_log_impl(&dword_19D9BE000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v68);
        }
      }
LABEL_156:

      goto LABEL_157;
    }
    double v62 = objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "[U+1] no remote device version received yet. Saving incoming RelayInterfaceInfo[Ack] for later", buf, 2u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19DAB233C;
    aBlock[3] = &unk_1E5974260;
    objc_copyWeak(&v233, (id *)buf);
    id v231 = v6;
    id v232 = key;
    double v63 = _Block_copy(aBlock);
    pendingCommandRelayInterfaceInfoBlocuint64_t k = self->super._pendingCommandRelayInterfaceInfoBlock;
    self->super._pendingCommandRelayInterfaceInfoBlocuint64_t k = v63;

    objc_destroyWeak(&v233);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    double v60 = objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "[U+1] not processing CommandRelayInterfaceInfo because we are not in U+1 mode.", buf, 2u);
    }
  }
LABEL_159:
}

- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5
{
  uint64_t v292 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v265 = a4;
  id v259 = a5;
  unsigned int v281 = 0;
  uint64_t v264 = v7;
  if (StunUtilHasValidUInt32Attr((uint64_t)v7, 65512, &v281)) {
    objc_msgSend_setChannelSettings_(v265, v8, v281, v10);
  }
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v8, v9, v10);
  __int16 v262 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v285 = v262;
    _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "current candidate pairs: %@", buf, 0xCu);
  }

  v263 = GLUtilGetDifferentRelayCandidatePairSucceeded(v265, v262);
  double v18 = objc_msgSend_local(v263, v15, v16, v17);
  uint64_t v22 = objc_msgSend_transport(v18, v19, v20, v21);

  uint64_t v26 = objc_msgSend_local(v265, v23, v24, v25);
  uint64_t v30 = objc_msgSend_transport(v26, v27, v28, v29);

  uint64_t v34 = objc_msgSend_local(v265, v31, v32, v33);
  uint64_t v38 = objc_msgSend_index(v34, v35, v36, v37);
  objc_msgSend__interfaceNameForInterfaceIndexIncludingVPN_(self, v39, v38, v40);
  long long v258 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v263) {
    goto LABEL_21;
  }
  if (!self->super._cellInterfaceName) {
    goto LABEL_15;
  }
  double v44 = objc_msgSend_local(v265, v41, v42, v43);
  if ((objc_msgSend_isCellularStunCandidate(v44, v45, v46, v47) & 1) == 0)
  {

LABEL_15:
    if (v22 <= v30 && (objc_msgSend_isRealloc(v265, v41, v42, v43) & 1) == 0)
    {
      double v244 = objc_msgSend_GFTGL(IDSFoundationLog, v41, v42, v43);
      if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v285 = (__CFString *)v22;
        __int16 v286 = 2048;
        uint64_t v287 = v30;
        __int16 v288 = 2112;
        id v289 = v265;
        _os_log_impl(&dword_19D9BE000, v244, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard current pair: %@", buf, 0x20u);
      }

      objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v245, (uint64_t)v259, v246, 0, 8);
      goto LABEL_105;
    }
    uint64_t v70 = objc_msgSend_GFTGL(IDSFoundationLog, v41, v42, v43);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v285 = (__CFString *)v22;
      __int16 v286 = 2048;
      uint64_t v287 = v30;
      __int16 v288 = 2112;
      id v289 = v263;
      _os_log_impl(&dword_19D9BE000, v70, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard existing pair: %@.", buf, 0x20u);
    }

    double v54 = objc_msgSend_candidatePairToken(v263, v71, v72, v73);
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v74, (uint64_t)v54, v75, 0, 8);
    goto LABEL_20;
  }
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v258, v48, (uint64_t)self->super._cellInterfaceName, v49);

  if (!isEqualToIgnoringCase) {
    goto LABEL_15;
  }
  double v51 = objc_msgSend_sharedInstanceForBagType_(IDSServerBag, v41, 0, v43);
  double v54 = objc_msgSend_objectForKey_(v51, v52, @"ids-delay-for-cellular-default-and-slicing", v53);

  if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v58 = objc_msgSend_unsignedIntegerValue(v54, v55, v56, v57);
    double v62 = objc_msgSend_GFTGL(IDSFoundationLog, v59, v60, v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      cellInterfaceName = self->super._cellInterfaceName;
      *(_DWORD *)buf = 138413058;
      v285 = v258;
      __int16 v286 = 2112;
      uint64_t v287 = (uint64_t)cellInterfaceName;
      __int16 v288 = 2112;
      id v289 = v263;
      __int16 v290 = 1024;
      int v291 = v58;
      _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface - currentInterfaceName %@ _cellInterfaceName %@ will discard existing pair: %@ in %u seconds.", buf, 0x26u);
    }

    int v66 = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F59E30], v64, (uint64_t)self, v65);
    dispatch_time_t v67 = dispatch_time(0, 1000000000 * v58);
    uint32_t v68 = im_primary_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DAB3404;
    block[3] = &unk_1E5974088;
    id v279 = v66;
    id v280 = v263;
    id v69 = v66;
    dispatch_after(v67, v68, block);
  }
  else
  {
    v247 = objc_msgSend_GFTGL(IDSFoundationLog, v55, v56, v57);
    if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v248 = self->super._cellInterfaceName;
      *(_DWORD *)buf = 138412802;
      v285 = v258;
      __int16 v286 = 2112;
      uint64_t v287 = (uint64_t)v248;
      __int16 v288 = 2112;
      id v289 = v263;
      _os_log_impl(&dword_19D9BE000, v247, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface - currentInterfaceName %@ _cellInterfaceName %@ discard existing pair: %@.", buf, 0x20u);
    }

    objc_msgSend_candidatePairToken(v263, v249, v250, v251);
    id v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v252, (uint64_t)v69, v253, 0, 13);
  }

LABEL_20:
LABEL_21:
  uint64_t v78 = objc_msgSend_hbhEncKey(v265, v41, v42, v43);
  if (!v78
    || (objc_msgSend_hbhDecKey(v265, v76, v77, v79),
        BOOL v80 = objc_claimAutoreleasedReturnValue(),
        BOOL v81 = v80 == 0,
        v80,
        v78,
        v81))
  {
    uint64_t v82 = objc_msgSend_relaySessionKey(v265, v76, v77, v79);
    double v86 = objc_msgSend_sessionID(v265, v83, v84, v85);
    unint64_t v90 = objc_msgSend_participantID(v265, v87, v88, v89);
    uint64_t v94 = objc_msgSend_transactionID(v264, v91, v92, v93);
    uint64_t v95 = IDSLinkHBHDeriveHKDFSha256Keys(v82, v86, v90, v94);

    if (v95)
    {
      uint64_t v99 = objc_msgSend_subdataWithRange_(v95, v96, 0, v98, 32);
      double v102 = objc_msgSend_subdataWithRange_(v95, v100, 32, v101, 32);
      objc_msgSend_setHbhEncKey_(v265, v103, (uint64_t)v99, v104);
      objc_msgSend_setHbhDecKey_(v265, v105, (uint64_t)v102, v106);
    }
    else
    {
      uint64_t v99 = objc_msgSend_GFTGL(IDSFoundationLog, v96, v97, v98);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
        sub_19DB7E318();
      }
    }
  }
  objc_msgSend__notifyQRSessionConnected_(self, v76, (uint64_t)v265, v79);
  double v110 = self;
  if (self->super._isUPlusOneSession)
  {
    objc_msgSend__sendRelayInterfaceInfo_(self, v107, (uint64_t)v259, v109);
    long long v276 = 0u;
    long long v277 = 0u;
    long long v275 = 0u;
    long long v274 = 0u;
    v111 = self->_remoteCandidatePairs;
    uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v274, v113, v283, 16);
    if (v115)
    {
      uint64_t v117 = *(void *)v275;
      do
      {
        for (uint64_t i = 0; i != v115; ++i)
        {
          if (*(void *)v275 != v117) {
            objc_enumerationMutation(v111);
          }
          objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(self, v114, (uint64_t)v265, v116, *(void *)(*((void *)&v274 + 1) + 8 * i));
        }
        uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v274, v116, v283, 16);
      }
      while (v115);
    }

    double v110 = self;
  }
  double v119 = objc_msgSend_allValues(v110->super._tokenToCandidatePairs, v107, v108, v109);
  v260 = GLUtilGetRelayCandidatePairNotSucceededForOppositeIPVersion(v265, v119);

  if (v260)
  {
    double v123 = GLUCreateIPVersionFailureEvent(v260);
    double v127 = objc_msgSend_local(v260, v124, v125, v126);
    if (*(unsigned char *)(objc_msgSend_address(v127, v128, v129, v130) + 1) == 2) {
      uint64_t v131 = @"IPv4";
    }
    else {
      uint64_t v131 = @"IPv6";
    }
    double v132 = v131;

    v133 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v285 = v132;
      _os_log_impl(&dword_19D9BE000, v133, OS_LOG_TYPE_DEFAULT, "RTC reports: add %@ setup failure", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v254 = v132;
        _IDSLogTransport(@"GL", @"IDS", @"RTC reports: add %@ setup failure");
        if (_IDSShouldLog())
        {
          v254 = v132;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"RTC reports: add %@ setup failure");
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    char v135 = objc_opt_respondsToSelector();

    if (v135)
    {
      id v136 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didAddQREvent_(v136, v137, (uint64_t)self, v138, v123);
    }
  }
  uint64_t v139 = objc_msgSend_linkID(v265, v120, v121, v122, v254);
  StunUtilProcessStreamInfo(v264, v139, v139);
  CFDictionaryRef v140 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v144 = v140;
  Value = 0;
  if (v140)
  {
    uint64_t v141 = (const char *)@"stream-info-peer-published-streams";
    if (@"stream-info-peer-published-streams") {
      Value = (void *)CFDictionaryGetValue(v140, @"stream-info-peer-published-streams");
    }
  }
  uint64_t v146 = objc_msgSend_participantID(v265, v141, v142, v143);
  uint64_t v147 = StunUtilProcessParticipants(Value, v146, self->super._isLightweightParticipant);
  double v148 = StunUtilProcessLightweightParticipants(v264);
  if ((unint64_t)objc_msgSend_count(v147, v149, v150, v151) >= 2)
  {
    self->super._isSecondOrLaterParticipant = 1;
    if (!self->super._receivedAllocbindResponse)
    {
      float v152 = ids_monotonic_time();
      double v153 = GLUCreateQRClientTimeEvent(311, 0, v265, 0, v152);
      double v154 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v154, OS_LOG_TYPE_DEFAULT, "RTC reports: add first allocbind response", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"RTC reports: add first allocbind response");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"RTC reports: add first allocbind response");
          }
        }
      }
      id v155 = objc_loadWeakRetained((id *)&self->super._delegate);
      char v156 = objc_opt_respondsToSelector();

      if (v156)
      {
        id v157 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v157, v158, (uint64_t)self, v159, v153);
      }
      self->super._receivedAllocbindResponse = 1;
    }
  }
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFDictionaryRef v160 = v144;
  if (v144)
  {
    CFDictionaryRef v161 = v160;
    CFDictionarySetValue(theDict, @"gl-option-sessioninfo-response-streaminfo-key", v160);
    CFDictionaryRef v160 = v161;
  }
  CFDictionaryRef v257 = v160;

  id v162 = v147;
  if (v162)
  {
    id v163 = v162;
    CFDictionarySetValue(theDict, @"gl-option-sessioninfo-response-participants-key", v162);
    id v162 = v163;
  }
  long long v256 = v162;

  id v164 = v148;
  if (v164)
  {
    id v165 = v164;
    CFDictionarySetValue(theDict, @"gl-option-sessioninfo-response-lightweight-participants-key", v164);
    id v164 = v165;
  }
  long long v255 = v164;

  uint64_t v169 = objc_msgSend_groupID(v265, v166, v167, v168);
  uint64_t v173 = objc_msgSend_sessionID(v265, v170, v171, v172);
  objc_msgSend__notifySessionInfoReceived_relayGroupID_relaySessionID_status_(self, v174, (uint64_t)theDict, v175, v169, v173, 0);

  double v179 = objc_msgSend_sessionID(v265, v176, v177, v178);
  objc_msgSend_initParticipantIDMap_(v265, v180, 0, v181);
  double v185 = objc_msgSend_groupID(v265, v182, v183, v184);
  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  uint64_t v186 = v262;
  uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v187, (uint64_t)&v270, v188, v282, 16);
  if (v191)
  {
    uint64_t v193 = *(void *)v271;
    do
    {
      for (uint64_t j = 0; j != v191; ++j)
      {
        if (*(void *)v271 != v193) {
          objc_enumerationMutation(v186);
        }
        v195 = *(void **)(*((void *)&v270 + 1) + 8 * j);
        uint64_t v196 = objc_msgSend_sessionID(v195, v189, v190, v192);
        if (objc_msgSend_isEqualToString_(v196, v197, (uint64_t)v179, v198))
        {
          long long v202 = objc_msgSend_groupID(v195, v199, v200, v201);
          if (objc_msgSend_isEqualToString_(v202, v203, (uint64_t)v185, v204)
            && objc_msgSend_state(v195, v205, v206, v207) == 4)
          {
            isSharedQRSessiouint64_t n = objc_msgSend_isSharedQRSession(v195, v208, v209, v210);

            if (!isSharedQRSession) {
              continue;
            }
            uint64_t v196 = objc_msgSend_allKeys(self->super._pluginParticipantIDs, v189, v190, v192);
            objc_msgSend_updateParticipantIDMap_(v195, v212, (uint64_t)v196, v213);
          }
          else
          {
          }
        }
      }
      uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v189, (uint64_t)&v270, v192, v282, 16);
    }
    while (v191);
  }

  unsigned int v269 = 0;
  if (StunUtilHasValidUInt32Attr((uint64_t)v264, 65513, &v269))
  {
    long long v217 = objc_msgSend_GFTGL(IDSFoundationLog, v214, v215, v216);
    if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v285) = v269;
      _os_log_impl(&dword_19D9BE000, v217, OS_LOG_TYPE_DEFAULT, "receive channel cookie %08x.", buf, 8u);
    }

    long long v218 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v219 = NSNumber;
    uint64_t SessionInfoReqID = objc_msgSend_nextSessionInfoReqID(v265, v220, v221, v222);
    unsigned int v226 = objc_msgSend_numberWithUnsignedInt_(v219, v224, SessionInfoReqID, v225);
    if (v226)
    {
      CFDictionarySetValue(v218, @"gl-option-sessioninfo-request-id", v226);
    }
    else
    {
      unsigned __int16 v227 = MEMORY[0x1E4F14500];
      id v228 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR)) {
        sub_19DB7B4D4();
      }
    }
    id v231 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v229, v269, v230);
    if (v231)
    {
      CFDictionarySetValue(v218, @"gl-option-sessioninfo-cookie", v231);
    }
    else
    {
      id v232 = MEMORY[0x1E4F14500];
      id v233 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR)) {
        sub_19DB7E290();
      }
    }
    objc_msgSend_sendSessionInfoRequest_options_(v265, v234, 0, v235, v218);
  }
  *(_DWORD *)buf = 0;
  int HasValidUInt32Attr = StunUtilHasValidUInt32Attr((uint64_t)v264, 65489, buf);
  if (*(_DWORD *)buf) {
    int v237 = HasValidUInt32Attr;
  }
  else {
    int v237 = 0;
  }
  if (v237 == 1)
  {
    id v238 = objc_loadWeakRetained((id *)&self->super._delegate);
    char v239 = objc_opt_respondsToSelector();

    if (v239)
    {
      id v240 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didReceiveSessionStateCounter_(v240, v241, (uint64_t)self, v242, *(unsigned int *)buf);
    }
  }
  v267[0] = MEMORY[0x1E4F143A8];
  v267[1] = 3221225472;
  v267[2] = sub_19DAB3514;
  v267[3] = &unk_1E5973CF8;
  v267[4] = self;
  id v268 = v265;
  IDSTransportThreadAddBlockAfter(v267, 1.0);

LABEL_105:
  return 1;
}

- (int64_t)_getQRAllocateType
{
  return 3;
}

- (void)_sendRelayInterfaceInfo:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v5, v6, v7);
  unint64_t v11 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v8, v9, (uint64_t)self->super._cbuuid, v10);

  if (v11 >= 3)
  {
    double v15 = objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)double v93 = v11;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo status was %lu. Resetting", buf, 0xCu);
    }

    unsigned int v19 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v16, v17, v18);
    objc_msgSend_removeCache_(v19, v20, (uint64_t)self->super._cbuuid, v21);
  }
  if (!self->_allowE2E || !self->super._receivedRemoteDeviceVersion)
  {
    uint64_t v28 = objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = @"YES";
      if (self->_allowE2E) {
        uint64_t v30 = @"YES";
      }
      else {
        uint64_t v30 = @"NO";
      }
      if (!self->super._receivedRemoteDeviceVersion) {
        double v29 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)double v93 = v30;
      *(_WORD *)&v93[8] = 2112;
      *(void *)&v93[10] = v29;
      _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo can't send relayInterfaceInfo yet. allowE2E = %@, BOOL receivedRemoteDeviceVersion = %@", buf, 0x16u);
    }

    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v31, v32, v33);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v34, v35, (uint64_t)self->super._cbuuid, v36, 1);
    goto LABEL_48;
  }
  tokenToCandidatePairs = self->super._tokenToCandidatePairs;
  if (v4)
  {
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(tokenToCandidatePairs, v12, (uint64_t)v4, v14);
    uint64_t v26 = (void *)v23;
    if (v23)
    {
      uint64_t v91 = v23;
      double v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)&v91, v25, 1);
    }
    else
    {
      double v27 = 0;
    }
  }
  else
  {
    double v27 = objc_msgSend_allValues(tokenToCandidatePairs, v12, v13, v14);
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v34 = v27;
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v86, v38, v90, 16);
  if (v39)
  {
    uint64_t v42 = v39;
    char v43 = 0;
    uint64_t v44 = *(void *)v87;
    uint64_t v45 = 67109376;
    while (1)
    {
      uint64_t v46 = 0;
      uint64_t v85 = v42;
      do
      {
        if (*(void *)v87 != v44) {
          objc_enumerationMutation(v34);
        }
        double v47 = *(void **)(*((void *)&v86 + 1) + 8 * v46);
        uint64_t v48 = objc_msgSend_state(v47, v40, v41, *(double *)&v45);
        if (objc_msgSend_isRelayStunCandidatePair(v47, v49, v50, v51))
        {
          if (v48 != 4) {
            goto LABEL_42;
          }
        }
        else if (v48 != 3)
        {
          goto LABEL_42;
        }
        if ((v43 & 1) == 0) {
          ++self->super._localRelayInterfaceCounter;
        }
        if (self->_keyMaterialData)
        {
          if (self->_keyMaterialDataCounter == -1) {
            self->_unsigned int keyMaterialDataCounter = self->super._localRelayInterfaceCounter;
          }
          double v52 = objc_msgSend_GFTGL(IDSFoundationLog, v40, v41, *(double *)&v45);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            int v56 = objc_msgSend_length(self->_keyMaterialData, v53, v54, v55);
            unsigned int keyMaterialDataCounter = self->_keyMaterialDataCounter;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)double v93 = v56;
            *(_WORD *)&v93[4] = 1024;
            *(_DWORD *)&v93[6] = keyMaterialDataCounter;
            _os_log_impl(&dword_19D9BE000, v52, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo piggybacking key material message %d bytes. unsigned int keyMaterialDataCounter = %u", buf, 0xEu);
          }

          uint64_t v58 = (void *)MEMORY[0x1E4F1C9E8];
          double v61 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v59, self->super._localRelayInterfaceCounter, v60);
          uint64_t v64 = objc_msgSend_dictionaryWithObjectsAndKeys_(v58, v62, (uint64_t)v61, v63, @"gl-attr-counter", self->_keyMaterialData, @"gl-attr-mkm", 0);
        }
        else
        {
          double v65 = (void *)MEMORY[0x1E4F1C9E8];
          double v61 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v40, self->super._localRelayInterfaceCounter, *(double *)&v45);
          uint64_t v64 = objc_msgSend_dictionaryWithObjectsAndKeys_(v65, v66, (uint64_t)v61, v67, @"gl-attr-counter", 0);
        }

        uint64_t v71 = objc_msgSend_candidatePairToken(v47, v68, v69, v70);

        double v75 = objc_msgSend_GFTGL(IDSFoundationLog, v72, v73, v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int localRelayInterfaceCounter = self->super._localRelayInterfaceCounter;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)double v93 = localRelayInterfaceCounter;
          *(_WORD *)&v93[4] = 2112;
          *(void *)&v93[6] = v71;
          _os_log_impl(&dword_19D9BE000, v75, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo: send RelayInterfaceInfo (counter: %u) on %@", buf, 0x12u);
        }

        objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v77, 6, v78, 0, v64, v71);
        char v43 = 1;
        id v4 = (id)v71;
        uint64_t v42 = v85;
LABEL_42:
        ++v46;
      }
      while (v42 != v46);
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v40, (uint64_t)&v86, *(double *)&v45, v90, 16);
      if (!v42)
      {

        if (v43)
        {
          uint64_t v82 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v79, v80, v81);
          objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v82, v83, (uint64_t)self->super._cbuuid, v84, 2);
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
  }
  uint64_t v82 = v34;
LABEL_47:

LABEL_48:
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)IDSGFTGL;
  unsigned int v5 = -[IDSGlobalLink _setupNewQRLinkIfNecessary:](&v15, sel__setupNewQRLinkIfNecessary_);
  BOOL v9 = v5;
  if (!a3 && v5)
  {
    double v10 = objc_msgSend_GFTGL(IDSFoundationLog, v6, v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      idsSessionID = self->super._idsSessionID;
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = idsSessionID;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "set up new QR link for group %@.", buf, 0xCu);
    }

    uint64_t v12 = im_primary_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DAB3C7C;
    block[3] = &unk_1E5973BA8;
    void block[4] = self;
    dispatch_async(v12, block);
  }
  return v9;
}

- (void)setAllowP2P:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMGetDomainBoolForKeyWithDefaultValue())
  {
    double v8 = objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Ignore setAllowP2P due to defaults", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    self->super._allowP2P = a3;
    BOOL v9 = objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._allowP2P) {
        double v10 = @"YES";
      }
      else {
        double v10 = @"NO";
      }
      int v15 = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "[U+1] setAllowP2P: %@", (uint8_t *)&v15, 0xCu);
    }

    nwLinuint64_t k = self->super._nwLink;
    if (nwLink) {
      objc_msgSend_setDisableP2P_(nwLink, v11, !self->super._allowP2P, v13);
    }
    if (self->super._allowP2P) {
      objc_msgSend__startExtIPDiscovery(self, v11, v12, v13);
    }
  }
}

- (void)_enableE2E
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_allowE2E)
  {
    unsigned int v5 = objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v6, v7, v8);
      uint64_t v12 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v9, v10, (uint64_t)self->super._cbuuid, v11);
      int v23 = 134217984;
      uint64_t v24 = v12;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "[U+1] _enableE2E: now can set up E2E links, VR status: %ld", (uint8_t *)&v23, 0xCu);
    }
    self->_allowE2E = 1;
    uint64_t v16 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v13, v14, v15);
    uint64_t v19 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v16, v17, (uint64_t)self->super._cbuuid, v18);

    if (v19 == 1) {
      objc_msgSend__sendRelayInterfaceInfo_(self, v20, 0, v22);
    }
    objc_msgSend__startExtIPDiscovery(self, v20, v21, v22);
  }
}

- (void)_disableE2E
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0x1E596F000uLL;
  uint64_t v6 = objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] _disableE2E: disconnect all E2E links", buf, 2u);
  }

  self->_allowE2E = 0;
  double v10 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v7, v8, v9);
  objc_msgSend_removeCache_(v10, v11, (uint64_t)self->super._cbuuid, v12);

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v13 = self->_virtualCandidatePairs;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v69, v15, v76, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v17, *(void *)(*((void *)&v69 + 1) + 8 * i), v18, 7);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v69, v18, v76, 16);
    }
    while (v19);
  }

  virtualCandidatePairs = self->_virtualCandidatePairs;
  self->_virtualCandidatePairs = 0;

  remoteCandidatePairs = self->_remoteCandidatePairs;
  self->_remoteCandidatePairs = 0;

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  self->super._BOOL receivedRemoteDeviceVersion = 0;
  self->super._unsigned int remoteRelayInterfaceCounter = 0;
  uint64_t v28 = objc_msgSend_allValues(self->super._tokenToCandidatePairs, v25, v26, v27);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v65, 0.0, v75, 16);
  if (v30)
  {
    uint64_t v34 = v30;
    double v35 = 0;
    uint64_t v36 = *(void *)v66;
    uint64_t v33 = 138412290;
    uint64_t v64 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v66 != v36) {
          objc_enumerationMutation(v28);
        }
        double v38 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        if ((objc_msgSend_isRelayStunCandidatePair(v38, v31, v32, *(double *)&v33) & 1) == 0
          && objc_msgSend_state(v38, v31, v32, *(double *)&v33) == 3)
        {
          uint64_t v41 = objc_msgSend_candidatePairToken(v38, v31, v32, *(double *)&v33);
          if (!v35) {
            double v35 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          if (v35 && v41) {
            CFArrayAppendValue(v35, v41);
          }
          char v43 = objc_msgSend_GFTGL(*(void **)(v5 + 2896), v39, v40, v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(v38, v44, v45, v46);
            double v47 = self;
            uint64_t v48 = v35;
            double v49 = v28;
            double v51 = v50 = v5;
            *(_DWORD *)buf = 138412290;
            double v74 = v51;
            _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "[U+1] removing P2P candidate pair %@", buf, 0xCu);

            unint64_t v5 = v50;
            uint64_t v28 = v49;
            double v35 = v48;
            self = v47;
            uint64_t v36 = v64;
          }

          objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v52, (uint64_t)v38, v53, 7);
        }
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v65, *(double *)&v33, v75, 16);
    }
    while (v34);
  }
  else
  {
    double v35 = 0;
  }
  objc_msgSend_removeObjectsForKeys_(self->super._tokenToCandidatePairs, v31, (uint64_t)v35, *(double *)&v33);
  tokenToStunCheckPairs = self->super._tokenToStunCheckPairs;
  self->super._tokenToStunCheckPairs = 0;

  remoteCandidateList = self->super._remoteCandidateList;
  self->super._remoteCandidateList = 0;

  double v59 = objc_msgSend_GFTGL(*(void **)(v5 + 2896), v56, v57, v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    double v63 = objc_msgSend_allValues(self->super._tokenToCandidatePairs, v60, v61, v62);
    *(_DWORD *)buf = 138412290;
    double v74 = v63;
    _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, "[U+1] remaining candidate pairs: %@", buf, 0xCu);
  }
}

- (void)_sendConnectionDataWithRemovedAddressList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_allowE2E && self->super._receivedRemoteDeviceVersion)
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSGFTGL;
    [(IDSGlobalLink *)&v11 _sendConnectionDataWithRemovedAddressList:v6];
  }
  else
  {
    uint64_t v8 = objc_msgSend_GFTGL(IDSFoundationLog, v4, v5, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = @"YES";
      if (self->_allowE2E) {
        double v10 = @"YES";
      }
      else {
        double v10 = @"NO";
      }
      if (!self->super._receivedRemoteDeviceVersion) {
        double v9 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      double v13 = v10;
      __int16 v14 = 2112;
      double v15 = v9;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "[U+1] cannot send connection data yet. allowE2E = %@, BOOL receivedRemoteDeviceVersion = %@", buf, 0x16u);
    }
  }
}

- (void)receiveJoinNotificationFromAParticipant
{
  if (self->super._isUPlusOneSession)
  {
    uint64_t v5 = objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "[U+1] remote joined the U + 1 session", v9, 2u);
    }

    objc_msgSend__enableE2E(self, v6, v7, v8);
  }
}

- (void)setIsUPlusOneSession:(BOOL)a3
{
  if (self->super._isUPlusOneSession != a3)
  {
    BOOL v4 = a3;
    self->super._isUPlusOneSessiouint64_t n = a3;
    id v6 = objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] enabled", buf, 2u);
      }

      int v8 = IMGetDomainBoolForKeyWithDefaultValue();
      self->super._allowP2P = v8 ^ 1;
      if (((v8 ^ 1) & 1) == 0)
      {
        double v12 = objc_msgSend_GFTGL(IDSFoundationLog, v9, v10, v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "disableP2PLinks default is set to YES.", v20, 2u);
        }
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] disabled", v19, 2u);
      }

      self->super._shouldReportAcceptDelay = 0;
      self->super._allowP2P = 0;
    }
    double v13 = GLUCreateSetUPlusOneEvent(v4, self->super._timeBase);
    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v16, v17, (uint64_t)self, v18, v13);
      }
    }
  }
}

- (void)enableUPlusOneSessionForTransition:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"NO";
    if (v4) {
      int v8 = @"YES";
    }
    else {
      int v8 = @"NO";
    }
    if (self->super._isUPlusOneSession) {
      BOOL v7 = @"YES";
    }
    int v21 = 138412546;
    double v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] enableUPlusOneSessionForTransition: enableUPlusOneSession: %@, _isUPlusOneSession: %@", (uint8_t *)&v21, 0x16u);
  }

  if (self->super._isUPlusOneSession != v4)
  {
    objc_msgSend_setIsUPlusOneSession_(self, v9, v4, v10);
    if (v4)
    {
      __int16 v14 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v11, v12, v13);
      objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v14, v15, (uint64_t)self->super._cbuuid, v16, 1);

      objc_msgSend__enableE2E(self, v17, v18, v19);
    }
    else
    {
      objc_msgSend__disableE2E(self, v11, v12, v13);
      pendingCommandRelayInterfaceInfoBlocuint64_t k = self->super._pendingCommandRelayInterfaceInfoBlock;
      self->super._pendingCommandRelayInterfaceInfoBlocuint64_t k = 0;
    }
  }
}

- (void)_discardCandidatePairsWithOption:(BOOL)a3 isReinitiating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v7 = self->_virtualCandidatePairs;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v18, v9, v22, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v11, *(void *)(*((void *)&v18 + 1) + 8 * v15++), v12, 11);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v18, v12, v22, 16);
    }
    while (v13);
  }

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  v17.receiver = self;
  v17.super_class = (Class)IDSGFTGL;
  [(IDSGlobalLink *)&v17 _discardCandidatePairsWithOption:v5 isReinitiating:v4];
}

- (BOOL)_processRemovedLocalAddressList:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)IDSGFTGL;
  BOOL v71 = [(IDSGlobalLink *)&v84 _processRemovedLocalAddressList:v4];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v4;
  uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v80, v6, v88, 16);
  double v9 = 0;
  if (v74)
  {
    uint64_t v73 = *(void *)v81;
    uint64_t v10 = 138412290;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v81 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v11;
        double v12 = objc_msgSend_address(*(void **)(*((void *)&v80 + 1) + 8 * v11), v7, v8, *(double *)&v10);
        uint64_t v16 = objc_msgSend_sa(v12, v13, v14, v15);

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        objc_super v17 = self->_virtualCandidatePairs;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v76, v19, v87, 16);
        if (v20)
        {
          uint64_t v24 = v20;
          uint64_t v25 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v77 != v25) {
                objc_enumerationMutation(v17);
              }
              double v27 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              uint64_t v28 = objc_msgSend_local(v27, v21, v22, v23);
              uint64_t v32 = objc_msgSend_address(v28, v29, v30, v31);
              BOOL v33 = IsSameIP(v16, v32);

              if (v33)
              {
                if (!v9) {
                  double v9 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                if (v27) {
                  BOOL v34 = v9 == 0;
                }
                else {
                  BOOL v34 = 1;
                }
                if (!v34) {
                  CFArrayAppendValue(v9, v27);
                }
                double v35 = objc_msgSend_GFTGL(IDSFoundationLog, v21, v22, v23);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v39 = objc_msgSend_candidatePairToken(v27, v36, v37, v38);
                  *(_DWORD *)buf = 138412290;
                  long long v86 = v39;
                  _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: remove virtual candidate pair %@.", buf, 0xCu);
                }
                objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v40, (uint64_t)v27, v41, 1);
                unsigned int v45 = objc_msgSend_relayLinkID(v27, v42, v43, v44);
                double v49 = (const char *)objc_msgSend_remoteRelayLinkID(v27, v46, v47, v48);
                double v51 = localRemoteRelayLinkIDForVirtualStunCandidatePair(v45, v49, v50);
                if (v51)
                {
                  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
                  if (localRemoteRelayLinkIDToVirtualCandidatePairs) {
                    CFDictionaryRemoveValue((CFMutableDictionaryRef)localRemoteRelayLinkIDToVirtualCandidatePairs, v51);
                  }
                }
              }
            }
            uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v76, v23, v87, 16);
          }
          while (v24);
        }

        uint64_t v11 = v75 + 1;
      }
      while (v75 + 1 != v74);
      uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v80, *(double *)&v10, v88, 16);
    }
    while (v74);
  }

  if (objc_msgSend_count(v9, v53, v54, v55))
  {
    objc_msgSend_removeObjectsInArray_(self->_virtualCandidatePairs, v56, (uint64_t)v9, v57);
    uint64_t v61 = objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      virtualCandidatePairs = self->_virtualCandidatePairs;
      *(_DWORD *)buf = 138412290;
      long long v86 = virtualCandidatePairs;
      _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: virtual candidate pairs: %@", buf, 0xCu);
    }

    long long v66 = objc_msgSend_GFTGL(IDSFoundationLog, v63, v64, v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      long long v67 = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
      *(_DWORD *)buf = 138412290;
      long long v86 = v67;
      _os_log_impl(&dword_19D9BE000, v66, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: localRemoteRelayLinkID map: %@", buf, 0xCu);
    }

    objc_msgSend__sendRelayInterfaceInfo_(self, v68, 0, v69);
  }

  return v71;
}

- (void)manageDesignatedDestinations:(id)a3 relayGroupID:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
  unsigned int v103 = a5;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v101 = self;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v108, v15, v115, 16);
  if (!v16) {
    goto LABEL_12;
  }
  uint64_t v20 = v16;
  uint64_t v21 = *(void *)v109;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v109 != v21) {
        objc_enumerationMutation(v13);
      }
      double v23 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      uint64_t v24 = objc_msgSend_groupID(v23, v17, v18, v19);
      if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v9, v26))
      {
        uint64_t v30 = objc_msgSend_state(v23, v27, v28, v29);

        if (v30 == 4)
        {
          double v35 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          double v38 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v36, v103, v37);
          uint64_t v39 = v38;
          if (v38)
          {
            CFDictionarySetValue(v35, @"gl-option-participant-update-request-type", v38);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            sub_19DB7E4E4();
          }

          if ((unsigned __int16)(v103 - 1) <= 3u)
          {
            CFMutableDictionaryRef theDict = v35;
            double v98 = v13;
            id v99 = v9;
            uint64_t v43 = objc_msgSend_URIToParticipantIDs(v23, v40, v41, v42);
            id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            id v100 = v8;
            id v46 = v8;
            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v104, v48, v114, 16);
            if (v49)
            {
              uint64_t v52 = v49;
              uint64_t v53 = *(void *)v105;
              do
              {
                for (uint64_t j = 0; j != v52; ++j)
                {
                  if (*(void *)v105 != v53) {
                    objc_enumerationMutation(v46);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v104 + 1) + 8 * j);
                  int v56 = objc_msgSend_objectForKey_(v43, v50, v55, v51);

                  if (v56)
                  {
                    uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v43, v57, v55, v58);
                    objc_msgSend_addObjectsFromArray_(v44, v60, (uint64_t)v59, v61);
                  }
                  else
                  {
                    objc_msgSend_addObject_(v45, v57, v55, v58);
                  }
                }
                uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v50, (uint64_t)&v104, v51, v114, 16);
              }
              while (v52);
            }

            uint64_t v65 = objc_msgSend_count(v44, v62, v63, v64);
            double v69 = objc_msgSend_GFTGL(IDSFoundationLog, v66, v67, v68);
            BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
            if (!v65)
            {
              if (v70)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D9BE000, v69, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find blocked participantIDs", buf, 2u);
              }

              long long v72 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              uint64_t v75 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v73, v103, v74);
              if (v75) {
                CFDictionarySetValue(v72, @"ids-stun-attribute-session-state-type", v75);
              }

              long long v78 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v76, 6, v77);
              if (v78)
              {
                CFDictionarySetValue(v72, @"ids-stun-message-type", v78);
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                sub_19DB7E34C();
              }

              id WeakRetained = objc_loadWeakRetained((id *)&v101->super._delegate);
              char v93 = objc_opt_respondsToSelector();

              if (v93)
              {
                id v94 = objc_loadWeakRetained((id *)&v101->super._delegate);
                objc_msgSend_link_didReceiveParticipantUpdate_status_(v94, v95, (uint64_t)v101, v96, v72, 6);
              }
              uint64_t v13 = v98;
              id v9 = v99;
              BOOL v34 = v98;
              id v8 = v100;
              goto LABEL_55;
            }
            if (v70)
            {
              *(_DWORD *)buf = 138412290;
              id v113 = v44;
              _os_log_impl(&dword_19D9BE000, v69, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: blockedParticipantIDs: %@", buf, 0xCu);
            }

            id v71 = v44;
            if (v71)
            {
              double v35 = theDict;
              CFDictionarySetValue(theDict, @"gl-option-participant-update-blocked-participantIDs", v71);
            }
            else
            {
              double v35 = theDict;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                sub_19DB7E45C();
              }
            }

            if (objc_msgSend_count(v45, v79, v80, v81))
            {
              uint64_t v85 = objc_msgSend_GFTGL(IDSFoundationLog, v82, v83, v84);
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v113 = v45;
                _os_log_impl(&dword_19D9BE000, v85, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find participantIDs for failureBlockedDestinations: %@", buf, 0xCu);
              }
            }
            id v9 = v99;
            id v8 = v100;
            uint64_t v13 = v98;
          }
          long long v86 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v40, a6, v42);
          if (v86)
          {
            CFDictionarySetValue(v35, @"gl-option-participant-update-request-counter", v86);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            sub_19DB7E3D4();
          }

          if (objc_msgSend_isQUIC(v23, v87, v88, v89)) {
            objc_msgSend_sendQUICParticipantUpdateRequestWithOptions_(v23, v90, (uint64_t)v35, v91);
          }
          else {
            objc_msgSend_sendParticipantUpdateRequest_options_(v23, v90, 0, v91, v35);
          }

          BOOL v34 = v13;
          goto LABEL_55;
        }
      }
      else
      {
      }
    }
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v108, v19, v115, 16);
    if (v20) {
      continue;
    }
    break;
  }
LABEL_12:

  BOOL v34 = objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find a connected candidatePair for sendParticipantUpdateRequest", buf, 2u);
  }
LABEL_55:
}

- (void)removeParticipantIDs:(id)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v50, v15, v54, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v13);
        }
        double v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_groupID(v23, v17, v18, v19);
        if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v9, v26))
        {
          uint64_t v30 = objc_msgSend_state(v23, v27, v28, v29);

          if (v30 == 4)
          {
            double v35 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            CFDictionarySetValue(v35, @"gl-option-participant-update-request-type", &unk_1EF028BD0);
            objc_msgSend_allObjects(v8, v36, v37, v38);
            id v39 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v40 = v39;
            if (v39)
            {
              CFDictionarySetValue(v35, @"gl-option-participant-update-blocked-participantIDs", v39);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              sub_19DB7E45C();
            }

            uint64_t v43 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v41, v5, v42);
            if (v43)
            {
              CFDictionarySetValue(v35, @"gl-option-participant-update-request-counter", v43);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              sub_19DB7E3D4();
            }

            if (objc_msgSend_isQUIC(v23, v44, v45, v46)) {
              objc_msgSend_sendQUICParticipantUpdateRequestWithOptions_(v23, v47, (uint64_t)v35, v48);
            }
            else {
              objc_msgSend_sendParticipantUpdateRequest_options_(v23, v47, 0, v48, v35);
            }

            BOOL v34 = v13;
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v50, v19, v54, 16);
      if (v20) {
        continue;
      }
      break;
    }
  }

  BOOL v34 = objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "removeParticipantIDs: couldn't find a connected candidatePair for sendParticipantUpdateRequest", v49, 2u);
  }
LABEL_26:
}

- (void)_destroyVirtualRelayLinksForCandidatePair:(id)a3 withReason:(unsigned __int8)a4
{
  unsigned int v66 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v67 = self;
    id v9 = self->_virtualCandidatePairs;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v69, v11, v75, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      CFMutableArrayRef theArray = 0;
      uint64_t v16 = *(void *)v70;
      uint64_t v17 = 138412290;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v70 != v16) {
            objc_enumerationMutation(v9);
          }
          double v19 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_sessionID(v19, v13, v14, *(double *)&v17);
          uint64_t v24 = objc_msgSend_sessionID(v7, v21, v22, v23);
          if (objc_msgSend_isEqualToString_(v20, v25, (uint64_t)v24, v26))
          {
            int v30 = objc_msgSend_relayLinkID(v19, v27, v28, v29);
            int v34 = objc_msgSend_relayLinkID(v7, v31, v32, v33);

            if (v30 != v34) {
              continue;
            }
            double v35 = theArray;
            if (!theArray) {
              double v35 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            CFMutableArrayRef theArray = v35;
            if (v19 && v35) {
              CFArrayAppendValue(v35, v19);
            }
            uint64_t v36 = objc_msgSend_GFTGL(IDSFoundationLog, v13, v14, *(double *)&v17);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_candidatePairToken(v19, v37, v38, v39);
              uint64_t v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              double v74 = v40;
              _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: remove virtual candidate pair %@.", buf, 0xCu);
            }
            objc_msgSend__notifyCandidatePairDisconnected_withReason_(v67, v41, (uint64_t)v19, v42, v66);
            unsigned int v46 = objc_msgSend_relayLinkID(v19, v43, v44, v45);
            long long v50 = (const char *)objc_msgSend_remoteRelayLinkID(v19, v47, v48, v49);
            uint64_t v20 = localRemoteRelayLinkIDForVirtualStunCandidatePair(v46, v50, v51);
            if (v20)
            {
              localRemoteRelayLinkIDToVirtualCandidatePairs = (__CFDictionary *)v67->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
              if (localRemoteRelayLinkIDToVirtualCandidatePairs) {
                CFDictionaryRemoveValue(localRemoteRelayLinkIDToVirtualCandidatePairs, v20);
              }
            }
          }
          else
          {
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v13, (uint64_t)&v69, *(double *)&v17, v75, 16);
        if (!v15) {
          goto LABEL_27;
        }
      }
    }
    CFMutableArrayRef theArray = 0;
LABEL_27:

    if (objc_msgSend_count(theArray, v54, v55, v56))
    {
      objc_msgSend_removeObjectsInArray_(v67->_virtualCandidatePairs, v57, (uint64_t)theArray, v58);
      double v62 = objc_msgSend_GFTGL(IDSFoundationLog, v59, v60, v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        virtualCandidatePairs = v67->_virtualCandidatePairs;
        *(_DWORD *)buf = 138412290;
        double v74 = virtualCandidatePairs;
        _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: virtual candidate pairs: %@", buf, 0xCu);
      }

      objc_msgSend__sendRelayInterfaceInfo_(v67, v64, 0, v65);
    }
  }
  else
  {
    long long v53 = objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v8);
    CFMutableArrayRef theArray = (CFMutableArrayRef)v53;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: invalid candidatePair, return", buf, 2u);
    }
  }
}

- (void)updateURIToParticipantIDs:(id)a3 relaySessionID:(id)a4 sessionInfo:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v13 = v49 = 0u;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v46, 0.0, v54, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v47;
    *(void *)&long long v18 = 138412546;
    long long v44 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_msgSend_sessionID(v22, v16, v17, *(double *)&v18, v44);
        double v23 = (IDSQuickRelaySessionInfo *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v8, v25))
        {
          double v29 = objc_msgSend_groupID(v22, v26, v27, v28);
          int isEqualToString = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v45, v31);

          if (!isEqualToString) {
            continue;
          }
          double v33 = objc_msgSend_GFTGL(IDSFoundationLog, v16, v17, *(double *)&v18);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            id v51 = v45;
            __int16 v52 = 2112;
            id v53 = v8;
            _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "updateURIToParticipantIDs for group %@, session %@.", buf, 0x16u);
          }

          objc_msgSend_updateURIToParticipantIDMapping_(v22, v34, (uint64_t)v9, v35);
          double v23 = objc_alloc_init(IDSQuickRelaySessionInfo);
          if (!objc_msgSend_parseSessionInfo_(v23, v36, (uint64_t)v9, v37))
          {
            uint64_t v41 = objc_msgSend_enableSKE(v22, v38, v39, v40);
            objc_msgSend_setPropertiesWithRelaySessionInfo_sessionInfoDict_enableSKE_(v22, v42, (uint64_t)v23, v43, v9, v41);
          }
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v46, *(double *)&v18, v54, 16);
    }
    while (v19);
  }
}

- (void)setTimeBase:(id)a3
{
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4
{
  self->super._BOOL isReliableUnicastSession = a3;
  self->super._isReliableUnicastClient = a4;
}

- (void)setPluginCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "setPluginCache: pluginNameToPluginOptionsDict %@", (uint8_t *)&v14, 0xCu);
  }

  double v12 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v4, v9, v10, v11);
  pluginNameToPluginOptionsDict = self->super._pluginNameToPluginOptionsDict;
  self->super._pluginNameToPluginOptionsDict = v12;
}

- (void)setParticipantType:(unsigned __int16)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL isLightweightParticipant = self->super._isLightweightParticipant;
  self->super._BOOL isLightweightParticipant = a3 == 0;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_GFTGL(IDSFoundationLog, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = @"YES";
    if (isLightweightParticipant) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    if (!self->super._isLightweightParticipant) {
      int v14 = @"NO";
    }
    int v18 = 138412546;
    uint64_t v19 = v15;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "setParticipantType: lightweight %@ -> lightweight %@", (uint8_t *)&v18, 0x16u);
  }

  if (v6) {
    objc_msgSend_manageDesignatedDestinations_relayGroupID_withType_sessionStateCounter_(self, v16, 0, v17, v9, 8, v5);
  }
  else {
    objc_msgSend_manageDesignatedDestinations_relayGroupID_withType_sessionStateCounter_(self, v16, 0, v17, v9, 7, v5);
  }
}

- (void)sendKeyMaterialMessageData:(id)a3 relayGroupID:(id)a4 destinationURIs:(id)a5 completionHandler:(id)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t))a6;
  double v17 = objc_msgSend_GFTGL(IDSFoundationLog, v14, v15, v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    isUPlusOneSessiouint64_t n = self->super._isUPlusOneSession;
    *(_DWORD *)buf = 138413058;
    if (isUPlusOneSession) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    *(void *)double v128 = v19;
    *(_WORD *)&v128[8] = 2112;
    *(void *)&v128[10] = v11;
    __int16 v129 = 2112;
    id v130 = v12;
    __int16 v131 = 2112;
    id v132 = v10;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData isUPlusOneSession %@ relayGroupID %@ destinationURIs %@ keyMaterialMessageData %@", buf, 0x2Au);
  }

  if (!self->super._isUPlusOneSession)
  {
    char v93 = objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v94 = "[U+1] sendKeyMaterialMessageData This is not U+1, returning.";
      uint64_t v95 = v93;
      uint32_t v96 = 2;
LABEL_42:
      _os_log_impl(&dword_19D9BE000, v95, OS_LOG_TYPE_DEFAULT, v94, buf, v96);
    }
LABEL_43:

    v13[2](v13, 2);
    goto LABEL_48;
  }
  if (!v10 || !v11)
  {
    char v93 = objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)double v128 = v10;
      *(_WORD *)&v128[8] = 2112;
      *(void *)&v128[10] = v11;
      id v94 = "[U+1] sendKeyMaterialMessageData Invalid params {keyMaterialMessageData: %@, relayGroupID: %@}";
      uint64_t v95 = v93;
      uint32_t v96 = 22;
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v125[0] = @"p";
  v125[1] = @"r";
  v126[0] = v10;
  v126[1] = v11;
  uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v126, v22, v125, 2);
  uint64_t v24 = JWEncodeDictionary();
  objc_storeStrong((id *)&self->_keyMaterialData, v24);
  double v25 = _Block_copy(v13);
  id keyMaterialSentHandler = self->_keyMaterialSentHandler;
  self->_id keyMaterialSentHandler = v25;

  int v30 = objc_msgSend_GFTGL(IDSFoundationLog, v27, v28, v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = objc_msgSend_length(v24, v31, v32, v33);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)double v128 = v34;
    *(_WORD *)&v128[4] = 2112;
    *(void *)&v128[6] = v23;
    _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData keyMaterialData size = %d from %@", buf, 0x12u);
  }
  double v112 = v24;
  id v113 = (void *)v23;

  uint64_t v38 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v35, v36, v37);
  uint64_t v41 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v38, v39, (uint64_t)self->super._cbuuid, v40);

  if (!v41)
  {
    id v45 = objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v42, v43, v44);
    objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v45, v46, (uint64_t)self->super._cbuuid, v47, 1);
  }
  long long v108 = self;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v42, v43, v44);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v119, v50, v124, 16);
  if (v51)
  {
    uint64_t v54 = v51;
    uint64_t v55 = *(void *)v120;
    uint64_t v56 = 138412802;
    long long v106 = v13;
    id v107 = v10;
    id v110 = v12;
    id v111 = v11;
    id v109 = v48;
    uint64_t v104 = *(void *)v120;
    do
    {
      uint64_t v57 = 0;
      uint64_t v105 = v54;
      do
      {
        if (*(void *)v120 != v55) {
          objc_enumerationMutation(v48);
        }
        double v58 = *(void **)(*((void *)&v119 + 1) + 8 * v57);
        if (objc_msgSend_isSharedQRSession(v58, v52, v53, *(double *)&v56))
        {
          uint64_t v59 = objc_msgSend_groupID(v58, v52, v53, *(double *)&v56);
          if (objc_msgSend_isEqualToString_(v59, v60, (uint64_t)v11, v61))
          {
            uint64_t v65 = objc_msgSend_state(v58, v62, v63, v64);

            if (v65 != 4) {
              goto LABEL_35;
            }
            uint64_t v59 = objc_msgSend_URIToParticipantIDs(v58, v52, v53, *(double *)&v56);
            long long v69 = objc_msgSend_GFTGL(IDSFoundationLog, v66, v67, v68);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)double v128 = v59;
              _os_log_impl(&dword_19D9BE000, v69, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData URIToParticipantIDs = %@", buf, 0xCu);
            }

            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            obuint64_t j = v12;
            uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v115, v71, v123, 16);
            if (v72)
            {
              uint64_t v75 = v72;
              uint64_t v76 = *(void *)v116;
              while (2)
              {
                for (uint64_t i = 0; i != v75; ++i)
                {
                  if (*(void *)v116 != v76) {
                    objc_enumerationMutation(obj);
                  }
                  long long v78 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                  long long v79 = objc_msgSend__stripPotentialTokenURIWithToken_(v78, v73, 0, v74);
                  long long v82 = objc_msgSend_objectForKey_(v59, v80, (uint64_t)v79, v81);
                  long long v86 = objc_msgSend_GFTGL(IDSFoundationLog, v83, v84, v85);
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    *(void *)double v128 = v78;
                    *(_WORD *)&v128[8] = 2112;
                    *(void *)&v128[10] = v79;
                    __int16 v129 = 2112;
                    id v130 = v82;
                    _os_log_impl(&dword_19D9BE000, v86, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData destinationURI = %@, strippedDestinationURI = %@, participantIDs = %@", buf, 0x20u);
                  }

                  if (objc_msgSend_count(v82, v87, v88, v89))
                  {
                    uint64_t v97 = objc_msgSend_GFTGL(IDSFoundationLog, v90, v91, v92);
                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                    {
                      double v101 = objc_msgSend_candidatePairToken(v58, v98, v99, v100);
                      *(_DWORD *)buf = 138412802;
                      *(void *)double v128 = v101;
                      *(_WORD *)&v128[8] = 2112;
                      *(void *)&v128[10] = v82;
                      __int16 v129 = 2112;
                      id v130 = v79;
                      _os_log_impl(&dword_19D9BE000, v97, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData found candidatePair %@ with participantIDs %@ for destinationURI %@", buf, 0x20u);
                    }
                    objc_msgSend__sendRelayInterfaceInfo_(v108, v102, 0, v103);

                    uint64_t v13 = v106;
                    id v10 = v107;
                    id v12 = v110;
                    id v11 = v111;
                    id v48 = v109;
                    goto LABEL_47;
                  }
                }
                uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v115, v74, v123, 16);
                if (v75) {
                  continue;
                }
                break;
              }
            }

            id v12 = v110;
            id v11 = v111;
            id v48 = v109;
            uint64_t v55 = v104;
            uint64_t v54 = v105;
          }
        }
LABEL_35:
        ++v57;
      }
      while (v57 != v54);
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v52, (uint64_t)&v119, *(double *)&v56, v124, 16);
      uint64_t v13 = v106;
      id v10 = v107;
    }
    while (v54);
  }
LABEL_47:

LABEL_48:
}

- (void)_discardKeyMaterialMessage:(int64_t)a3
{
  keyMaterialData = self->_keyMaterialData;
  self->_keyMaterialData = 0;

  self->_unsigned int keyMaterialDataCounter = -1;
  id keyMaterialSentHandler = (void (**)(id, int64_t))self->_keyMaterialSentHandler;
  if (keyMaterialSentHandler)
  {
    keyMaterialSentHandler[2](keyMaterialSentHandler, a3);
    id v7 = self->_keyMaterialSentHandler;
    self->_id keyMaterialSentHandler = 0;
  }
}

- (void)reportLinkMetricsForLinkID:(unsigned __int8)a3 lastPacketReceivedTime:(double)a4 lastPacketSentTime:(double)a5
{
  linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
  id v8 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, a3, a4, a5);
  id v11 = objc_msgSend_objectForKeyedSubscript_(linkIDToCandidatePairs, v9, (uint64_t)v8, v10);

  if (v11)
  {
    if (objc_msgSend_isP2P(v11, v12, v13, v14))
    {
      double lastP2PPacketReceivedTime = self->_lastP2PPacketReceivedTime;
      if (lastP2PPacketReceivedTime < a4) {
        double lastP2PPacketReceivedTime = a4;
      }
      self->_double lastP2PPacketReceivedTime = lastP2PPacketReceivedTime;
      objc_msgSend__checkIfQRLinkIsDownButP2PLinkIsUp(self, v15, v16, lastP2PPacketReceivedTime);
    }
  }
  else
  {
    int v18 = objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_19DB7E56C();
    }
  }
}

- (void)didReceiveProtobufPacketForLinkID:(unsigned __int8)a3
{
  linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
  int v6 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, a3, v3);
  id v9 = objc_msgSend_objectForKeyedSubscript_(linkIDToCandidatePairs, v7, (uint64_t)v6, v8);

  if (!v9)
  {
    __int16 v20 = objc_msgSend_GFTGL(IDSFoundationLog, v10, v11, v12);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_19DB7E5D4();
    }
    goto LABEL_10;
  }
  if ((objc_msgSend_isQUIC(v9, v10, v11, v12) & 1) == 0)
  {
    __int16 v20 = objc_msgSend_GFTGL(IDSFoundationLog, v13, v14, v15);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_19DB7E63C();
    }
LABEL_10:

    goto LABEL_11;
  }
  double lastQRPacketReceivedTime = self->_lastQRPacketReceivedTime;
  double v19 = ids_monotonic_time();
  if (lastQRPacketReceivedTime >= v19) {
    double v19 = lastQRPacketReceivedTime;
  }
  self->_double lastQRPacketReceivedTime = v19;
  objc_msgSend__checkIfQRLinkIsDownButP2PLinkIsUp(self, v17, v18, v19);
LABEL_11:
}

- (void)_checkIfQRLinkIsDownButP2PLinkIsUp
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  double v3 = ids_monotonic_time();
  double lastP2PPacketReceivedTime = self->_lastP2PPacketReceivedTime;
  double lastQRPacketReceivedTime = self->_lastQRPacketReceivedTime;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v8 = objc_msgSend_allValues(self->super._tokenToCandidatePairs, v6, v7, 0.0, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, v10, v39, 16);
  if (!v11)
  {
LABEL_16:

    return;
  }
  uint64_t v15 = v11;
  char v16 = 0;
  double v17 = v3 - lastP2PPacketReceivedTime;
  double v18 = v3 - lastQRPacketReceivedTime;
  uint64_t v19 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v8);
      }
      uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (objc_msgSend_isQUIC(v21, v12, v13, v14)) {
        v16 |= objc_msgSend_state(v21, v12, v13, v14) == 4;
      }
    }
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v29, v14, v39, 16);
  }
  while (v15);

  if ((v16 & 1) != 0 && v17 < 5.0 && v18 >= 25.0)
  {
    uint64_t v24 = objc_msgSend_GFTGL(IDSFoundationLog, v22, v23, 25.0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int v34 = @"YES";
      __int16 v35 = 2048;
      double v36 = v17;
      __int16 v37 = 2048;
      double v38 = v18;
      _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "_checkIfQRLinkIsDownButP2PLinkIsUp: has active QUIC: %@, last P2P: %f, last QR: %f", buf, 0x20u);
    }

    double v8 = objc_msgSend_error_(self->super._metricsCollector, v25, @"gl", v26);
    objc_msgSend_event_(v8, v27, @"p2p-but-no-qr", v28);
    goto LABEL_16;
  }
}

- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4
{
  uint64_t v267 = *MEMORY[0x1E4F143B8];
  id v241 = a3;
  id v242 = a4;
  id v233 = objc_msgSend_candidatePairToken(v242, v5, v6, v7);
  uint64_t v11 = objc_msgSend_channelSettings(v241, v8, v9, v10);
  if (v11) {
    objc_msgSend_setChannelSettings_(v242, v12, v11, v14);
  }
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v12, v13, v14);
  id v238 = (__CFString *)objc_claimAutoreleasedReturnValue();
  double v18 = objc_msgSend_GFTGL(IDSFoundationLog, v15, v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v260 = v238;
    _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "current candidate pairs: %@", buf, 0xCu);
  }

  id v240 = GLUtilGetDifferentRelayCandidatePairSucceeded(v242, v238);
  double v22 = objc_msgSend_local(v240, v19, v20, v21);
  uint64_t v26 = objc_msgSend_transport(v22, v23, v24, v25);

  long long v30 = objc_msgSend_local(v242, v27, v28, v29);
  uint64_t v34 = objc_msgSend_transport(v30, v31, v32, v33);

  double v38 = objc_msgSend_local(v242, v35, v36, v37);
  uint64_t v42 = objc_msgSend_index(v38, v39, v40, v41);
  objc_msgSend__interfaceNameForInterfaceIndexIncludingVPN_(self, v43, v42, v44);
  id v232 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v240) {
    goto LABEL_21;
  }
  if (!self->super._cellInterfaceName) {
    goto LABEL_15;
  }
  id v48 = objc_msgSend_local(v242, v45, v46, v47);
  if ((objc_msgSend_isCellularStunCandidate(v48, v49, v50, v51) & 1) == 0)
  {

LABEL_15:
    if (v26 <= v34 && (objc_msgSend_isRealloc(v242, v45, v46, v47) & 1) == 0)
    {
      uint64_t v221 = objc_msgSend_GFTGL(IDSFoundationLog, v45, v46, v47);
      if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v260 = (__CFString *)v26;
        __int16 v261 = 2048;
        uint64_t v262 = v34;
        __int16 v263 = 2112;
        id v264 = v242;
        _os_log_impl(&dword_19D9BE000, v221, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard current pair: %@", buf, 0x20u);
      }

      objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v222, (uint64_t)v233, v223, 0, 8);
      goto LABEL_89;
    }
    double v74 = objc_msgSend_GFTGL(IDSFoundationLog, v45, v46, v47);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v260 = (__CFString *)v26;
      __int16 v261 = 2048;
      uint64_t v262 = v34;
      __int16 v263 = 2112;
      id v264 = v240;
      _os_log_impl(&dword_19D9BE000, v74, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard existing pair: %@.", buf, 0x20u);
    }

    double v58 = objc_msgSend_candidatePairToken(v240, v75, v76, v77);
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v78, (uint64_t)v58, v79, 0, 8);
    goto LABEL_20;
  }
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v232, v52, (uint64_t)self->super._cellInterfaceName, v53);

  if (!isEqualToIgnoringCase) {
    goto LABEL_15;
  }
  uint64_t v55 = objc_msgSend_sharedInstanceForBagType_(IDSServerBag, v45, 0, v47);
  double v58 = objc_msgSend_objectForKey_(v55, v56, @"ids-delay-for-cellular-default-and-slicing", v57);

  if (v58 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v62 = objc_msgSend_unsignedIntegerValue(v58, v59, v60, v61);
    unsigned int v66 = objc_msgSend_GFTGL(IDSFoundationLog, v63, v64, v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      cellInterfaceName = self->super._cellInterfaceName;
      *(_DWORD *)buf = 138413058;
      v260 = v232;
      __int16 v261 = 2112;
      uint64_t v262 = (uint64_t)cellInterfaceName;
      __int16 v263 = 2112;
      id v264 = v240;
      __int16 v265 = 1024;
      int v266 = v62;
      _os_log_impl(&dword_19D9BE000, v66, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface - currentInterfaceName %@ _cellInterfaceName %@ will discard existing pair: %@ in %u seconds.", buf, 0x26u);
    }

    long long v70 = objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F59E30], v68, (uint64_t)self, v69);
    dispatch_time_t v71 = dispatch_time(0, 1000000000 * v62);
    uint64_t v72 = im_primary_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19DAB7A8C;
    block[3] = &unk_1E5974088;
    id v255 = v70;
    id v256 = v240;
    id v73 = v70;
    dispatch_after(v71, v72, block);
  }
  else
  {
    long long v224 = objc_msgSend_GFTGL(IDSFoundationLog, v59, v60, v61);
    if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
    {
      double v225 = self->super._cellInterfaceName;
      *(_DWORD *)buf = 138412802;
      v260 = v232;
      __int16 v261 = 2112;
      uint64_t v262 = (uint64_t)v225;
      __int16 v263 = 2112;
      id v264 = v240;
      _os_log_impl(&dword_19D9BE000, v224, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface - currentInterfaceName %@ _cellInterfaceName %@ discard existing pair: %@.", buf, 0x20u);
    }

    objc_msgSend_candidatePairToken(v240, v226, v227, v228);
    id v73 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v229, (uint64_t)v73, v230, 0, 13);
  }

LABEL_20:
LABEL_21:
  long long v82 = objc_msgSend_hbhEncKey(v242, v45, v46, v47);
  if (!v82
    || (objc_msgSend_hbhDecKey(v242, v80, v81, v83),
        uint64_t v84 = objc_claimAutoreleasedReturnValue(),
        BOOL v85 = v84 == 0,
        v84,
        v82,
        v85))
  {
    long long v86 = objc_msgSend_relaySessionKey(v242, v80, v81, v83);
    unint64_t v90 = objc_msgSend_sessionID(v242, v87, v88, v89);
    unint64_t v94 = objc_msgSend_participantID(v242, v91, v92, v93);
    double v98 = objc_msgSend_hbhSalt(v242, v95, v96, v97);
    uint64_t v99 = IDSLinkHBHDeriveHKDFSha256Keys(v86, v90, v94, v98);

    if (v99)
    {
      double v103 = objc_msgSend_subdataWithRange_(v99, v100, 0, v102, 32);
      long long v106 = objc_msgSend_subdataWithRange_(v99, v104, 32, v105, 32);
      objc_msgSend_setHbhEncKey_(v242, v107, (uint64_t)v103, v108);
      objc_msgSend_setHbhDecKey_(v242, v109, (uint64_t)v106, v110);
    }
    else
    {
      double v103 = objc_msgSend_GFTGL(IDSFoundationLog, v100, v101, v102);
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
        sub_19DB7E6A4();
      }
    }
  }
  objc_msgSend__notifyQRSessionConnected_(self, v80, (uint64_t)v242, v83);
  uint64_t v114 = self;
  if (self->super._isUPlusOneSession)
  {
    objc_msgSend__sendRelayInterfaceInfo_(self, v111, (uint64_t)v233, v113);
    long long v252 = 0u;
    long long v253 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    long long v115 = self->_remoteCandidatePairs;
    uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v250, v117, v258, 16);
    if (v119)
    {
      uint64_t v121 = *(void *)v251;
      do
      {
        for (uint64_t i = 0; i != v119; ++i)
        {
          if (*(void *)v251 != v121) {
            objc_enumerationMutation(v115);
          }
          objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(self, v118, (uint64_t)v242, v120, *(void *)(*((void *)&v250 + 1) + 8 * i));
        }
        uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v250, v120, v258, 16);
      }
      while (v119);
    }

    uint64_t v114 = self;
  }
  double v123 = objc_msgSend_allValues(v114->super._tokenToCandidatePairs, v111, v112, v113);
  double v235 = GLUtilGetRelayCandidatePairNotSucceededForOppositeIPVersion(v242, v123);

  if (v235)
  {
    double v127 = GLUCreateIPVersionFailureEvent(v235);
    __int16 v131 = objc_msgSend_local(v235, v128, v129, v130);
    if (*(unsigned char *)(objc_msgSend_address(v131, v132, v133, v134) + 1) == 2) {
      char v135 = @"IPv4";
    }
    else {
      char v135 = @"IPv6";
    }
    id v136 = v135;

    double v137 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v260 = v136;
      _os_log_impl(&dword_19D9BE000, v137, OS_LOG_TYPE_DEFAULT, "RTC reports: add %@ setup failure", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v231 = v136;
        _IDSLogTransport(@"GL", @"IDS", @"RTC reports: add %@ setup failure");
        if (_IDSShouldLog())
        {
          id v231 = v136;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"RTC reports: add %@ setup failure");
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    char v139 = objc_opt_respondsToSelector();

    if (v139)
    {
      id v140 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didAddQREvent_(v140, v141, (uint64_t)self, v142, v127);
    }
  }
  unsigned int v143 = objc_msgSend_linkID(v242, v124, v125, v126, v231);
  ProtoUtilProcessStreamInfo(v241, v143, v143);
  CFDictionaryRef theDict = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v147 = 0;
  if (theDict)
  {
    CFDictionaryRef v144 = (const char *)@"stream-info-peer-published-streams";
    if (@"stream-info-peer-published-streams") {
      uint64_t v147 = (void *)CFDictionaryGetValue(theDict, @"stream-info-peer-published-streams");
    }
  }
  uint64_t v148 = objc_msgSend_participantID(v242, v144, v145, v146);
  uint64_t v236 = StunUtilProcessParticipants(v147, v148, self->super._isLightweightParticipant);
  value = ProtoUtilProcessLightweightParticipants(v241);
  if ((unint64_t)objc_msgSend_count(v236, v149, v150, v151) >= 2)
  {
    self->super._isSecondOrLaterParticipant = 1;
    if (!self->super._receivedAllocbindResponse)
    {
      float v152 = ids_monotonic_time();
      double v153 = GLUCreateQRClientTimeEvent(311, 0, v242, 0, v152);
      double v154 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v154, OS_LOG_TYPE_DEFAULT, "RTC reports: add first allocbind response", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"RTC reports: add first allocbind response");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"RTC reports: add first allocbind response");
          }
        }
      }
      id v155 = objc_loadWeakRetained((id *)&self->super._delegate);
      char v156 = objc_opt_respondsToSelector();

      if (v156)
      {
        id v157 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v157, v158, (uint64_t)self, v159, v153);
      }
      self->super._receivedAllocbindResponse = 1;
    }
  }
  int v237 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (theDict) {
    CFDictionarySetValue(v237, @"gl-option-sessioninfo-response-streaminfo-key", theDict);
  }
  if (v236) {
    CFDictionarySetValue(v237, @"gl-option-sessioninfo-response-participants-key", v236);
  }
  if (value) {
    CFDictionarySetValue(v237, @"gl-option-sessioninfo-response-lightweight-participants-key", value);
  }
  id v163 = objc_msgSend_groupID(v242, v160, v161, v162);
  uint64_t v167 = objc_msgSend_sessionID(v242, v164, v165, v166);
  objc_msgSend__notifySessionInfoReceived_relayGroupID_relaySessionID_status_(self, v168, (uint64_t)v237, v169, v163, v167, 0);

  uint64_t v173 = objc_msgSend_sessionID(v242, v170, v171, v172);
  objc_msgSend_initParticipantIDMap_(v242, v174, 0, v175);
  double v179 = objc_msgSend_groupID(v242, v176, v177, v178);
  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  uint64_t v180 = v238;
  uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v181, (uint64_t)&v246, v182, v257, 16);
  if (v185)
  {
    uint64_t v187 = *(void *)v247;
    do
    {
      for (uint64_t j = 0; j != v185; ++j)
      {
        if (*(void *)v247 != v187) {
          objc_enumerationMutation(v180);
        }
        double v189 = *(void **)(*((void *)&v246 + 1) + 8 * j);
        uint64_t v190 = objc_msgSend_sessionID(v189, v183, v184, v186);
        if (objc_msgSend_isEqualToString_(v190, v191, (uint64_t)v173, v192))
        {
          uint64_t v196 = objc_msgSend_groupID(v189, v193, v194, v195);
          if (objc_msgSend_isEqualToString_(v196, v197, (uint64_t)v179, v198)
            && objc_msgSend_state(v189, v199, v200, v201) == 4)
          {
            isSharedQRSessiouint64_t n = objc_msgSend_isSharedQRSession(v189, v202, v203, v204);

            if (!isSharedQRSession) {
              continue;
            }
            uint64_t v190 = objc_msgSend_allKeys(self->super._pluginParticipantIDs, v183, v184, v186);
            objc_msgSend_updateParticipantIDMap_(v189, v206, (uint64_t)v190, v207);
          }
          else
          {
          }
        }
      }
      uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v183, (uint64_t)&v246, v186, v257, 16);
    }
    while (v185);
  }

  if (objc_msgSend_hasSessionStateCounter(v241, v208, v209, v210))
  {
    uint64_t v214 = objc_msgSend_sessionStateCounter(v241, v211, v212, v213);
    if (v214)
    {
      id v215 = objc_loadWeakRetained((id *)&self->super._delegate);
      char v216 = objc_opt_respondsToSelector();

      if (v216)
      {
        id v217 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didReceiveSessionStateCounter_(v217, v218, (uint64_t)self, v219, v214);
      }
    }
  }
  v244[0] = MEMORY[0x1E4F143A8];
  v244[1] = 3221225472;
  v244[2] = sub_19DAB7B9C;
  v244[3] = &unk_1E5973CF8;
  v244[4] = self;
  id v245 = v242;
  IDSTransportThreadAddBlockAfter(v244, 1.0);

LABEL_89:
  return 1;
}

- (BOOL)_IsExtIPDiscoveryNeeded:(sockaddr *)a3 candidatePairList:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->super._sharedSessionHasJoined && self->super._isUPlusOneSession && !self->super._ipDiscoveryDisabled)
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSGFTGL;
    BOOL v11 = [(IDSGlobalLink *)&v13 _IsExtIPDiscoveryNeeded:a3 candidatePairList:v6];
  }
  else
  {
    double v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = @"YES";
      if (self->super._sharedSessionHasJoined) {
        uint64_t v9 = @"YES";
      }
      else {
        uint64_t v9 = @"NO";
      }
      if (self->super._isUPlusOneSession) {
        double v10 = @"YES";
      }
      else {
        double v10 = @"NO";
      }
      if (!self->super._ipDiscoveryDisabled) {
        double v8 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      double v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@");
        }
      }
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setSharedSessionHasJoined:(BOOL)a3
{
  self->super._sharedSessionHasJoined = a3;
}

- (void)setCellInterfaceName:(id)a3
{
  id v4 = (NSString *)a3;
  objc_msgSend_setCellInterfaceName_(self->super._nwLink, v5, (uint64_t)v4, v6);
  cellInterfaceName = self->super._cellInterfaceName;
  self->super._cellInterfaceName = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reliableUnicastServerMaterialToProtoMessageTransactionID, 0);
  objc_storeStrong(&self->_keyMaterialSentHandler, 0);
  objc_storeStrong((id *)&self->_keyMaterialData, 0);
  objc_storeStrong((id *)&self->_virtualCandidatePairs, 0);
  objc_storeStrong((id *)&self->_remoteCandidatePairs, 0);
}

@end