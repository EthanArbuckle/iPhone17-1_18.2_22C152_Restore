@interface IDSNonFTGL
- (BOOL)_isBetterCandidatePair:(id)a3 newCandidatePair:(id)a4;
- (BOOL)_processRemovedLocalAddressList:(id)a3;
- (BOOL)_setupNewQRLinkIfNecessary:(id)a3;
- (id)_nextConnectedCandidatePair;
- (void)_handleNoRemotePacket;
- (void)_notifyCandidatePairConnected:(id)a3;
- (void)_selectBetterDefaultCandidatePair:(id)a3;
- (void)_selectDefaultCandidatePair;
- (void)_setDefaultCandidatePairForNonFT;
- (void)_setFirstDefaultCandidatePair:(id)a3;
- (void)_startHB:(id)a3;
- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4;
- (void)startWithOptions:(id)a3;
@end

@implementation IDSNonFTGL

- (void)startWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  Value = 0;
  if (v6)
  {
    v4 = (const char *)@"gl-option-client-type";
    if (@"gl-option-client-type") {
      Value = (void *)CFDictionaryGetValue(v6, @"gl-option-client-type");
    }
  }
  uint64_t v9 = objc_msgSend_unsignedIntValue(Value, v4, v5, v7);
  self->super._clientType = v9;
  self->super._useSecureControlMessage = 1;
  v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v9;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "enable secure control message for client type: %u.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v18 = v9;
      _IDSLogTransport(@"GL", @"IDS", @"enable secure control message for client type: %u.");
      if (_IDSShouldLog())
      {
        uint64_t v18 = v9;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"enable secure control message for client type: %u.");
      }
    }
  }
  v14 = objc_msgSend_NonFTGL(IDSFoundationLog, v11, v12, v13, v18);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = idsSessionID;
    _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:NO, isMultiway:NO).", buf, 0x16u);
  }

  if (IMGetDomainBoolForKey())
  {
    self->super._startPort = 16393;
    self->super._portRange = 10;
    v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = (unsigned __int16)v9;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v19 = (unsigned __int16)v9;
        _IDSLogTransport(@"GL", @"IDS", @"Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u.");
        if (_IDSShouldLog())
        {
          uint64_t v19 = (unsigned __int16)v9;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u.");
        }
      }
    }
  }
  else
  {
    self->super._startPort = 16403;
    self->super._portRange = 70;
    v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = (unsigned __int16)v9;
      _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "Use GameKit port range for clientType %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v19 = (unsigned __int16)v9;
        _IDSLogTransport(@"GL", @"IDS", @"Use GameKit port range for clientType %u.");
        if (_IDSShouldLog())
        {
          uint64_t v19 = (unsigned __int16)v9;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"Use GameKit port range for clientType %u.");
        }
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)IDSNonFTGL;
  -[IDSGlobalLink startWithOptions:](&v20, sel_startWithOptions_, v6, v19);
  self->super._enableSKE = 0;
  self->super._reduceCellularUsage = 0;
  self->super._reduceRelayLinkCreation = 0;
  self->super._shouldProcessBasebandNotification = 0;
  self->super._supportChannelData = 0;
}

- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)IDSNonFTGL;
  [(IDSGlobalLink *)&v11 disconnectWithCompletionHandler:a3 isReinitiating:a4];
  objc_msgSend__sendSessionDisconnectedCommand(self, v5, v6, v7);
  objc_msgSend__startDisconnectTimer(self, v8, v9, v10);
}

- (void)_notifyCandidatePairConnected:(id)a3
{
  id v4 = a3;
  if (v4 && self->super._delayedConnData)
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "connection data is delayed, send it now.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"connection data is delayed, send it now.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"connection data is delayed, send it now.");
        }
      }
    }
    objc_msgSend__sendConnectionDataWithRemovedAddressList_(self, v6, 0, v7);
  }
}

- (void)_setFirstDefaultCandidatePair:(id)a3
{
  id v7 = a3;
  id v4 = IDSQRSendInfoList_ItemAtIndex(self->super._sendInfoList, 0);
  if (v4 && !*((_DWORD *)v4 + 1)) {
    objc_msgSend__updateDefaultCandidatePair_(self, v5, (uint64_t)v7, v6);
  }
}

- (BOOL)_isBetterCandidatePair:(id)a3 newCandidatePair:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v10 = objc_msgSend_local(v5, v7, v8, v9);
  int v14 = objc_msgSend_radioAccessTechnology(v10, v11, v12, v13);

  uint64_t v18 = objc_msgSend_remote(v5, v15, v16, v17);
  int v22 = objc_msgSend_radioAccessTechnology(v18, v19, v20, v21);

  v26 = objc_msgSend_local(v6, v23, v24, v25);
  int v30 = objc_msgSend_radioAccessTechnology(v26, v27, v28, v29);

  v34 = objc_msgSend_remote(v6, v31, v32, v33);
  int v38 = objc_msgSend_radioAccessTechnology(v34, v35, v36, v37);

  int v42 = objc_msgSend_channelNumber(v5, v39, v40, v41);
  int v46 = objc_msgSend_channelNumber(v6, v43, v44, v45);
  v111 = v5;
  v50 = objc_msgSend_local(v5, v47, v48, v49);
  int v54 = *(unsigned __int8 *)(objc_msgSend_address(v50, v51, v52, v53) + 1);

  v58 = objc_msgSend_local(v6, v55, v56, v57);
  int v62 = *(unsigned __int8 *)(objc_msgSend_address(v58, v59, v60, v61) + 1);

  if (v14) {
    BOOL v66 = v14 == 9;
  }
  else {
    BOOL v66 = 1;
  }
  int v67 = !v66;
  if (v30) {
    BOOL v68 = v30 == 9;
  }
  else {
    BOOL v68 = 1;
  }
  int v69 = !v68;
  if (v22) {
    BOOL v70 = v22 == 9;
  }
  else {
    BOOL v70 = 1;
  }
  int v71 = !v70;
  if (v38) {
    BOOL v72 = v38 == 9;
  }
  else {
    BOOL v72 = 1;
  }
  if (!v72) {
    int v71 = 0;
  }
  if (v67 == v69) {
    int v67 = v71;
  }
  int v73 = (v42 != 0) & ~v67;
  if (v46) {
    int v73 = 0;
  }
  int v74 = v67 | v73;
  int v75 = (v54 == 30) & ~v74;
  if (v62 != 2) {
    int v75 = 0;
  }
  char v76 = v74 | v75;
  if ((v74 | v75) == 1 || v62 != 2)
  {
    v77 = v111;
  }
  else
  {
    v77 = v111;
    v78 = objc_msgSend_local(v111, v63, v64, v65);
    unsigned int v82 = *(_DWORD *)(objc_msgSend_address(v78, v79, v80, v81) + 4);

    v86 = objc_msgSend_remote(v111, v83, v84, v85);
    unsigned int v90 = *(_DWORD *)(objc_msgSend_external(v86, v87, v88, v89) + 4);

    v94 = objc_msgSend_local(v6, v91, v92, v93);
    unsigned int v98 = bswap32(*(_DWORD *)(objc_msgSend_address(v94, v95, v96, v97) + 4));

    v102 = objc_msgSend_remote(v6, v99, v100, v101);
    unsigned int v106 = *(_DWORD *)(objc_msgSend_external(v102, v103, v104, v105) + 4);

    if (HIBYTE(v98) == 10 || (v98 & 0xFFF00000) == 0xAC100000 || (v98 & 0xFFFF0000) == 0xC0A80000)
    {
      unsigned int v107 = bswap32(v106);
      if ((v107 & 0xFFFF0000) == 0xC0A80000 || (v107 & 0xFF000000) == 0xA000000 || (v107 & 0xFFF00000) == 0xAC100000)
      {
        if ((unsigned int v108 = bswap32(v82), HIBYTE(v108) != 10)
          && (v108 & 0xFFF00000) != 0xAC100000
          && (v108 & 0xFFFF0000) != 0xC0A80000
          || (unsigned int v109 = bswap32(v90), HIBYTE(v109) != 10)
          && (v109 & 0xFFF00000) != 0xAC100000
          && (v109 & 0xFFFF0000) != 0xC0A80000)
        {
          char v76 = 1;
        }
      }
    }
  }

  return v76;
}

- (void)_selectBetterDefaultCandidatePair:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->super._allowOnlyOneQR && self->super._isInitiator)
  {
    objc_msgSend_allValues(self->super._tokenToCandidatePairs, v4, v5, v7);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v28, v10, v34, 16);
    if (v13)
    {
      uint64_t v15 = *(void *)v29;
LABEL_5:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v8);
        }
        double v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
        if (objc_msgSend_isNominated(v17, v11, v12, v14)) {
          break;
        }
        if (v13 == (id)++v16)
        {
          id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v14, v34, 16);
          if (v13) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v13 = v17;

      if (!v13
        || !objc_msgSend__isBetterCandidatePair_newCandidatePair_(self, v19, (uint64_t)v13, v20, v6))
      {
        goto LABEL_22;
      }
      double v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "select better candidate pair %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v27 = v6;
          _IDSLogTransport(@"GL", @"IDS", @"select better candidate pair %@.");
          if (_IDSShouldLog())
          {
            id v27 = v6;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"select better candidate pair %@.");
          }
        }
      }
      uint64_t v18 = objc_msgSend_candidatePairToken(v6, v22, v23, v24, v27);
      objc_msgSend__nominateCandidatePair_(self, v25, (uint64_t)v18, v26);
    }
    else
    {
LABEL_11:
      uint64_t v18 = v8;
    }

LABEL_22:
  }
}

- (id)_nextConnectedCandidatePair
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, a2, v2, v3);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, v6, v27, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v24;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v4);
      }
      double v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
      int isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v14, v8, v9, v10, (void)v23);
      uint64_t v19 = objc_msgSend_state(v14, v16, v17, v18);
      if (isRelayStunCandidatePair)
      {
        if (v19 == 4) {
          goto LABEL_10;
        }
      }
      else if (v19 == 3)
      {
LABEL_10:
        id v20 = v14;
        if (v20)
        {
          double v21 = v20;
          goto LABEL_15;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v23, v10, v27, 16);
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  double v21 = 0;
LABEL_15:

  return v21;
}

- (void)_selectDefaultCandidatePair
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!self->super._allowOnlyOneQR && self->super._isInitiator)
  {
    uint64_t v5 = objc_msgSend__nextConnectedCandidatePair(self, a2, v2, v3);
    if (v5)
    {
      double v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v5;
        _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "currentBestPair: %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v36 = v5;
          _IDSLogTransport(@"GL", @"IDS", @"currentBestPair: %@.");
          if (_IDSShouldLog())
          {
            uint64_t v36 = v5;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"currentBestPair: %@.");
          }
        }
      }
      objc_msgSend_allValues(self->super._tokenToCandidatePairs, v7, v8, v9, v36);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v38, v12, v42, 16);
      if (v15)
      {
        uint64_t v16 = *(void *)v39;
        uint64_t v17 = 138412290;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v10);
            }
            uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v20 = objc_msgSend_state(v19, v13, v14, *(double *)&v17, v37);
            if ((objc_msgSend_isEqual_(v19, v21, (uint64_t)v5, v22) & 1) == 0)
            {
              char isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v19, v13, v14, *(double *)&v17);
              char v24 = v20 == 4 ? 0 : isRelayStunCandidatePair;
              if ((v24 & 1) == 0)
              {
                int v25 = objc_msgSend_isRelayStunCandidatePair(v19, v13, v14, *(double *)&v17);
                int v26 = v20 == 3 ? 1 : v25;
                if (v26 == 1
                  && objc_msgSend__isBetterCandidatePair_newCandidatePair_(self, v13, (uint64_t)v5, *(double *)&v17, v19))
                {
                  id v27 = v19;

                  uint64_t v28 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v44 = v27;
                    _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "new currentBestPair: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      id v37 = v27;
                      _IDSLogTransport(@"GL", @"IDS", @"new currentBestPair: %@");
                      if (_IDSShouldLog())
                      {
                        id v37 = v27;
                        _IDSLogV(0, @"IDSFoundation", @"GL", @"new currentBestPair: %@");
                      }
                    }
                  }
                  uint64_t v5 = v27;
                }
              }
            }
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v38, *(double *)&v17, v42, 16);
        }
        while (v15);
      }

      long long v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v5;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "selected best candidate pair %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v37 = v5;
        _IDSLogTransport(@"GL", @"IDS", @"selected best candidate pair %@.");
        if (_IDSShouldLog())
        {
          id v37 = v5;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"selected best candidate pair %@.");
        }
      }
      id v33 = objc_msgSend_candidatePairToken(v5, v30, v31, v32, v37);
      objc_msgSend__nominateCandidatePair_(self, v34, (uint64_t)v33, v35);
    }
  }
}

- (BOOL)_processRemovedLocalAddressList:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IDSNonFTGL;
  if ([(IDSGlobalLink *)&v10 _processRemovedLocalAddressList:a3]
    && objc_msgSend__hasCandidatePairInState_anotherState_relayCandidatePairsOnly_excludeSelfAlloc_(self, v4, 3, v5, 4, 0, 0))
  {
    objc_msgSend__setDefaultCandidatePairForNonFT(self, v6, v7, v8);
  }
  return 0;
}

- (void)_startHB:(id)a3
{
  id v4 = a3;
  objc_msgSend_setHbStarted_(v4, v5, 1, v6);
  objc_msgSend_candidatePairToken(v4, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v10, 3, v11, 0, 0, v12);
}

- (void)_handleNoRemotePacket
{
  id v4 = _Block_copy(self->super._connectReadyHandler);
  if (v4)
  {
    double v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v3, @"No remote packet time out.", v5, *MEMORY[0x1E4F28568]);
    objc_super v10 = objc_msgSend_errorWithDomain_code_userInfo_(v6, v8, @"GlobalLink", v9, 11, v7);

    double v11 = im_primary_queue();
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = sub_19DA1B0F8;
    long long v23 = &unk_1E5970A78;
    id v24 = v10;
    id v25 = v4;
    id v12 = v10;
    dispatch_async(v11, &v20);

LABEL_5:
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v12 = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend_link_didFailToConnectOverCloud_cbuuid_(v12, v18, (uint64_t)self, v19, 0, self->super._cbuuid);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend__stopActivityTimer(self, v15, v16, v17, v20, v21, v22, v23);
}

- (void)_setDefaultCandidatePairForNonFT
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->super._allowOnlyOneQR)
  {
    double v5 = objc_msgSend__nextConnectedCandidatePair(self, a2, v2, v3);
    if (v5)
    {
      double v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v10 = objc_msgSend_candidatePairToken(v5, v7, v8, v9);
        *(_DWORD *)buf = 138412290;
        double v17 = v10;
        _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "default candidate pair is removed, switch to %@.", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        uint64_t v15 = objc_msgSend_candidatePairToken(v5, v11, v13, v12);
        _IDSLogTransport(@"GL", @"IDS", @"default candidate pair is removed, switch to %@.");

        if (_IDSShouldLog())
        {
          uint64_t v15 = objc_msgSend_candidatePairToken(v5, v11, v14, v12, v15);
          _IDSLogV(0, @"IDSFoundation", @"GL", @"default candidate pair is removed, switch to %@.");
        }
      }
      objc_msgSend__updateDefaultCandidatePair_(self, v11, (uint64_t)v5, v12, v15);
    }
  }
  else
  {
    ((void (*)(IDSNonFTGL *, char *))MEMORY[0x1F4181798])(self, sel__selectDefaultCandidatePair);
  }
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->super._hasPendingAllocation)
  {
    uint64_t v8 = objc_msgSend_NonFTGL(IDSFoundationLog, v4, v5, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._hasPendingAllocation) {
        double v9 = @"YES";
      }
      else {
        double v9 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "skip set up new QR link, relaySessionID: %@, _hasPendingAllocation: %@", buf, 0x16u);
    }

    BOOL v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSNonFTGL;
    unsigned int v11 = [(IDSGlobalLink *)&v14 _setupNewQRLinkIfNecessary:v6];
    BOOL v10 = v11;
    if (!v6 && v11)
    {
      v13.receiver = self;
      v13.super_class = (Class)IDSNonFTGL;
      [(IDSGlobalLink *)&v13 _requestNewTwoWayQRAllocation:0];
      BOOL v10 = 1;
    }
  }

  return v10;
}

@end