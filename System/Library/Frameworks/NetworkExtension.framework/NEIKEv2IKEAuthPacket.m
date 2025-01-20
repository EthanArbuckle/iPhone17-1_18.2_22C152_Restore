@interface NEIKEv2IKEAuthPacket
+ (NSObject)createIKEAuthForInitiatorIKESA:(void *)a3 childSA:;
+ (id)copyTypeDescription;
+ (id)createIKEAuthResponse:(unint64_t)a3 refusalError:;
+ (id)prepareDeviceIdentityNotifyPayload:(void *)a3 IMEISV:(void *)a4 lastResponderPacket:;
+ (unint64_t)exchangeType;
- (uint64_t)validateAuthPart1AsInitiator:(int)a3 beforeEAP:;
- (uint64_t)validateAuthPayloadAsInitiator:(char)a3 beforeEAP:;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IKEAuthPacket

+ (NSObject)createIKEAuthForInitiatorIKESA:(void *)a3 childSA:
{
  uint64_t v297 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  v5 = a3;
  self;
  if (!v4)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_153;
    }
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA";
    goto LABEL_43;
  }
  if (!v5 && (*((unsigned char *)v4 + 23) & 1) == 0)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_153;
    }
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null childSA";
    goto LABEL_43;
  }
  id v7 = objc_getProperty(v4, v6, 96, 1);

  if (!v7)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_153:
      v129 = 0;
      goto LABEL_154;
    }
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA.chosenProposal";
LABEL_43:
    _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, v102, (uint8_t *)&buf, 0xCu);
    goto LABEL_153;
  }
  v8 = -[NEIKEv2Packet initOutbound]([NEIKEv2IKEAuthPacket alloc]);
  if (!v8)
  {
    v103 = ne_log_obj();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initOutbound:] failed", (uint8_t *)&buf, 2u);
    }

    v9 = 0;
    goto LABEL_153;
  }
  v9 = v8;
  v10 = objc_alloc_init(NEIKEv2InitiatorIdentifierPayload);
  objc_setProperty_atomic(v9, v11, v10, 96);

  v13 = [(NEIKEv2IKESA *)v4 copyInitiatorIdentifier];
  v15 = objc_getProperty(v9, v14, 96, 1);
  v17 = v15;
  if (v15) {
    objc_setProperty_atomic(v15, v16, v13, 24);
  }

  uint64_t v19 = objc_getProperty(v9, v18, 96, 1);
  v20 = (void *)v19;
  if (v19) {
    objc_storeWeak((id *)(v19 + 32), v4);
  }

  v22 = objc_getProperty(v9, v21, 96, 1);
  char v23 = -[NEIKEv2Payload isValid]((uint64_t)v22);

  if ((v23 & 1) == 0)
  {
    v100 = ne_log_obj();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      int buf = 136315138;
      v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
      v101 = "%s called with null packet.idi.isValid";
      goto LABEL_150;
    }
LABEL_152:

    goto LABEL_153;
  }
  v25 = objc_getProperty(v9, v24, 96, 1);
  objc_storeWeak(v4 + 41, v25);

  v27 = [(NEIKEv2IKESA *)v4 copyResponderIdentifier];
  if (v27)
  {
    v29 = objc_alloc_init(NEIKEv2ResponderIdentifierPayload);
    objc_setProperty_atomic(v9, v30, v29, 104);

    v32 = [(NEIKEv2IKESA *)v4 copyResponderIdentifier];
    v34 = objc_getProperty(v9, v33, 104, 1);
    v36 = v34;
    if (v34) {
      objc_setProperty_atomic(v34, v35, v32, 24);
    }

    v38 = objc_getProperty(v9, v37, 104, 1);
    char v39 = -[NEIKEv2Payload isValid]((uint64_t)v38);

    if ((v39 & 1) == 0)
    {
      v100 = ne_log_obj();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        int buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.idr.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
  }
  v269 = v4;
  self = v9;
  if ((*((unsigned char *)v4 + 23) & 1) == 0)
  {
    v40 = objc_alloc_init(NEIKEv2ChildSAPayload);
    objc_setProperty_atomic(v9, v41, v40, 88);

    v43 = [(NEIKEv2ChildSA *)v5 configProposalsWithoutKEM];
    v45 = objc_getProperty(v9, v44, 88, 1);
    v47 = v45;
    if (v45) {
      objc_setProperty_atomic(v45, v46, v43, 24);
    }

    v49 = objc_getProperty(v9, v48, 88, 1);
    char v50 = -[NEIKEv2Payload isValid]((uint64_t)v49);

    if ((v50 & 1) == 0)
    {
      v100 = ne_log_obj();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        int buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.sa.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    v51 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
    objc_setProperty_atomic(v9, v52, v51, 160);

    v54 = [(NEIKEv2ChildSA *)v5 configuredInitiatorTrafficSelectors];
    v56 = objc_getProperty(v9, v55, 160, 1);
    v58 = v56;
    if (v56) {
      objc_setProperty_atomic(v56, v57, v54, 24);
    }

    v60 = objc_getProperty(v9, v59, 160, 1);
    char v61 = -[NEIKEv2Payload isValid]((uint64_t)v60);

    if ((v61 & 1) == 0)
    {
      v100 = ne_log_obj();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        int buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.tsi.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    v62 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
    objc_setProperty_atomic(v9, v63, v62, 168);

    v65 = [(NEIKEv2ChildSA *)v5 configuredResponderTrafficSelectors];
    v67 = objc_getProperty(v9, v66, 168, 1);
    v69 = v67;
    if (v67) {
      objc_setProperty_atomic(v67, v68, v65, 24);
    }

    v71 = objc_getProperty(v9, v70, 168, 1);
    char v72 = -[NEIKEv2Payload isValid]((uint64_t)v71);

    if ((v72 & 1) == 0)
    {
      v100 = ne_log_obj();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        int buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.tsr.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    if (v5) {
      id Property = objc_getProperty(v5, v73, 48, 1);
    }
    else {
      id Property = 0;
    }
    id v75 = Property;
    uint64_t v76 = [v75 mode];

    if (v76 == 1 && !-[NEIKEv2Packet addNotification:data:](v9, 0x4007uLL, 0))
    {
      v100 = ne_log_obj();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
        goto LABEL_152;
      }
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
      goto LABEL_187;
    }
    if (!-[NEIKEv2Packet addNotification:data:](v9, 0x400AuLL, 0))
    {
      v100 = ne_log_obj();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
        goto LABEL_152;
      }
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeESPTFCPaddingNotSupported] failed";
      goto LABEL_187;
    }
    if (!-[NEIKEv2Packet addNotification:data:](v9, 0x400BuLL, 0))
    {
      v100 = ne_log_obj();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
        goto LABEL_152;
      }
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeNonFirstFragmentsAlso] failed";
      goto LABEL_187;
    }
    if (v5) {
      id v78 = objc_getProperty(v5, v77, 48, 1);
    }
    else {
      id v78 = 0;
    }
    id v79 = v78;
    int v80 = [v79 sequencePerTrafficClass];

    if (v80)
    {
      v82 = +[NEIKEv2NotifyPayload createNotifyPayloadType:]();
      BOOL v83 = -[NEIKEv2Packet addNotifyPayload:](v9, v82);

      if (!v83)
      {
        v100 = ne_log_obj();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
          goto LABEL_152;
        }
        LOWORD(buf) = 0;
        v101 = "[packet addNotifyPayload:notifyPayload] failed";
        goto LABEL_187;
      }
    }
    id v84 = objc_getProperty(v4, v81, 88, 1);
    v85 = [v84 configurationRequest];

    if (v85)
    {
      v87 = v5;
      v88 = objc_alloc_init(NEIKEv2ConfigPayload);
      objc_setProperty_atomic(v9, v89, v88, 152);

      id v91 = objc_getProperty(v4, v90, 88, 1);
      v92 = [v91 configurationRequest];
      id v94 = objc_getProperty(v9, v93, 152, 1);
      v96 = v94;
      if (v94) {
        objc_setProperty_atomic(v94, v95, v92, 24);
      }

      id v98 = objc_getProperty(v9, v97, 152, 1);
      char v99 = -[NEIKEv2Payload isValid]((uint64_t)v98);

      v5 = v87;
      if ((v99 & 1) == 0)
      {
        v100 = ne_log_obj();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        {
          int buf = 136315138;
          v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
          v101 = "%s called with null packet.config.isValid";
LABEL_150:
          v223 = v100;
          uint32_t v224 = 12;
LABEL_151:
          _os_log_fault_impl(&dword_19DDAF000, v223, OS_LOG_TYPE_FAULT, v101, (uint8_t *)&buf, v224);
          goto LABEL_152;
        }
        goto LABEL_152;
      }
    }
LABEL_77:
    id v130 = objc_getProperty(v4, v86, 88, 1);
    char v131 = [v130 initialContactDisabled];

    if ((v131 & 1) != 0 || -[NEIKEv2Packet addNotification:data:](v9, 0x4000uLL, 0))
    {
      id v133 = objc_getProperty(v4, v132, 88, 1);
      int v134 = [v133 negotiateMOBIKE];

      if (!v134 || -[NEIKEv2Packet addNotification:data:](v9, 0x400CuLL, 0))
      {
        v268 = v5;
        v136 = [(NEIKEv2IKESA *)v4 remoteAuthentication];
        if ([v136 method])
        {
          if ([v136 isSignature])
          {
            id v139 = objc_getProperty(v4, v138, 88, 1);
            if (!v139 || (v140 = v139, uint64_t v141 = [v139 remotePublicKeyRef], v140, !v141))
            {
              v142 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityHashData](v4);
              if (v142)
              {
                v143 = objc_alloc_init(NEIKEv2CertificateRequestPayload);
                if (!v143)
                {
                  v267 = ne_log_obj();
                  if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
                  {
                    int buf = 136315138;
                    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                    _os_log_fault_impl(&dword_19DDAF000, v267, OS_LOG_TYPE_FAULT, "%s called with null certReq", (uint8_t *)&buf, 0xCu);
                  }

                  goto LABEL_208;
                }
                v145 = v143;
                objc_setProperty_atomic(v143, v144, v142, 32);
                v145->_encoding = 4;
                v294 = v145;
                v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v294 count:1];
                objc_setProperty_atomic(v9, v147, v146, 120);
              }
            }
          }
          if ([v136 isSecurePassword])
          {
            v149 = -[NEIKEv2GSPM initWithIKESA:]((id *)[NEIKEv2GSPM alloc], v4);
            if (v149)
            {
              v150 = (NEIKEv2CertificatePayload *)v149;
              v151 = objc_alloc_init(NEIKEv2GSPMPayload);
              objc_setProperty_atomic(v9, v152, v151, 144);

              v153 = v150->super._payloadData;
              id v155 = objc_getProperty(v9, v154, 144, 1);
              -[NEIKEv2GSPMPayload setGspmData:]((uint64_t)v155, v153);

              objc_setProperty_atomic(v4, v156, v150, 456);
LABEL_92:

LABEL_102:
              long long v282 = 0u;
              long long v283 = 0u;
              long long v280 = 0u;
              long long v281 = 0u;
              id v165 = objc_getProperty(v4, v157, 88, 1);
              v166 = [v165 customIKEAuthPrivateNotifies];

              uint64_t v167 = [v166 countByEnumeratingWithState:&v280 objects:v292 count:16];
              if (v167)
              {
                uint64_t v168 = v167;
                uint64_t v169 = *(void *)v281;
                while (2)
                {
                  uint64_t v170 = 0;
                  do
                  {
                    if (*(void *)v281 != v169) {
                      objc_enumerationMutation(v166);
                    }
                    v171 = *(void **)(*((void *)&v280 + 1) + 8 * v170);
                    v172 = objc_alloc_init(NEIKEv2NotifyPayload);
                    unsigned int v173 = [v171 notifyStatus];
                    if (v172)
                    {
                      v172->_notifyType = v173;
                      v174 = [v171 notifyData];
                      objc_setProperty_atomic(v172, v175, v174, 32);
                    }
                    else
                    {
                      v174 = [v171 notifyData];
                    }

                    if (!-[NEIKEv2Packet addNotifyPayload:](self, v172))
                    {
                      v222 = ne_log_obj();
                      v4 = v269;
                      if (os_log_type_enabled(v222, OS_LOG_TYPE_FAULT))
                      {
                        LOWORD(buf) = 0;
                        _os_log_fault_impl(&dword_19DDAF000, v222, OS_LOG_TYPE_FAULT, "[packet addNotifyPayload:notifyPayload] failed", (uint8_t *)&buf, 2u);
                      }

                      v129 = 0;
                      v5 = v268;
                      goto LABEL_147;
                    }

                    ++v170;
                    v4 = v269;
                  }
                  while (v168 != v170);
                  uint64_t v176 = [v166 countByEnumeratingWithState:&v280 objects:v292 count:16];
                  uint64_t v168 = v176;
                  if (v176) {
                    continue;
                  }
                  break;
                }
              }

              long long v278 = 0u;
              long long v279 = 0u;
              long long v276 = 0u;
              long long v277 = 0u;
              id v178 = objc_getProperty(v4, v177, 88, 1);
              v179 = [v178 customIKEAuthVendorPayloads];

              uint64_t v180 = [v179 countByEnumeratingWithState:&v276 objects:v291 count:16];
              v9 = self;
              if (v180)
              {
                uint64_t v181 = v180;
                uint64_t v182 = *(void *)v277;
                do
                {
                  for (uint64_t i = 0; i != v181; ++i)
                  {
                    if (*(void *)v277 != v182) {
                      objc_enumerationMutation(v179);
                    }
                    v184 = *(void **)(*((void *)&v276 + 1) + 8 * i);
                    v185 = objc_alloc_init(NEIKEv2VendorIDPayload);
                    v187 = [v184 vendorData];
                    if (v185) {
                      objc_setProperty_atomic(v185, v186, v187, 24);
                    }

                    v189 = objc_getProperty(v9, v188, 176, 1);

                    if (v189)
                    {
                      v191 = objc_getProperty(v9, v190, 176, 1);
                      v192 = [v191 arrayByAddingObject:v185];
                      objc_setProperty_atomic(self, v193, v192, 176);

                      v9 = self;
                    }
                    else
                    {
                      v290 = v185;
                      v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v290 count:1];
                      objc_setProperty_atomic(v9, v194, v191, 176);
                    }
                  }
                  uint64_t v181 = [v179 countByEnumeratingWithState:&v276 objects:v291 count:16];
                }
                while (v181);
              }

              long long v274 = 0u;
              long long v275 = 0u;
              long long v272 = 0u;
              long long v273 = 0u;
              id v196 = objc_getProperty(v269, v195, 88, 1);
              v197 = [v196 customIKEAuthPayloads];

              uint64_t v198 = [v197 countByEnumeratingWithState:&v272 objects:v289 count:16];
              if (v198)
              {
                uint64_t v199 = v198;
                uint64_t v200 = *(void *)v273;
                do
                {
                  uint64_t v201 = 0;
                  do
                  {
                    if (*(void *)v273 != v200) {
                      objc_enumerationMutation(v197);
                    }
                    v202 = *(void **)(*((void *)&v272 + 1) + 8 * v201);
                    v203 = objc_alloc_init(NEIKEv2CustomPayload);
                    uint64_t v204 = [v202 customType];
                    if (v203)
                    {
                      v203->_customType = v204;
                      v205 = [v202 customData];
                      objc_setProperty_atomic(v203, v206, v205, 32);
                    }
                    else
                    {
                      v205 = [v202 customData];
                    }

                    v208 = objc_getProperty(v9, v207, 56, 1);

                    if (v208)
                    {
                      v210 = objc_getProperty(v9, v209, 56, 1);
                      v211 = [v210 arrayByAddingObject:v203];
                      objc_setProperty_atomic(self, v212, v211, 56);

                      v9 = self;
                    }
                    else
                    {
                      v288 = v203;
                      v210 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v288 count:1];
                      objc_setProperty_atomic(v9, v213, v210, 56);
                    }

                    ++v201;
                  }
                  while (v199 != v201);
                  uint64_t v214 = [v197 countByEnumeratingWithState:&v272 objects:v289 count:16];
                  uint64_t v199 = v214;
                }
                while (v214);
              }

              v4 = v269;
              id v216 = objc_getProperty(v269, v215, 88, 1);
              v217 = [v216 pduSessionID];

              if (!v217) {
                goto LABEL_143;
              }
              id v219 = objc_getProperty(v269, v218, 88, 1);
              v220 = [v219 pduSessionID];
              char v221 = [v220 unsignedCharValue];

              LOBYTE(v284) = v221;
              char v271 = 1;
              v150 = (NEIKEv2CertificatePayload *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
              [(NEIKEv2CertificatePayload *)v150 appendBytes:&v271 length:1];
              [(NEIKEv2CertificatePayload *)v150 appendBytes:&v284 length:1];
              if (-[NEIKEv2Packet addNotification:data:](v9, 0xC747uLL, v150))
              {

LABEL_143:
                v129 = v9;
LABEL_201:
                v5 = v268;
LABEL_202:

                goto LABEL_154;
              }
              v236 = ne_log_obj();
              if (!os_log_type_enabled(v236, OS_LOG_TYPE_FAULT)) {
                goto LABEL_199;
              }
              LOWORD(buf) = 0;
              v257 = "[packet addNotification:NEIKEv2NotifyTypeMOBIKESupported] failed";
              v258 = v236;
              uint32_t v259 = 2;
LABEL_179:
              _os_log_fault_impl(&dword_19DDAF000, v258, OS_LOG_TYPE_FAULT, v257, (uint8_t *)&buf, v259);
LABEL_199:

              goto LABEL_200;
            }
            v142 = ne_log_obj();
            if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
            {
LABEL_208:

              v129 = 0;
              v5 = v268;
LABEL_147:
              v9 = self;
              goto LABEL_202;
            }
            LOWORD(buf) = 0;
            v264 = "[NEIKEv2GSPM initWithIKESA:] failed";
            v265 = v142;
            uint32_t v266 = 2;
LABEL_215:
            _os_log_fault_impl(&dword_19DDAF000, v265, OS_LOG_TYPE_FAULT, v264, (uint8_t *)&buf, v266);
            goto LABEL_208;
          }
          id v163 = objc_getProperty(v4, v148, 96, 1);
          char v164 = -[NEIKEv2IKESAProposal hasEAPMethods](v163);

          if (v164) {
            goto LABEL_102;
          }
          v226 = -[NEIKEv2IKESA copyAuthenticationPayloadUsingPrimeKey:](v4, 0);
          objc_setProperty_atomic(v9, v227, v226, 128);

          v229 = objc_getProperty(v9, v228, 128, 1);
          char v230 = -[NEIKEv2Payload isValid]((uint64_t)v229);

          if (v230)
          {
            if (((_BYTE)v4[3] & 1) == 0) {
              goto LABEL_168;
            }
            LOBYTE(v284) = 0;
            id v232 = objc_getProperty(v4, v231, 88, 1);
            char v233 = [v232 ppkIDType];

            LOBYTE(v284) = v233;
            if (v233)
            {
              id v235 = objc_getProperty(v4, v234, 88, 1);
              v150 = [v235 ppkID];

              if (v284 != 2 || v150)
              {
                v236 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", -[NEIKEv2CertificatePayload length](v150, "length") + 1);
                [v236 appendBytes:&v284 length:1];
                [v236 appendData:v150];
                if (!-[NEIKEv2Packet addNotification:data:](v9, 0x4034uLL, v236))
                {
                  v240 = ne_log_obj();
                  if (os_log_type_enabled(v240, OS_LOG_TYPE_FAULT))
                  {
                    LOWORD(buf) = 0;
                    _os_log_fault_impl(&dword_19DDAF000, v240, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypePPKIdentity] failed", (uint8_t *)&buf, 2u);
                  }
                  goto LABEL_198;
                }
                id v238 = objc_getProperty(v4, v237, 88, 1);
                char v239 = [v238 ppkMandatory];

                if (v239)
                {
LABEL_167:

                  v4 = v269;
LABEL_168:
                  v150 = [(NEIKEv2IKESA *)v4 authenticationProtocol];
                  if ([(NEIKEv2CertificatePayload *)v150 isSignature])
                  {
                    id v245 = objc_getProperty(v4, v244, 88, 1);
                    if (v245)
                    {
                      v246 = v245;
                      uint64_t v247 = [v245 localPrivateKeyRef];

                      if (v247) {
                        goto LABEL_102;
                      }
                    }
                    else
                    {
                    }
                    v150 = objc_alloc_init(NEIKEv2CertificatePayload);
                    v249 = [(NEIKEv2IKESA *)v4 copyLocalCertificateData];
                    v251 = v249;
                    if (v150)
                    {
                      objc_setProperty_atomic(v150, v250, v249, 32);

                      v150->_encoding = 4;
                      id v253 = objc_getProperty(v150, v252, 32, 1);
                    }
                    else
                    {

                      id v253 = 0;
                    }
                    id v254 = v253;

                    if (!v254)
                    {
                      v236 = ne_log_obj();
                      if (!os_log_type_enabled(v236, OS_LOG_TYPE_FAULT)) {
                        goto LABEL_199;
                      }
                      int buf = 136315138;
                      v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                      v257 = "%s called with null cert.certificateData";
                      v258 = v236;
                      uint32_t v259 = 12;
                      goto LABEL_179;
                    }
                    v293 = v150;
                    v255 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v293 count:1];
                    objc_setProperty_atomic(v9, v256, v255, 112);
                  }
                  goto LABEL_92;
                }
                v240 = -[NEIKEv2IKESA copyAuthenticationPayloadUsingPrimeKey:](v269, (const char *)1);
                if (-[NEIKEv2Payload isValid]((uint64_t)v240))
                {
                  if (v240) {
                    Class isa = v240[4].isa;
                  }
                  else {
                    Class isa = 0;
                  }
                  v242 = isa;
                  BOOL v243 = -[NEIKEv2Packet addNotification:data:](v9, 0x4035uLL, v242);

                  if (v243)
                  {

                    v9 = self;
                    goto LABEL_167;
                  }
                  v260 = ne_log_obj();
                  if (!os_log_type_enabled(v260, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_197;
                  }
                  LOWORD(buf) = 0;
                  v261 = "[packet addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed";
                  v262 = v260;
                  uint32_t v263 = 2;
                }
                else
                {
                  v260 = ne_log_obj();
                  if (!os_log_type_enabled(v260, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_197;
                  }
                  int buf = 136315138;
                  v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                  v261 = "%s called with null primeAuth.isValid";
                  v262 = v260;
                  uint32_t v263 = 12;
                }
                _os_log_fault_impl(&dword_19DDAF000, v262, OS_LOG_TYPE_FAULT, v261, (uint8_t *)&buf, v263);
LABEL_197:
                v9 = self;

                v4 = v269;
LABEL_198:

                goto LABEL_199;
              }
              v142 = ne_log_obj();
              if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT)) {
                goto LABEL_208;
              }
              int buf = 136315138;
              v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
              v264 = "%s called with null ppkID";
            }
            else
            {
              v142 = ne_log_obj();
              if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT)) {
                goto LABEL_208;
              }
              int buf = 136315138;
              v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
              v264 = "%s called with null ppkIDType";
            }
            v265 = v142;
            uint32_t v266 = 12;
            goto LABEL_215;
          }
          ne_log_obj();
          v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v150->super.super, OS_LOG_TYPE_FAULT))
          {
            int buf = 136315138;
            v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
            v160 = "%s called with null packet.auth.isValid";
            p_super = &v150->super.super;
            uint32_t v162 = 12;
            goto LABEL_182;
          }
        }
        else
        {
          id v158 = objc_getProperty(v4, v137, 96, 1);
          int v159 = -[NEIKEv2IKESAProposal hasEAPMethods](v158);

          if (!v159 || -[NEIKEv2Packet addNotification:data:](v9, 0x4021uLL, 0)) {
            goto LABEL_102;
          }
          ne_log_obj();
          v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v150->super.super, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            v160 = "[packet addNotification:NEIKEv2NotifyTypeEAPOnlyAuthentication] failed";
            p_super = &v150->super.super;
            uint32_t v162 = 2;
LABEL_182:
            _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, v160, (uint8_t *)&buf, v162);
          }
        }
LABEL_200:

        v129 = 0;
        goto LABEL_201;
      }
      v100 = ne_log_obj();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
        goto LABEL_152;
      }
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeMOBIKESupported] failed";
    }
    else
    {
      v100 = ne_log_obj();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
        goto LABEL_152;
      }
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeInitialContact] failed";
    }
LABEL_187:
    v223 = v100;
    uint32_t v224 = 2;
    goto LABEL_151;
  }
  id v104 = objc_getProperty(v4, v28, 88, 1);
  v105 = [v104 configurationRequest];

  if (!v105) {
    goto LABEL_77;
  }
  v106 = v5;
  id v107 = objc_getProperty(v4, v86, 88, 1);
  uint64_t v108 = [v107 configurationRequest];
  if (!v108)
  {

    v118 = 0;
LABEL_76:

    v5 = v106;
    goto LABEL_77;
  }
  v109 = (void *)v108;
  id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v284 = 0u;
  long long v285 = 0u;
  long long v286 = 0u;
  long long v287 = 0u;
  id v112 = objc_getProperty(v109, v111, 16, 1);
  uint64_t v113 = [v112 countByEnumeratingWithState:&v284 objects:&buf count:16];
  if (v113)
  {
    uint64_t v114 = v113;
    uint64_t v115 = *(void *)v285;
    do
    {
      for (uint64_t j = 0; j != v114; ++j)
      {
        if (*(void *)v285 != v115) {
          objc_enumerationMutation(v112);
        }
        v117 = *(void **)(*((void *)&v284 + 1) + 8 * j);
        if ([v117 validForChildlessSA]) {
          [v110 addObject:v117];
        }
      }
      uint64_t v114 = [v112 countByEnumeratingWithState:&v284 objects:&buf count:16];
    }
    while (v114);
  }

  if ([v110 count]) {
    v118 = [[NEIKEv2ConfigurationMessage alloc] initWithWithAttributes:v110];
  }
  else {
    v118 = 0;
  }
  v4 = v269;
  v9 = self;

  if (!v118) {
    goto LABEL_76;
  }
  v119 = objc_alloc_init(NEIKEv2ConfigPayload);
  objc_setProperty_atomic(self, v120, v119, 152);

  id v122 = objc_getProperty(self, v121, 152, 1);
  v124 = v122;
  if (v122) {
    objc_setProperty_atomic(v122, v123, v118, 24);
  }

  id v126 = objc_getProperty(self, v125, 152, 1);
  char v127 = -[NEIKEv2Payload isValid]((uint64_t)v126);

  if (v127) {
    goto LABEL_76;
  }
  v128 = ne_log_obj();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
  {
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    _os_log_fault_impl(&dword_19DDAF000, v128, OS_LOG_TYPE_FAULT, "%s called with null packet.config.isValid", (uint8_t *)&buf, 0xCu);
  }

  v129 = 0;
  v5 = v106;
LABEL_154:

  return v129;
}

- (uint64_t)validateAuthPayloadAsInitiator:(char)a3 beforeEAP:
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v7 = objc_getProperty(a1, v6, 128, 1);

  if (!v7)
  {
    SEL v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v131 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v131;
      _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, "%@ Authentication payload missing from IKE_AUTH", buf, 0xCu);
    }
    v29 = @"Authentication payload missing from IKE_AUTH";
    goto LABEL_22;
  }
  uint64_t v9 = objc_getProperty(a1, v8, 128, 1);
  v10 = (void *)v9;
  if (v9) {
    SEL v11 = *(void **)(v9 + 24);
  }
  else {
    SEL v11 = 0;
  }
  id v12 = v11;

  if (!v12)
  {
    SEL v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v151 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v151;
      _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "%@ Authentication protocol missing from AUTH payload", buf, 0xCu);
    }
    v29 = @"Authentication protocol missing from AUTH payload";
    goto LABEL_22;
  }
  uint64_t v14 = objc_getProperty(a1, v13, 128, 1);
  v15 = (void *)v14;
  if (v14) {
    v16 = *(void **)(v14 + 32);
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (!v17)
  {
    v31 = ne_log_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v153 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v153;
      _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "%@ Authentication data missing from AUTH payload", buf, 0xCu);
    }
    v29 = @"Authentication data missing from AUTH payload";
    goto LABEL_22;
  }
  if (!v5)
  {
    uint64_t v19 = 0;
    char v20 = 1;
LABEL_28:
    uint64_t v37 = objc_getProperty(a1, v18, 128, 1);
    v38 = (void *)v37;
    if (v37) {
      char v39 = *(void **)(v37 + 24);
    }
    else {
      char v39 = 0;
    }
    v40 = v39;

    if (v5) {
      id Property = objc_getProperty(v5, v41, 448, 1);
    }
    else {
      id Property = 0;
    }
    id v43 = Property;

    if (v43)
    {
      if ([v40 method] == 2)
      {
        if (!v5)
        {
LABEL_140:
          v56 = 0;
LABEL_141:
          v185 = ne_log_obj();
          if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
          {
            SEL v195 = (char *)[a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            uint32_t v259 = v195;
            _os_log_error_impl(&dword_19DDAF000, v185, OS_LOG_TYPE_ERROR, "%@ EAP authentication data could not be verified", buf, 0xCu);
          }
          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"EAP authentication data could not be verified", v186, v187, v188, v189, v190, v191, v192, v245);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorAuthentication);

          goto LABEL_144;
        }
        id v46 = objc_getProperty(v5, v45, 448, 1);

        if (v46)
        {
          id v48 = objc_getProperty(v5, v47, 96, 1);

          if (v48)
          {
            char v50 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v5, (const char *)v19);
            if (v50)
            {
              char v250 = v20;
              id v51 = objc_getProperty(v5, v49, 448, 1);
              SEL v52 = -[NEIKEv2EAP sessionKey]((uint64_t)v51);

              if (v52
                || (!v19 ? (ptrdiff_t v54 = 248) : (ptrdiff_t v54 = 256),
                    objc_getProperty(v5, v53, v54, 1),
                    (SEL v52 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                SEL v55 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v5, v52, v50);
                if (v55)
                {
                  v56 = v55;

                  uint64_t v58 = objc_getProperty(a1, v57, 128, 1);
                  SEL v59 = (void *)v58;
                  int v60 = v19;
                  if (v58) {
                    char v61 = *(void **)(v58 + 32);
                  }
                  else {
                    char v61 = 0;
                  }
                  id v62 = v61;
                  BOOL v63 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v56, v62);

                  if (v63)
                  {
                    v64 = ne_log_obj();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)int buf = 0;
                      _os_log_debug_impl(&dword_19DDAF000, v64, OS_LOG_TYPE_DEBUG, "Peer EAP MAC is valid", buf, 2u);
                    }

                    char v66 = v250;
                    goto LABEL_105;
                  }
                  goto LABEL_141;
                }
                v160 = ne_log_obj();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)int buf = 0;
                  _os_log_fault_impl(&dword_19DDAF000, v160, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret failed", buf, 2u);
                }

                goto LABEL_138;
              }
              SEL v52 = ne_log_obj();
              if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
              {
LABEL_138:

                goto LABEL_139;
              }
              *(_WORD *)int buf = 0;
              SEL v152 = "skPr failed";
            }
            else
            {
              SEL v52 = ne_log_obj();
              if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
                goto LABEL_138;
              }
              *(_WORD *)int buf = 0;
              SEL v152 = "createResponderSignedOctetsUsingPrimeKey: failed";
            }
            _os_log_fault_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_FAULT, v152, buf, 2u);
            goto LABEL_138;
          }
          char v50 = ne_log_obj();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)int buf = 136315138;
            uint32_t v259 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
            id v130 = "%s called with null self.chosenProposal";
            goto LABEL_89;
          }
        }
        else
        {
          char v50 = ne_log_obj();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)int buf = 136315138;
            uint32_t v259 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
            id v130 = "%s called with null self.eapClient";
LABEL_89:
            _os_log_fault_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_FAULT, v130, buf, 0xCu);
          }
        }
LABEL_139:

        goto LABEL_140;
      }
      int v80 = ne_log_obj();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v161 = (char *)[a1 copyShortDescription];
        *(_DWORD *)int buf = 138412290;
        uint32_t v259 = v161;
        _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "%@ Authentication method for EAP was not shared key", buf, 0xCu);
      }
      v88 = (void *)NEIKEv2CreateErrorAuthentication(@"Authentication method for EAP was not shared key", v81, v82, v83, v84, v85, v86, v87, v245);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v88);
LABEL_94:

LABEL_144:
      uint64_t v33 = 0;
      goto LABEL_145;
    }
    if (v5) {
      id v67 = objc_getProperty(v5, v44, 456, 1);
    }
    else {
      id v67 = 0;
    }
    id v68 = v67;

    if (v68)
    {
      if ([v40 method] == 12)
      {
        SEL v70 = -[NEIKEv2IKESA createResponderGSPMAuthenticationDataUsingPrimeKey:](v5, (const char *)v19);
        char v72 = v70;
        if (!v70) {
          goto LABEL_84;
        }
        SEL v252 = v70;
        char v73 = v20;
        uint64_t v74 = objc_getProperty(a1, v71, 128, 1);
        id v75 = (void *)v74;
        int v60 = v19;
        uint64_t v76 = v74 ? *(void **)(v74 + 32) : 0;
        id v77 = v76;
        BOOL v78 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v252, v77);

        char v66 = v73;
        char v72 = v252;
        if (!v78)
        {
LABEL_84:
          v132 = ne_log_obj();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          {
            v208 = (char *)[a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            uint32_t v259 = v208;
            _os_log_error_impl(&dword_19DDAF000, v132, OS_LOG_TYPE_ERROR, "%@ GSPM authentication data could not be verified", buf, 0xCu);
          }
          v140 = (void *)NEIKEv2CreateErrorAuthentication(@"GSPM authentication data could not be verified", v133, v134, v135, v136, v137, v138, v139, v245);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v140);

          goto LABEL_144;
        }
        id v79 = ne_log_obj();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int buf = 0;
          _os_log_debug_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_DEBUG, "Peer GSPM MAC is valid", buf, 2u);
        }
LABEL_104:

        if (!v5)
        {
LABEL_106:
          if ((v66 & 1) == 0)
          {
            if (!v60)
            {
              uint64_t v33 = 1;
              if (v5) {
                BYTE3(v5[2].isa) = 1;
              }
              goto LABEL_145;
            }
            [(NEIKEv2IKESA *)v5 restorePrimeKeys];
          }
          uint64_t v33 = 1;
LABEL_145:
          v32 = v40;
          goto LABEL_146;
        }
LABEL_105:
        BYTE2(v5[2].isa) = 1;
        goto LABEL_106;
      }
      SEL v120 = ne_log_obj();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        v197 = (char *)[a1 copyShortDescription];
        uint64_t v199 = objc_getProperty(a1, v198, 128, 1);
        *(_DWORD *)int buf = 138412546;
        uint32_t v259 = v197;
        __int16 v260 = 2112;
        v261 = v199;
        _os_log_error_impl(&dword_19DDAF000, v120, OS_LOG_TYPE_ERROR, "%@ Wrong authentication method %@ for GSPM", buf, 0x16u);
      }
      v88 = objc_getProperty(a1, v121, 128, 1);
      v129 = (void *)NEIKEv2CreateErrorAuthentication(@"Wrong authentication method %@ for GSPM", v122, v123, v124, v125, v126, v127, v128, (uint64_t)v88);
LABEL_93:
      v150 = v129;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v129);

      goto LABEL_94;
    }
    char v251 = v20;
    SEL v89 = [(NEIKEv2IKESA *)v5 remoteAuthentication];
    uint64_t v90 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]((uint64_t)NEIKEv2Crypto, v40, v89);

    if ((v90 & 1) == 0)
    {
      uint64_t v141 = ne_log_obj();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      {
        v209 = (char *)[a1 copyShortDescription];
        v211 = [(NEIKEv2IKESA *)v5 remoteAuthentication];
        *(_DWORD *)int buf = 138412802;
        uint32_t v259 = v209;
        __int16 v260 = 2112;
        v261 = v40;
        __int16 v262 = 2112;
        uint32_t v263 = v211;
        _os_log_error_impl(&dword_19DDAF000, v141, OS_LOG_TYPE_ERROR, "%@ Initiator packet authentication method %@ is not compatible with configuration %@", buf, 0x20u);
      }
      v88 = [(NEIKEv2IKESA *)v5 remoteAuthentication];
      v129 = (void *)NEIKEv2CreateErrorAuthentication(@"Packet authentication method %@ is not compatible with configuration %@", v143, v144, v145, v146, v147, v148, v149, (uint64_t)v40);
      goto LABEL_93;
    }
    v32 = v40;
    v92 = [(NEIKEv2IKESA *)v5 remoteAuthentication];
    int v93 = [v92 isNonStandard];

    v95 = v32;
    if (v93)
    {
      v95 = [(NEIKEv2IKESA *)v5 remoteAuthentication];
    }
    SEL v252 = v95;
    unsigned int v249 = v19;
    if (![v95 isSignature])
    {
      uint64_t v154 = objc_getProperty(a1, v96, 128, 1);
      id v155 = (void *)v154;
      if (v154) {
        SEL v156 = *(void **)(v154 + 32);
      }
      else {
        SEL v156 = 0;
      }
      id v157 = v156;
      char v158 = -[NEIKEv2IKESA checkSharedKeyAuthData:usingPrimeKey:]((uint64_t)v5, v157, (const char *)v249);

      int v159 = ne_log_obj();
      id v79 = v159;
      if ((v158 & 1) == 0)
      {
        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          char v230 = (char *)[a1 copyShortDescription];
          *(_DWORD *)int buf = 138412546;
          uint32_t v259 = v230;
          __int16 v260 = 2112;
          v261 = v252;
          _os_log_error_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_ERROR, "%@ Initiator failed to validate remote authentication data %@", buf, 0x16u);
        }
        uint32_t v162 = v252;
        id v79 = NEIKEv2CreateErrorAuthentication(@"Failed to validate remote authentication data %@", v163, v164, v165, v166, v167, v168, v169, (uint64_t)v252);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v79);
        uint64_t v33 = 0;
        goto LABEL_159;
      }
      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_DEBUG, "Peer PSK MAC is valid", buf, 2u);
      }
      goto LABEL_103;
    }
    if (v5) {
      id v97 = objc_getProperty(v5, v96, 88, 1);
    }
    else {
      id v97 = 0;
    }
    id v98 = v97;
    char v99 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v98);

    if (v99)
    {
LABEL_70:
      id v79 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:]((uint64_t)v5, (const char *)v249);
      uint64_t v102 = objc_getProperty(a1, v101, 128, 1);
      v103 = (void *)v102;
      if (v102) {
        id v104 = *(void **)(v102 + 32);
      }
      else {
        id v104 = 0;
      }
      id v105 = v104;
      char v106 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]((uint64_t)NEIKEv2Crypto, v105, v79, v252, v99);

      CFRelease(v99);
      if ((v106 & 1) == 0)
      {
        if (v5) {
          id v108 = objc_getProperty(v5, v107, 88, 1);
        }
        else {
          id v108 = 0;
        }
        id v109 = v108;
        uint64_t v33 = [v109 disableRemoteCertificateValidation];

        if (v33)
        {
          v117 = ne_log_obj();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
          {
            v118 = (char *)[a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            uint32_t v259 = v118;
            _os_log_impl(&dword_19DDAF000, v117, OS_LOG_TYPE_INFO, "%@ Passing authentication because configuration does not require remote signature validation", buf, 0xCu);
          }
          v119 = v252;
        }
        else
        {
          v119 = v252;
          v117 = NEIKEv2CreateErrorAuthentication(@"Authentication data could not be verified %@", v110, v111, v112, v113, v114, v115, v116, (uint64_t)v252);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v117);
        }

        uint32_t v162 = v119;
        goto LABEL_159;
      }
LABEL_103:
      int v60 = v249;
      char v66 = v251;
      goto LABEL_104;
    }
    uint64_t v170 = objc_getProperty(a1, v100, 112, 1);
    uint64_t v171 = [v170 count];

    if (!v171)
    {
      uint64_t v200 = ne_log_obj();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        BOOL v243 = (char *)[a1 copyShortDescription];
        *(_DWORD *)int buf = 138412290;
        uint32_t v259 = v243;
        _os_log_error_impl(&dword_19DDAF000, v200, OS_LOG_TYPE_ERROR, "%@ No certificate payload received", buf, 0xCu);
      }
      id v79 = NEIKEv2CreateErrorAuthentication(@"No certificate payload received", v201, v202, v203, v204, v205, v206, v207, v245);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v79);
      uint64_t v33 = 0;
      uint32_t v162 = v252;
      goto LABEL_159;
    }
    v248 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v248)
    {
      long long v255 = 0u;
      long long v256 = 0u;
      long long v253 = 0u;
      long long v254 = 0u;
      obuint64_t j = objc_getProperty(a1, v172, 112, 1);
      uint64_t v173 = [obj countByEnumeratingWithState:&v253 objects:v257 count:16];
      if (v173)
      {
        uint64_t v175 = v173;
        uint64_t v247 = *(void *)v254;
        while (2)
        {
          uint64_t v176 = 0;
          do
          {
            if (*(void *)v254 != v247) {
              objc_enumerationMutation(obj);
            }
            SEL v177 = *(void **)(*((void *)&v253 + 1) + 8 * v176);
            if (v177) {
              id v178 = objc_getProperty(*(id *)(*((void *)&v253 + 1) + 8 * v176), v174, 32, 1);
            }
            else {
              id v178 = 0;
            }
            id v179 = v178;

            if (!v179)
            {
              SEL v212 = ne_log_obj();
              if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
              {
                v244 = (char *)[a1 copyShortDescription];
                *(_DWORD *)int buf = 138412290;
                uint32_t v259 = v244;
                _os_log_error_impl(&dword_19DDAF000, v212, OS_LOG_TYPE_ERROR, "%@ Certificate missing data", buf, 0xCu);
              }
              v220 = (void *)NEIKEv2CreateErrorAuthentication(@"Certificate missing data", v213, v214, v215, v216, v217, v218, v219, v245);
              -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v220);

              uint64_t v33 = 0;
              uint32_t v162 = v252;
              id v79 = v248;
              ErrorInternal = obj;
              goto LABEL_158;
            }
            if (v177) {
              id v181 = objc_getProperty(v177, v180, 32, 1);
            }
            else {
              id v181 = 0;
            }
            id v182 = v181;
            [v248 addObject:v182];

            ++v176;
          }
          while (v175 != v176);
          uint64_t v183 = [obj countByEnumeratingWithState:&v253 objects:v257 count:16];
          uint64_t v175 = v183;
          if (v183) {
            continue;
          }
          break;
        }
      }

      id v79 = v248;
      SecKeyRef v184 = -[NEIKEv2IKESA checkValidityOfCertificates:](v5, v248);
      if (v184)
      {
        char v99 = v184;

        goto LABEL_70;
      }
      v231 = ne_log_obj();
      uint32_t v162 = v252;
      if (os_log_type_enabled(v231, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v231, OS_LOG_TYPE_ERROR, "Certificate chain could not be verified", buf, 2u);
      }

      if (v5) {
        id v233 = objc_getProperty(v5, v232, 88, 1);
      }
      else {
        id v233 = 0;
      }
      id v234 = v233;
      uint64_t v33 = [v234 disableRemoteCertificateValidation];

      if (v33)
      {
        ErrorInternal = ne_log_obj();
        uint64_t v33 = 1;
        if (os_log_type_enabled(ErrorInternal, OS_LOG_TYPE_INFO))
        {
          v242 = (char *)[a1 copyShortDescription];
          *(_DWORD *)int buf = 138412290;
          uint32_t v259 = v242;
          _os_log_impl(&dword_19DDAF000, ErrorInternal, OS_LOG_TYPE_INFO, "%@ Passing authentication because configuration does not require certificate validation", buf, 0xCu);
        }
      }
      else
      {
        ErrorInternal = NEIKEv2CreateErrorAuthentication(@"Certificate chain could not be verified", v235, v236, v237, v238, v239, v240, v241, v245);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorInternal);
      }
    }
    else
    {
      v222 = ne_log_obj();
      uint32_t v162 = v95;
      if (os_log_type_enabled(v222, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v222, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
      }

      ErrorInternal = NEIKEv2CreateErrorInternal(@"[[NSMutableArray alloc] init] failed", v223, v224, v225, v226, v227, v228, v229, v245);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorInternal);
      uint64_t v33 = 0;
      id v79 = 0;
    }
LABEL_158:

LABEL_159:
    goto LABEL_146;
  }
  uint64_t v19 = (uint64_t)v5[3].isa & 1;
  char v20 = 1;
  if ((uint64_t)v5[3].isa & 1) == 0 || (a3) {
    goto LABEL_28;
  }
  if (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4034))
  {
    char v20 = 0;
    uint64_t v19 = 0;
    goto LABEL_28;
  }
  uint64_t v19 = 1;
  id v34 = objc_getProperty(v5, v18, 88, 1);
  int v35 = [v34 ppkMandatory];

  if (!v35)
  {
    char v20 = 0;
    goto LABEL_28;
  }
  v36 = ne_log_obj();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    id v196 = (char *)[a1 copyShortDescription];
    *(_DWORD *)int buf = 138412290;
    uint32_t v259 = v196;
    _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%@ No PPK ID notify received with mandatory PPK auth", buf, 0xCu);
  }
  v29 = @"No PPK ID received with mandatory PPK auth";
LABEL_22:
  v32 = NEIKEv2CreateErrorAuthentication(v29, v22, v23, v24, v25, v26, v27, v28, v245);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v32);
  uint64_t v33 = 0;
LABEL_146:

  return v33;
}

- (uint64_t)validateAuthPart1AsInitiator:(int)a3 beforeEAP:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v7 = v5;
  if (a1)
  {
    if (v5 && (v5[9] & 1) != 0)
    {
      id v8 = objc_getProperty(v5, v6, 96, 1);

      if (v8)
      {
        id Property = objc_getProperty((id)a1, v9, 104, 1);
        id v12 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v11, 24, 1);
        }
        id v13 = Property;
        objc_setProperty_atomic(v7, v14, v13, 504);

        v16 = [(NEIKEv2IKESA *)v7 remoteAuthentication];
        uint64_t v17 = [v16 method];

        if (!v17)
        {
          a1 = 1;
          goto LABEL_20;
        }
        uint64_t v19 = objc_getProperty((id)a1, v18, 128, 1);
        char v20 = (void *)v19;
        if (v19) {
          SEL v21 = *(void **)(v19 + 24);
        }
        else {
          SEL v21 = 0;
        }
        uint64_t v22 = v21;

        -[NEIKEv2IKESA setRemoteAuthProtocolUsed:]((uint64_t)v7, v22);
        uint64_t v24 = [(NEIKEv2IKESA *)v7 remoteAuthentication];
        int v25 = [v24 isSecurePassword];

        if (!v25) {
          goto LABEL_34;
        }
        if (v22)
        {
          v40 = ne_log_obj();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            char v50 = (char *)[(id)a1 copyShortDescription];
            SEL v52 = [(NEIKEv2IKESA *)v7 remoteAuthentication];
            *(_DWORD *)int buf = 138412802;
            v56 = v50;
            __int16 v57 = 2112;
            uint64_t v58 = v22;
            __int16 v59 = 2112;
            int v60 = v52;
            _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%@ Initiator packet authentication method %@ is not compatible with GSPM configuration %@", buf, 0x20u);
          }
          ptrdiff_t v54 = [(NEIKEv2IKESA *)v7 remoteAuthentication];
          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(@"Initiator packet authentication method %@ is not compatible with GSPM configuration %@", v42, v43, v44, v45, v46, v47, v48, (uint64_t)v22);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorAuthentication);

          goto LABEL_17;
        }
        id v27 = objc_getProperty((id)a1, v26, 144, 1);

        if (!v27)
        {
          v29 = ne_log_obj();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            char v39 = (char *)[(id)a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            v56 = v39;
            _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "%@ Packet missing GSPM payload", buf, 0xCu);
          }
          uint64_t v37 = (void *)NEIKEv2CreateErrorAuthentication(@"Packet missing GSPM payload", v30, v31, v32, v33, v34, v35, v36, v53);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, v37);

          uint64_t v22 = 0;
        }
        else
        {
LABEL_34:
          if (!a3 || -[NEIKEv2IKEAuthPacket validateAuthPayloadAsInitiator:beforeEAP:]((void *)a1, v7, 1))
          {
            a1 = 1;
LABEL_18:

            goto LABEL_20;
          }
        }
LABEL_17:
        a1 = 0;
        goto LABEL_18;
      }
      uint64_t v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_17;
      }
      *(_DWORD *)int buf = 136315138;
      v56 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart1AsInitiator:beforeEAP:]";
      v38 = "%s called with null ikeSA.chosenProposal";
    }
    else
    {
      uint64_t v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_17;
      }
      *(_DWORD *)int buf = 136315138;
      v56 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthPart1AsInitiator:beforeEAP:]";
      v38 = "%s called with null ikeSA.isInitiator";
    }
    _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v38, buf, 0xCu);
    goto LABEL_17;
  }
LABEL_20:

  return a1;
}

+ (id)prepareDeviceIdentityNotifyPayload:(void *)a3 IMEISV:(void *)a4 lastResponderPacket:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  if (!v7 || [v7 length] != 16)
  {
    if (!v6) {
      goto LABEL_9;
    }
    if ([v6 length] != 15) {
      goto LABEL_9;
    }
    v20[0] = -1;
    id v12 = (void *)MEMORY[0x1E4F1CA58];
    id v13 = objc_msgSend(v6, "dataUsingEncoding:", 4, *(void *)v20);
    SEL v14 = [v12 dataWithData:v13];

    char v11 = 1;
    [v14 appendBytes:v20 length:1];
    id v15 = v14;
    v10 = (const char *)[v15 bytes];

    if (!v10) {
      goto LABEL_9;
    }
LABEL_8:
    int8x8x2_t v23 = vld2_s8(v10);
    *(_WORD *)char v20 = 2304;
    v20[2] = v11;
    *(int8x8_t *)&v20[3] = vsli_n_s8(v23.val[0], v23.val[1], 4uLL);
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v20 length:11];
    goto LABEL_12;
  }
  id v9 = [v7 dataUsingEncoding:4];
  v10 = (const char *)[v9 bytes];

  char v11 = 2;
  if (v10) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (void *)[v8 copyShortDescription];
    *(_DWORD *)char v20 = 138412290;
    *(void *)&v20[4] = v19;
    _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@ Could not find Device Identity (IMEI) data", v20, 0xCu);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)createIKEAuthResponse:(unint64_t)a3 refusalError:
{
  id v4 = a2;
  self;
  v5 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKEAuthPacket alloc], v4);

  if (!v5)
  {
    id v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_7:

      id v6 = 0;
      goto LABEL_8;
    }
    __int16 v12 = 0;
    id v8 = "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed";
    id v9 = (uint8_t *)&v12;
LABEL_10:
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
    goto LABEL_7;
  }
  if (!-[NEIKEv2Packet addNotification:data:](v5, a3, 0))
  {
    id v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    __int16 v11 = 0;
    id v8 = "[packet addNotification:refusalError] failed";
    id v9 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  id v6 = v5;
LABEL_8:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_tsr, 0);
  objc_storeStrong((id *)&self->_tsi, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_gspm, 0);
  objc_storeStrong((id *)&self->_eap, 0);
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_certificateRequests, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_idr, 0);
  objc_storeStrong((id *)&self->_idi, 0);

  objc_storeStrong((id *)&self->_sa, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (self) {
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 80, 1);
  }
  v3 = self;
  uint64_t v4 = [(NEIKEv2IKEAuthPacket *)v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 88;
LABEL_35:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_36;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 96;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 104;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 128;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 136;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 144;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 152;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 160;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 168;
          goto LABEL_35;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v2 && objc_getProperty(v2, v11, 112, 1))
          {
            SEL v14 = objc_msgSend(objc_getProperty(v2, v12, 112, 1), "arrayByAddingObject:", v8);
LABEL_51:
            ptrdiff_t v19 = 112;
            goto LABEL_66;
          }
          uint64_t v35 = v8;
          SEL v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v35, 1, (void)v27);
          if (v2) {
            goto LABEL_51;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v15, 120, 1))
            {
              SEL v14 = objc_msgSend(objc_getProperty(v2, v16, 120, 1), "arrayByAddingObject:", v8);
LABEL_57:
              ptrdiff_t v19 = 120;
              goto LABEL_66;
            }
            uint64_t v34 = v8;
            SEL v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v34, 1, (void)v27);
            if (v2) {
              goto LABEL_57;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v2 && objc_getProperty(v2, v17, 64, 1))
              {
                SEL v14 = objc_msgSend(objc_getProperty(v2, v18, 64, 1), "arrayByAddingObject:", v8);
LABEL_63:
                uint64_t v24 = v2;
                int v25 = v14;
                ptrdiff_t v19 = 64;
                goto LABEL_67;
              }
              uint64_t v33 = v8;
              SEL v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v33, 1, (void)v27);
              if (v2) {
                goto LABEL_63;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_36;
                }
                if (v2 && objc_getProperty(v2, v22, 56, 1))
                {
                  SEL v14 = objc_msgSend(objc_getProperty(v2, v23, 56, 1), "arrayByAddingObject:", v8);
                }
                else
                {
                  uint64_t v31 = v8;
                  SEL v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v31, 1, (void)v27);
                  if (!v2) {
                    goto LABEL_68;
                  }
                }
                uint64_t v24 = v2;
                int v25 = v14;
                ptrdiff_t v19 = 56;
                goto LABEL_67;
              }
              if (v2 && objc_getProperty(v2, v20, 176, 1))
              {
                SEL v14 = objc_msgSend(objc_getProperty(v2, v21, 176, 1), "arrayByAddingObject:", v8);
LABEL_65:
                ptrdiff_t v19 = 176;
LABEL_66:
                uint64_t v24 = v2;
                int v25 = v14;
LABEL_67:
                objc_setProperty_atomic(v24, v13, v25, v19);
                goto LABEL_68;
              }
              uint64_t v32 = v8;
              SEL v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v32, 1, (void)v27);
              if (v2) {
                goto LABEL_65;
              }
            }
          }
        }
LABEL_68:

LABEL_36:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v26 = [(NEIKEv2IKEAuthPacket *)v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      uint64_t v5 = v26;
    }
    while (v26);
  }
}

- (void)gatherPayloads
{
  v2 = self;
  if (self) {
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 64, 1);
  }
  id v21 = (id)[(NEIKEv2IKEAuthPacket *)self mutableCopy];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = v3;
  if (v2)
  {
    if (objc_getProperty(v2, v4, 96, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v6, 96, 1));
    }
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v6, 112, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 0x4000, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16392, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v7, 120, 1));
    if (objc_getProperty(v2, v8, 104, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v9, 104, 1));
    }
    if (objc_getProperty(v2, v9, 128, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v10, 128, 1));
    }
    if (objc_getProperty(v2, v10, 152, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v11, 152, 1));
    }
  }
  else
  {
    [v3 addObjectsFromArray:0];
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 0x4000, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16392, v21, v5);
    [v5 addObjectsFromArray:0];
  }
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395, v21, v5);
  if (v2)
  {
    if (objc_getProperty(v2, v12, 136, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v13, 136, 1));
    }
    if (objc_getProperty(v2, v13, 144, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v14, 144, 1));
    }
    if (objc_getProperty(v2, v14, 88, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v15, 88, 1));
    }
    if (objc_getProperty(v2, v15, 160, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v16, 160, 1));
    }
    if (objc_getProperty(v2, v16, 168, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v17, 168, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v18, 176, 1));
    [v5 addObjectsFromArray:v21];
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v19, 56, 1));
    objc_setProperty_atomic(v2, v20, v5, 80);
  }
  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16386, v21, v5);
    [v5 addObjectsFromArray:0];
    [v5 addObjectsFromArray:v21];
    [v5 addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 35;
}

+ (id)copyTypeDescription
{
  return @"IKE_AUTH";
}

@end