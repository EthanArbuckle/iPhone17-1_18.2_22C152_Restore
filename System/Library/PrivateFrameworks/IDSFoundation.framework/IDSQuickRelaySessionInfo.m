@interface IDSQuickRelaySessionInfo
- (BOOL)h2FallbackDisabled;
- (BOOL)handOffOverQREnabled;
- (BOOL)ipDiscoveryDisabled;
- (BOOL)isInitiator;
- (BOOL)isInternal;
- (BOOL)isPseudoParticipant;
- (BOOL)sessionIsUserParticipantInitiated;
- (BOOL)transportLayerEncryptionDisabled;
- (BOOL)uplinkNackDisabled;
- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider;
- (NSArray)allParticipantIDs;
- (NSArray)publishedStreams;
- (NSArray)subscribedStreams;
- (NSData)avcDataBlob;
- (NSData)relaySessionKey;
- (NSData)relaySessionToken;
- (NSData)softwareData;
- (NSDictionary)qrSessionExperiments;
- (NSSet)initialServerDesiredMaterial;
- (NSString)allocateRequestID;
- (NSString)groupID;
- (NSString)idsSessionID;
- (NSString)pskH3Settings;
- (NSString)pskTransportParameters;
- (NSString)relaySessionID;
- (NSString)reportingDataBlob;
- (NSString)stableGroupID;
- (NSUUID)defaultDeviceLocalCBUUID;
- (NSUUID)defaultDeviceRemoteCBUUID;
- (const)highPriorityServerAddress;
- (const)highPriorityServerAddressIPv6;
- (const)serverAddress;
- (const)serverAddressIPv6;
- (double)allocateTime;
- (id)initialServerDesiredMaterialSigner;
- (int64_t)allocateType;
- (int64_t)linkProtocol;
- (int64_t)parseSessionInfo:(id)a3;
- (int64_t)relayServerProviderType;
- (unint64_t)callType;
- (unint64_t)participantID;
- (unsigned)generationCounter;
- (unsigned)ipPreference;
- (unsigned)linkScore;
- (unsigned)linkSuggestion;
- (unsigned)maxConcurrentStreams;
- (unsigned)protocolVersion;
@end

@implementation IDSQuickRelaySessionInfo

- (const)serverAddress
{
  return &self->_serverAddress;
}

- (const)serverAddressIPv6
{
  return &self->_serverAddressIPv6;
}

- (const)highPriorityServerAddress
{
  return &self->_highPriorityServerAddress;
}

- (const)highPriorityServerAddressIPv6
{
  return &self->_highPriorityServerAddressIPv6;
}

- (int64_t)parseSessionInfo:(id)a3
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  Value = 0;
  if (v6)
  {
    v4 = (const char *)@"qat";
    if (@"qat") {
      Value = (void *)CFDictionaryGetValue(v6, @"qat");
    }
  }
  unsigned int v9 = objc_msgSend_unsignedIntValue(Value, v4, v5, v7);
  self->_allocateType = v9;
  if (v9 - 5 <= 0xFFFFFFFB)
  {
    v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "failed to get allocate-type from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get allocate-type from sessionInfo.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get allocate-type from sessionInfo.");
        }
      }
    }
    int64_t v14 = 27;
    goto LABEL_272;
  }
  v15 = 0;
  if (v6)
  {
    v10 = (const char *)@"qsat";
    if (@"qsat") {
      v15 = (void *)CFDictionaryGetValue(v6, @"qsat");
    }
  }
  objc_msgSend_doubleValue(v15, v10, v11, v12);
  self->_allocateTime = v16;
  if (v16 <= 0.0)
  {
    v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "failed to get allocate-time from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get allocate-time from sessionInfo.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get allocate-time from sessionInfo.");
        }
      }
    }
    int64_t v14 = 28;
  }
  else
  {
    if (v6)
    {
      if (@"U")
      {
        v17 = (void *)CFDictionaryGetValue(v6, @"U");
        id v222 = v17;
        if (v222)
        {
          objc_storeStrong((id *)&self->_allocateRequestID, v17);
          if (!@"qrsi"
            || (v18 = (void *)CFDictionaryGetValue(v6, @"qrsi"),
                (id v19 = v18) == 0))
          {
            v32 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-id from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get relay-session-id from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get relay-session-id from sessionInfo.");
                }
              }
            }
            int64_t v14 = 1;
            goto LABEL_271;
          }
          v221 = v19;
          objc_storeStrong((id *)&self->_relaySessionID, v18);
          if (!@"qrst"
            || (v20 = (void *)CFDictionaryGetValue(v6, @"qrst"),
                (id v21 = v20) == 0))
          {
            v33 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-token from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get relay-session-token from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get relay-session-token from sessionInfo.");
                }
              }
            }
            int64_t v14 = 2;
            goto LABEL_270;
          }
          v219 = v21;
          objc_storeStrong((id *)&self->_relaySessionToken, v20);
          if (!@"qrsk"
            || (v22 = (void *)CFDictionaryGetValue(v6, @"qrsk"),
                (id v23 = v22) == 0))
          {
            v34 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-key from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get relay-session-key from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get relay-session-key from sessionInfo.");
                }
              }
            }
            int64_t v14 = 3;
            goto LABEL_269;
          }
          v218 = v23;
          objc_storeStrong((id *)&self->_relaySessionKey, v22);
          if (!@"qr-software-id"
            || (v24 = (void *)CFDictionaryGetValue(v6, @"qr-software-id"),
                (id v25 = v24) == 0))
          {
            v35 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "failed to get software-data from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get software-data from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get software-data from sessionInfo.");
                }
              }
            }
            v36 = 0;
            int64_t v14 = 29;
            goto LABEL_268;
          }
          id v217 = v25;
          objc_storeStrong((id *)&self->_softwareData, v24);
          v28 = (const char *)@"qrp";
          if (@"qrp") {
            v29 = (void *)CFDictionaryGetValue(v6, @"qrp");
          }
          else {
            v29 = 0;
          }
          unsigned int v37 = objc_msgSend_unsignedShortValue(v29, v28, v26, v27);
          if (!v37)
          {
            v48 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v48, OS_LOG_TYPE_DEFAULT, "failed to get relay-port from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get relay-port from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get relay-port from sessionInfo.");
                }
              }
            }
            int64_t v14 = 5;
            goto LABEL_267;
          }
          int v227 = -1431655766;
          if (!@"qrip"
            || (unsigned int v38 = v37, (v39 = (id)CFDictionaryGetValue(v6, @"qrip")) == 0))
          {
            v47 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "failed to get relay-address from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get relay-address from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get relay-address from sessionInfo.");
                }
              }
            }
            int64_t v14 = 4;
            goto LABEL_267;
          }
          v215 = v39;
          objc_msgSend_getBytes_length_(v39, v40, (uint64_t)&v227, v41, 4);
          *(_WORD *)&self->_serverAddress.ss_len = 528;
          *(_DWORD *)&self->_serverAddress.__ss_pad1[2] = v227;
          __int16 v44 = __rev16(v38);
          *(_WORD *)self->_serverAddress.__ss_pad1 = v44;
          v45 = (const char *)@"qipp";
          if (@"qipp") {
            v46 = (void *)CFDictionaryGetValue(v6, @"qipp");
          }
          else {
            v46 = 0;
          }
          self->_ipPreference = objc_msgSend_unsignedCharValue(v46, v45, v42, v43);
          v51 = (const char *)@"qrhpp";
          if (@"qrhpp") {
            v52 = (void *)CFDictionaryGetValue(v6, @"qrhpp");
          }
          else {
            v52 = 0;
          }
          unsigned int v53 = objc_msgSend_unsignedShortValue(v52, v51, v49, v50);
          unsigned int v54 = v53;
          *(_DWORD *)&self->_highPriorityServerAddressIPv6.__ss_pad2[8] = 0;
          *(void *)self->_highPriorityServerAddressIPv6.__ss_pad2 = 0;
          *(_OWORD *)&self->_highPriorityServerAddressIPv6.ss_len = 0u;
          *(_OWORD *)&self->_highPriorityServerAddress.ss_len = 0u;
          if (v53)
          {
            *(_WORD *)&self->_highPriorityServerAddress.ss_len = 528;
            *(_DWORD *)&self->_highPriorityServerAddress.__ss_pad1[2] = v227;
            *(_WORD *)self->_highPriorityServerAddress.__ss_pad1 = __rev16(v53);
          }
          else
          {
            v55 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "failed to get high priority relay-port from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get high priority relay-port from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get high priority relay-port from sessionInfo.");
                }
              }
            }
          }
          if (@"qrip6"
            && (v56 = (id)CFDictionaryGetValue(v6, @"qrip6")) != 0)
          {
            id v216 = v56;
            if (objc_msgSend_length(v56, v57, v58, v59) == 16)
            {
              *(void *)&self->_serverAddressIPv6.ss_len = 0;
              self->_serverAddressIPv6.__ss_align = 0;
              *(_DWORD *)&self->_serverAddressIPv6.__ss_pad2[8] = 0;
              *(void *)self->_serverAddressIPv6.__ss_pad2 = 0;
              *(_WORD *)&self->_serverAddressIPv6.ss_len = 7708;
              *(_WORD *)self->_serverAddressIPv6.__ss_pad1 = v44;
              id v216 = v216;
              *(_OWORD *)&self->_serverAddressIPv6.__ss_align = *(_OWORD *)objc_msgSend_bytes(v216, v60, v61, v62);
              v63 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                int v64 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                *(_DWORD *)buf = 67109120;
                LODWORD(v230) = v64;
                _os_log_impl(&dword_19D9BE000, v63, OS_LOG_TYPE_DEFAULT, "QR IPv6 port number: %d", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v212 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                  _IDSLogTransport(@"GL", @"IDS", @"QR IPv6 port number: %d");
                  if (_IDSShouldLog())
                  {
                    uint64_t v212 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"QR IPv6 port number: %d");
                  }
                }
              }
              if (v54)
              {
                *(_WORD *)&self->_highPriorityServerAddressIPv6.ss_len = 7708;
                *(_WORD *)self->_highPriorityServerAddressIPv6.__ss_pad1 = __rev16(v54);
                id v216 = v216;
                v70 = (long long *)objc_msgSend_bytes(v216, v67, v68, v69);
                long long v66 = *v70;
                *(_OWORD *)&self->_highPriorityServerAddressIPv6.__ss_align = *v70;
              }
            }
            else
            {
              v82 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v86 = objc_msgSend_length(v216, v83, v84, v85);
                *(_DWORD *)buf = 134217984;
                uint64_t v230 = v86;
                _os_log_impl(&dword_19D9BE000, v82, OS_LOG_TYPE_DEFAULT, "QR IPv6 address length is: %lu != 16", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v212 = objc_msgSend_length(v216, v87, v65, *(double *)&v66);
                  _IDSLogTransport(@"GL", @"IDS", @"QR IPv6 address length is: %lu != 16");
                  if (_IDSShouldLog())
                  {
                    uint64_t v212 = objc_msgSend_length(v216, v88, v65, *(double *)&v66, v212);
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"QR IPv6 address length is: %lu != 16");
                  }
                }
              }
            }
          }
          else
          {
            v71 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v71, OS_LOG_TYPE_DEFAULT, "No IPV6 relay-address from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"No IPV6 relay-address from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"No IPV6 relay-address from sessionInfo.");
                }
              }
            }
            id v216 = 0;
          }
          v72 = (const char *)@"qv";
          if (@"qv") {
            v73 = (void *)CFDictionaryGetValue(v6, @"qv");
          }
          else {
            v73 = 0;
          }
          int v74 = objc_msgSend_unsignedCharValue(v73, v72, v65, *(double *)&v66, v212);
          if (!v74)
          {
            v81 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v81, OS_LOG_TYPE_DEFAULT, "invalid QR protocol version.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"invalid QR protocol version.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid QR protocol version.");
                }
              }
            }
            int64_t v14 = 13;
            goto LABEL_266;
          }
          self->_protocolVersion = v74;
          if (!@"qids"
            || (v75 = (void *)CFDictionaryGetValue(v6, @"qids"),
                (id v213 = v75) == 0))
          {
            v80 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "failed to get ids-session-id from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get ids-session-id from sessionInfo.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get ids-session-id from sessionInfo.");
                }
              }
            }
            int64_t v14 = 25;
            goto LABEL_266;
          }
          objc_storeStrong((id *)&self->_idsSessionID, v75);
          v78 = (const char *)@"qrpr";
          if (@"qrpr") {
            v79 = (void *)CFDictionaryGetValue(v6, @"qrpr");
          }
          else {
            v79 = 0;
          }
          self->_relayServerProviderType = objc_msgSend_unsignedIntValue(v79, v78, v76, v77);
          v89 = @"qrep";
          if (@"qrep") {
            v89 = (__CFString *)CFDictionaryGetValue(v6, @"qrep");
          }
          objc_storeStrong((id *)&self->_reportingDataBlob, v89);
          v92 = (const char *)@"qri";
          if (@"qri") {
            v93 = (void *)CFDictionaryGetValue(v6, @"qri");
          }
          else {
            v93 = 0;
          }
          self->_participantID = objc_msgSend_unsignedLongLongValue(v93, v92, v90, v91);
          v96 = (const char *)@"IsInitiator";
          if (@"IsInitiator") {
            v97 = (void *)CFDictionaryGetValue(v6, @"IsInitiator");
          }
          else {
            v97 = 0;
          }
          self->_isInitiator = objc_msgSend_BOOLValue(v97, v96, v94, v95);
          v100 = (const char *)@"link-protocol";
          if (@"link-protocol") {
            v101 = (void *)CFDictionaryGetValue(v6, @"link-protocol");
          }
          else {
            v101 = 0;
          }
          self->_linkProtocol = (int)objc_msgSend_intValue(v101, v100, v98, v99);
          v104 = (const char *)@"ls";
          if (@"ls") {
            v105 = (void *)CFDictionaryGetValue(v6, @"ls");
          }
          else {
            v105 = 0;
          }
          self->_linkSuggestion = objc_msgSend_unsignedCharValue(v105, v104, v102, v103);
          v108 = (const char *)@"lc";
          if (@"lc") {
            v109 = (void *)CFDictionaryGetValue(v6, @"lc");
          }
          else {
            v109 = 0;
          }
          self->_linkScore = objc_msgSend_unsignedCharValue(v109, v108, v106, v107);
          v112 = (const char *)@"und2";
          if (@"und2") {
            v113 = (void *)CFDictionaryGetValue(v6, @"und2");
          }
          else {
            v113 = 0;
          }
          self->_uplinkNackDisabled = objc_msgSend_BOOLValue(v113, v112, v110, v111);
          v116 = (const char *)@"h2fdv2";
          if (@"h2fdv2") {
            v117 = (void *)CFDictionaryGetValue(v6, @"h2fdv2");
          }
          else {
            v117 = 0;
          }
          self->_h2FallbackDisabled = objc_msgSend_BOOLValue(v117, v116, v114, v115);
          v120 = (const char *)@"tled";
          if (@"tled") {
            v121 = (void *)CFDictionaryGetValue(v6, @"tled");
          }
          else {
            v121 = 0;
          }
          self->_transportLayerEncryptionDisabled = objc_msgSend_BOOLValue(v121, v120, v118, v119);
          v124 = (const char *)@"ipdd";
          if (@"ipdd") {
            v125 = (void *)CFDictionaryGetValue(v6, @"ipdd");
          }
          else {
            v125 = 0;
          }
          self->_ipDiscoveryDisabled = objc_msgSend_BOOLValue(v125, v124, v122, v123);
          v126 = @"qrexp";
          if (@"qrexp") {
            v126 = (__CFString *)CFDictionaryGetValue(v6, @"qrexp");
          }
          objc_storeStrong((id *)&self->_qrSessionExperiments, v126);
          v127 = @"qptp";
          if (@"qptp") {
            v127 = (__CFString *)CFDictionaryGetValue(v6, @"qptp");
          }
          objc_storeStrong((id *)&self->_pskTransportParameters, v127);
          v128 = @"qph3";
          if (@"qph3") {
            v128 = (__CFString *)CFDictionaryGetValue(v6, @"qph3");
          }
          objc_storeStrong((id *)&self->_pskH3Settings, v128);
          v131 = (const char *)@"x-internal";
          if (@"x-internal") {
            v132 = (void *)CFDictionaryGetValue(v6, @"x-internal");
          }
          else {
            v132 = 0;
          }
          self->_isInternal = objc_msgSend_BOOLValue(v132, v131, v129, v130);
          if (@"qal") {
            v133 = (void *)CFDictionaryGetValue(v6, @"qal");
          }
          else {
            v133 = 0;
          }
          id v214 = v133;
          id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend_addObjectsFromArray_(v134, v135, (uint64_t)v214, v136);
          long long v225 = 0u;
          long long v226 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          id obj = v134;
          uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v137, (uint64_t)&v223, v138, v228, 16);
          if (v139)
          {
            v140 = 0;
            uint64_t v141 = *(void *)v224;
            do
            {
              for (uint64_t i = 0; i != v139; ++i)
              {
                if (*(void *)v224 != v141) {
                  objc_enumerationMutation(obj);
                }
                CFDictionaryRef v143 = *(const __CFDictionary **)(*((void *)&v223 + 1) + 8 * i);
                if (v143) {
                  BOOL v144 = @"qri" == 0;
                }
                else {
                  BOOL v144 = 1;
                }
                if (v144) {
                  v145 = 0;
                }
                else {
                  v145 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v223 + 1) + 8 * i), @"qri");
                }
                id v146 = v145;
                v147 = NSNumber;
                uint64_t v151 = objc_msgSend_unsignedLongLongValue(v146, v148, v149, v150);
                v156 = objc_msgSend_numberWithUnsignedLongLong_(v147, v152, v151, v153);
                if (!v140) {
                  v140 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                if (v140 && v156) {
                  CFArrayAppendValue(v140, v156);
                }
                if (objc_msgSend_unsignedLongLongValue(v146, v154, v155, v157) == self->_participantID)
                {
                  v158 = 0;
                  if (v143 && @"tP") {
                    v158 = (void *)CFDictionaryGetValue(v143, @"tP");
                  }
                  id v159 = v158;
                  self->_isPseudoParticipant = MEMORY[0x19F3ADAA0]();
                }
              }
              uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v160, (uint64_t)&v223, v161, v228, 16);
            }
            while (v139);

            if (v140) {
              goto LABEL_226;
            }
          }
          else
          {
          }
          if (self->_allocateType == 3)
          {
            v162 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D9BE000, v162, OS_LOG_TYPE_DEFAULT, "failed to get recipient participant-id list.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"failed to get recipient participant-id list.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get recipient participant-id list.");
                }
              }
            }
            v140 = 0;
            int64_t v14 = 31;
LABEL_265:

LABEL_266:
LABEL_267:
            v36 = v217;
LABEL_268:

LABEL_269:
LABEL_270:

LABEL_271:
            goto LABEL_272;
          }
          v140 = 0;
LABEL_226:
          objc_storeStrong((id *)&self->_allParticipantIDs, v140);
          objc_msgSend_description(v140, v163, v164, v165);
          id v166 = (id)objc_claimAutoreleasedReturnValue();
          cut_dispatch_log_queue();
          if (@"default-local-device-cbuuid") {
            v167 = (void *)CFDictionaryGetValue(v6, @"default-local-device-cbuuid");
          }
          else {
            v167 = 0;
          }
          id v168 = v167;
          id v169 = objc_alloc(MEMORY[0x1E4F29128]);
          v172 = (NSUUID *)objc_msgSend_initWithUUIDString_(v169, v170, (uint64_t)v168, v171);
          defaultDeviceLocalCBUUID = self->_defaultDeviceLocalCBUUID;
          self->_defaultDeviceLocalCBUUID = v172;

          if (@"default-remote-device-cbuuid") {
            v174 = (void *)CFDictionaryGetValue(v6, @"default-remote-device-cbuuid");
          }
          else {
            v174 = 0;
          }
          id v175 = v174;
          id v176 = objc_alloc(MEMORY[0x1E4F29128]);
          v179 = (NSUUID *)objc_msgSend_initWithUUIDString_(v176, v177, (uint64_t)v175, v178);
          defaultDeviceRemoteCBUUID = self->_defaultDeviceRemoteCBUUID;
          self->_defaultDeviceRemoteCBUUID = v179;

          v181 = @"qgid";
          if (@"qgid") {
            v181 = (__CFString *)CFDictionaryGetValue(v6, @"qgid");
          }
          objc_storeStrong((id *)&self->_groupID, v181);
          v182 = @"qsgid";
          if (@"qsgid") {
            v182 = (__CFString *)CFDictionaryGetValue(v6, @"qsgid");
          }
          objc_storeStrong((id *)&self->_stableGroupID, v182);
          v183 = @"stream-info-published-streams";
          if (@"stream-info-published-streams") {
            v183 = (__CFString *)CFDictionaryGetValue(v6, @"stream-info-published-streams");
          }
          objc_storeStrong((id *)&self->_publishedStreams, v183);
          v184 = @"stream-info-subscribed-streams";
          if (@"stream-info-subscribed-streams") {
            v184 = (__CFString *)CFDictionaryGetValue(v6, @"stream-info-subscribed-streams");
          }
          objc_storeStrong((id *)&self->_subscribedStreams, v184);
          v187 = (const char *)@"stream-info-generation-counter";
          if (@"stream-info-generation-counter") {
            v188 = (void *)CFDictionaryGetValue(v6, @"stream-info-generation-counter");
          }
          else {
            v188 = 0;
          }
          self->_generationCounter = objc_msgSend_unsignedIntValue(v188, v187, v185, v186);
          v191 = (const char *)@"stream-info-max-concurrent-streams";
          if (@"stream-info-max-concurrent-streams") {
            v192 = (void *)CFDictionaryGetValue(v6, @"stream-info-max-concurrent-streams");
          }
          else {
            v192 = 0;
          }
          self->_maxConcurrentStreams = objc_msgSend_unsignedIntValue(v192, v191, v189, v190);
          v193 = @"participant-data-key";
          if (@"participant-data-key") {
            v193 = (__CFString *)CFDictionaryGetValue(v6, @"participant-data-key");
          }
          objc_storeStrong((id *)&self->_avcDataBlob, v193);
          v194 = @"initial-materials-key";
          if (@"initial-materials-key") {
            v194 = (__CFString *)CFDictionaryGetValue(v6, @"initial-materials-key");
          }
          objc_storeStrong((id *)&self->_initialServerDesiredMaterial, v194);
          if (@"initial-materials-signer-key") {
            v195 = CFDictionaryGetValue(v6, @"initial-materials-signer-key");
          }
          else {
            v195 = 0;
          }
          v196 = _Block_copy(v195);
          id initialServerDesiredMaterialSigner = self->_initialServerDesiredMaterialSigner;
          self->_id initialServerDesiredMaterialSigner = v196;

          v198 = @"quic-exchange-provider-key";
          if (@"quic-exchange-provider-key") {
            v198 = (__CFString *)CFDictionaryGetValue(v6, @"quic-exchange-provider-key");
          }
          objc_storeStrong((id *)&self->_quicMaterialExchangeProvider, v198);
          v201 = (const char *)@"gl-option-session-is-user-participant-initiated";
          if (@"gl-option-session-is-user-participant-initiated") {
            v202 = (void *)CFDictionaryGetValue(v6, @"gl-option-session-is-user-participant-initiated");
          }
          else {
            v202 = 0;
          }
          self->_sessionIsNonUserParticipantInitiated = objc_msgSend_unsignedIntValue(v202, v201, v199, v200) != 0;
          v205 = (const char *)@"gl-option-session-hand-off-over-qr-enabled";
          if (@"gl-option-session-hand-off-over-qr-enabled") {
            v206 = (void *)CFDictionaryGetValue(v6, @"gl-option-session-hand-off-over-qr-enabled");
          }
          else {
            v206 = 0;
          }
          self->_handOffOverQREnabled = objc_msgSend_BOOLValue(v206, v205, v203, v204);
          v209 = (const char *)@"gl-option-call-type";
          if (@"gl-option-call-type") {
            v210 = (void *)CFDictionaryGetValue(v6, @"gl-option-call-type");
          }
          else {
            v210 = 0;
          }
          self->_callType = objc_msgSend_unsignedIntValue(v210, v209, v207, v208);

          int64_t v14 = 0;
          goto LABEL_265;
        }
      }
    }
    v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "failed to get allocate-request-id from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"failed to get allocate-request-id from sessionInfo.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to get allocate-request-id from sessionInfo.");
        }
      }
    }
    int64_t v14 = 12;
  }
LABEL_272:

  return v14;
}

- (int64_t)allocateType
{
  return self->_allocateType;
}

- (double)allocateTime
{
  return self->_allocateTime;
}

- (NSString)allocateRequestID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)idsSessionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)relaySessionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)softwareData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)relayServerProviderType
{
  return self->_relayServerProviderType;
}

- (NSString)reportingDataBlob
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (NSArray)allParticipantIDs
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (int64_t)linkProtocol
{
  return self->_linkProtocol;
}

- (unsigned)linkSuggestion
{
  return self->_linkSuggestion;
}

- (unsigned)linkScore
{
  return self->_linkScore;
}

- (BOOL)uplinkNackDisabled
{
  return self->_uplinkNackDisabled;
}

- (BOOL)isPseudoParticipant
{
  return self->_isPseudoParticipant;
}

- (BOOL)h2FallbackDisabled
{
  return self->_h2FallbackDisabled;
}

- (BOOL)handOffOverQREnabled
{
  return self->_handOffOverQREnabled;
}

- (BOOL)transportLayerEncryptionDisabled
{
  return self->_transportLayerEncryptionDisabled;
}

- (BOOL)ipDiscoveryDisabled
{
  return self->_ipDiscoveryDisabled;
}

- (NSDictionary)qrSessionExperiments
{
  return (NSDictionary *)objc_getProperty(self, a2, 704, 1);
}

- (BOOL)sessionIsUserParticipantInitiated
{
  return self->_sessionIsUserParticipantInitiated;
}

- (NSString)pskTransportParameters
{
  return (NSString *)objc_getProperty(self, a2, 720, 1);
}

- (NSString)pskH3Settings
{
  return (NSString *)objc_getProperty(self, a2, 728, 1);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (NSUUID)defaultDeviceLocalCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 656, 1);
}

- (NSUUID)defaultDeviceRemoteCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 664, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 640, 1);
}

- (NSString)stableGroupID
{
  return (NSString *)objc_getProperty(self, a2, 648, 1);
}

- (NSArray)publishedStreams
{
  return (NSArray *)objc_getProperty(self, a2, 672, 1);
}

- (NSArray)subscribedStreams
{
  return (NSArray *)objc_getProperty(self, a2, 680, 1);
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (NSData)avcDataBlob
{
  return (NSData *)objc_getProperty(self, a2, 744, 1);
}

- (unsigned)ipPreference
{
  return self->_ipPreference;
}

- (NSSet)initialServerDesiredMaterial
{
  return (NSSet *)objc_getProperty(self, a2, 768, 1);
}

- (id)initialServerDesiredMaterialSigner
{
  return objc_getProperty(self, a2, 776, 1);
}

- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider
{
  return (IDSGroupQUICMaterialExchangeProvider *)objc_getProperty(self, a2, 792, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicMaterialExchangeProvider, 0);
  objc_storeStrong(&self->_initialServerDesiredMaterialSigner, 0);
  objc_storeStrong((id *)&self->_initialServerDesiredMaterial, 0);
  objc_storeStrong((id *)&self->_avcDataBlob, 0);
  objc_storeStrong((id *)&self->_pskH3Settings, 0);
  objc_storeStrong((id *)&self->_pskTransportParameters, 0);
  objc_storeStrong((id *)&self->_qrSessionExperiments, 0);
  objc_storeStrong((id *)&self->_subscribedStreams, 0);
  objc_storeStrong((id *)&self->_publishedStreams, 0);
  objc_storeStrong((id *)&self->_defaultDeviceRemoteCBUUID, 0);
  objc_storeStrong((id *)&self->_defaultDeviceLocalCBUUID, 0);
  objc_storeStrong((id *)&self->_stableGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_allParticipantIDs, 0);
  objc_storeStrong((id *)&self->_reportingDataBlob, 0);
  objc_storeStrong((id *)&self->_softwareData, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_idsSessionID, 0);
  objc_storeStrong((id *)&self->_allocateRequestID, 0);
}

@end