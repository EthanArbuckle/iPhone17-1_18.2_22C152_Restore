@interface NEIKEv2CreateChildPacket
+ (NSObject)createRekeyRequestChildSA:(uint64_t)a1;
+ (id)copyTypeDescription;
+ (id)createChildSAResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:;
+ (unint64_t)exchangeType;
- (BOOL)isRekeyIKE;
- (uint64_t)validateRekeyResponseChildSA:(uint64_t)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2CreateChildPacket

+ (NSObject)createRekeyRequestChildSA:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  self;
  if (!v2)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v87 = "%s called with null childSA";
    goto LABEL_49;
  }
  id v4 = objc_getProperty(v2, v3, 176, 1);

  if (!v4)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_34:
      v82 = 0;
      goto LABEL_59;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v87 = "%s called with null childSA.rekeyRequestProposals";
LABEL_49:
    _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, v87, (uint8_t *)&v90, 0xCu);
    goto LABEL_34;
  }
  v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2CreateChildPacket alloc]);
  if (!v6)
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v90) = 0;
      _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed", (uint8_t *)&v90, 2u);
    }
    goto LABEL_57;
  }
  id Property = objc_getProperty(v2, v5, 56, 1);
  v9 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v8, 80, 1);
  }
  id v10 = Property;
  self;
  if (v10)
  {
    v11 = objc_alloc_init(NEIKEv2NotifyPayload);
    p_super = &v11->super.super;
    if (v11)
    {
      v11->_notifyType = 16393;
      objc_setProperty_atomic(v11, v12, v10, 40);
    }
  }
  else
  {
    v89 = ne_log_obj();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
    {
      int v90 = 136315138;
      v91 = "+[NEIKEv2NotifyPayload createNotifyPayloadType:spi:]";
      _os_log_fault_impl(&dword_19DDAF000, v89, OS_LOG_TYPE_FAULT, "%s called with null spi", (uint8_t *)&v90, 0xCu);
    }

    p_super = 0;
  }

  if (!-[NEIKEv2Packet addNotifyPayload:](v6, p_super))
  {
    v83 = ne_log_obj();
    if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
      goto LABEL_56;
    }
    LOWORD(v90) = 0;
    v84 = "[packet addNotification:NEIKEv2NotifyTypeRekeySA] failed";
LABEL_39:
    v85 = v83;
    uint32_t v86 = 2;
LABEL_55:
    _os_log_fault_impl(&dword_19DDAF000, v85, OS_LOG_TYPE_FAULT, v84, (uint8_t *)&v90, v86);
    goto LABEL_56;
  }
  id v15 = objc_getProperty(v2, v14, 48, 1);
  uint64_t v16 = [v15 mode];

  if (v16 == 1 && !-[NEIKEv2Packet addNotification:data:](v6, 0x4007uLL, 0))
  {
    v83 = ne_log_obj();
    if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
      goto LABEL_56;
    }
    LOWORD(v90) = 0;
    v84 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
    goto LABEL_39;
  }
  v17 = objc_alloc_init(NEIKEv2ChildSAPayload);
  objc_setProperty_atomic(v6, v18, v17, 96);

  id v20 = objc_getProperty(v2, v19, 176, 1);
  v22 = objc_getProperty(v6, v21, 96, 1);
  v24 = v22;
  if (v22) {
    objc_setProperty_atomic(v22, v23, v20, 24);
  }

  if ([(NEIKEv2ChildSA *)v2 shouldGenerateNewDHKeys])
  {
    v27 = objc_alloc_init(NEIKEv2KeyExchangePayload);
    objc_setProperty_atomic(v6, v28, v27, 104);

    v30 = [(NEIKEv2ChildSA *)v2 preferredKEMProtocol];
    v32 = objc_getProperty(v6, v31, 104, 1);
    v34 = v32;
    if (v32) {
      objc_setProperty_atomic(v32, v33, v30, 24);
    }

    id v36 = objc_getProperty(v2, v35, 112, 1);
    v37 = v36;
    if (v36) {
      v38 = (void *)*((void *)v36 + 2);
    }
    else {
      v38 = 0;
    }
    id v39 = v38;
    v41 = objc_getProperty(v6, v40, 104, 1);
    v43 = v41;
    if (v41) {
      objc_setProperty_atomic(v41, v42, v39, 32);
    }

    v45 = objc_getProperty(v6, v44, 104, 1);
    char v46 = -[NEIKEv2Payload isValid]((uint64_t)v45);

    if ((v46 & 1) == 0)
    {
      v83 = ne_log_obj();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
        goto LABEL_56;
      }
      int v90 = 136315138;
      v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
      v84 = "%s called with null packet.ke.isValid";
      goto LABEL_54;
    }
  }
  v47 = objc_getProperty(v6, v26, 96, 1);
  char v48 = -[NEIKEv2Payload isValid]((uint64_t)v47);

  if ((v48 & 1) == 0)
  {
    v83 = ne_log_obj();
    if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
      goto LABEL_56;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v84 = "%s called with null packet.childSA.isValid";
LABEL_54:
    v85 = v83;
    uint32_t v86 = 12;
    goto LABEL_55;
  }
  v49 = objc_alloc_init(NEIKEv2NoncePayload);
  objc_setProperty_atomic(v6, v50, v49, 112);

  v52 = objc_getProperty(v2, v51, 80, 1);
  v54 = objc_getProperty(v6, v53, 112, 1);
  v56 = v54;
  if (v54) {
    objc_setProperty_atomic(v54, v55, v52, 24);
  }

  v58 = objc_getProperty(v6, v57, 112, 1);
  char v59 = -[NEIKEv2Payload isValid]((uint64_t)v58);

  if ((v59 & 1) == 0)
  {
    v83 = ne_log_obj();
    if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
      goto LABEL_56;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v84 = "%s called with null packet.nonce.isValid";
    goto LABEL_54;
  }
  v60 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
  objc_setProperty_atomic(v6, v61, v60, 128);

  v63 = [(NEIKEv2ChildSA *)v2 initiatorTrafficSelectors];
  v65 = objc_getProperty(v6, v64, 128, 1);
  v67 = v65;
  if (v65) {
    objc_setProperty_atomic(v65, v66, v63, 24);
  }

  v69 = objc_getProperty(v6, v68, 128, 1);
  char v70 = -[NEIKEv2Payload isValid]((uint64_t)v69);

  if ((v70 & 1) == 0)
  {
    v83 = ne_log_obj();
    if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
      goto LABEL_56;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v84 = "%s called with null packet.tsi.isValid";
    goto LABEL_54;
  }
  v71 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
  objc_setProperty_atomic(v6, v72, v71, 136);

  v74 = [(NEIKEv2ChildSA *)v2 responderTrafficSelectors];
  v76 = objc_getProperty(v6, v75, 136, 1);
  v78 = v76;
  if (v76) {
    objc_setProperty_atomic(v76, v77, v74, 24);
  }

  v80 = objc_getProperty(v6, v79, 136, 1);
  char v81 = -[NEIKEv2Payload isValid]((uint64_t)v80);

  if ((v81 & 1) == 0)
  {
    v83 = ne_log_obj();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
    {
      int v90 = 136315138;
      v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
      v84 = "%s called with null packet.tsr.isValid";
      goto LABEL_54;
    }
LABEL_56:

LABEL_57:
    v82 = 0;
    goto LABEL_58;
  }
  v82 = v6;
LABEL_58:

LABEL_59:

  return v82;
}

- (uint64_t)validateRekeyResponseChildSA:(uint64_t)a1
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (!v3)
    {
      v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v161 = "-[NEIKEv2CreateChildPacket(Exchange) validateRekeyResponseChildSA:]";
        _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
      }
LABEL_35:
      a1 = 0;
LABEL_122:

      goto LABEL_123;
    }
    if ([(NEIKEv2Packet *)(void *)a1 hasErrors])
    {
      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      v7 = objc_getProperty((id)a1, v6, 64, 1);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v156 objects:v166 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v157;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v157 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(__CFString **)(*((void *)&v156 + 1) + 8 * v11);
          if (v12)
          {
            if ((unint64_t)(v12->length - 1) <= 0x3FFE) {
              break;
            }
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v156 objects:v166 count:16];
            if (v9) {
              goto LABEL_6;
            }
            goto LABEL_13;
          }
        }
        v30 = ne_log_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v73 = (char *)[(id)a1 copyShortDescription];
          v74 = -[NEIKEv2NotifyPayload copyError](v12);
          *(_DWORD *)buf = 138412546;
          v161 = v73;
          __int16 v162 = 2112;
          uint64_t v163 = (uint64_t)v74;
          _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ Rekey child received notify error %@", buf, 0x16u);
        }
        if (v12->length == 17)
        {
          v32 = (char *)objc_getProperty(v12, v31, 32, 1);
          uint64_t v16 = v32;
          if (v32)
          {
            *(_WORD *)buf = 0;
            [v32 getBytes:buf length:2];
            v33 = [NEIKEv2KEMProtocol alloc];
            v34 = [(NEIKEv2KEMProtocol *)v33 initWithMethod:bswap32(*(unsigned __int16 *)buf) >> 16];
            objc_setProperty_atomic(v5, v35, v34, 96);
          }
          goto LABEL_34;
        }
        goto LABEL_35;
      }
LABEL_13:
    }
    id v13 = objc_getProperty(v5, v6, 48, 1);
    if ([v13 mode] == 1)
    {
      char v14 = -[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4007);

      if ((v14 & 1) == 0)
      {
        v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = (char *)[(id)a1 copyShortDescription];
          *(_DWORD *)buf = 138412290;
          v161 = v16;
          _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA was not accepted", buf, 0xCu);
LABEL_34:
        }
        goto LABEL_35;
      }
    }
    else
    {
    }
    id Property = objc_getProperty((id)a1, v15, 96, 1);
    SEL v19 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v18, 24, 1);
    }
    v7 = Property;

    if ([v7 count] != 1)
    {
      uint64_t v20 = ne_log_obj();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        SEL v75 = (char *)[(id)a1 copyShortDescription];
        int v76 = [v7 count];
        *(_DWORD *)buf = 138412546;
        v161 = v75;
        __int16 v162 = 1024;
        LODWORD(v163) = v76;
        _os_log_error_impl(&dword_19DDAF000, (os_log_t)v20, OS_LOG_TYPE_ERROR, "%@ Received %u child SA proposals, require 1", buf, 0x12u);
      }
      a1 = 0;
      goto LABEL_121;
    }
    uint64_t v20 = [v7 firstObject];
    id v23 = objc_getProperty(v5, v21, 176, 1);
    if (v20) {
      id v24 = objc_getProperty((id)v20, v22, 80, 1);
    }
    else {
      id v24 = 0;
    }
    id v25 = v24;

    if (!v25)
    {
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        SEL v28 = (char *)[(id)a1 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v161 = v28;
        v29 = "%@ Child SA proposal missing SPI";
        goto LABEL_69;
      }
LABEL_40:
      a1 = 0;
LABEL_120:

LABEL_121:
      goto LABEL_122;
    }
    if (v20)
    {
      unint64_t v26 = *(unsigned __int8 *)(v20 + 8);
      if ([v23 count] < v26)
      {
        v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          SEL v28 = (char *)[(id)a1 copyShortDescription];
          *(_DWORD *)buf = 138412290;
          v161 = v28;
          v29 = "%@ Child SA proposal out of range";
LABEL_69:
          _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

          goto LABEL_40;
        }
        goto LABEL_40;
      }
      unsigned int v36 = *(unsigned __int8 *)(v20 + 8);
    }
    else
    {
      [v23 count];
      unsigned int v36 = 0;
    }
    v27 = [v23 objectAtIndexedSubscript:v36 - 1];
    if (-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](v20, v27, 0, 1))
    {
      v37 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v27, (void *)v20, 0, 1);
      objc_setProperty_atomic(v5, v38, v37, 56);

      id v40 = objc_getProperty(v5, v39, 56, 1);
      if (v40)
      {
        objc_setProperty_atomic(v5, v41, 0, 176);
        *((unsigned char *)v5 + 9) = 1;
        v42 = &OBJC_IVAR___NEIKEv2IKESA__error;
        SEL v44 = objc_getProperty((id)a1, v43, 112, 1);

        if (v44)
        {
          char v46 = objc_getProperty((id)a1, v45, 112, 1);
          char v48 = v46;
          if (v46) {
            char v46 = objc_getProperty(v46, v47, 24, 1);
          }
          id v49 = v46;

          if (v49)
          {
            WeakRetained = objc_loadWeakRetained(v5 + 3);
            v52 = WeakRetained;
            if (WeakRetained) {
              WeakRetained = objc_getProperty(WeakRetained, v51, 80, 1);
            }
            SEL v53 = WeakRetained;
            int v54 = [v53 strictNonceSizeChecks];

            if (v54)
            {
              v56 = objc_getProperty((id)a1, v55, 112, 1);
              v58 = v56;
              if (v56) {
                v56 = objc_getProperty(v56, v57, 24, 1);
              }
              id v59 = v56;
              uint64_t v60 = [v59 length];

              if ((unint64_t)(v60 - 257) <= 0xFFFFFFFFFFFFFF0ELL)
              {
                v62 = ne_log_obj();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v63 = (char *)[(id)a1 copyShortDescription];
                  *(_DWORD *)buf = 138412546;
                  v161 = v63;
                  __int16 v162 = 2048;
                  uint64_t v163 = v60;
                  SEL v64 = "%@ NONCE data length %zu is out of bounds";
                  v65 = v62;
                  uint32_t v66 = 22;
LABEL_112:
                  _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, v64, buf, v66);
LABEL_113:
                }
LABEL_117:

                goto LABEL_118;
              }
              self = (id)v60;
              if (v52) {
                id v77 = objc_getProperty(v52, v61, 96, 1);
              }
              else {
                id v77 = 0;
              }
              id v78 = v77;
              v80 = [(NEIKEv2IKESAProposal *)v78 prfProtocol];
              unsigned int v81 = [v80 nonceSize];

              v42 = &OBJC_IVAR___NEIKEv2IKESA__error;
              if ((unint64_t)self < v81)
              {
                v62 = ne_log_obj();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v63 = (char *)[(id)a1 copyShortDescription];
                  if (v52) {
                    id v83 = objc_getProperty(v52, v82, 96, 1);
                  }
                  else {
                    id v83 = 0;
                  }
                  id v84 = v83;
                  uint32_t v86 = [(NEIKEv2IKESAProposal *)v84 prfProtocol];
                  *(_DWORD *)buf = 138412802;
                  v161 = v63;
                  __int16 v162 = 2048;
                  uint64_t v163 = (uint64_t)self;
                  __int16 v164 = 2112;
                  uint64_t v165 = (uint64_t)v86;
                  _os_log_error_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x20u);

                  goto LABEL_113;
                }
                goto LABEL_117;
              }
            }
            v87 = objc_getProperty((id)a1, v55, v42[147], 1);
            v89 = v87;
            if (v87) {
              v87 = objc_getProperty(v87, v88, 24, 1);
            }
            id v90 = v87;
            objc_setProperty_atomic(v5, v91, v90, 88);

            id v93 = objc_getProperty(v5, v92, 56, 1);
            v95 = [(NEIKEv2IKESAProposal *)v93 kemProtocol];
            uint64_t v96 = [v95 method];

            if (v96)
            {
              v98 = objc_getProperty((id)a1, v97, 104, 1);

              if (!v98)
              {
                v62 = ne_log_obj();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_117;
                }
                v63 = (char *)[(id)a1 copyShortDescription];
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                SEL v64 = "%@ Did not receive KE payload";
LABEL_111:
                v65 = v62;
                uint32_t v66 = 12;
                goto LABEL_112;
              }
              v100 = objc_getProperty((id)a1, v99, 104, 1);
              v102 = v100;
              if (v100) {
                v100 = objc_getProperty(v100, v101, 24, 1);
              }
              id v103 = v100;

              if (!v103)
              {
                v62 = ne_log_obj();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_117;
                }
                v63 = (char *)[(id)a1 copyShortDescription];
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                SEL v64 = "%@ Did not receive method in KE payload";
                goto LABEL_111;
              }
              v105 = objc_getProperty((id)a1, v104, 104, 1);
              v107 = v105;
              if (v105) {
                v105 = objc_getProperty(v105, v106, 32, 1);
              }
              id v108 = v105;

              if (!v108)
              {
                v62 = ne_log_obj();
                if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_117;
                }
                v63 = (char *)[(id)a1 copyShortDescription];
                *(_DWORD *)buf = 138412290;
                v161 = v63;
                SEL v64 = "%@ Did not receive data in KE payload";
                goto LABEL_111;
              }
              v110 = objc_getProperty((id)a1, v109, 104, 1);
              selfa = v110;
              if (v110) {
                v110 = objc_getProperty(v110, v111, 24, 1);
              }
              id v149 = v110;
              uint64_t v151 = [v149 method];
              id v113 = objc_getProperty(v5, v112, 56, 1);
              v115 = [(NEIKEv2IKESAProposal *)v113 kemProtocol];
              uint64_t v116 = [v115 method];

              if (v151 != v116)
              {
                v62 = ne_log_obj();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v152 = (char *)[(id)a1 copyShortDescription];
                  v141 = objc_getProperty((id)a1, v140, 104, 1);
                  selfb = v141;
                  if (v141) {
                    v141 = objc_getProperty(v141, v142, 24, 1);
                  }
                  id v150 = v141;
                  uint64_t v148 = [v150 method];
                  id v144 = objc_getProperty(v5, v143, 56, 1);
                  v146 = [(NEIKEv2IKESAProposal *)v144 kemProtocol];
                  uint64_t v147 = [v146 method];
                  *(_DWORD *)buf = 138412802;
                  v161 = v152;
                  __int16 v162 = 2048;
                  uint64_t v163 = v148;
                  __int16 v164 = 2048;
                  uint64_t v165 = v147;
                  _os_log_error_impl(&dword_19DDAF000, v62, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu)", buf, 0x20u);
                }
                goto LABEL_117;
              }
              v118 = objc_getProperty((id)a1, v117, 104, 1);
              v120 = v118;
              if (v118) {
                v118 = objc_getProperty(v118, v119, 32, 1);
              }
              id v121 = v118;
              objc_setProperty_atomic(v5, v122, v121, 104);

              v123 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4039);
              objc_setProperty_atomic(v5, v124, v123, 128);
            }
            else
            {
              objc_setProperty_atomic(v5, v97, 0, 112);
            }
            v126 = objc_getProperty((id)a1, v125, 128, 1);
            v128 = v126;
            if (v126) {
              v126 = objc_getProperty(v126, v127, 24, 1);
            }
            id v129 = v126;
            -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v5, v129);

            v131 = [(NEIKEv2ChildSA *)v5 initiatorTrafficSelectors];

            if (v131)
            {
              v133 = objc_getProperty((id)a1, v132, 136, 1);
              v135 = v133;
              if (v133) {
                v133 = objc_getProperty(v133, v134, 24, 1);
              }
              id v136 = v133;
              -[NEIKEv2ChildSA setResponderTrafficSelectors:](v5, v136);

              v138 = [(NEIKEv2ChildSA *)v5 responderTrafficSelectors];

              if (v138)
              {
                a1 = 1;
LABEL_119:

                goto LABEL_120;
              }
              v62 = ne_log_obj();
              if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                goto LABEL_117;
              }
              v63 = (char *)[(id)a1 copyShortDescription];
              *(_DWORD *)buf = 138412290;
              v161 = v63;
              SEL v64 = "%@ Could not set responder traffic selectors";
            }
            else
            {
              v62 = ne_log_obj();
              if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                goto LABEL_117;
              }
              v63 = (char *)[(id)a1 copyShortDescription];
              *(_DWORD *)buf = 138412290;
              v161 = v63;
              SEL v64 = "%@ Could not set initiator traffic selectors";
            }
            goto LABEL_111;
          }
          v52 = ne_log_obj();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            SEL v68 = (char *)[(id)a1 copyShortDescription];
            *(_DWORD *)buf = 138412290;
            v161 = v68;
            char v70 = "%@ Did not receive NONCE data";
            goto LABEL_66;
          }
LABEL_118:
          a1 = 0;
          goto LABEL_119;
        }
        v52 = ne_log_obj();
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          goto LABEL_118;
        }
        SEL v68 = (char *)[(id)a1 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v161 = v68;
        char v70 = "%@ Did not receive NONCE payload";
      }
      else
      {
        v52 = ne_log_obj();
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          goto LABEL_118;
        }
        SEL v68 = (char *)[(id)a1 copyShortDescription];
        *(_DWORD *)buf = 138412290;
        v161 = v68;
        char v70 = "%@ Could not set chosen proposal values";
      }
LABEL_66:
      v71 = v52;
      uint32_t v72 = 12;
LABEL_67:
      _os_log_error_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_ERROR, v70, buf, v72);

      goto LABEL_118;
    }
    v52 = ne_log_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v67 = [(id)a1 copyShortDescription];
      SEL v68 = (char *)v67;
      if (v20) {
        int v69 = *(unsigned __int8 *)(v20 + 8);
      }
      else {
        int v69 = 0;
      }
      *(_DWORD *)buf = 138412546;
      v161 = (const char *)v67;
      __int16 v162 = 1024;
      LODWORD(v163) = v69;
      char v70 = "%@ SA proposal number %u does not match";
      v71 = v52;
      uint32_t v72 = 18;
      goto LABEL_67;
    }
    goto LABEL_118;
  }
LABEL_123:

  return a1;
}

+ (id)createChildSAResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6 = a2;
  id v7 = a4;
  self;
  uint64_t v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2CreateChildPacket alloc], v6);
  if (v8)
  {
    id v9 = v8;
    if (-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
    {
      id v9 = v9;
      uint64_t v10 = v9;
      goto LABEL_11;
    }
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v14 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }
  }
  else
  {
    uint64_t v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed", buf, 2u);
    }

    id v9 = 0;
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_tsr, 0);
  objc_storeStrong((id *)&self->_tsi, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ke, 0);
  objc_storeStrong((id *)&self->_childSA, 0);

  objc_storeStrong((id *)&self->_ikeSA, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (self) {
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 80, 1);
  }
  v3 = self;
  uint64_t v4 = [(NEIKEv2CreateChildPacket *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 88;
LABEL_29:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_30;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 96;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 104;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 112;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 120;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 128;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 136;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v2 && objc_getProperty(v2, v11, 64, 1))
          {
            char v14 = objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v8);
LABEL_45:
            SEL v19 = v2;
            uint64_t v20 = v14;
            ptrdiff_t v21 = 64;
            goto LABEL_50;
          }
          v29 = v8;
          char v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v29, 1, (void)v23);
          if (v2) {
            goto LABEL_45;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v15, 144, 1))
            {
              char v14 = objc_msgSend(objc_getProperty(v2, v16, 144, 1), "arrayByAddingObject:", v8);
LABEL_47:
              ptrdiff_t v21 = 144;
              SEL v19 = v2;
              uint64_t v20 = v14;
              goto LABEL_50;
            }
            SEL v28 = v8;
            char v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1, (void)v23);
            if (v2) {
              goto LABEL_47;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_30;
            }
            if (v2 && objc_getProperty(v2, v17, 56, 1))
            {
              char v14 = objc_msgSend(objc_getProperty(v2, v18, 56, 1), "arrayByAddingObject:", v8);
LABEL_49:
              SEL v19 = v2;
              uint64_t v20 = v14;
              ptrdiff_t v21 = 56;
LABEL_50:
              objc_setProperty_atomic(v19, v13, v20, v21);
              goto LABEL_51;
            }
            v27 = v8;
            char v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v27, 1, (void)v23);
            if (v2) {
              goto LABEL_49;
            }
          }
        }
LABEL_51:

LABEL_30:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v22 = [(NEIKEv2CreateChildPacket *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
      uint64_t v5 = v22;
    }
    while (v22);
  }
}

- (void)gatherPayloads
{
  v2 = self;
  if (self) {
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 64, 1);
  }
  id v16 = (id)[(NEIKEv2CreateChildPacket *)self mutableCopy];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16393, v16, v3);
  if (v2)
  {
    if (objc_getProperty(v2, v4, 120, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v5, 120, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395, v16, v3);
    if (objc_getProperty(v2, v6, 88, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v7, 88, 1));
    }
    if (objc_getProperty(v2, v7, 96, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v8, 96, 1));
    }
    if (objc_getProperty(v2, v8, 112, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v9, 112, 1));
    }
    if (objc_getProperty(v2, v9, 104, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v10, 104, 1));
    }
    if (objc_getProperty(v2, v10, 128, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v11, 128, 1));
    }
    if (objc_getProperty(v2, v11, 136, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v12, 136, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386, v16, v3);
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v13, 144, 1));
    [v3 addObjectsFromArray:v16];
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v14, 56, 1));
    objc_setProperty_atomic(v2, v15, v3, 80);
  }
  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16387, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16391, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16394, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16395, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16386, v16, v3);
    [v3 addObjectsFromArray:0];
    [v3 addObjectsFromArray:v16];
    [v3 addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 36;
}

+ (id)copyTypeDescription
{
  return @"CREATE_CHILD_SA";
}

- (BOOL)isRekeyIKE
{
  return objc_getProperty(a1, a2, 88, 1) != 0;
}

@end