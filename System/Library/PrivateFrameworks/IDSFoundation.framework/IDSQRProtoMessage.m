@interface IDSQRProtoMessage
+ (id)dataWithEmptyUnAllocBindResponse;
- (BOOL)_setupAllocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupParticipantUpdateRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupPluginControlRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupPutmaterialRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupRegisterAckRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupRegisterRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupSessionInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupStatsRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupTestRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (BOOL)_setupUnallocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5;
- (IDSQRProtoMessage)initWithData:(id)a3;
- (IDSQRProtoMessage)initWithType:(int)a3 candidatePair:(id)a4 options:(id)a5;
- (double)startTime;
- (id)allocbindResponse;
- (id)data;
- (id)diagnosticIndication;
- (id)errorIndication;
- (id)getMaterialResponse;
- (id)goAwayIndication;
- (id)infoResponse;
- (id)participantUpdateIndication;
- (id)participantUpdateResponse;
- (id)pluginControlIndication;
- (id)pluginControlResponse;
- (id)putMaterialIndication;
- (id)putMaterialResponse;
- (id)reallocateIndication;
- (id)registerIndication;
- (id)registerResponse;
- (id)sessionInfoIndication;
- (id)sessionInfoResponse;
- (id)statsResponse;
- (id)testResponse;
- (id)unallocbindResponse;
- (int)messageType;
- (unint64_t)transactionID;
- (void)setStartTime:(double)a3;
- (void)setTransactionID:(unint64_t)a3;
@end

@implementation IDSQRProtoMessage

- (IDSQRProtoMessage)initWithType:(int)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v154.receiver = self;
  v154.super_class = (Class)IDSQRProtoMessage;
  v12 = [(IDSQRProtoMessage *)&v154 init];
  if (v12)
  {
    if (objc_msgSend_isRelayStunCandidatePair(v8, v10, v11, v13)
      && (objc_msgSend_isValidRelayStunCandidatePair(v8, v14, v15, v16) & 1) != 0)
    {
      v12->_startTime = ids_monotonic_time();
      v17 = objc_alloc_init(IDSQRProtoH3Message);
      message = v12->_message;
      v12->_message = v17;

      switch((int)v6)
      {
        case 15:
          v21 = objc_alloc_init(IDSQRProtoSessionInfoRequest);
          objc_msgSend_setSessioninfoRequest_(v12->_message, v22, (uint64_t)v21, v23);

          v27 = objc_msgSend_sessioninfoRequest(v12->_message, v24, v25, v26);
          char updated = objc_msgSend__setupSessionInfoRequest_candidatePair_options_(v12, v28, (uint64_t)v27, v29, v8, v9);

          goto LABEL_25;
        case 16:
        case 17:
        case 19:
        case 21:
        case 23:
        case 25:
        case 26:
        case 28:
        case 30:
        case 31:
          goto LABEL_29;
        case 18:
          v41 = objc_alloc_init(IDSQRProtoStatsRequest);
          objc_msgSend_setStatsRequest_(v12->_message, v42, (uint64_t)v41, v43);

          v47 = objc_msgSend_statsRequest(v12->_message, v44, v45, v46);
          char updated = objc_msgSend__setupStatsRequest_candidatePair_options_(v12, v48, (uint64_t)v47, v49, v8, v9);

          goto LABEL_25;
        case 20:
          v50 = objc_alloc_init(IDSQRProtoTestRequest);
          objc_msgSend_setTestRequest_(v12->_message, v51, (uint64_t)v50, v52);

          v56 = objc_msgSend_testRequest(v12->_message, v53, v54, v55);
          char updated = objc_msgSend__setupTestRequest_candidatePair_options_(v12, v57, (uint64_t)v56, v58, v8, v9);

          goto LABEL_25;
        case 22:
          v59 = objc_alloc_init(IDSQRProtoUnAllocBindRequest);
          objc_msgSend_setUnallocbindRequest_(v12->_message, v60, (uint64_t)v59, v61);

          v65 = objc_msgSend_unallocbindRequest(v12->_message, v62, v63, v64);
          char updated = objc_msgSend__setupUnallocbindRequest_candidatePair_options_(v12, v66, (uint64_t)v65, v67, v8, v9);

          goto LABEL_25;
        case 24:
          v68 = objc_alloc_init(IDSQRProtoPutMaterialRequest);
          objc_msgSend_setPutmaterialRequest_(v12->_message, v69, (uint64_t)v68, v70);

          v74 = objc_msgSend_putmaterialRequest(v12->_message, v71, v72, v73);
          char updated = objc_msgSend__setupPutmaterialRequest_candidatePair_options_(v12, v75, (uint64_t)v74, v76, v8, v9);

          goto LABEL_25;
        case 27:
          v78 = objc_msgSend_objectForKeyedSubscript_(v9, v19, @"gl-option-materials-request-key", v20);
          if (!v78) {
            goto LABEL_29;
          }
          objc_msgSend_setGetmaterialRequest_(v12->_message, v77, (uint64_t)v78, v79);

          goto LABEL_26;
        case 29:
          v80 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterRequest);
          objc_msgSend_setRegisterRequest_(v12->_message, v81, (uint64_t)v80, v82);

          v86 = objc_msgSend_registerRequest(v12->_message, v83, v84, v85);
          char updated = objc_msgSend__setupRegisterRequest_candidatePair_options_(v12, v87, (uint64_t)v86, v88, v8, v9);

          goto LABEL_25;
        case 32:
          v89 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterAckRequest);
          objc_msgSend_setRegisterAckRequest_(v12->_message, v90, (uint64_t)v89, v91);

          v95 = objc_msgSend_registerAckRequest(v12->_message, v92, v93, v94);
          char updated = objc_msgSend__setupRegisterAckRequest_candidatePair_options_(v12, v96, (uint64_t)v95, v97, v8, v9);

LABEL_25:
          if (updated)
          {
LABEL_26:
            v125 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
            {
              if ((v6 - 1) >= 0x20)
              {
                v128 = objc_msgSend_stringWithFormat_(NSString, v126, @"(unknown: %i)", v127, v6);
              }
              else
              {
                v128 = *(&off_1E5974FD8 + (int)v6 - 1);
              }
              v136 = v12->_message;
              *(_DWORD *)buf = 138412546;
              v156 = v128;
              __int16 v157 = 2112;
              v158 = v136;
              _os_log_impl(&dword_19D9BE000, v125, OS_LOG_TYPE_DEFAULT, "created %@ proto message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
            {
              if ((v6 - 1) >= 0x20)
              {
                v140 = objc_msgSend_stringWithFormat_(NSString, v137, @"(unknown: %i)", v139, v6);
              }
              else
              {
                v140 = *(&off_1E5974FD8 + (int)v6 - 1);
              }
              v150 = v140;
              v151 = v12->_message;
              _IDSLogTransport(@"GL", @"IDS", @"created %@ proto message %@");

              if (_IDSShouldLog())
              {
                if (v6 >= 0x25)
                {
                  v144 = objc_msgSend_stringWithFormat_(NSString, v137, @"(unknown: %i)", v139, v6, v151);
                }
                else
                {
                  v144 = *(&off_1E59750D8 + (int)v6);
                }
                v150 = v144;
                v151 = v12->_message;
                _IDSLogV(0, @"IDSFoundation", @"GL", @"created %@ proto message %@");
              }
            }
            if (v6 >= 0x25)
            {
              v146 = objc_msgSend_stringWithFormat_(NSString, v137, @"(unknown: %i)", v139, v6);
            }
            else
            {
              v146 = *(&off_1E59750D8 + (int)v6);
            }
            objc_msgSend_description(v12->_message, v137, v138, v139, v150, v151);
            v153 = v152 = v146;
            id v147 = v153;
            id v148 = v146;
            cut_dispatch_log_queue();

            goto LABEL_61;
          }
LABEL_29:
          v129 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            if (v6 >= 0x25)
            {
              v132 = objc_msgSend_stringWithFormat_(NSString, v130, @"(unknown: %i)", v131, v6);
            }
            else
            {
              v132 = *(&off_1E59750D8 + (int)v6);
            }
            *(_DWORD *)buf = 138412290;
            v156 = v132;
            _os_log_impl(&dword_19D9BE000, v129, OS_LOG_TYPE_DEFAULT, "failed to create %@ message", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            if (v6 >= 0x25)
            {
              v135 = objc_msgSend_stringWithFormat_(NSString, v133, @"(unknown: %i)", v134, v6);
            }
            else
            {
              v135 = *(&off_1E59750D8 + (int)v6);
            }
            _IDSLogTransport(@"GL", @"IDS", @"failed to create %@ message");

            if (_IDSShouldLog())
            {
              if (v6 >= 0x25)
              {
                v143 = objc_msgSend_stringWithFormat_(NSString, v141, @"(unknown: %i)", v142, v6);
              }
              else
              {
                v143 = *(&off_1E59750D8 + (int)v6);
              }
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create %@ message");
            }
          }
          break;
        default:
          switch((int)v6)
          {
            case 1:
              v32 = objc_alloc_init(IDSQRProtoAllocBindRequest);
              objc_msgSend_setAllocbindRequest_(v12->_message, v33, (uint64_t)v32, v34);

              v38 = objc_msgSend_allocbindRequest(v12->_message, v35, v36, v37);
              char updated = objc_msgSend__setupAllocbindRequest_candidatePair_options_(v12, v39, (uint64_t)v38, v40, v8, v9);

              goto LABEL_25;
            case 5:
              v98 = objc_alloc_init(IDSQRProtoInfoRequest);
              objc_msgSend_setInfoRequest_(v12->_message, v99, (uint64_t)v98, v100);

              v104 = objc_msgSend_infoRequest(v12->_message, v101, v102, v103);
              char updated = objc_msgSend__setupInfoRequest_candidatePair_options_(v12, v105, (uint64_t)v104, v106, v8, v9);

              goto LABEL_25;
            case 7:
              v107 = objc_alloc_init(IDSQRProtoParticipantUpdateRequest);
              objc_msgSend_setParticipantupdateRequest_(v12->_message, v108, (uint64_t)v107, v109);

              v113 = objc_msgSend_participantupdateRequest(v12->_message, v110, v111, v112);
              char updated = objc_msgSend__setupParticipantUpdateRequest_candidatePair_options_(v12, v114, (uint64_t)v113, v115, v8, v9);

              goto LABEL_25;
            case 10:
              v116 = objc_alloc_init(IDSQRProtoPluginControlRequest);
              objc_msgSend_setPlugincontrolRequest_(v12->_message, v117, (uint64_t)v116, v118);

              v122 = objc_msgSend_plugincontrolRequest(v12->_message, v119, v120, v121);
              char updated = objc_msgSend__setupPluginControlRequest_candidatePair_options_(v12, v123, (uint64_t)v122, v124, v8, v9);

              goto LABEL_25;
            default:
              goto LABEL_29;
          }
      }
    }
    else
    {
      v31 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "failed to create QRProtoMessage due to invalid relay candidate pair.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to create QRProtoMessage due to invalid relay candidate pair.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to create QRProtoMessage due to invalid relay candidate pair.");
          }
        }
      }
    }
    v145 = 0;
  }
  else
  {
LABEL_61:
    v145 = v12;
  }

  return v145;
}

- (BOOL)_setupAllocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v291 = *MEMORY[0x1E4F143B8];
  id v280 = a3;
  id v278 = a4;
  CFDictionaryRef theDict = (const __CFDictionary *)a5;
  v277 = objc_msgSend_softwareData(v278, v7, v8, v9);
  unint64_t v275 = objc_msgSend_length(v277, v10, v11, v12);
  if (v275 <= 2)
  {
    v137 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v288 = (uint64_t)v277;
      _os_log_impl(&dword_19D9BE000, v137, OS_LOG_TYPE_DEFAULT, "invalid software data %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"invalid software data %@");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid software data %@");
        }
      }
    }
  }
  else
  {
    id v13 = v277;
    uint64_t v17 = objc_msgSend_bytes(v13, v14, v15, v16);
    objc_msgSend_setServiceId_(v280, v18, __rev16(*(unsigned __int16 *)(v17 + 1)), v19);
    double v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v20, v21, v22);
    v274 = objc_msgSend_productName(v23, v24, v25, v26);

    v30 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v27, v28, v29);
    v273 = objc_msgSend_productVersion(v30, v31, v32, v33);

    double v37 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v34, v35, v36);
    v272 = objc_msgSend_productBuildVersion(v37, v38, v39, v40);

    v271 = objc_msgSend_stringWithFormat_(NSString, v41, @"%@,%@,%@", v42, v274, v273, v272);
    objc_msgSend_setClientOsVersion_(v280, v43, (uint64_t)v271, v44);
    v48 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v45, v46, v47);
    v270 = objc_msgSend_model(v48, v49, v50, v51);

    objc_msgSend_setClientHwVersion_(v280, v52, (uint64_t)v270, v53);
    uint64_t v59 = objc_msgSend_capabilityFlags(v278, v54, v55, v56);
    Value = 0;
    if (theDict)
    {
      v57 = (const char *)@"gl-option-is-lightweight-participant-key";
      if (@"gl-option-is-lightweight-participant-key") {
        Value = (void *)CFDictionaryGetValue(theDict, @"gl-option-is-lightweight-participant-key");
      }
    }
    int v64 = objc_msgSend_BOOLValue(Value, v57, v58, v60);
    v66 = 0;
    if (v64) {
      unint64_t v67 = v59 & 0xFFFFFFFFFFDF7FFFLL | 0x8000;
    }
    else {
      unint64_t v67 = v59;
    }
    if (theDict)
    {
      v62 = (const char *)@"gl-option-is-facetime-session";
      if (@"gl-option-is-facetime-session") {
        v66 = (void *)CFDictionaryGetValue(theDict, @"gl-option-is-facetime-session");
      }
    }
    int v68 = objc_msgSend_BOOLValue(v66, v62, v63, v65);
    int isSharedQRSession = objc_msgSend_isSharedQRSession(v278, v69, v70, v71);
    double v76 = 0;
    if ((isSharedQRSession & v68) != 0) {
      uint64_t v77 = v67 | 0x90000;
    }
    else {
      uint64_t v77 = v67;
    }
    if (theDict)
    {
      uint64_t v72 = (const char *)@"gl-option-uplink-nack-disabled";
      if (@"gl-option-uplink-nack-disabled") {
        double v76 = (void *)CFDictionaryGetValue(theDict, @"gl-option-uplink-nack-disabled");
      }
    }
    int v80 = objc_msgSend_BOOLValue(v76, v72, v73, v75);
    double v82 = 0;
    if (v80) {
      v77 &= ~0x80000uLL;
    }
    if (theDict)
    {
      v78 = (const char *)@"gs-shortmki-enabled-key";
      if (@"gs-shortmki-enabled-key") {
        double v82 = (void *)CFDictionaryGetValue(theDict, @"gs-shortmki-enabled-key");
      }
    }
    if (objc_msgSend_BOOLValue(v82, v78, v79, v81)) {
      v77 |= 0x800000uLL;
    }
    objc_msgSend_setCapabilities_(v280, v83, v77, v84);
    double v85 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v288 = v77;
      _os_log_impl(&dword_19D9BE000, v85, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: final capabilityFlags: %llx", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v263 = v77;
        _IDSLogTransport(@"GL", @"IDS", @"_setupAllocbindRequest: final capabilityFlags: %llx");
        if (_IDSShouldLog())
        {
          uint64_t v263 = v77;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_setupAllocbindRequest: final capabilityFlags: %llx");
        }
      }
    }
    uint64_t v89 = objc_msgSend_stateFlags(v278, v86, v87, v88, v263);
    objc_msgSend_setStateFlags_(v280, v90, v89, v91);
    v92 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v288) = v89;
      _os_log_impl(&dword_19D9BE000, v92, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: final stateFlags: %x", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v264 = v89;
        _IDSLogTransport(@"GL", @"IDS", @"_setupAllocbindRequest: final stateFlags: %x");
        if (_IDSShouldLog())
        {
          uint64_t v264 = v89;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_setupAllocbindRequest: final stateFlags: %x");
        }
      }
    }
    if (objc_msgSend_isSharedQRSession(v278, v93, v94, v95, v264))
    {
      v99 = objc_msgSend_relaySessionInfo(v278, v96, v97, v98);
      double v103 = objc_msgSend_publishedStreams(v99, v100, v101, v102);

      v107 = objc_msgSend_relaySessionInfo(v278, v104, v105, v106);
      uint64_t v111 = objc_msgSend_subscribedStreams(v107, v108, v109, v110);

      double v115 = objc_msgSend_relaySessionInfo(v278, v112, v113, v114);
      LODWORD(v107) = objc_msgSend_maxConcurrentStreams(v115, v116, v117, v118);

      sub_19DAEDFC4(v280, v103, v111, v107);
    }
    v119 = 0;
    if (theDict)
    {
      v96 = (const char *)@"gl-option-additional-binding";
      if (@"gl-option-additional-binding") {
        v119 = (void *)CFDictionaryGetValue(theDict, @"gl-option-additional-binding");
      }
    }
    char v120 = objc_msgSend_unsignedIntValue(v119, v96, v97, v98);
    if ((objc_msgSend_isSelfQRSession(v278, v121, v122, v123) & 1) == 0)
    {
      double v127 = objc_msgSend_local(v278, v124, v125, v126);
      unsigned int isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v127, v128, v129, v130);

      double v134 = (const char *)@"gl-option-should-auto-disconnect-for-standard-participant";
      if (@"gl-option-should-auto-disconnect-for-standard-participant") {
        BOOL v135 = theDict != 0;
      }
      else {
        BOOL v135 = 0;
      }
      if (v135) {
        v136 = (void *)CFDictionaryGetValue(theDict, @"gl-option-should-auto-disconnect-for-standard-participant");
      }
      else {
        v136 = 0;
      }
      int v138 = objc_msgSend_BOOLValue(v136, v134, v132, v133);
      double v142 = objc_msgSend_sharedInstance(IDSServerBag, v139, v140, v141);
      v145 = objc_msgSend_objectForKey_(v142, v143, @"ids-disallow-qr-auto-disconnect", v144);

      v146 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        id v147 = @"NO";
        if (v138) {
          id v148 = @"YES";
        }
        else {
          id v148 = @"NO";
        }
        if (v64) {
          id v147 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v288 = (uint64_t)v148;
        __int16 v289 = 2112;
        v290 = v147;
        _os_log_impl(&dword_19D9BE000, v146, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v152 = v138 ? @"YES" : @"NO";
        v153 = v64 ? @"YES" : @"NO";
        uint64_t v265 = (uint64_t)v152;
        v267 = v153;
        _IDSLogTransport(@"GL", @"IDS", @"_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@");
        if (_IDSShouldLog())
        {
          uint64_t v265 = (uint64_t)v152;
          v267 = v153;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@");
        }
      }
      uint64_t v154 = v120 & 0x30 | isCellularStunCandidate;
      if (v138)
      {
        if (objc_msgSend_BOOLValue(v145, v149, v150, v151))
        {
          v155 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v155, OS_LOG_TYPE_DEFAULT, "disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit");
              }
            }
          }
        }
        else
        {
          uint64_t v154 = v154 | 0x200;
        }
      }
      objc_msgSend_setChannelBindingInfo_(v280, v149, v154, v151, v265, v267);
      v156 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v288) = v154;
        _os_log_impl(&dword_19D9BE000, v156, OS_LOG_TYPE_DEFAULT, "channelBindingInfo: %u", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v265 = v154;
          _IDSLogTransport(@"GL", @"IDS", @"channelBindingInfo: %u");
          if (_IDSShouldLog())
          {
            uint64_t v265 = v154;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"channelBindingInfo: %u");
          }
        }
      }
    }
    v269 = 0;
    if (theDict && @"gl-option-qr-connection-id-avc-key")
    {
      v269 = (id)CFDictionaryGetValue(theDict, @"gl-option-qr-connection-id-avc-key");
      if (v269)
      {
        __int16 v157 = objc_alloc_init(IDSQRProtoQuicConnectionInfo);
        objc_msgSend_setQuicConnectionType_(v157, v158, 0, v159);
        objc_msgSend_setQuicConnectionId_(v157, v160, (uint64_t)v269, v161);
        objc_msgSend_addQuicConnectionInfo_(v280, v162, (uint64_t)v157, v163);
      }
      else
      {
        v269 = 0;
      }
    }
    v268 = 0;
    if (theDict && @"gl-option-qr-connection-id-ids-key")
    {
      v268 = (id)CFDictionaryGetValue(theDict, @"gl-option-qr-connection-id-ids-key");
      if (v268)
      {
        v164 = objc_alloc_init(IDSQRProtoQuicConnectionInfo);
        objc_msgSend_setQuicConnectionType_(v164, v165, 1, v166);
        objc_msgSend_setQuicConnectionId_(v164, v167, (uint64_t)v268, v168);
        objc_msgSend_addQuicConnectionInfo_(v280, v169, (uint64_t)v164, v170);
      }
      else
      {
        v268 = 0;
      }
    }
    id v276 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v173 = (const char *)@"gl-option-should-override-server-test-option-tle-disabled";
    if (@"gl-option-should-override-server-test-option-tle-disabled") {
      BOOL v174 = theDict != 0;
    }
    else {
      BOOL v174 = 0;
    }
    if (v174) {
      v175 = (void *)CFDictionaryGetValue(theDict, @"gl-option-should-override-server-test-option-tle-disabled");
    }
    else {
      v175 = 0;
    }
    if (objc_msgSend_BOOLValue(v175, v173, v171, v172, v265))
    {
      v179 = 0;
      if (theDict)
      {
        v176 = (const char *)@"gl-option-server-test-option-tle-disabled";
        if (@"gl-option-server-test-option-tle-disabled") {
          v179 = (void *)CFDictionaryGetValue(theDict, @"gl-option-server-test-option-tle-disabled");
        }
      }
      uint64_t v180 = objc_msgSend_BOOLValue(v179, v176, v177, v178);
      v181 = objc_alloc_init(IDSQRProtoExperimentOverride);
      objc_msgSend_setExperimentName_(v181, v182, @"tled", v183);
      objc_msgSend_setValue_(v181, v184, v180, v185);
      objc_msgSend_addObject_(v276, v186, (uint64_t)v181, v187);
    }
    if (objc_msgSend_count(v276, v176, v177, v178))
    {
      v191 = objc_alloc_init(IDSQRProtoAllocBindTestOption);
      objc_msgSend_setExperimentOverrides_(v191, v192, (uint64_t)v276, v193);
      objc_msgSend_setTestOption_(v280, v194, (uint64_t)v191, v195);
    }
    if (theDict)
    {
      v188 = @"gl-option-qr-session-experiments";
      if (@"gl-option-qr-session-experiments")
      {
        v196 = (id)CFDictionaryGetValue(theDict, @"gl-option-qr-session-experiments");
        if (v196)
        {
          v197 = v196;
          v198 = objc_msgSend_array(MEMORY[0x1E4F1CA48], (const char *)v188, v189, v190);
          objc_msgSend_setSessionExperiments_(v280, v199, (uint64_t)v198, v200);

          long long v284 = 0u;
          long long v285 = 0u;
          long long v282 = 0u;
          long long v283 = 0u;
          id v201 = v197;
          uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v202, (uint64_t)&v282, v203, v286, 16);
          if (!v205) {
            goto LABEL_144;
          }
          uint64_t v206 = *(void *)v283;
          uint64_t v207 = 138412546;
          while (1)
          {
            uint64_t v208 = 0;
            do
            {
              if (*(void *)v283 != v206) {
                objc_enumerationMutation(v201);
              }
              uint64_t v209 = *(void *)(*((void *)&v282 + 1) + 8 * v208);
              v210 = objc_msgSend_objectForKeyedSubscript_(v201, v204, v209, *(double *)&v207, v266, v267);
              v211 = objc_alloc_init(IDSQRProtoSessionExperiment);
              objc_msgSend_setExperimentName_(v211, v212, v209, v213);
              id v214 = v210;
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              id v217 = v214;
              if (isKindOfClass)
              {
                objc_msgSend_setStringValue_(v211, v216, (uint64_t)v217, v218);

LABEL_120:
                v219 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v288 = v209;
                  __int16 v289 = 2112;
                  v290 = v211;
                  _os_log_impl(&dword_19D9BE000, v219, OS_LOG_TYPE_DEFAULT, "qrexp %@=%@", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    uint64_t v266 = v209;
                    v267 = v211;
                    _IDSLogTransport(@"GL", @"IDS", @"qrexp %@=%@");
                    if (_IDSShouldLog())
                    {
                      uint64_t v266 = v209;
                      v267 = v211;
                      _IDSLogV(0, @"IDSFoundation", @"GL", @"qrexp %@=%@");
                    }
                  }
                }
                v223 = objc_msgSend_sessionExperiments(v280, v220, v221, v222, v266);
                objc_msgSend_addObject_(v223, v224, (uint64_t)v211, v225);

                goto LABEL_127;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CFTypeID v226 = CFGetTypeID(v217);
                LODWORD(v226) = v226 == CFBooleanGetTypeID();

                if (v226)
                {
                  uint64_t v230 = objc_msgSend_BOOLValue(v217, v227, v228, v229);
                  objc_msgSend_setBoolValue_(v211, v231, v230, v232);
                  goto LABEL_120;
                }
              }
              else
              {
              }
              CFNumberRef v233 = (const __CFNumber *)v217;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v234 = CFNumberIsFloatType(v233) == 0;

                if (v234)
                {
                  uint64_t v238 = objc_msgSend_intValue(v233, v235, v236, v237);
                  objc_msgSend_setInt32Value_(v211, v239, v238, v240);
                  goto LABEL_120;
                }
              }
              else
              {
              }
              v241 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v288 = v209;
                __int16 v289 = 2112;
                v290 = v233;
                _os_log_impl(&dword_19D9BE000, v241, OS_LOG_TYPE_DEFAULT, "qrexp %@ has unknown type (raw: %@)!", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v266 = v209;
                  v267 = v233;
                  _IDSLogTransport(@"GL", @"IDS", @"qrexp %@ has unknown type (raw: %@)!");
                  if (_IDSShouldLog())
                  {
                    uint64_t v266 = v209;
                    v267 = v233;
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"qrexp %@ has unknown type (raw: %@)!");
                  }
                }
              }
LABEL_127:

              ++v208;
            }
            while (v205 != v208);
            uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v204, (uint64_t)&v282, *(double *)&v207, v286, 16);
            uint64_t v205 = v242;
            if (!v242)
            {
LABEL_144:

              break;
            }
          }
        }
      }
    }
    if (theDict)
    {
      v188 = @"gl-option-qr-server-data-blob";
      if (@"gl-option-qr-server-data-blob")
      {
        v243 = (id)CFDictionaryGetValue(theDict, @"gl-option-qr-server-data-blob");
        if (v243)
        {
          v244 = v243;
          objc_msgSend_setServerBlob_(v280, (const char *)v188, (uint64_t)v243, v190);
        }
      }
    }
    if (theDict)
    {
      v188 = @"gl-option-ids-context-blob-key";
      if (@"gl-option-ids-context-blob-key")
      {
        v245 = (id)CFDictionaryGetValue(theDict, @"gl-option-ids-context-blob-key");
        if (v245)
        {
          v246 = v245;
          objc_msgSend_setClientContextBlob_(v280, (const char *)v188, (uint64_t)v245, v190);
        }
      }
    }
    v247 = 0;
    if (theDict)
    {
      v188 = @"gl-option-ids-context-reason-key";
      if (@"gl-option-ids-context-reason-key") {
        v247 = (void *)CFDictionaryGetValue(theDict, @"gl-option-ids-context-reason-key");
      }
    }
    uint64_t v249 = objc_msgSend_intValue(v247, (const char *)v188, v189, v190, v266);
    if (v249) {
      objc_msgSend_setReason_(v280, v248, v249, v250);
    }
    v251 = objc_msgSend_objectForKeyedSubscript_(theDict, v248, @"gl-option-materials-key", v250);
    objc_msgSend_setMaterials_(v280, v252, (uint64_t)v251, v253);

    v257 = objc_msgSend_materials(v280, v254, v255, v256);
    v261 = objc_msgSend_description(v257, v258, v259, v260);

    id v281 = v261;
    cut_dispatch_log_queue();
  }
  return v275 > 2;
}

- (BOOL)_setupInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v6 = a3;
  v10 = objc_msgSend_relaySessionToken(a4, v7, v8, v9);
  objc_msgSend_setAccessToken_(v6, v11, (uint64_t)v10, v12);
  objc_msgSend_setInfoFlags_(v6, v13, 7, v14);

  return 1;
}

- (BOOL)_setupParticipantUpdateRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    double v9 = (const char *)@"gl-option-participant-update-request-type";
    if (@"gl-option-participant-update-request-type") {
      Value = (void *)CFDictionaryGetValue(v11, @"gl-option-participant-update-request-type");
    }
  }
  uint64_t v14 = objc_msgSend_unsignedShortValue(Value, v9, v10, v12);
  objc_msgSend_setOperationFlags_(v7, v15, v14, v16);
  if (v14)
  {
    double v20 = 0;
    if (v11 && @"gl-option-participant-update-blocked-participantIDs") {
      double v20 = (void *)CFDictionaryGetValue(v11, @"gl-option-participant-update-blocked-participantIDs");
    }
    id v21 = v20;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v38, 0.0, v42, 16);
    if (v23)
    {
      uint64_t v27 = v23;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v21);
          }
          uint64_t v30 = objc_msgSend_unsignedLongLongValue(*(void **)(*((void *)&v38 + 1) + 8 * i), v24, v25, v26);
          objc_msgSend_addParticipantIdList_(v7, v31, v30, v32);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v38, v26, v42, 16);
      }
      while (v27);
    }
  }
  double v33 = 0;
  if (v11)
  {
    uint64_t v17 = (const char *)@"gl-option-participant-update-request-counter";
    if (@"gl-option-participant-update-request-counter") {
      double v33 = (void *)CFDictionaryGetValue(v11, @"gl-option-participant-update-request-counter");
    }
  }
  uint64_t v34 = objc_msgSend_unsignedIntValue(v33, v17, v18, v19);
  objc_msgSend_setSessionStateCounter_(v7, v35, v34, v36);

  return 1;
}

- (BOOL)_setupRegisterRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_candidatePairToken(v8, v10, v11, v12);
  if (v14)
  {
    double v16 = objc_msgSend_objectForKeyedSubscript_(v9, v13, @"gl-option-reliable-unicast-reliable-link-uuid", v15);
    double v19 = v16;
    if (!v16)
    {
      double v51 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "Will not send register request due to reliable link UUID!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Will not send register request due to reliable link UUID!");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request due to reliable link UUID!");
          }
        }
      }
      BOOL v49 = 0;
      goto LABEL_41;
    }
    memset(buf, 170, 16);
    objc_msgSend_getUUIDBytes_(v16, v17, (uint64_t)buf, v18);
    uint64_t v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v20, (uint64_t)buf, v21, 16);
    if (v23)
    {
      objc_msgSend_setE2eChannelUuid_(v7, v22, (uint64_t)v23, v24);
      uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v9, v25, @"gl-option-reliable-unicast-local-relay-id", v26);
      unsigned __int16 v31 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30);

      uint64_t v34 = v31;
      if (v31)
      {
        uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v9, v32, @"gl-option-reliable-unicast-remote-relay-id", v33);
        unsigned __int16 v39 = objc_msgSend_unsignedIntValue(v35, v36, v37, v38);

        if (v39)
        {
          long long v40 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo);
          objc_msgSend_setQuicClientLinkId_(v40, v41, v34, v42);
          objc_msgSend_setQuicServerLinkId_(v40, v43, v39, v44);
          objc_msgSend_setServerGeneratedConnectionIds_(v40, v45, 1, v46);
          objc_msgSend_setChannelInfo_(v7, v47, (uint64_t)v40, v48);

          BOOL v49 = 1;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        uint64_t v54 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v56 = 0;
          _os_log_impl(&dword_19D9BE000, v54, OS_LOG_TYPE_DEFAULT, "Will not send register request, invalid remote relay link ID!", v56, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Will not send register request, invalid remote relay link ID!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request, invalid remote relay link ID!");
            }
          }
        }
      }
      else
      {
        double v53 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v56 = 0;
          _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "Will not send register request, invalid local relay link ID!", v56, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Will not send register request, invalid local relay link ID!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request, invalid local relay link ID!");
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
        *(_WORD *)double v56 = 0;
        _os_log_impl(&dword_19D9BE000, v52, OS_LOG_TYPE_DEFAULT, "Will not send register request, can not convert UUID to NSData!", v56, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Will not send register request, can not convert UUID to NSData!");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register request, can not convert UUID to NSData!");
          }
        }
      }
    }
    BOOL v49 = 0;
    goto LABEL_40;
  }
  uint64_t v50 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidatePairToken!", buf, 2u);
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
  BOOL v49 = 0;
LABEL_42:

  return v49;
}

- (BOOL)_setupRegisterAckRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_candidatePairToken(v8, v10, v11, v12);
  if (v14)
  {
    double v16 = objc_msgSend_objectForKeyedSubscript_(v9, v13, @"gl-option-reliable-unicast-reliable-link-uuid", v15);
    double v19 = v16;
    if (v16)
    {
      memset(buf, 170, 16);
      objc_msgSend_getUUIDBytes_(v16, v17, (uint64_t)buf, v18);
      uint64_t v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v20, (uint64_t)buf, v21, 16);
      BOOL v25 = v23 != 0;
      if (v23)
      {
        objc_msgSend_setE2eChannelUuid_(v7, v22, (uint64_t)v23, v24);
        objc_msgSend_setAccept_(v7, v26, 1, v27);
      }
      else
      {
        double v30 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v32 = 0;
          _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "Will not send register ack request, can not convert UUID to NSData!", v32, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request, can not convert UUID to NSData!");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request, can not convert UUID to NSData!");
            }
          }
        }
      }
    }
    else
    {
      uint64_t v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid reliable link UUID!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Will not send register ack request due to invalid reliable link UUID!");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Will not send register ack request due to invalid reliable link UUID!");
          }
        }
      }
      BOOL v25 = 0;
    }
  }
  else
  {
    uint64_t v28 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePairToken!", buf, 2u);
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
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_setupPluginControlRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    id v9 = (const char *)@"gl-option-plugin-operation";
    if (@"gl-option-plugin-operation") {
      Value = (void *)CFDictionaryGetValue(v11, @"gl-option-plugin-operation");
    }
  }
  uint64_t v14 = objc_msgSend_unsignedIntValue(Value, v9, v10, v12);
  double v15 = 0;
  if (v11 && @"gl-option-plugin-name") {
    double v15 = (void *)CFDictionaryGetValue(v11, @"gl-option-plugin-name");
  }
  id v16 = v15;
  uint64_t v17 = 0;
  if (v11 && @"gl-option-plugin-raw-public-key") {
    uint64_t v17 = (void *)CFDictionaryGetValue(v11, @"gl-option-plugin-raw-public-key");
  }
  id v18 = v17;
  objc_msgSend_setPluginOperation_(v7, v19, v14, v20);
  objc_msgSend_setPluginName_(v7, v21, (uint64_t)v16, v22);
  objc_msgSend_setPluginClientRawPublicKey_(v7, v23, (uint64_t)v18, v24);

  return 1;
}

- (BOOL)_setupSessionInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v9 = (const __CFDictionary *)a5;
  char isSharedQRSession = objc_msgSend_isSharedQRSession(v8, v10, v11, v12);
  if (isSharedQRSession)
  {
    Value = 0;
    if (v9)
    {
      id v13 = (const char *)@"gl-option-sessioninfo-request-type";
      if (@"gl-option-sessioninfo-request-type") {
        Value = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-request-type");
      }
    }
    if (objc_msgSend_intValue(Value, v13, v14, v16) == 2)
    {
      double v21 = 0;
      if (v9)
      {
        id v18 = @"gl-option-sessioninfo-generation-counter";
        if (@"gl-option-sessioninfo-generation-counter") {
          double v21 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-generation-counter");
        }
      }
      uint64_t v22 = objc_msgSend_unsignedIntValue(v21, (const char *)v18, v19, v20);
      objc_msgSend_setGenerationCounter_(v7, v23, v22, v24);
      BOOL v25 = 0;
      if (v9 && @"gl-option-sessioninfo-published-streams") {
        BOOL v25 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-published-streams");
      }
      id v26 = v25;
      double v27 = 0;
      if (v9 && @"gl-option-sessioninfo-subscribed-streams") {
        double v27 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-subscribed-streams");
      }
      id v30 = v27;
      double v32 = 0;
      if (v9)
      {
        uint64_t v28 = (const char *)@"gl-option-sessioninfo-max-concurrent-streams";
        if (@"gl-option-sessioninfo-max-concurrent-streams") {
          double v32 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-max-concurrent-streams");
        }
      }
      unsigned int v33 = objc_msgSend_unsignedCharValue(v32, v28, v29, v31);
      sub_19DAEDFC4(v7, v26, v30, v33);
      uint64_t v37 = 0;
      if (v9)
      {
        uint64_t v34 = (const char *)@"gl-option-sessioninfo-relay-link-id";
        if (@"gl-option-sessioninfo-relay-link-id") {
          uint64_t v37 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-relay-link-id");
        }
      }
      uint64_t v38 = objc_msgSend_unsignedShortValue(v37, v34, v35, v36);
      if (v38) {
        objc_msgSend_setLinkId_(v7, v39, v38, v40);
      }
    }
    long long v41 = 0;
    if (v9)
    {
      id v18 = @"gl-option-sessioninfo-command-flag";
      if (@"gl-option-sessioninfo-command-flag") {
        long long v41 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-command-flag");
      }
    }
    uint64_t v42 = objc_msgSend_unsignedIntValue(v41, (const char *)v18, v19, v20);
    if (v42) {
      objc_msgSend_setCommandFlags_(v7, v43, v42, v45);
    }
    double v46 = 0;
    if (v9)
    {
      uint64_t v43 = (const char *)@"gl-option-sessioninfo-request-id";
      if (@"gl-option-sessioninfo-request-id") {
        double v46 = (void *)CFDictionaryGetValue(v9, @"gl-option-sessioninfo-request-id");
      }
    }
    uint64_t v47 = objc_msgSend_unsignedIntValue(v46, v43, v44, v45);
    if (v47) {
      objc_msgSend_setRequestId_(v7, v48, v47, v49);
    }
  }
  else
  {
    uint64_t v50 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v52 = 0;
      _os_log_impl(&dword_19D9BE000, v50, OS_LOG_TYPE_DEFAULT, "session-info is not allowed in non-shared QR session", v52, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"session-info is not allowed in non-shared QR session");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"session-info is not allowed in non-shared QR session");
        }
      }
    }
  }

  return isSharedQRSession;
}

- (BOOL)_setupPutmaterialRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v8, @"gl-option-materials-key", v9);
  objc_msgSend_setMaterials_(v7, v11, (uint64_t)v10, v12);

  double v15 = objc_msgSend_objectForKeyedSubscript_(v6, v13, @"gl-option-materials-key", v14);

  uint64_t v19 = objc_msgSend_description(v15, v16, v17, v18);

  id v20 = v19;
  cut_dispatch_log_queue();

  return 1;
}

- (BOOL)_setupStatsRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v8 = a3;
  CFDictionaryRef v9 = (const __CFDictionary *)a5;
  double startTime = self->_startTime;
  id v11 = a4;
  unint64_t v12 = ntpTime32(startTime);
  objc_msgSend_serverLatency(v11, v13, v14, v15);
  double v17 = v16;

  objc_msgSend_setClientTimestampNtp_(v8, v18, v12, v17 * 1000.0);
  if ((v17 * 1000.0)) {
    objc_msgSend_setClientLatencyMs_(v8, v19, (v17 * 1000.0), v20);
  }
  if (v9) {
    BOOL v21 = @"gl-option-stats-sent-packets" == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;
  if (!v21 && CFDictionaryGetValue(v9, @"gl-option-stats-sent-packets")) {
    goto LABEL_15;
  }
  if (!v9
    || !@"gl-option-stats-received-packets"
    || !CFDictionaryGetValue(v9, @"gl-option-stats-received-packets"))
  {
    goto LABEL_21;
  }
  if (v22) {
LABEL_15:
  }
    Value = (void *)CFDictionaryGetValue(v9, @"gl-option-stats-sent-packets");
  else {
    Value = 0;
  }
  uint64_t v27 = objc_msgSend_unsignedIntValue(Value, v23, v24, v25);
  objc_msgSend_setSentPackets_(v8, v28, v27, v29);
  unsigned int v33 = 0;
  if (v9 && @"gl-option-stats-received-packets") {
    unsigned int v33 = (void *)CFDictionaryGetValue(v9, @"gl-option-stats-received-packets");
  }
  uint64_t v34 = objc_msgSend_unsignedIntValue(v33, v30, v31, v32);
  objc_msgSend_setReceivedPackets_(v8, v35, v34, v36);
LABEL_21:

  return 1;
}

- (BOOL)_setupTestRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    CFDictionaryRef v9 = (const char *)@"gl-option-test-options-flags";
    if (@"gl-option-test-options-flags") {
      Value = (void *)CFDictionaryGetValue(v11, @"gl-option-test-options-flags");
    }
  }
  uint64_t v16 = objc_msgSend_unsignedIntValue(Value, v9, v10, v12);
  double v18 = 0;
  if (v11)
  {
    uint64_t v14 = (const char *)@"gl-option-test-requested-message-type";
    if (@"gl-option-test-requested-message-type") {
      double v18 = (void *)CFDictionaryGetValue(v11, @"gl-option-test-requested-message-type");
    }
  }
  unsigned __int16 v21 = objc_msgSend_unsignedIntValue(v18, v14, v15, v17);
  uint64_t v23 = 0;
  if (v11)
  {
    uint64_t v19 = (const char *)@"gl-option-test-requested-error-code-type";
    if (@"gl-option-test-requested-error-code-type") {
      uint64_t v23 = (void *)CFDictionaryGetValue(v11, @"gl-option-test-requested-error-code-type");
    }
  }
  unsigned __int16 v24 = objc_msgSend_unsignedIntValue(v23, v19, v20, v22);
  double v25 = 0;
  if (v11 && @"gl-option-test-sub-operation") {
    double v25 = (void *)CFDictionaryGetValue(v11, @"gl-option-test-sub-operation");
  }
  id v26 = v25;
  objc_msgSend_setTestOptionFlags_(v7, v27, v16, v28);
  if (v16 == 8)
  {
    uint64_t v31 = v21;
    objc_msgSend_setRequestedMessageType_(v7, v29, v31, v30);
    uint64_t v32 = v24;
    objc_msgSend_setRequestedErrorCode_(v7, v33, v32, v34);
    uint64_t v35 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v41 = 8;
      __int16 v42 = 1024;
      int v43 = v31;
      __int16 v44 = 1024;
      int v45 = v32;
      _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, "testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v38 = v31;
        uint64_t v39 = v32;
        uint64_t v37 = 8;
        _IDSLogTransport(@"GL", @"IDS", @"testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u");
        if (_IDSShouldLog())
        {
          uint64_t v38 = v31;
          uint64_t v39 = v32;
          uint64_t v37 = 8;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u");
        }
      }
    }
  }
  objc_msgSend_setSubOperation_(v7, v29, (uint64_t)v26, v30, v37, v38, v39);

  return 1;
}

- (BOOL)_setupUnallocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  CFDictionaryRef v9 = (const __CFDictionary *)a5;
  CFDictionaryRef v13 = v9;
  if (v9)
  {
    uint64_t v10 = @"gl-option-ids-context-blob-key";
    if (@"gl-option-ids-context-blob-key")
    {
      uint64_t v14 = (id)CFDictionaryGetValue(v9, @"gl-option-ids-context-blob-key");
      if (v14)
      {
        uint64_t v15 = v14;
        objc_msgSend_setClientContextBlob_(v7, (const char *)v10, (uint64_t)v14, v12);
      }
    }
  }
  Value = 0;
  if (v13)
  {
    uint64_t v10 = @"gl-option-ids-context-reason-key";
    if (@"gl-option-ids-context-reason-key") {
      Value = (void *)CFDictionaryGetValue(v13, @"gl-option-ids-context-reason-key");
    }
  }
  uint64_t v17 = objc_msgSend_intValue(Value, (const char *)v10, v11, v12);
  objc_msgSend_setReason_(v7, v18, v17, v19);

  return 1;
}

- (IDSQRProtoMessage)initWithData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IDSQRProtoMessage;
  v5 = [(IDSQRProtoMessage *)&v31 init];
  if (v5)
  {
    v5->_double startTime = ids_monotonic_time();
    id v6 = [IDSQRProtoH3Message alloc];
    uint64_t v9 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v4, v8);
    message = v5->_message;
    v5->_message = (IDSQRProtoH3Message *)v9;

    uint64_t v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = v5->_message;
      *(_DWORD *)buf = 138412546;
      unsigned int v33 = v12;
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "created proto message %@ with %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v29 = v5->_message;
        id v30 = v4;
        _IDSLogTransport(@"GL", @"IDS", @"created proto message %@ with %@");
        if (_IDSShouldLog())
        {
          double v29 = v5->_message;
          id v30 = v4;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"created proto message %@ with %@");
        }
      }
    }
    uint64_t v16 = objc_msgSend_description(v5->_message, v13, v14, v15, v29, v30);
    uint64_t v20 = objc_msgSend_debugDescription(v4, v17, v18, v19);
    id v21 = v16;
    id v22 = v20;
    cut_dispatch_log_queue();
    id v26 = v5->_message;
    if (!v26 || !objc_msgSend_hasInnerMessage(v26, v23, v24, v25))
    {

      uint64_t v27 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v27 = v5;
LABEL_13:

  return v27;
}

- (id)allocbindResponse
{
  if (objc_msgSend_innerMessage(self->_message, a2, v2, v3) == 2
    && objc_msgSend_hasAllocbindResponse(self->_message, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_allocbindResponse(self->_message, v8, v9, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)infoResponse
{
  if (objc_msgSend_hasInfoResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_infoResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)participantUpdateResponse
{
  if (objc_msgSend_hasParticipantupdateResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_participantupdateResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)pluginControlResponse
{
  if (objc_msgSend_hasPlugincontrolResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_plugincontrolResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)sessionInfoResponse
{
  if (objc_msgSend_hasSessioninfoResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_sessioninfoResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)getMaterialResponse
{
  if (objc_msgSend_hasGetmaterialResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_getmaterialResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)putMaterialResponse
{
  if (objc_msgSend_hasPutmaterialResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_putmaterialResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)statsResponse
{
  if (objc_msgSend_hasStatsResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_statsResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)testResponse
{
  if (objc_msgSend_hasTestResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_testResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)unallocbindResponse
{
  if (objc_msgSend_hasUnallocbindResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_unallocbindResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)diagnosticIndication
{
  if (objc_msgSend_hasDiagnosticIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_diagnosticIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)errorIndication
{
  if (objc_msgSend_hasErrorIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_errorIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)goAwayIndication
{
  if (objc_msgSend_hasGoawayIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_goawayIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)participantUpdateIndication
{
  if (objc_msgSend_hasParticipantupdateIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_participantupdateIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)pluginControlIndication
{
  if (objc_msgSend_hasPlugincontrolIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_plugincontrolIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)reallocateIndication
{
  if (objc_msgSend_hasReallocateIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_reallocateIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)sessionInfoIndication
{
  if (objc_msgSend_hasSessioninfoIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_sessioninfoIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)putMaterialIndication
{
  if (objc_msgSend_hasPutmaterialIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_putmaterialIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)registerIndication
{
  if (objc_msgSend_hasRegisterIndication(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_registerIndication(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)registerResponse
{
  if (objc_msgSend_hasRegisterResponse(self->_message, a2, v2, v3))
  {
    double v8 = objc_msgSend_registerResponse(self->_message, v5, v6, v7);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)data
{
  return (id)objc_msgSend_data(self->_message, a2, v2, v3);
}

- (int)messageType
{
  return objc_msgSend_innerMessage(self->_message, a2, v2, v3);
}

+ (id)dataWithEmptyUnAllocBindResponse
{
  uint64_t v2 = objc_alloc_init(IDSQRProtoH3Message);
  double v3 = objc_alloc_init(IDSQRProtoUnAllocBindResponse);
  objc_msgSend_setUnallocbindResponse_(v2, v4, (uint64_t)v3, v5);

  uint64_t v9 = objc_msgSend_data(v2, v6, v7, v8);

  return v9;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (void).cxx_destruct
{
}

@end