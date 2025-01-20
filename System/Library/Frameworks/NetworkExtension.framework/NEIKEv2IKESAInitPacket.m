@interface NEIKEv2IKESAInitPacket
+ (BOOL)encryptPayloads;
+ (NSObject)createIKESAInitForInitiatorIKESA:(uint64_t)a1;
+ (id)copyTypeDescription;
+ (id)createIKESAInitResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:;
+ (unint64_t)exchangeType;
- (uint64_t)validateSAInitAsInitiator:(uint64_t)a1;
- (uint64_t)validateSAInitAsResponder:(void *)a3 errorCodeToSend:;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IKESAInitPacket

+ (NSObject)createIKESAInitForInitiatorIKESA:(uint64_t)a1
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  self;
  if (!v2)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v80 = "%s called with null ikeSA";
    goto LABEL_40;
  }
  v4 = [(NEIKEv2IKESA *)v2 preferredKEMProtocol];

  if (!v4)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_25:
      v76 = 0;
      goto LABEL_65;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v80 = "%s called with null ikeSA.preferredKEMProtocol";
LABEL_40:
    _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, v80, buf, 0xCu);
    goto LABEL_25;
  }
  v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2IKESAInitPacket alloc]);
  if (!v6)
  {
    p_super = ne_log_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    v77 = "[[NEIKEv2IKESAInitPacket alloc] initOutbound:] failed";
    goto LABEL_32;
  }
  id v7 = objc_getProperty(v2, v5, 280, 1);

  if (v7)
  {
    id v9 = objc_getProperty(v2, v8, 280, 1);
    v10 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4006uLL, v9);
    objc_setProperty_atomic(v6, v11, v10, 88);

    v13 = objc_getProperty(v6, v12, 88, 1);

    if (!v13)
    {
      p_super = ne_log_obj();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
        goto LABEL_63;
      }
      *(_WORD *)buf = 0;
      v77 = "[NEIKEv2NotifyPayload createNotifyPayloadType:NEIKEv2NotifyTypeCookie] failed";
      goto LABEL_32;
    }
  }
  v14 = objc_alloc_init(NEIKEv2IKESAPayload);
  objc_setProperty_atomic(v6, v15, v14, 96);

  id v17 = objc_getProperty(v2, v16, 80, 1);
  v18 = [v17 proposals];
  v20 = objc_getProperty(v6, v19, 96, 1);
  v22 = v20;
  if (v20) {
    objc_setProperty_atomic(v20, v21, v18, 24);
  }

  v24 = objc_getProperty(v6, v23, 96, 1);
  char v25 = -[NEIKEv2Payload isValid]((uint64_t)v24);

  if ((v25 & 1) == 0)
  {
    p_super = ne_log_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v77 = "%s called with null packet.sa.isValid";
    goto LABEL_37;
  }
  v26 = objc_alloc_init(NEIKEv2KeyExchangePayload);
  objc_setProperty_atomic(v6, v27, v26, 104);

  v29 = [(NEIKEv2IKESA *)v2 preferredKEMProtocol];
  v31 = objc_getProperty(v6, v30, 104, 1);
  v33 = v31;
  if (v31) {
    objc_setProperty_atomic(v31, v32, v29, 24);
  }

  id v35 = objc_getProperty(v2, v34, 160, 1);
  v36 = v35;
  if (v35) {
    v37 = (void *)*((void *)v35 + 2);
  }
  else {
    v37 = 0;
  }
  id v38 = v37;
  v40 = objc_getProperty(v6, v39, 104, 1);
  v42 = v40;
  if (v40) {
    objc_setProperty_atomic(v40, v41, v38, 32);
  }

  v44 = objc_getProperty(v6, v43, 104, 1);
  char v45 = -[NEIKEv2Payload isValid]((uint64_t)v44);

  if ((v45 & 1) == 0)
  {
    p_super = ne_log_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v77 = "%s called with null packet.ke.isValid";
    goto LABEL_37;
  }
  v46 = objc_alloc_init(NEIKEv2NoncePayload);
  objc_setProperty_atomic(v6, v47, v46, 112);

  id v49 = objc_getProperty(v2, v48, 128, 1);
  v51 = objc_getProperty(v6, v50, 112, 1);
  v53 = v51;
  if (v51) {
    objc_setProperty_atomic(v51, v52, v49, 24);
  }

  v55 = objc_getProperty(v6, v54, 112, 1);
  char v56 = -[NEIKEv2Payload isValid]((uint64_t)v55);

  if ((v56 & 1) == 0)
  {
    p_super = ne_log_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      goto LABEL_63;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v77 = "%s called with null packet.nonce.isValid";
LABEL_37:
    v78 = p_super;
    uint32_t v79 = 12;
    goto LABEL_38;
  }
  id v58 = objc_getProperty(v2, v57, 80, 1);
  v59 = [v58 redirectedFromServer];

  if (v59)
  {
    v61 = objc_alloc_init(NEIKEv2NotifyPayload);
    p_super = &v61->super.super;
    if (v61) {
      v61->_notifyType = 16408;
    }
    id v64 = objc_getProperty(v2, v62, 80, 1);
    v65 = [v64 redirectedFromServer];
    uint64_t v66 = [v65 addressFamily];

    id v68 = objc_getProperty(v2, v67, 80, 1);
    v69 = [v68 redirectedFromServer];
    v70 = v69;
    if (v66 == 2)
    {
      uint64_t v71 = [v69 address];

      buf[0] = 1;
      v207[0] = 4;
      id v72 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [v72 appendBytes:buf length:1];
      [v72 appendBytes:v207 length:1];
      uint64_t v73 = v71 + 4;
      v74 = v72;
      uint64_t v75 = 4;
    }
    else
    {
      uint64_t v84 = [v69 addressFamily];

      if (v84 != 30)
      {
LABEL_50:
        if (-[NEIKEv2Packet addNotifyPayload:](v6, p_super))
        {

          goto LABEL_52;
        }
        v117 = ne_log_obj();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_FAULT, "[packet addNotifyPayload:redirectFromPayload] failed", buf, 2u);
        }

        goto LABEL_63;
      }
      id v86 = objc_getProperty(v2, v85, 80, 1);
      v87 = [v86 redirectedFromServer];
      uint64_t v88 = [v87 address];

      buf[0] = 2;
      v207[0] = 16;
      id v72 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [v72 appendBytes:buf length:1];
      [v72 appendBytes:v207 length:1];
      uint64_t v73 = v88 + 8;
      v74 = v72;
      uint64_t v75 = 16;
    }
    [v74 appendBytes:v73 length:v75];
    if (p_super) {
      objc_setProperty_atomic(p_super, v89, v72, 32);
    }

    goto LABEL_50;
  }
  id v81 = objc_getProperty(v2, v60, 80, 1);
  int v82 = [v81 allowRedirect];

  if (!v82 || -[NEIKEv2Packet addNotification:data:](v6, 0x4016uLL, 0))
  {
LABEL_52:
    v90 = [(NEIKEv2IKESA *)v2 initiatorSPI];
    v92 = [(NEIKEv2IKESA *)v2 responderSPI];
    id v94 = objc_getProperty(v2, v93, 64, 1);
    p_super = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v90, v92, v94);

    if (!-[NEIKEv2Packet addNotification:data:](v6, 0x4004uLL, p_super))
    {
      v101 = ne_log_obj();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed", buf, 2u);
      }
      v76 = 0;
      goto LABEL_146;
    }
    v96 = [(NEIKEv2IKESA *)v2 initiatorSPI];
    v98 = [(NEIKEv2IKESA *)v2 responderSPI];
    id v100 = objc_getProperty(v2, v99, 72, 1);
    v101 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v96, v98, v100);

    if (-[NEIKEv2Packet addNotification:data:](v6, 0x4005uLL, v101))
    {
      if (-[NEIKEv2Packet addNotification:data:](v6, 0x402EuLL, 0))
      {
        id v103 = objc_getProperty(v2, v102, 88, 1);
        v104 = [v103 authenticationProtocol];

        if (v104)
        {
          id v106 = objc_getProperty(v2, v105, 88, 1);
          v107 = [v106 authenticationProtocol];

          id v109 = objc_getProperty(v2, v108, 80, 1);
          v110 = [v109 extraSupportedSignatureHashes];
          v111 = +[NEIKEv2Crypto copySignHashDataForSet:authentication:]((uint64_t)NEIKEv2Crypto, v110, v107);

          if ([v107 isSecurePassword])
          {
            id v113 = objc_getProperty(v2, v112, 88, 1);
            v114 = [v113 remoteAuthentication];
            char v115 = [v107 isEqual:v114];

            if (v115)
            {
              *(_WORD *)buf = 0;
              *(_WORD *)buf = bswap32([v107 securePasswordMethod]) >> 16;
              v116 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:2];
              if (-[NEIKEv2Packet addNotification:data:](v6, 0x4028uLL, v116))
              {

                goto LABEL_86;
              }
              v184 = ne_log_obj();
              if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v207 = 0;
                _os_log_fault_impl(&dword_19DDAF000, v184, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeSecurePasswordMethods] failed", v207, 2u);
              }
            }
            else
            {
              v116 = ne_log_obj();
              if (!os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
              {
LABEL_142:

                goto LABEL_143;
              }
              v184 = objc_getProperty(v2, v183, 88, 1);
              v185 = [v184 remoteAuthentication];
              *(_DWORD *)buf = 138412546;
              v215 = (const char *)v107;
              __int16 v216 = 2112;
              v217 = v185;
              _os_log_fault_impl(&dword_19DDAF000, v116, OS_LOG_TYPE_FAULT, "Local authentication %@ is GSPM but doesn't match remote authentication %@", buf, 0x16u);
            }
            goto LABEL_142;
          }
        }
        else
        {
          v187 = v101;
          v107 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v203 = 0u;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          id v121 = objc_getProperty(v2, v120, 80, 1);
          v122 = [v121 proposals];

          uint64_t v123 = [v122 countByEnumeratingWithState:&v203 objects:v213 count:16];
          if (v123)
          {
            uint64_t v124 = v123;
            uint64_t v125 = *(void *)v204;
            do
            {
              for (uint64_t i = 0; i != v124; ++i)
              {
                if (*(void *)v204 != v125) {
                  objc_enumerationMutation(v122);
                }
                v127 = *(void **)(*((void *)&v203 + 1) + 8 * i);
                if (v127) {
                  v127 = (void *)v127[16];
                }
                v128 = v127;
                [v107 addObject:v128];
              }
              uint64_t v124 = [v122 countByEnumeratingWithState:&v203 objects:v213 count:16];
            }
            while (v124);
          }

          id v130 = objc_getProperty(v2, v129, 80, 1);
          v131 = [v130 extraSupportedSignatureHashes];
          v111 = +[NEIKEv2Crypto copySignHashDataForSet:authenticationSet:]((uint64_t)NEIKEv2Crypto, v131, v107);

          v101 = v187;
        }
LABEL_86:

        if (v111 && !-[NEIKEv2Packet addNotification:data:](v6, 0x402FuLL, v111))
        {
          v107 = ne_log_obj();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
          {
LABEL_143:

            goto LABEL_144;
          }
          *(_WORD *)buf = 0;
          v181 = "[packet addNotification:NEIKEv2NotifyTypeSignatureHashAlgorithms] failed";
        }
        else
        {
          id v133 = objc_getProperty(v2, v132, 80, 1);
          int v134 = [v133 requestPPK];

          if (!v134 || -[NEIKEv2Packet addNotification:data:](v6, 0x4033uLL, 0))
          {
            v186 = v111;
            v188 = v101;
            long long v201 = 0u;
            long long v202 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            id v136 = objc_getProperty(v2, v135, 80, 1);
            v137 = [v136 proposals];

            uint64_t v138 = [v137 countByEnumeratingWithState:&v199 objects:v212 count:16];
            if (v138)
            {
              uint64_t v139 = v138;
              uint64_t v140 = *(void *)v200;
              while (2)
              {
                for (uint64_t j = 0; j != v139; ++j)
                {
                  if (*(void *)v200 != v140) {
                    objc_enumerationMutation(v137);
                  }
                  v142 = [*(id *)(*((void *)&v199 + 1) + 8 * j) additionalKEMProtocols];

                  if (v142 && !-[NEIKEv2Packet addNotification:data:](v6, 0x4036uLL, 0))
                  {
                    v182 = ne_log_obj();
                    if (os_log_type_enabled(v182, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19DDAF000, v182, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeIntermediateExchangeSupported] failed", buf, 2u);
                    }

                    v76 = 0;
                    goto LABEL_131;
                  }
                }
                uint64_t v139 = [v137 countByEnumeratingWithState:&v199 objects:v212 count:16];
                if (v139) {
                  continue;
                }
                break;
              }
            }

            long long v197 = 0u;
            long long v198 = 0u;
            long long v195 = 0u;
            long long v196 = 0u;
            id v144 = objc_getProperty(v2, v143, 80, 1);
            v145 = [v144 customIKESAInitVendorPayloads];

            obuint64_t j = v145;
            uint64_t v146 = [v145 countByEnumeratingWithState:&v195 objects:v211 count:16];
            if (v146)
            {
              uint64_t v147 = v146;
              uint64_t v148 = *(void *)v196;
              do
              {
                for (uint64_t k = 0; k != v147; ++k)
                {
                  if (*(void *)v196 != v148) {
                    objc_enumerationMutation(obj);
                  }
                  v150 = *(void **)(*((void *)&v195 + 1) + 8 * k);
                  v151 = objc_alloc_init(NEIKEv2VendorIDPayload);
                  v153 = [v150 vendorData];
                  if (v151) {
                    objc_setProperty_atomic(v151, v152, v153, 24);
                  }

                  v155 = objc_getProperty(v6, v154, 120, 1);

                  if (v155)
                  {
                    v157 = objc_getProperty(v6, v156, 120, 1);
                    v158 = [v157 arrayByAddingObject:v151];
                    objc_setProperty_atomic(v6, v159, v158, 120);
                  }
                  else
                  {
                    v210 = v151;
                    v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
                    objc_setProperty_atomic(v6, v160, v157, 120);
                  }
                }
                uint64_t v147 = [obj countByEnumeratingWithState:&v195 objects:v211 count:16];
              }
              while (v147);
            }

            long long v193 = 0u;
            long long v194 = 0u;
            long long v191 = 0u;
            long long v192 = 0u;
            id v162 = objc_getProperty(v2, v161, 80, 1);
            v163 = [v162 customIKESAInitPayloads];

            id obja = v163;
            uint64_t v164 = [v163 countByEnumeratingWithState:&v191 objects:v209 count:16];
            if (v164)
            {
              uint64_t v165 = v164;
              uint64_t v166 = *(void *)v192;
              do
              {
                uint64_t v167 = 0;
                do
                {
                  if (*(void *)v192 != v166) {
                    objc_enumerationMutation(obja);
                  }
                  v168 = *(void **)(*((void *)&v191 + 1) + 8 * v167);
                  v169 = objc_alloc_init(NEIKEv2CustomPayload);
                  uint64_t v170 = [v168 customType];
                  if (v169)
                  {
                    v169->_customType = v170;
                    v171 = [v168 customData];
                    objc_setProperty_atomic(v169, v172, v171, 32);
                  }
                  else
                  {
                    v171 = [v168 customData];
                  }

                  v174 = objc_getProperty(v6, v173, 56, 1);

                  if (v174)
                  {
                    v176 = objc_getProperty(v6, v175, 56, 1);
                    v177 = [v176 arrayByAddingObject:v169];
                    objc_setProperty_atomic(v6, v178, v177, 56);
                  }
                  else
                  {
                    v208 = v169;
                    v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
                    objc_setProperty_atomic(v6, v179, v176, 56);
                  }

                  ++v167;
                }
                while (v165 != v167);
                uint64_t v180 = [obja countByEnumeratingWithState:&v191 objects:v209 count:16];
                uint64_t v165 = v180;
              }
              while (v180);
            }

            v76 = v6;
LABEL_131:
            v111 = v186;
            v101 = v188;
            goto LABEL_145;
          }
          v107 = ne_log_obj();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_FAULT)) {
            goto LABEL_143;
          }
          *(_WORD *)buf = 0;
          v181 = "[packet addNotification:NEIKEv2NotifyTypeUsePPK] failed";
        }
        _os_log_fault_impl(&dword_19DDAF000, v107, OS_LOG_TYPE_FAULT, v181, buf, 2u);
        goto LABEL_143;
      }
      v111 = ne_log_obj();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v119 = "[packet addNotification:NEIKEv2NotifyTypeIKEv2FragmentationSupported] failed";
        goto LABEL_75;
      }
    }
    else
    {
      v111 = ne_log_obj();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v119 = "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed";
LABEL_75:
        _os_log_fault_impl(&dword_19DDAF000, v111, OS_LOG_TYPE_FAULT, v119, buf, 2u);
      }
    }
LABEL_144:
    v76 = 0;
LABEL_145:

LABEL_146:
    goto LABEL_64;
  }
  p_super = ne_log_obj();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v77 = "[packet addNotification:NEIKEv2NotifyTypeRedirectSupported] failed";
LABEL_32:
    v78 = p_super;
    uint32_t v79 = 2;
LABEL_38:
    _os_log_fault_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_FAULT, v77, buf, v79);
  }
LABEL_63:
  v76 = 0;
LABEL_64:

LABEL_65:

  return v76;
}

+ (id)createIKESAInitResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6 = a2;
  id v7 = a4;
  self;
  v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKESAInitPacket alloc], v6);
  if (v8)
  {
    id v9 = v8;
    if (-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
    {
      id v9 = v9;
      v10 = v9;
      goto LABEL_11;
    }
    SEL v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }
  }
  else
  {
    SEL v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed", buf, 2u);
    }

    id v9 = 0;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (uint64_t)validateSAInitAsInitiator:(uint64_t)a1
{
  uint64_t v391 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v5 = (uint64_t)v3;
  if (!a1) {
    goto LABEL_49;
  }
  if (!v3)
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int buf = 136315138;
      v384 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsInitiator:]";
      long long v196 = "%s called with null ikeSA";
LABEL_118:
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, v196, (uint8_t *)&buf, 0xCu);
    }
LABEL_47:
    a1 = 0;
    goto LABEL_48;
  }
  if ((v3[9] & 1) == 0)
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int buf = 136315138;
      v384 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsInitiator:]";
      long long v196 = "%s called with null ikeSA.isInitiator";
      goto LABEL_118;
    }
    goto LABEL_47;
  }
  if (![(NEIKEv2Packet *)(void *)a1 hasErrors]) {
    goto LABEL_15;
  }
  long long v381 = 0u;
  long long v382 = 0u;
  long long v379 = 0u;
  long long v380 = 0u;
  id v7 = objc_getProperty((id)a1, v6, 64, 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v379 objects:v390 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v380;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v380 != v10) {
        objc_enumerationMutation(v7);
      }
      SEL v12 = *(void **)(*((void *)&v379 + 1) + 8 * i);
      if (v12 && (unint64_t)(v12[3] - 1) <= 0x3FFE)
      {
        v20 = -[NEIKEv2NotifyPayload copyError](*(__CFString **)(*((void *)&v379 + 1) + 8 * i));
        v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = (char *)[(id)a1 copyShortDescription];
          int buf = 138412546;
          v384 = v75;
          __int16 v385 = 2112;
          v386 = (NEIKEv2AuthenticationProtocol *)v20;
          _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@ Initiator init received notify error %@", (uint8_t *)&buf, 0x16u);
        }
        if (v12[3] == 17)
        {
          id v24 = objc_getProperty(v12, v23, 32, 1);
          char v25 = v24;
          if (v24)
          {
            LOWORD(buf) = 0;
            [v24 getBytes:&buf length:2];
            v26 = [NEIKEv2KEMProtocol alloc];
            SEL v27 = [(NEIKEv2KEMProtocol *)v26 initWithMethod:bswap32((unsigned __int16)buf) >> 16];
            objc_setProperty_atomic((id)v5, v28, v27, 144);
          }
          else
          {
            -[NEIKEv2IKESA setState:error:](v5, 3uLL, v20);
          }
        }
        else
        {
          -[NEIKEv2IKESA setState:error:](v5, 3uLL, v20);
        }
LABEL_46:

        goto LABEL_47;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v379 objects:v390 count:16];
  }
  while (v9);
LABEL_14:

LABEL_15:
  if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4017))
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v65 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v65;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ Received notify server redirect", (uint8_t *)&buf, 0xCu);
    }
    Error = NEIKEv2CreateError(5);
    goto LABEL_19;
  }
  SEL v16 = objc_getProperty((id)a1, v13, 88, 1);

  if (v16)
  {
    Property = objc_getProperty((id)a1, v17, 88, 1);
    id v7 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v19, 32, 1);
    }
    v20 = Property;
    objc_setProperty_atomic((id)v5, v21, v20, 280);
    goto LABEL_46;
  }
  id v29 = objc_getProperty((id)a1, v17, 40, 1);
  uint64_t v30 = [v29 value];

  if (!v30)
  {
    SEL v48 = ne_log_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      SEL v159 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v159;
      _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@ Received no remote SPI on SA_INIT", (uint8_t *)&buf, 0xCu);
    }
    Error = NEIKEv2CreateErrorPeerInvalidSyntax(@"Received no remote SPI on SA_INIT", v49, v50, v51, v52, v53, v54, v55, v361);
LABEL_19:
    id v7 = Error;
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, Error);
    goto LABEL_47;
  }
  id v32 = objc_getProperty((id)a1, v31, 40, 1);
  -[NEIKEv2IKESA assignRemoteSPI:]((void *)v5, v32);

  SEL v34 = objc_getProperty((id)a1, v33, 96, 1);
  v36 = v34;
  if (v34) {
    SEL v34 = objc_getProperty(v34, v35, 24, 1);
  }
  id v7 = v34;

  if ([v7 count] != 1)
  {
    char v56 = ne_log_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      SEL v160 = (char *)[(id)a1 copyShortDescription];
      int v161 = [v7 count];
      int buf = 138412546;
      v384 = v160;
      __int16 v385 = 1024;
      LODWORD(v386) = v161;
      _os_log_error_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_ERROR, "%@ Received %u SA proposals, require 1", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v57 = [v7 count];
    ErrorPeerInvalidSyntax = (NEIKEv2AuthenticationProtocol *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Invalid SA proposal count %u", v58, v59, v60, v61, v62, v63, v64, v57);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, ErrorPeerInvalidSyntax);
    a1 = 0;
    goto LABEL_109;
  }
  ErrorPeerInvalidSyntax = [v7 firstObject];
  if (([(NEIKEv2IKESAProposal *)ErrorPeerInvalidSyntax isAValidResponse] & 1) == 0)
  {
    uint64_t v66 = ne_log_obj();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v171 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412546;
      v384 = v171;
      __int16 v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19DDAF000, v66, OS_LOG_TYPE_ERROR, "%@ Received invalid SA proposal %@", (uint8_t *)&buf, 0x16u);
    }
    id v74 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received invalid SA proposal", v67, v68, v69, v70, v71, v72, v73, v361);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v74);
    a1 = 0;
    goto LABEL_108;
  }
  long long v377 = 0u;
  long long v378 = 0u;
  long long v375 = 0u;
  long long v376 = 0u;
  id v40 = objc_getProperty((id)v5, v39, 80, 1);
  v41 = [v40 proposals];

  uint64_t v42 = [v41 countByEnumeratingWithState:&v375 objects:v389 count:16];
  if (!v42)
  {
LABEL_43:

LABEL_88:
    uint64_t v139 = ne_log_obj();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      SEL v173 = (char *)[(id)a1 copyShortDescription];
      id v175 = objc_getProperty((id)v5, v174, 80, 1);
      v176 = [v175 proposals];
      int buf = 138412802;
      v384 = v173;
      __int16 v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      __int16 v387 = 2112;
      uint64_t v388 = (uint64_t)v176;
      _os_log_error_impl(&dword_19DDAF000, v139, OS_LOG_TYPE_ERROR, "%@ Received proposal %@ does not match config %@", (uint8_t *)&buf, 0x20u);
    }
    id v74 = objc_getProperty((id)v5, v140, 80, 1);
    id v141 = [v74 proposals];
    id v149 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(@"Received proposal %@ does not match config %@", v142, v143, v144, v145, v146, v147, v148, (uint64_t)ErrorPeerInvalidSyntax);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v149);
LABEL_91:

LABEL_106:
    a1 = 0;
    goto LABEL_107;
  }
  uint64_t v43 = v42;
  uint64_t v44 = *(void *)v376;
LABEL_37:
  uint64_t v45 = 0;
  while (1)
  {
    if (*(void *)v376 != v44) {
      objc_enumerationMutation(v41);
    }
    v46 = *(void **)(*((void *)&v375 + 1) + 8 * v45);
    if (-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](v46, ErrorPeerInvalidSyntax, 0))break; {
    if (v43 == ++v45)
    }
    {
      uint64_t v43 = [v41 countByEnumeratingWithState:&v375 objects:v389 count:16];
      if (v43) {
        goto LABEL_37;
      }
      goto LABEL_43;
    }
  }
  id v74 = v46;

  if (!v74) {
    goto LABEL_88;
  }
  v76 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v74, ErrorPeerInvalidSyntax, 0);
  objc_setProperty_atomic((id)v5, v77, v76, 96);

  id v79 = objc_getProperty((id)v5, v78, 96, 1);
  if (!v79)
  {
    v150 = ne_log_obj();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      long long v206 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412546;
      v384 = v206;
      __int16 v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19DDAF000, v150, OS_LOG_TYPE_ERROR, "%@ Could not set chosen proposal values %@", (uint8_t *)&buf, 0x16u);
    }
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Could not set chosen proposal values %@", v151, v152, v153, v154, v155, v156, v157, (uint64_t)ErrorPeerInvalidSyntax);
    goto LABEL_105;
  }
  id v81 = objc_getProperty((id)v5, v80, 96, 1);
  v83 = v81;
  if (v81) {
    id v81 = objc_getProperty(v81, v82, 120, 1);
  }
  id v84 = v81;

  if (v84 && (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4036) & 1) == 0)
  {
    v336 = ne_log_obj();
    if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
    {
      v346 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412546;
      v384 = v346;
      __int16 v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19DDAF000, v336, OS_LOG_TYPE_ERROR, "%@ Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@ ", (uint8_t *)&buf, 0x16u);
    }
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@", v337, v338, v339, v340, v341, v342, v343, (uint64_t)ErrorPeerInvalidSyntax);
    goto LABEL_105;
  }
  id v86 = objc_getProperty((id)a1, v85, 104, 1);

  if (!v86)
  {
    id v162 = ne_log_obj();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      v208 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v208;
      _os_log_error_impl(&dword_19DDAF000, v162, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v170 = @"Did not receive KE payload";
    goto LABEL_104;
  }
  uint64_t v88 = objc_getProperty((id)a1, v87, 104, 1);
  v90 = v88;
  if (v88) {
    uint64_t v88 = objc_getProperty(v88, v89, 24, 1);
  }
  id v91 = v88;

  if (!v91)
  {
    SEL v172 = ne_log_obj();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
    {
      v209 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v209;
      _os_log_error_impl(&dword_19DDAF000, v172, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v170 = @"Did not receive method in KE payload";
    goto LABEL_104;
  }
  SEL v93 = objc_getProperty((id)a1, v92, 104, 1);
  v95 = v93;
  if (v93) {
    SEL v93 = objc_getProperty(v93, v94, 32, 1);
  }
  id v96 = v93;

  if (!v96)
  {
    v177 = ne_log_obj();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
    {
      v294 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v294;
      _os_log_error_impl(&dword_19DDAF000, v177, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v170 = @"Did not receive data in KE payload";
LABEL_104:
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v170, v163, v164, v165, v166, v167, v168, v169, v361);
LABEL_105:
    id v141 = v158;
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v158);
    goto LABEL_106;
  }
  v98 = objc_getProperty((id)a1, v97, 104, 1);
  id v100 = v98;
  id v373 = v74;
  if (v98) {
    v98 = objc_getProperty(v98, v99, 24, 1);
  }
  id v101 = v98;
  selfd = (id)[v101 method];
  id v103 = objc_getProperty((id)v5, v102, 96, 1);
  v105 = [(NEIKEv2IKESAProposal *)v103 kemProtocol];
  uint64_t v106 = [v105 method];

  if (selfd != (id)v106)
  {
    SEL v178 = ne_log_obj();
    id v74 = v373;
    SEL v179 = &OBJC_IVAR___NEIKEv2IKESA__error;
    if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
    {
      v367 = (char *)[(id)a1 copyShortDescription];
      v307 = objc_getProperty((id)a1, v306, 104, 1);
      selfc = v307;
      if (v307) {
        v307 = objc_getProperty(v307, v308, 24, 1);
      }
      id v364 = v307;
      uint64_t v309 = [v364 method];
      id v311 = objc_getProperty((id)v5, v310, 96, 1);
      v313 = [(NEIKEv2IKESAProposal *)v311 kemProtocol];
      uint64_t v314 = [v313 method];
      int buf = 138412802;
      v384 = v367;
      __int16 v385 = 2048;
      v386 = (NEIKEv2AuthenticationProtocol *)v309;
      __int16 v387 = 2048;
      uint64_t v388 = v314;
      _os_log_error_impl(&dword_19DDAF000, v178, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu)", (uint8_t *)&buf, 0x20u);

      id v74 = v373;
      SEL v179 = &OBJC_IVAR___NEIKEv2IKESA__error;
    }

    v181 = objc_getProperty((id)a1, v180, v179[129], 1);
    id v141 = v181;
    if (v181) {
      v181 = objc_getProperty(v181, v182, 24, 1);
    }
    id v149 = v181;
    uint64_t v183 = [v149 method];
    id v185 = objc_getProperty((id)v5, v184, 96, 1);
    v187 = [(NEIKEv2IKESAProposal *)v185 kemProtocol];
    [v187 method];
    long long v195 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Did not receive matching method from KE payload (%zu != %zu)", v188, v189, v190, v191, v192, v193, v194, v183);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v195);

    goto LABEL_91;
  }
  SEL v108 = objc_getProperty((id)a1, v107, 104, 1);
  v110 = v108;
  if (v108) {
    SEL v108 = objc_getProperty(v108, v109, 32, 1);
  }
  id v111 = v108;
  objc_setProperty_atomic((id)v5, v112, v111, 152);

  v114 = objc_getProperty((id)a1, v113, 112, 1);

  if (!v114)
  {
    long long v197 = ne_log_obj();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
    {
      v318 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v318;
      _os_log_error_impl(&dword_19DDAF000, v197, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", (uint8_t *)&buf, 0xCu);
    }
    long long v205 = @"Did not receive NONCE payload";
    goto LABEL_125;
  }
  v116 = objc_getProperty((id)a1, v115, 112, 1);
  v118 = v116;
  if (v116) {
    v116 = objc_getProperty(v116, v117, 24, 1);
  }
  id v119 = v116;

  if (!v119)
  {
    v207 = ne_log_obj();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
    {
      v321 = (char *)[(id)a1 copyShortDescription];
      int buf = 138412290;
      v384 = v321;
      _os_log_error_impl(&dword_19DDAF000, v207, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", (uint8_t *)&buf, 0xCu);
    }
    long long v205 = @"Did not receive NONCE data";
LABEL_125:
    uint64_t v138 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v205, v198, v199, v200, v201, v202, v203, v204, v361);
    goto LABEL_126;
  }
  id v121 = objc_getProperty((id)v5, v120, 80, 1);
  int v122 = [v121 strictNonceSizeChecks];

  if (!v122) {
    goto LABEL_133;
  }
  uint64_t v124 = objc_getProperty((id)a1, v123, 112, 1);
  v126 = v124;
  if (v124) {
    uint64_t v124 = objc_getProperty(v124, v125, 24, 1);
  }
  id v127 = v124;
  uint64_t v128 = [v127 length];

  self = (NEIKEv2AuthenticationProtocol *)v128;
  if ((unint64_t)(v128 - 257) > 0xFFFFFFFFFFFFFF0ELL)
  {
    id v210 = objc_getProperty((id)v5, v129, 96, 1);
    v212 = [(NEIKEv2IKESAProposal *)v210 prfProtocol];
    unsigned int v213 = [v212 nonceSize];

    if ((unint64_t)self < v213)
    {
      v214 = ne_log_obj();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
      {
        v328 = (char *)[(id)a1 copyShortDescription];
        id v330 = objc_getProperty((id)v5, v329, 96, 1);
        v332 = [(NEIKEv2IKESAProposal *)v330 prfProtocol];
        int buf = 138412802;
        v384 = v328;
        __int16 v385 = 2048;
        v386 = self;
        __int16 v387 = 2112;
        uint64_t v388 = (uint64_t)v332;
        _os_log_error_impl(&dword_19DDAF000, v214, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", (uint8_t *)&buf, 0x20u);
      }
      id v141 = objc_getProperty((id)v5, v215, 96, 1);
      v217 = [(NEIKEv2IKESAProposal *)v141 prfProtocol];
      v225 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is shorter than the minimum for PRF protocol %@", v218, v219, v220, v221, v222, v223, v224, (uint64_t)self);
      -[NEIKEv2IKESA setState:error:](v5, 3uLL, v225);

      goto LABEL_184;
    }
LABEL_133:
    v226 = objc_getProperty((id)a1, v123, 112, 1);
    v228 = v226;
    if (v226) {
      v226 = objc_getProperty(v226, v227, 24, 1);
    }
    id v229 = v226;
    objc_setProperty_atomic((id)v5, v230, v229, 136);

    v231 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x402F);
    id v141 = v231;
    if (v231)
    {
      id v233 = objc_getProperty(v231, v232, 32, 1);
      v234 = +[NEIKEv2Crypto copySignHashSetForData:]((uint64_t)NEIKEv2Crypto, v233);
      objc_storeStrong((id *)(v5 + 112), v234);
    }
    id v235 = objc_getProperty((id)v5, v232, 88, 1);
    v236 = [v235 authenticationProtocol];
    int v237 = [v236 isSecurePassword];

    if (v237)
    {
      v238 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4028);
      if (!v238)
      {
        v347 = ne_log_obj();
        if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
        {
          v358 = (char *)[(id)a1 copyShortDescription];
          int buf = 138412290;
          v384 = v358;
          _os_log_error_impl(&dword_19DDAF000, v347, OS_LOG_TYPE_ERROR, "%@ Did not receive secure password methods notify", (uint8_t *)&buf, 0xCu);
        }
        v267 = @"Did not receive secure password methods notify";
        goto LABEL_183;
      }
      selfa = v238;
      id v240 = objc_getProperty(v238, v239, 32, 1);
      if ([v240 length] == 2)
      {
        unsigned __int16 v374 = 0;
        id v365 = v240;
        [v240 getBytes:&v374 length:2];
        v241 = [NEIKEv2AuthenticationProtocol alloc];
        v242 = [(NEIKEv2AuthenticationProtocol *)v241 initWithSecurePassword:bswap32(v374) >> 16];
        id v244 = objc_getProperty((id)v5, v243, 88, 1);
        v245 = [v244 authenticationProtocol];
        BOOL v246 = [(NEIKEv2AuthenticationProtocol *)v242 isEqual:v245];

        if (v246)
        {
          objc_storeStrong((id *)(v5 + 104), v242);

          goto LABEL_142;
        }
        v295 = ne_log_obj();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
        {
          v324 = (char *)[(id)a1 copyShortDescription];
          id v326 = objc_getProperty((id)v5, v325, 88, 1);
          v327 = [v326 authenticationProtocol];
          int buf = 138412802;
          v384 = v324;
          __int16 v385 = 2112;
          v386 = v242;
          __int16 v387 = 2112;
          uint64_t v388 = (uint64_t)v327;
          _os_log_error_impl(&dword_19DDAF000, v295, OS_LOG_TYPE_ERROR, "%@ Secure password method %@ does not match configured %@", (uint8_t *)&buf, 0x20u);
        }
        id v297 = objc_getProperty((id)v5, v296, 88, 1);
        v362 = [v297 authenticationProtocol];
        v305 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Secure password method %@ does not match configured %@", v298, v299, v300, v301, v302, v303, v304, (uint64_t)v242);
        -[NEIKEv2IKESA setState:error:](v5, 3uLL, v305);
      }
      else
      {
        v348 = ne_log_obj();
        if (os_log_type_enabled(v348, OS_LOG_TYPE_ERROR))
        {
          v359 = (char *)[(id)a1 copyShortDescription];
          uint64_t v360 = [v240 length];
          int buf = 138412546;
          v384 = v359;
          __int16 v385 = 2048;
          v386 = (NEIKEv2AuthenticationProtocol *)v360;
          _os_log_error_impl(&dword_19DDAF000, v348, OS_LOG_TYPE_ERROR, "%@ Secure password methods notify has incorrect length %zu != sizeof(uint16_t)", (uint8_t *)&buf, 0x16u);
        }
        uint64_t v349 = [v240 length];
        v357 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Secure password methods notify has incorrect length %zu != sizeof(uint16_t)", v350, v351, v352, v353, v354, v355, v356, v349);
        -[NEIKEv2IKESA setState:error:](v5, 3uLL, v357);
      }
      goto LABEL_127;
    }
LABEL_142:
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x402E)
      && (*(unsigned char *)(v5 + 13) & 1) == 0)
    {
      *(unsigned char *)(v5 + 10) = 1;
      v247 = ne_log_obj();
      if (os_log_type_enabled(v247, OS_LOG_TYPE_DEBUG))
      {
        v333 = (char *)[(id)a1 copyShortDescription];
        int buf = 138412290;
        v384 = v333;
        _os_log_debug_impl(&dword_19DDAF000, v247, OS_LOG_TYPE_DEBUG, "%@ IKEv2 fragmentation supported", (uint8_t *)&buf, 0xCu);
      }
    }
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4022))
    {
      v248 = ne_log_obj();
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEBUG))
      {
        v323 = (char *)[(id)a1 copyShortDescription];
        int buf = 138412290;
        v384 = v323;
        _os_log_debug_impl(&dword_19DDAF000, v248, OS_LOG_TYPE_DEBUG, "%@ Childless IKEv2 supported", (uint8_t *)&buf, 0xCu);
      }
      id v250 = objc_getProperty((id)v5, v249, 80, 1);
      int v251 = [v250 requestChildlessSA];

      if (v251) {
        *(unsigned char *)(v5 + 23) = 1;
      }
    }
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4033))
    {
      id v253 = objc_getProperty((id)v5, v252, 80, 1);
      char v254 = [v253 requestPPK];

      if (v254)
      {
        *(unsigned char *)(v5 + 24) = 1;
        v255 = ne_log_obj();
        if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
        {
          v256 = (char *)[(id)a1 copyShortDescription];
          int buf = 138412290;
          v384 = v256;
          _os_log_impl(&dword_19DDAF000, v255, OS_LOG_TYPE_INFO, "%@ PPK use requested", (uint8_t *)&buf, 0xCu);
        }
LABEL_161:
        v268 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4004);
        v269 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4005);
        selfb = v268;
        if (!v268 || !v269) {
          goto LABEL_192;
        }
        id v366 = v269;
        v271 = [(NEIKEv2IKESA *)(unsigned char *)v5 initiatorSPI];
        v273 = [(NEIKEv2IKESA *)(unsigned char *)v5 responderSPI];
        id v275 = objc_getProperty((id)v5, v274, 72, 1);
        v363 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v271, v273, v275);

        v277 = [(NEIKEv2IKESA *)(unsigned char *)v5 initiatorSPI];
        v279 = [(NEIKEv2IKESA *)(unsigned char *)v5 responderSPI];
        id v281 = objc_getProperty((id)v5, v280, 64, 1);
        v282 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v277, v279, v281);

        id v284 = objc_getProperty(selfb, v283, 32, 1);
        LOBYTE(v281) = [v363 isEqualToData:v284];

        if ((v281 & 1) == 0)
        {
          *(unsigned char *)(v5 + 15) = 1;
          v286 = ne_log_obj();
          if (os_log_type_enabled(v286, OS_LOG_TYPE_DEBUG))
          {
            v344 = (char *)[(id)a1 copyShortDescription];
            int buf = 138412290;
            v384 = v344;
            _os_log_debug_impl(&dword_19DDAF000, v286, OS_LOG_TYPE_DEBUG, "%@ Detected incoming NAT", (uint8_t *)&buf, 0xCu);
          }
        }
        id v287 = objc_getProperty(v366, v285, 32, 1);
        char v288 = [v282 isEqualToData:v287];

        if ((v288 & 1) == 0)
        {
          *(unsigned char *)(v5 + 14) = 1;
          v290 = ne_log_obj();
          if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG))
          {
            v345 = (char *)[(id)a1 copyShortDescription];
            int buf = 138412290;
            v384 = v345;
            _os_log_debug_impl(&dword_19DDAF000, v290, OS_LOG_TYPE_DEBUG, "%@ Detected outgoing NAT", (uint8_t *)&buf, 0xCu);
          }
        }
        id v291 = objc_getProperty((id)v5, v289, 80, 1);
        if ([v291 disableSwitchToNATTPorts])
        {
        }
        else
        {
          id v316 = objc_getProperty((id)v5, v292, 88, 1);
          if ([v316 negotiateMOBIKE] & 1) != 0 || (*(unsigned char *)(v5 + 15))
          {
          }
          else
          {
            char v317 = *(unsigned char *)(v5 + 14);

            if ((v317 & 1) == 0) {
              goto LABEL_191;
            }
          }
          [(NEIKEv2IKESA *)v5 switchToNATTraversalPorts];
        }
LABEL_191:
        id v319 = objc_getProperty(v366, v293, 32, 1);
        objc_setProperty_atomic((id)v5, v320, v319, 496);

        v269 = v366;
LABEL_192:

        a1 = 1;
        goto LABEL_128;
      }
      v315 = ne_log_obj();
      if (os_log_type_enabled(v315, OS_LOG_TYPE_ERROR))
      {
        v335 = (char *)[(id)a1 copyShortDescription];
        int buf = 138412290;
        v384 = v335;
        _os_log_error_impl(&dword_19DDAF000, v315, OS_LOG_TYPE_ERROR, "%@ PPK use requested but PPK use is not configured", (uint8_t *)&buf, 0xCu);
      }
      v267 = @"PPK use requested but PPK use is not configured";
    }
    else
    {
      id v257 = objc_getProperty((id)v5, v252, 88, 1);
      int v258 = [v257 ppkMandatory];

      if (!v258) {
        goto LABEL_161;
      }
      v259 = ne_log_obj();
      if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
      {
        v334 = (char *)[(id)a1 copyShortDescription];
        int buf = 138412290;
        v384 = v334;
        _os_log_error_impl(&dword_19DDAF000, v259, OS_LOG_TYPE_ERROR, "%@ PPK use not requested but PPK use is mandatory", (uint8_t *)&buf, 0xCu);
      }
      v267 = @"PPK use not requested but PPK use is mandatory";
    }
LABEL_183:
    v217 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v267, v260, v261, v262, v263, v264, v265, v266, v361);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v217);
LABEL_184:

    goto LABEL_127;
  }
  id v130 = ne_log_obj();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
  {
    v322 = (char *)[(id)a1 copyShortDescription];
    int buf = 138412546;
    v384 = v322;
    __int16 v385 = 2048;
    v386 = (NEIKEv2AuthenticationProtocol *)v128;
    _os_log_error_impl(&dword_19DDAF000, v130, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", (uint8_t *)&buf, 0x16u);
  }
  uint64_t v138 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is out of bounds", v131, v132, v133, v134, v135, v136, v137, v128);
LABEL_126:
  id v141 = v138;
  -[NEIKEv2IKESA setState:error:](v5, 3uLL, v138);
LABEL_127:
  a1 = 0;
LABEL_128:
  id v74 = v373;
LABEL_107:

LABEL_108:
LABEL_109:

LABEL_48:
LABEL_49:

  return a1;
}

- (uint64_t)validateSAInitAsResponder:(void *)a3 errorCodeToSend:
{
  uint64_t v267 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint64_t v7 = (uint64_t)v5;
  if (v5 && (v5[9] & 1) != 0)
  {
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v261 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsResponder:errorCodeToSend:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", buf, 0xCu);
    }
  }
  else
  {
    if ([(NEIKEv2Packet *)a1 hasErrors])
    {
      long long v258 = 0u;
      long long v259 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      if (a1) {
        id Property = objc_getProperty(a1, v8, 64, 1);
      }
      else {
        id Property = 0;
      }
      uint64_t v10 = Property;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v256 objects:v266 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v257;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v257 != v13) {
              objc_enumerationMutation(v10);
            }
            SEL v15 = *(__CFString **)(*((void *)&v256 + 1) + 8 * i);
            if (v15 && (unint64_t)(v15->length - 1) <= 0x3FFE)
            {
              id v103 = -[NEIKEv2NotifyPayload copyError](v15);
              v104 = ne_log_obj();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                id v130 = (char *)[a1 copyShortDescription];
                *(_DWORD *)int buf = 138412546;
                uint64_t v261 = v130;
                __int16 v262 = 2112;
                unint64_t v263 = (unint64_t)v103;
                _os_log_error_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_ERROR, "%@ Responder init received notify error %@", buf, 0x16u);
              }
              -[NEIKEv2IKESA setState:error:](v7, 3uLL, v103);

              goto LABEL_71;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v256 objects:v266 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    SEL v16 = objc_getProperty(a1, v8, 32, 1);
    uint64_t v17 = [v16 value];

    if (v17)
    {
      SEL v19 = objc_getProperty(a1, v18, 32, 1);
      -[NEIKEv2IKESA assignRemoteSPI:]((void *)v7, v19);

      SEL v21 = objc_getProperty(a1, v20, 96, 1);
      SEL v23 = v21;
      if (v21) {
        SEL v21 = objc_getProperty(v21, v22, 24, 1);
      }
      uint64_t v10 = v21;

      if (v7) {
        id v25 = objc_getProperty((id)v7, v24, 80, 1);
      }
      else {
        id v25 = 0;
      }
      id v26 = v25;
      SEL v27 = [v26 proposals];

      if ([v10 count])
      {
        if (v7) {
          id v29 = objc_getProperty((id)v7, v28, 80, 1);
        }
        else {
          id v29 = 0;
        }
        id v30 = v29;
        v31 = +[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]((uint64_t)NEIKEv2IKESAProposal, v27, v10, [v30 preferInitiatorProposalOrder]);
        objc_setProperty_atomic((id)v7, v32, v31, 96);

        SEL v33 = ne_log_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v35 = (char *)[a1 copyShortDescription];
          if (v7) {
            id v36 = objc_getProperty((id)v7, v34, 96, 1);
          }
          else {
            id v36 = 0;
          }
          id v37 = v36;
          *(_DWORD *)int buf = 138412802;
          uint64_t v261 = v35;
          __int16 v262 = 2112;
          unint64_t v263 = (unint64_t)v37;
          __int16 v264 = 2112;
          uint64_t v265 = (uint64_t)v10;
          _os_log_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_INFO, "%@ Choosing SA proposal %@ from %@", buf, 0x20u);
        }
        if (v7) {
          id v39 = objc_getProperty((id)v7, v38, 96, 1);
        }
        else {
          id v39 = 0;
        }
        id v40 = v39;

        if (v40)
        {
          if (v7)
          {
            id v42 = objc_getProperty((id)v7, v41, 96, 1);
            uint64_t v44 = v42;
            if (v42) {
              id v42 = objc_getProperty(v42, v43, 120, 1);
            }
          }
          else
          {
            uint64_t v44 = 0;
            id v42 = 0;
          }
          id v45 = v42;

          if (v45 && (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4036) & 1) == 0)
          {
            id v235 = ne_log_obj();
            if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
            {
              v247 = (char *)[a1 copyShortDescription];
              if (v7) {
                id v248 = objc_getProperty((id)v7, v246, 96, 1);
              }
              else {
                id v248 = 0;
              }
              id v249 = v248;
              *(_DWORD *)int buf = 138412546;
              uint64_t v261 = v247;
              __int16 v262 = 2112;
              unint64_t v263 = (unint64_t)v249;
              _os_log_error_impl(&dword_19DDAF000, v235, OS_LOG_TYPE_ERROR, "%@ Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@", buf, 0x16u);
            }
            if (v7) {
              id v237 = objc_getProperty((id)v7, v236, 96, 1);
            }
            else {
              id v237 = 0;
            }
            id v127 = v237;
            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@", v238, v239, v240, v241, v242, v243, v244, (uint64_t)v127);
            -[NEIKEv2IKESA setState:error:](v7, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_90;
          }
          SEL v47 = objc_getProperty(a1, v46, 104, 1);

          if (v47)
          {
            uint64_t v49 = objc_getProperty(a1, v48, 104, 1);
            uint64_t v51 = v49;
            if (v49) {
              uint64_t v49 = objc_getProperty(v49, v50, 24, 1);
            }
            id v52 = v49;

            if (v52)
            {
              uint64_t v54 = objc_getProperty(a1, v53, 104, 1);
              char v56 = v54;
              if (v54) {
                uint64_t v54 = objc_getProperty(v54, v55, 32, 1);
              }
              id v57 = v54;

              if (v57)
              {
                uint64_t v59 = objc_getProperty(a1, v58, 104, 1);
                uint64_t v61 = v59;
                if (v59) {
                  uint64_t v59 = objc_getProperty(v59, v60, 24, 1);
                }
                id v62 = v59;
                uint64_t v64 = [v62 method];
                v255 = v27;
                if (v7) {
                  id v65 = objc_getProperty((id)v7, v63, 96, 1);
                }
                else {
                  id v65 = 0;
                }
                id v66 = v65;
                uint64_t v68 = [(NEIKEv2IKESAProposal *)v66 kemProtocol];
                uint64_t v69 = [v68 method];

                if (v64 == v69)
                {
                  uint64_t v71 = objc_getProperty(a1, v70, 104, 1);
                  uint64_t v73 = v71;
                  SEL v27 = v255;
                  if (v71) {
                    uint64_t v71 = objc_getProperty(v71, v72, 32, 1);
                  }
                  id v75 = v71;
                  if (v7) {
                    objc_setProperty_atomic((id)v7, v74, v75, 152);
                  }

                  SEL v77 = objc_getProperty(a1, v76, 112, 1);

                  if (v77)
                  {
                    id v79 = objc_getProperty(a1, v78, 112, 1);
                    id v81 = v79;
                    if (v79) {
                      id v79 = objc_getProperty(v79, v80, 24, 1);
                    }
                    id v82 = v79;

                    if (v82)
                    {
                      if (v7) {
                        id v84 = objc_getProperty((id)v7, v83, 80, 1);
                      }
                      else {
                        id v84 = 0;
                      }
                      id v85 = v84;
                      int v86 = [v85 strictNonceSizeChecks];

                      if (v86)
                      {
                        uint64_t v88 = objc_getProperty(a1, v87, 112, 1);
                        v90 = v88;
                        if (v88) {
                          uint64_t v88 = objc_getProperty(v88, v89, 24, 1);
                        }
                        id v91 = v88;
                        unint64_t v92 = [v91 length];

                        if (v92 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
                        {
                          id v94 = ne_log_obj();
                          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                          {
                            v225 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412546;
                            uint64_t v261 = v225;
                            __int16 v262 = 2048;
                            unint64_t v263 = v92;
                            _os_log_error_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", buf, 0x16u);
                          }
                          SEL v102 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is out of bounds", v95, v96, v97, v98, v99, v100, v101, v92);
                          goto LABEL_104;
                        }
                        if (v7) {
                          id v147 = objc_getProperty((id)v7, v93, 96, 1);
                        }
                        else {
                          id v147 = 0;
                        }
                        id v148 = v147;
                        v150 = [(NEIKEv2IKESAProposal *)v148 prfProtocol];
                        unsigned int v151 = [v150 nonceSize];

                        if (v92 < v151)
                        {
                          uint64_t v152 = ne_log_obj();
                          if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                          {
                            SEL v230 = (char *)[a1 copyShortDescription];
                            if (v7) {
                              id v231 = objc_getProperty((id)v7, v229, 96, 1);
                            }
                            else {
                              id v231 = 0;
                            }
                            id v232 = v231;
                            v234 = [(NEIKEv2IKESAProposal *)v232 prfProtocol];
                            *(_DWORD *)int buf = 138412802;
                            uint64_t v261 = v230;
                            __int16 v262 = 2048;
                            unint64_t v263 = v92;
                            __int16 v264 = 2112;
                            uint64_t v265 = (uint64_t)v234;
                            _os_log_error_impl(&dword_19DDAF000, v152, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x20u);
                          }
                          if (v7) {
                            id v154 = objc_getProperty((id)v7, v153, 96, 1);
                          }
                          else {
                            id v154 = 0;
                          }
                          id v144 = v154;
                          int v251 = [(NEIKEv2IKESAProposal *)v144 prfProtocol];
                          uint64_t v163 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(@"NONCE data length %zu is shorter than the minimum for PRF protocol %@", v156, v157, v158, v159, v160, v161, v162, v92);
                          -[NEIKEv2IKESA setState:error:](v7, 3uLL, v163);

                          goto LABEL_105;
                        }
                      }
                      uint64_t v164 = objc_getProperty(a1, v87, 112, 1);
                      uint64_t v166 = v164;
                      if (v164) {
                        uint64_t v164 = objc_getProperty(v164, v165, 24, 1);
                      }
                      id v167 = v164;
                      objc_setProperty_atomic((id)v7, v168, v167, 136);

                      uint64_t v169 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x402F);
                      v171 = v169;
                      if (v169)
                      {
                        id v172 = objc_getProperty(v169, v170, 32, 1);
                        SEL v173 = +[NEIKEv2Crypto copySignHashSetForData:]((uint64_t)NEIKEv2Crypto, v172);
                        objc_storeStrong((id *)(v7 + 112), v173);
                      }
                      SEL v174 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4028);
                      id v175 = (void *)-[NEIKEv2IKESA selectSecurePasswordMethod:]((void *)v7, v174);
                      objc_storeStrong((id *)(v7 + 104), v175);

                      if (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x402E)
                        && (*(unsigned char *)(v7 + 13) & 1) == 0)
                      {
                        *(unsigned char *)(v7 + 10) = 1;
                        v176 = ne_log_obj();
                        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
                        {
                          v226 = (char *)[a1 copyShortDescription];
                          *(_DWORD *)int buf = 138412290;
                          uint64_t v261 = v226;
                          _os_log_debug_impl(&dword_19DDAF000, v176, OS_LOG_TYPE_DEBUG, "%@ IKEv2 fragmentation supported", buf, 0xCu);
                        }
                      }
                      if (!-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4033))
                      {
LABEL_130:
                        SEL v184 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4004);
                        id v185 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4005);
                        v187 = v185;
                        if (!v184 || !v185) {
                          goto LABEL_154;
                        }
                        v252 = v171;
                        char v254 = v174;
                        uint64_t v188 = [(NEIKEv2IKESA *)(unsigned char *)v7 initiatorSPI];
                        id v190 = objc_getProperty((id)v7, v189, 72, 1);
                        uint64_t v191 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v188, 0, v190);

                        uint64_t v193 = [(NEIKEv2IKESA *)(unsigned char *)v7 initiatorSPI];
                        id v195 = objc_getProperty((id)v7, v194, 64, 1);
                        long long v196 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v193, 0, v195);

                        id v198 = objc_getProperty(v184, v197, 32, 1);
                        id v253 = v191;
                        LOBYTE(v195) = [v191 isEqualToData:v198];

                        if ((v195 & 1) == 0)
                        {
                          *(unsigned char *)(v7 + 15) = 1;
                          uint64_t v200 = ne_log_obj();
                          if (os_log_type_enabled(v200, OS_LOG_TYPE_DEBUG))
                          {
                            v227 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412290;
                            uint64_t v261 = v227;
                            _os_log_debug_impl(&dword_19DDAF000, v200, OS_LOG_TYPE_DEBUG, "%@ Detected incoming NAT", buf, 0xCu);
                          }
                        }
                        id v201 = objc_getProperty(v187, v199, 32, 1);
                        char v202 = [v196 isEqualToData:v201];

                        v171 = v252;
                        if ((v202 & 1) == 0)
                        {
                          *(unsigned char *)(v7 + 14) = 1;
                          uint64_t v204 = ne_log_obj();
                          if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
                          {
                            v228 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412290;
                            uint64_t v261 = v228;
                            _os_log_debug_impl(&dword_19DDAF000, v204, OS_LOG_TYPE_DEBUG, "%@ Detected outgoing NAT", buf, 0xCu);
                          }
                        }
                        id v205 = objc_getProperty((id)v7, v203, 80, 1);
                        if ([v205 disableSwitchToNATTPorts])
                        {
                        }
                        else
                        {
                          id v207 = objc_getProperty((id)v7, v206, 88, 1);
                          if ([v207 negotiateMOBIKE] & 1) != 0 || (*(unsigned char *)(v7 + 15))
                          {
                          }
                          else
                          {
                            char v208 = *(unsigned char *)(v7 + 14);

                            if ((v208 & 1) == 0) {
                              goto LABEL_153;
                            }
                          }
                          [(NEIKEv2IKESA *)v7 switchToNATTraversalPorts];
                        }
LABEL_153:

                        SEL v174 = v254;
                        SEL v27 = v255;
LABEL_154:

                        uint64_t v113 = 1;
                        goto LABEL_92;
                      }
                      id v178 = objc_getProperty((id)v7, v177, 80, 1);
                      char v179 = [v178 requestPPK];

                      if (v179)
                      {
                        *(unsigned char *)(v7 + 24) = 1;
                        SEL v180 = ne_log_obj();
                        if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                        {
                          v181 = (char *)[a1 copyShortDescription];
                          *(_DWORD *)int buf = 138412290;
                          uint64_t v261 = v181;
                          v182 = "%@ PPK use requested";
LABEL_128:
                          _os_log_impl(&dword_19DDAF000, v180, OS_LOG_TYPE_INFO, v182, buf, 0xCu);
                        }
                      }
                      else
                      {
                        SEL v180 = ne_log_obj();
                        if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                        {
                          v181 = (char *)[a1 copyShortDescription];
                          *(_DWORD *)int buf = 138412290;
                          uint64_t v261 = v181;
                          v182 = "%@ PPK use requested but PPK use is not configured";
                          goto LABEL_128;
                        }
                      }

                      goto LABEL_130;
                    }
                    uint64_t v143 = ne_log_obj();
                    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v224 = (char *)[a1 copyShortDescription];
                      *(_DWORD *)int buf = 138412290;
                      uint64_t v261 = v224;
                      _os_log_error_impl(&dword_19DDAF000, v143, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", buf, 0xCu);
                    }
                    id v141 = @"Did not receive NONCE data";
                  }
                  else
                  {
                    uint64_t v133 = ne_log_obj();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v223 = (char *)[a1 copyShortDescription];
                      *(_DWORD *)int buf = 138412290;
                      uint64_t v261 = v223;
                      _os_log_error_impl(&dword_19DDAF000, v133, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", buf, 0xCu);
                    }
                    id v141 = @"Did not receive NONCE payload";
                  }
                  SEL v102 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v141, v134, v135, v136, v137, v138, v139, v140, v250);
LABEL_104:
                  id v144 = v102;
                  -[NEIKEv2IKESA setState:error:](v7, 3uLL, v102);
LABEL_105:

                  goto LABEL_91;
                }
                SEL v129 = ne_log_obj();
                SEL v27 = v255;
                if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                {
                  id v210 = (char *)[a1 copyShortDescription];
                  v212 = objc_getProperty(a1, v211, 104, 1);
                  v214 = v212;
                  if (v212) {
                    v212 = objc_getProperty(v212, v213, 24, 1);
                  }
                  id v215 = v212;
                  uint64_t v217 = [v215 method];
                  if (v7) {
                    id v218 = objc_getProperty((id)v7, v216, 96, 1);
                  }
                  else {
                    id v218 = 0;
                  }
                  id v219 = v218;
                  uint64_t v221 = [(NEIKEv2IKESAProposal *)v219 kemProtocol];
                  uint64_t v222 = [v221 method];
                  *(_DWORD *)int buf = 138412802;
                  uint64_t v261 = v210;
                  __int16 v262 = 2048;
                  unint64_t v263 = v217;
                  __int16 v264 = 2048;
                  uint64_t v265 = v222;
                  _os_log_error_impl(&dword_19DDAF000, v129, OS_LOG_TYPE_ERROR, "%@ Received KE method %zu does not match KE method %zu in SA proposal", buf, 0x20u);

                  SEL v27 = v255;
                }

                if (a3)
                {
                  uint64_t v113 = 0;
                  *a3 = 17;
                  goto LABEL_92;
                }
LABEL_91:
                uint64_t v113 = 0;
LABEL_92:

                goto LABEL_93;
              }
              v126 = ne_log_obj();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                uint64_t v183 = (char *)[a1 copyShortDescription];
                *(_DWORD *)int buf = 138412290;
                uint64_t v261 = v183;
                _os_log_error_impl(&dword_19DDAF000, v126, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", buf, 0xCu);
              }
              int v122 = @"Did not receive data in KE payload";
            }
            else
            {
              uint64_t v125 = ne_log_obj();
              if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
              {
                uint64_t v146 = (char *)[a1 copyShortDescription];
                *(_DWORD *)int buf = 138412290;
                uint64_t v261 = v146;
                _os_log_error_impl(&dword_19DDAF000, v125, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", buf, 0xCu);
              }
              int v122 = @"Did not receive method in KE payload";
            }
          }
          else
          {
            uint64_t v124 = ne_log_obj();
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              uint64_t v145 = (char *)[a1 copyShortDescription];
              *(_DWORD *)int buf = 138412290;
              uint64_t v261 = v145;
              _os_log_error_impl(&dword_19DDAF000, v124, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", buf, 0xCu);
            }
            int v122 = @"Did not receive KE payload";
          }
        }
        else
        {
          uint64_t v123 = ne_log_obj();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            uint64_t v142 = (char *)[a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            uint64_t v261 = v142;
            _os_log_error_impl(&dword_19DDAF000, v123, OS_LOG_TYPE_ERROR, "%@ No matching proposal found", buf, 0xCu);
          }
          if (a3) {
            *a3 = 14;
          }
          int v122 = @"No matching proposal found";
        }
      }
      else
      {
        v114 = ne_log_obj();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          uint64_t v132 = (char *)[a1 copyShortDescription];
          *(_DWORD *)int buf = 138412290;
          uint64_t v261 = v132;
          _os_log_error_impl(&dword_19DDAF000, v114, OS_LOG_TYPE_ERROR, "%@ Received no SA proposals", buf, 0xCu);
        }
        int v122 = @"Received no SA proposals";
      }
      id v127 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(v122, v115, v116, v117, v118, v119, v120, v121, v250);
      -[NEIKEv2IKESA setState:error:](v7, 3uLL, v127);
LABEL_90:

      goto LABEL_91;
    }
    v105 = ne_log_obj();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      uint64_t v131 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint64_t v261 = v131;
      _os_log_error_impl(&dword_19DDAF000, v105, OS_LOG_TYPE_ERROR, "%@ Received no remote SPI on SA_INIT", buf, 0xCu);
    }
    uint64_t v10 = NEIKEv2CreateErrorPeerInvalidSyntax(@"Received no remote SPI on SA_INIT", v106, v107, v108, v109, v110, v111, v112, v250);
    -[NEIKEv2IKESA setState:error:](v7, 3uLL, v10);
  }
LABEL_71:
  uint64_t v113 = 0;
LABEL_93:

  return v113;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ke, 0);
  objc_storeStrong((id *)&self->_sa, 0);

  objc_storeStrong((id *)&self->_cookie, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (self) {
    self = (NEIKEv2IKESAInitPacket *)objc_getProperty(self, a2, 80, 1);
  }
  v3 = self;
  uint64_t v4 = [(NEIKEv2IKESAInitPacket *)v3 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = &OBJC_IVAR___NEIKEv2IKESA__error;
    uint64_t v7 = &OBJC_IVAR___NEIKEv2IKESA__error;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = v6[128];
LABEL_17:
          objc_setProperty_atomic(v2, v11, v10, v12);
          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = v7[129];
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = 112;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v20, 120, 1))
            {
              SEL v23 = objc_msgSend(objc_getProperty(v2, v21, 120, 1), "arrayByAddingObject:", v10);
              goto LABEL_40;
            }
            id v36 = v10;
            SEL v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v36, 1, (void)v31);
            if (v2)
            {
LABEL_40:
              ptrdiff_t v27 = 120;
              SEL v28 = v2;
              id v29 = v23;
              goto LABEL_43;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_18;
            }
            if (v2 && objc_getProperty(v2, v24, 56, 1))
            {
              SEL v23 = objc_msgSend(objc_getProperty(v2, v25, 56, 1), "arrayByAddingObject:", v10);
            }
            else
            {
              id v35 = v10;
              SEL v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v35, 1, (void)v31);
              if (!v2) {
                goto LABEL_44;
              }
            }
            SEL v28 = v2;
            id v29 = v23;
            ptrdiff_t v27 = 56;
LABEL_43:
            objc_setProperty_atomic(v28, v22, v29, v27);
          }
LABEL_44:

          goto LABEL_18;
        }
        uint64_t v13 = v6;
        v14 = v7;
        SEL v16 = v10;
        if (v2 && objc_getProperty(v2, v15, 64, 1))
        {
          SEL v19 = objc_msgSend(objc_getProperty(v2, v17, 64, 1), "arrayByAddingObject:", v16);
        }
        else
        {
          id v37 = v16;
          SEL v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v37, 1, (void)v31);
          if (!v2) {
            goto LABEL_34;
          }
        }
        objc_setProperty_atomic(v2, v18, v19, 64);
LABEL_34:

        if (v16 && v2 && v16[3] == 16390) {
          objc_setProperty_atomic(v2, v26, v16, 88);
        }

        uint64_t v7 = v14;
        id v6 = v13;
LABEL_18:
        ++v9;
      }
      while (v5 != v9);
      uint64_t v30 = [(NEIKEv2IKESAInitPacket *)v3 countByEnumeratingWithState:&v31 objects:v38 count:16];
      uint64_t v5 = v30;
    }
    while (v30);
  }
}

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    if (objc_getProperty(self, v4, 96, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    }
    if (objc_getProperty(self, v5, 104, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 104, 1));
    }
    if (objc_getProperty(self, v6, 112, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v7, 112, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v7, 120, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v8, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v9, 56, 1));
    objc_setProperty_atomic(self, v10, newValue, 80);
  }
  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

+ (BOOL)encryptPayloads
{
  return 0;
}

+ (unint64_t)exchangeType
{
  return 34;
}

+ (id)copyTypeDescription
{
  return @"IKE_SA_INIT";
}

@end