@interface CRPreflightController
- (BOOL)challengeStrongComponents:(id)a3 responses:(id *)a4 error:(id *)a5;
- (BOOL)deltaComponents:(id *)a3 strongComponents:(id *)a4 error:(id *)a5;
- (BOOL)isErrorResponse:(id)a3;
- (BOOL)issueRepairCert:(id *)a3 keyBlob:(id *)a4 error:(id *)a5;
- (BOOL)miniPreflight;
- (BOOL)queryRepairDelta:(id *)a3 error:(id *)a4;
- (BOOL)sendRequest:(id)a3 response:(id *)a4 keyBlob:(id)a5 error:(id *)a6;
- (BOOL)setComponentsState:(id)a3 withResponseDetails:(id)a4;
- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5;
- (NSNumber)socksPort;
- (NSString)socksHost;
- (NSXPCConnection)connectionToService;
- (id)components:(id)a3 withState:(int64_t)a4;
- (id)createPEMFromCerts:(id)a3;
- (id)getSupportedStrongComponents;
- (id)sign:(id)a3 keyBlob:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)preflight:(id)a3 withReply:(id)a4;
- (void)preflightPhase1:(id)a3 withReply:(id)a4;
- (void)preflightPhase2:(id)a3 withReply:(id)a4;
- (void)setConnectionToService:(id)a3;
- (void)setMiniPreflight:(BOOL)a3;
- (void)setSocksHost:(id)a3;
- (void)setSocksPort:(id)a3;
@end

@implementation CRPreflightController

- (void)preflightPhase1:(id)a3 withReply:(id)a4
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = (void (**)(id, uint64_t, void *, char *))a4;
  if (v6)
  {
    v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"miniPreflight", v8);

    if (v10)
    {
      self->_miniPreflight = objc_msgSend_BOOLFromKey_defaultValue_failed_(v6, v11, @"miniPreflight", 0, 0);
      v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_miniPreflight) {
          v14 = @"YES";
        }
        else {
          v14 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v176 = v14;
        _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Mini preflight: %@", buf, 0xCu);
      }
    }
    v15 = objc_msgSend_objectForKeyedSubscript_(v6, v11, @"socksHost", v12);

    if (v15)
    {
      objc_msgSend_NSStringFromKey_defaultValue_failed_(v6, v16, @"socksHost", 0, 0);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      socksHost = self->_socksHost;
      self->_socksHost = v18;

      v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_socksHost;
        *(_DWORD *)buf = 138412290;
        v176 = v21;
        _os_log_impl(&dword_21FBF2000, v20, OS_LOG_TYPE_DEFAULT, "Socks host: %@", buf, 0xCu);
      }
    }
    v22 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"socksPort", v17);

    if (v22)
    {
      objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v6, v23, @"socksPort", (uint64_t)&unk_26D1631E8, &unk_26D163200, 0, 0);
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      socksPort = self->_socksPort;
      self->_socksPort = v24;

      v26 = handleForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_socksPort;
        *(_DWORD *)buf = 138412290;
        v176 = v27;
        _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Socks port: %@", buf, 0xCu);
      }
    }
  }
  if (os_variant_has_internal_content())
  {
    v29 = [CRUserDefaults alloc];
    v32 = objc_msgSend_initWithSuiteName_(v29, v30, @"com.apple.corerepaird.test", v31);
    v35 = objc_msgSend_stringForKey_(v32, v33, @"AxiomURL", v34);
    if (v35)
    {
      v36 = handleForCategory(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v176 = v35;
        _os_log_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_DEFAULT, "Overriding serverUrlString: %@", buf, 0xCu);
      }

      v37 = v35;
    }
    else
    {
      v37 = @"https://sklaxm.apple.com/axiom/SSR";
    }
  }
  else
  {
    v37 = @"https://sklaxm.apple.com/axiom/SSR";
  }
  id v167 = 0;
  id v168 = 0;
  id v166 = 0;
  int v38 = objc_msgSend_deltaComponents_strongComponents_error_(self, v28, (uint64_t)&v168, (uint64_t)&v167, &v166);
  id v39 = v168;
  id v40 = v167;
  v41 = (char *)v166;
  v45 = v41;
  v157 = v40;
  v158 = v37;
  if (!v38 || !v39 || v41)
  {
    v104 = handleForCategory(0);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D18C();
    }
    v115 = 0;
    id v86 = 0;
    v52 = 0;
    v116 = 0;
    id v159 = 0;
    id v160 = 0;
    goto LABEL_66;
  }
  if (objc_msgSend_count(v39, v42, v43, v44))
  {
    id v164 = 0;
    id v165 = 0;
    id v163 = 0;
    int v47 = objc_msgSend_issueRepairCert_keyBlob_error_(self, v46, (uint64_t)&v165, (uint64_t)&v164, &v163);
    id v160 = v165;
    id v159 = v164;
    v48 = (char *)v163;
    v45 = v48;
    if (!v47 || v48)
    {
      v104 = handleForCategory(0);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D2D4();
      }
      v115 = 0;
      id v86 = 0;
      v52 = 0;
      goto LABEL_65;
    }
    v52 = objc_msgSend_request(CRPreflightRequest, v49, v50, v51);
    int v56 = objc_msgSend_miniPreflight(self, v53, v54, v55);
    v59 = NSURL;
    if (v56) {
      objc_msgSend_stringWithFormat_(NSString, v57, @"%@/%@", v58, v37, @"minipreflight/phase1");
    }
    else {
    v60 = objc_msgSend_stringWithFormat_(NSString, v57, @"%@/%@", v58, v37, @"fullpreflight/phase1");
    }
    v63 = objc_msgSend_URLWithString_(v59, v61, (uint64_t)v60, v62);
    objc_msgSend_setServer_(v52, v64, (uint64_t)v63, v65);

    v69 = objc_msgSend_UUID(MEMORY[0x263F08C38], v66, v67, v68);
    v73 = objc_msgSend_UUIDString(v69, v70, v71, v72);
    objc_msgSend_setRequestID_(v52, v74, (uint64_t)v73, v75);

    v78 = objc_msgSend_objectAtIndexedSubscript_(v160, v76, 0, v77);
    objc_msgSend_setBikCertificate_(v52, v79, (uint64_t)v78, v80);

    objc_msgSend_setComponents_(v52, v81, (uint64_t)v40, v82);
    objc_msgSend_setPhase_(v52, v83, @"Phase1", v84);
    id v161 = 0;
    id v162 = 0;
    LODWORD(v73) = objc_msgSend_sendRequest_response_keyBlob_error_(self, v85, (uint64_t)v52, (uint64_t)&v162, v159, &v161);
    id v86 = v162;
    v87 = (char *)v161;
    v45 = v87;
    if (!v73 || v87)
    {
      v104 = handleForCategory(0);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D244(v52, v45, (uint64_t)v104, v118);
      }
      goto LABEL_64;
    }
    if (objc_msgSend_isErrorResponse_(self, v88, (uint64_t)v86, v89))
    {
      handleForCategory(0);
      v90 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D1C0(v52, v90, v91, v92);
      }

      v96 = objc_msgSend_errorCode(v86, v93, v94, v95);
      int isEqual = objc_msgSend_isEqual_(v96, v97, @"10262", v98);

      if (isEqual)
      {
        v155 = (void *)MEMORY[0x263F087E8];
        uint64_t v173 = *MEMORY[0x263F08320];
        v103 = NSString;
        v104 = objc_msgSend_phase(v52, v100, v101, v102);
        v108 = objc_msgSend_rawResponse(v86, v105, v106, v107);
        v111 = objc_msgSend_stringWithFormat_(v103, v109, @"%@: Error response: %@", v110, v104, v108);
        v174 = v111;
        v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v112, (uint64_t)&v174, (uint64_t)&v173, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v155, v114, @"com.apple.corerepair", -92, v113);
      }
      else
      {
        v129 = objc_msgSend_errorCode(v86, v100, v101, v102);
        int v132 = objc_msgSend_isEqual_(v129, v130, @"10261", v131);

        v156 = (void *)MEMORY[0x263F087E8];
        if (!v132)
        {
          uint64_t v169 = *MEMORY[0x263F08320];
          v144 = NSString;
          v104 = objc_msgSend_phase(v52, v133, v134, v135);
          v148 = objc_msgSend_rawResponse(v86, v145, v146, v147);
          v151 = objc_msgSend_stringWithFormat_(v144, v149, @"%@: Error response: %@", v150, v104, v148);
          v170 = v151;
          v153 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v152, (uint64_t)&v170, (uint64_t)&v169, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v156, v154, @"com.apple.corerepair", -78, v153);
          v45 = (char *)objc_claimAutoreleasedReturnValue();

          goto LABEL_64;
        }
        uint64_t v171 = *MEMORY[0x263F08320];
        v136 = NSString;
        v104 = objc_msgSend_phase(v52, v133, v134, v135);
        v108 = objc_msgSend_rawResponse(v86, v137, v138, v139);
        v111 = objc_msgSend_stringWithFormat_(v136, v140, @"%@: Error response: %@", v141, v104, v108);
        v172 = v111;
        v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v142, (uint64_t)&v172, (uint64_t)&v171, 1);
        objc_msgSend_errorWithDomain_code_userInfo_(v156, v143, @"com.apple.corerepair", -93, v113);
      }
      v45 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_64:
      v115 = 0;
LABEL_65:
      v116 = 0;
LABEL_66:
      uint64_t v117 = 0;
      goto LABEL_67;
    }
    id v119 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v115 = v119;
    if (v159) {
      objc_msgSend_setObject_forKeyedSubscript_(v119, v120, (uint64_t)v159, @"keyBlob");
    }
    v116 = objc_msgSend_createPEMFromCerts_(self, v120, (uint64_t)v160, v121);
    if (v116) {
      objc_msgSend_setObject_forKeyedSubscript_(v115, v122, (uint64_t)v116, @"baaCert");
    }
    objc_msgSend_rawResponse(v86, v122, v123, v124);
    v45 = (char *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      uint64_t v117 = 1;
      goto LABEL_68;
    }
    v104 = objc_msgSend_rawResponse(v86, v125, v126, v127);
    objc_msgSend_setObject_forKeyedSubscript_(v115, v128, (uint64_t)v104, @"responsePhase1");
  }
  else
  {
    v104 = handleForCategory(0);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v104, OS_LOG_TYPE_DEFAULT, "No delta components", buf, 2u);
    }
    v115 = 0;
    id v86 = 0;
    v52 = 0;
    v116 = 0;
    id v159 = 0;
    id v160 = 0;
  }
  v45 = 0;
  uint64_t v117 = 1;
LABEL_67:

LABEL_68:
  if (v9) {
    v9[2](v9, v117, v115, v45);
  }
}

- (void)preflightPhase2:(id)a3 withReply:(id)a4
{
  uint64_t v285 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v9 = (void (**)(id, uint64_t, id, char *))a4;
  char v271 = 0;
  if (!v6)
  {
    v18 = 0;
    uint64_t v20 = 0;
LABEL_35:
    v257 = (void *)v20;
    v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D33C();
    }
    id v49 = 0;
    v256 = 0;
    id v50 = 0;
    id v51 = 0;
    v52 = 0;
    v53 = 0;
    uint64_t v54 = 0;
    v258 = @"https://sklaxm.apple.com/axiom/SSR";
    id v259 = 0;
    goto LABEL_70;
  }
  v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"miniPreflight", v8);

  if (v10)
  {
    self->_miniPreflight = objc_msgSend_BOOLFromKey_defaultValue_failed_(v6, v11, @"miniPreflight", 0, &v271);
    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_miniPreflight) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v284 = (uint64_t)v14;
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Mini preflight: %@", buf, 0xCu);
    }
  }
  v15 = objc_msgSend_objectForKeyedSubscript_(v6, v11, @"keyBlob", v12);

  if (v15)
  {
    v18 = objc_msgSend_NSDataFromKey_defaultValue_failed_(v6, v16, @"keyBlob", 0, &v271);
    v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v284 = (uint64_t)v18;
      _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "keyBlob input: %@", buf, 0xCu);
    }
  }
  else
  {
    v18 = 0;
  }
  v21 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"responsePhase1", v17);

  if (v21)
  {
    uint64_t v20 = objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(v6, v22, @"responsePhase1", 0, &v271);
    v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v284 = v20;
      _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "responsePhase1 input: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  v25 = objc_msgSend_objectForKeyedSubscript_(v6, v22, @"socksHost", v23);

  if (v25)
  {
    objc_msgSend_NSStringFromKey_defaultValue_failed_(v6, v26, @"socksHost", 0, 0);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    socksHost = self->_socksHost;
    self->_socksHost = v28;

    v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = self->_socksHost;
      *(_DWORD *)buf = 138412290;
      uint64_t v284 = (uint64_t)v31;
      _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "Socks host: %@", buf, 0xCu);
    }
  }
  v32 = objc_msgSend_objectForKeyedSubscript_(v6, v26, @"socksPort", v27);

  if (v32)
  {
    objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v6, v33, @"socksPort", (uint64_t)&unk_26D1631E8, &unk_26D163200, 0, 0);
    uint64_t v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    socksPort = self->_socksPort;
    self->_socksPort = v34;

    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_socksPort;
      *(_DWORD *)buf = 138412290;
      uint64_t v284 = (uint64_t)v37;
      _os_log_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_DEFAULT, "Socks port: %@", buf, 0xCu);
    }
  }
  if (!v18 || !v20) {
    goto LABEL_35;
  }
  if (os_variant_has_internal_content())
  {
    id v39 = [CRUserDefaults alloc];
    v42 = objc_msgSend_initWithSuiteName_(v39, v40, @"com.apple.corerepaird.test", v41);
    v45 = objc_msgSend_stringForKey_(v42, v43, @"AxiomURL", v44);
    if (v45)
    {
      v46 = handleForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v284 = (uint64_t)v45;
        _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Overriding serverUrlString: %@", buf, 0xCu);
      }

      int v47 = v45;
    }
    else
    {
      int v47 = @"https://sklaxm.apple.com/axiom/SSR";
    }
  }
  else
  {
    int v47 = @"https://sklaxm.apple.com/axiom/SSR";
  }
  id v269 = 0;
  id v270 = 0;
  id v268 = 0;
  int v55 = objc_msgSend_deltaComponents_strongComponents_error_(self, v38, (uint64_t)&v270, (uint64_t)&v269, &v268);
  id v50 = v270;
  id v56 = v269;
  v57 = (char *)v268;
  v53 = v57;
  v257 = (void *)v20;
  v258 = v47;
  v256 = v56;
  if (!v55 || !v50 || v57)
  {
    v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D18C();
    }
    id v49 = 0;
    id v259 = 0;
    id v51 = 0;
    goto LABEL_52;
  }
  if (!objc_msgSend_count(v50, v58, v59, v60))
  {
    v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "No delta components", buf, 2u);
    }
    id v49 = 0;
    id v259 = 0;
    id v51 = 0;
    v52 = 0;
    v53 = 0;
    uint64_t v54 = 1;
    goto LABEL_70;
  }
  v61 = [CRPreflightResponse alloc];
  id v51 = (id)objc_msgSend_initWithDictionary_(v61, v62, v20, v63);
  uint64_t v67 = objc_msgSend_componentChallenges(v51, v64, v65, v66);

  if (!v67)
  {
    id v259 = 0;
    goto LABEL_57;
  }
  uint64_t v71 = objc_msgSend_componentChallenges(v51, v68, v69, v70);
  id v266 = 0;
  id v267 = 0;
  int v73 = objc_msgSend_challengeStrongComponents_responses_error_(self, v72, (uint64_t)v71, (uint64_t)&v267, &v266);
  id v259 = v267;
  v53 = (char *)v266;

  if (!v73 || v53)
  {
    v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D370();
    }
    id v49 = 0;
LABEL_52:
    v52 = 0;
LABEL_69:
    uint64_t v54 = 0;
    goto LABEL_70;
  }
  int v47 = v258;
LABEL_57:
  v52 = objc_msgSend_request(CRPreflightRequest, v68, v69, v70);
  int v77 = objc_msgSend_miniPreflight(self, v74, v75, v76);
  uint64_t v80 = NSURL;
  if (v77) {
    objc_msgSend_stringWithFormat_(NSString, v78, @"%@/%@", v79, v47, @"minipreflight/phase2");
  }
  else {
  v81 = objc_msgSend_stringWithFormat_(NSString, v78, @"%@/%@", v79, v47, @"fullpreflight/phase2");
  }
  uint64_t v84 = objc_msgSend_URLWithString_(v80, v82, (uint64_t)v81, v83);
  objc_msgSend_setServer_(v52, v85, (uint64_t)v84, v86);

  v90 = objc_msgSend_requestID(v51, v87, v88, v89);
  objc_msgSend_setRequestID_(v52, v91, (uint64_t)v90, v92);

  v96 = objc_msgSend_sessionID(v51, v93, v94, v95);
  objc_msgSend_setSessionID_(v52, v97, (uint64_t)v96, v98);

  objc_msgSend_setComponents_(v52, v99, (uint64_t)v50, v100);
  objc_msgSend_setComponentResponses_(v52, v101, (uint64_t)v259, v102);
  uint64_t v106 = objc_msgSend_activationChallenges(v51, v103, v104, v105);
  objc_msgSend_setActivationResponses_(v52, v107, (uint64_t)v106, v108);

  v112 = objc_msgSend_signatureChallenge(v51, v109, v110, v111);
  objc_msgSend_setSignatureChallenge_(v52, v113, (uint64_t)v112, v114);

  objc_msgSend_setPhase_(v52, v115, @"Phase2", v116);
  id v264 = 0;
  id v265 = 0;
  LODWORD(v81) = objc_msgSend_sendRequest_response_keyBlob_error_(self, v117, (uint64_t)v52, (uint64_t)&v265, v18, &v264);
  id v51 = v265;
  uint64_t v118 = (char *)v264;
  v53 = v118;
  if (!v81 || v118)
  {
    v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D244(v52, v53, (uint64_t)v48, v140);
    }
    goto LABEL_68;
  }
  if (objc_msgSend_isErrorResponse_(self, v119, (uint64_t)v51, v120))
  {
    handleForCategory(0);
    uint64_t v124 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D1C0(v52, v124, v125, v126);
    }

    v251 = (void *)MEMORY[0x263F087E8];
    uint64_t v281 = *MEMORY[0x263F08320];
    uint64_t v127 = NSString;
    v48 = objc_msgSend_phase(v52, v128, v129, v130);
    v250 = objc_msgSend_rawResponse(v51, v131, v132, v133);
    v136 = objc_msgSend_stringWithFormat_(v127, v134, @"%@: Error response: %@", v135, v48, v250);
    v282 = v136;
    uint64_t v138 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v137, (uint64_t)&v282, (uint64_t)&v281, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v251, v139, @"com.apple.corerepair", -79, v138);
    v53 = (char *)objc_claimAutoreleasedReturnValue();

    goto LABEL_68;
  }
  uint64_t v141 = objc_msgSend_status(v51, v121, v122, v123);
  if (objc_msgSend_isEqual_(v141, v142, @"200", v143))
  {
    uint64_t v147 = objc_msgSend_details(v51, v144, v145, v146);

    if (v147)
    {
      v252 = (void *)MEMORY[0x263F087E8];
      uint64_t v279 = *MEMORY[0x263F08320];
      v151 = NSString;
      v48 = objc_msgSend_details(v51, v148, v149, v150);
      v154 = objc_msgSend_stringWithFormat_(v151, v152, @"Success status, but with failure details: %@", v153, v48);
      v280 = v154;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v155, (uint64_t)&v280, (uint64_t)&v279, 1);
      v170 = LABEL_83:;
      objc_msgSend_errorWithDomain_code_userInfo_(v252, v171, @"com.apple.corerepair", -79, v170);
      v53 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_68:
      id v49 = 0;
      goto LABEL_69;
    }
  }
  else
  {
  }
  v156 = objc_msgSend_status(v51, v148, v149, v150);
  if (objc_msgSend_isEqual_(v156, v157, @"207", v158))
  {
    id v162 = objc_msgSend_details(v51, v159, v160, v161);

    if (!v162)
    {
      v252 = (void *)MEMORY[0x263F087E8];
      uint64_t v277 = *MEMORY[0x263F08320];
      id v166 = NSString;
      v48 = objc_msgSend_details(v51, v163, v164, v165);
      v154 = objc_msgSend_stringWithFormat_(v166, v167, @"Partial success status, but without failure details: %@", v168, v48);
      v278 = v154;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v169, (uint64_t)&v278, (uint64_t)&v277, 1);
      goto LABEL_83;
    }
  }
  else
  {
  }
  id v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setObject_forKeyedSubscript_(v49, v172, (uint64_t)v18, @"keyBlob");
  v176 = objc_msgSend_status(v51, v173, v174, v175);

  if (v176)
  {
    v180 = objc_msgSend_status(v51, v177, v178, v179);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v181, (uint64_t)v180, @"status");
  }
  v182 = objc_msgSend_details(v51, v177, v178, v179);

  if (v182)
  {
    v186 = objc_msgSend_details(v51, v183, v184, v185);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v187, (uint64_t)v186, @"details");
  }
  v188 = objc_msgSend_status(v51, v183, v184, v185);
  if (objc_msgSend_isEqual_(v188, v189, @"200", v190))
  {
  }
  else
  {
    v194 = objc_msgSend_status(v51, v191, v192, v193);
    int isEqual = objc_msgSend_isEqual_(v194, v195, @"207", v196);

    if (!isEqual)
    {
      v255 = (void *)MEMORY[0x263F087E8];
      uint64_t v272 = *MEMORY[0x263F08320];
      v242 = NSString;
      v48 = objc_msgSend_status(v51, v197, v198, v199);
      v249 = objc_msgSend_stringWithFormat_(v242, v243, @"Server response: %@", v244, v48);
      v273 = v249;
      v246 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v245, (uint64_t)&v273, (uint64_t)&v272, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v255, v247, @"com.apple.corerepair", -79, v246);
      v53 = (char *)objc_claimAutoreleasedReturnValue();

      goto LABEL_69;
    }
  }
  v254 = v18;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  id v50 = v50;
  uint64_t v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v200, (uint64_t)&v260, (uint64_t)v276, 16);
  if (v201)
  {
    uint64_t v204 = v201;
    uint64_t v205 = *(void *)v261;
    do
    {
      for (uint64_t i = 0; i != v204; ++i)
      {
        if (*(void *)v261 != v205) {
          objc_enumerationMutation(v50);
        }
        objc_msgSend_setState_(*(void **)(*((void *)&v260 + 1) + 8 * i), v202, 1, v203);
      }
      uint64_t v204 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v202, (uint64_t)&v260, (uint64_t)v276, 16);
    }
    while (v204);
  }

  v210 = objc_msgSend_details(v51, v207, v208, v209);
  char v212 = objc_msgSend_setComponentsState_withResponseDetails_(self, v211, (uint64_t)v50, (uint64_t)v210);

  if (v212)
  {
    uint64_t v54 = 1;
    v216 = objc_msgSend_components_withState_(self, v213, (uint64_t)v50, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v217, (uint64_t)v216, @"passComponents");

    v219 = objc_msgSend_components_withState_(self, v218, (uint64_t)v50, 2);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v220, (uint64_t)v219, @"unauthComponents");

    v222 = objc_msgSend_components_withState_(self, v221, (uint64_t)v50, 3);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v223, (uint64_t)v222, @"lockComponents");

    v225 = objc_msgSend_components_withState_(self, v224, (uint64_t)v50, 6);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v226, (uint64_t)v225, @"failComponents");

    v228 = objc_msgSend_components_withState_(self, v227, (uint64_t)v50, 5);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v229, (uint64_t)v228, @"lostComponents");

    v231 = objc_msgSend_components_withState_(self, v230, (uint64_t)v50, 4);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v232, (uint64_t)v231, @"deniedComponents");

    v48 = objc_msgSend_components_withState_(self, v233, (uint64_t)v50, 7);
    objc_msgSend_setObject_forKeyedSubscript_(v49, v234, (uint64_t)v48, @"sealedComponents");
    v53 = 0;
  }
  else
  {
    v248 = (void *)MEMORY[0x263F087E8];
    uint64_t v274 = *MEMORY[0x263F08320];
    v235 = NSString;
    v48 = objc_msgSend_details(v51, v213, v214, v215);
    v238 = objc_msgSend_stringWithFormat_(v235, v236, @"Failed to set components status: %@", v237, v48);
    v275 = v238;
    v240 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v239, (uint64_t)&v275, (uint64_t)&v274, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v248, v241, @"com.apple.corerepair", -79, v240);
    v53 = (char *)objc_claimAutoreleasedReturnValue();

    uint64_t v54 = 0;
  }
  v18 = v254;
LABEL_70:

  if (v9) {
    v9[2](v9, v54, v49, v53);
  }
}

- (void)preflight:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v10 = (void (**)(id, void, uint64_t, uint64_t))a4;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_21FBFF598;
  int v38 = sub_21FBFF5A8;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_21FBFF598;
  v32 = sub_21FBFF5A8;
  id v33 = 0;
  if (v6) {
    uint64_t v11 = objc_msgSend_mutableCopy(v6, v7, v8, v9);
  }
  else {
    uint64_t v11 = objc_opt_new();
  }
  v13 = (void *)v11;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_21FBFF5B0;
  v27[3] = &unk_26452A5E8;
  v27[4] = &v40;
  v27[5] = &v28;
  v27[6] = &v34;
  objc_msgSend_preflightPhase1_withReply_(self, v12, v11, (uint64_t)v27);
  if (*((unsigned char *)v41 + 24) && !v35[5])
  {
    v16 = objc_msgSend_objectForKeyedSubscript_((void *)v29[5], v14, @"keyBlob", v15);

    if (v16)
    {
      v19 = objc_msgSend_objectForKeyedSubscript_((void *)v29[5], v17, @"keyBlob", v18);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v20, (uint64_t)v19, @"keyBlob");
    }
    v21 = objc_msgSend_objectForKeyedSubscript_((void *)v29[5], v17, @"responsePhase1", v18);

    if (v21)
    {
      v24 = objc_msgSend_objectForKeyedSubscript_((void *)v29[5], v22, @"responsePhase1", v23);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, @"responsePhase1");
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_21FBFF630;
    v26[3] = &unk_26452A5E8;
    v26[4] = &v40;
    v26[5] = &v28;
    v26[6] = &v34;
    objc_msgSend_preflightPhase2_withReply_(self, v22, (uint64_t)v13, (uint64_t)v26);
  }
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v41 + 24), v29[5], v35[5]);
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_21FBFF598;
  uint64_t v31 = sub_21FBFF5A8;
  id v32 = 0;
  id v8 = objc_alloc(MEMORY[0x263F08D68]);
  v10 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v8, v9, @"com.apple.corerepair.preflightControl", 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v10;

  v14 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v12, (uint64_t)&unk_26D168410, v13);
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v15, (uint64_t)v14, v16);

  objc_msgSend_resume(self->_connectionToService, v17, v18, v19);
  v22 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_connectionToService, v20, (uint64_t)&unk_26D1577C8, v21);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_21FBFF8B4;
  v26[3] = &unk_26452A630;
  v26[4] = self;
  v26[5] = &v27;
  objc_msgSend_sign_keyBlob_withReply_(v22, v23, (uint64_t)v6, (uint64_t)v7, v26);

  id v24 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v24;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v11 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v13 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v11, v12, @"com.apple.corerepair.preflightControl", 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v13;

  uint64_t v17 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v15, (uint64_t)&unk_26D168410, v16);
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v18, (uint64_t)v17, v19);

  objc_msgSend_resume(self->_connectionToService, v20, v21, v22);
  v25 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_connectionToService, v23, (uint64_t)&unk_26D1577E8, v24);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_21FBFFB74;
  v28[3] = &unk_26452A658;
  v28[4] = self;
  v28[5] = &v29;
  objc_msgSend_verify_signature_keyBlob_withReply_(v25, v26, (uint64_t)v8, (uint64_t)v9, v10, v28);

  LOBYTE(self) = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v29, 8);

  return (char)self;
}

- (id)components:(id)a3 withState:(int64_t)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v37 = (id)objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend_state(v15, v9, v10, v11) == a4)
        {
          id v16 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v20 = objc_msgSend_identifier(v15, v17, v18, v19);
          uint64_t v22 = objc_msgSend_initWithBase64EncodedString_options_(v16, v21, (uint64_t)v20, 0);

          id v23 = [NSString alloc];
          v25 = objc_msgSend_initWithData_encoding_(v23, v24, (uint64_t)v22, 4);
          v26 = NSString;
          uint64_t v30 = objc_msgSend_type(v15, v27, v28, v29);
          id v33 = objc_msgSend_stringWithFormat_(v26, v31, @"%@-%@", v32, v30, v25);

          objc_msgSend_addObject_(v37, v34, (uint64_t)v33, v35);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v12);
  }

  return v37;
}

- (BOOL)setComponentsState:(id)a3 withResponseDetails:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "no details in response", buf, 2u);
    }
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D510();
    }
    BOOL v60 = 0;
    goto LABEL_59;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v7 = v6;
  uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v78, (uint64_t)v85, 16);
  if (!v69)
  {
LABEL_50:
    BOOL v60 = 1;
    goto LABEL_59;
  }
  id v64 = v6;
  uint64_t v10 = *(void *)v79;
  *(void *)&long long v9 = 138412290;
  long long v63 = v9;
  uint64_t v66 = v7;
  id v67 = v5;
  uint64_t v65 = *(void *)v79;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v79 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v78 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v61 = handleForCategory(0);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_21FC5D4A8();
        }

LABEL_57:
        BOOL v60 = 0;
        goto LABEL_58;
      }
      id v13 = v12;
      id v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"Type", v15);
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v13, v17, @"Identifier", v18);
      uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v13, v20, @"status", v21);
      if (v16) {
        BOOL v25 = v19 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      BOOL v26 = v25 || v22 == 0;
      int v27 = !v26;
      int v72 = v27;
      uint64_t v70 = v11;
      uint64_t v71 = v22;
      if (v26)
      {
        uint64_t v32 = handleForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v63;
          id v84 = v13;
          _os_log_error_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_ERROR, "details item in response malformed: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v28 = v22;
        id v68 = v13;
        if (objc_msgSend_isEqual_(v22, v23, @"10230", v24))
        {
          uint64_t v31 = 2;
        }
        else if (objc_msgSend_isEqual_(v28, v29, @"10260", v30))
        {
          uint64_t v31 = 3;
        }
        else if (objc_msgSend_isEqual_(v28, v33, @"10261", v34))
        {
          uint64_t v31 = 4;
        }
        else if (objc_msgSend_isEqual_(v28, v35, @"10262", v36))
        {
          uint64_t v31 = 5;
        }
        else
        {
          int isEqual = objc_msgSend_isEqual_(v28, v37, @"20100", v38);
          uint64_t v31 = 6;
          if (isEqual) {
            uint64_t v31 = 7;
          }
        }
        uint64_t v73 = v31;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v32 = v5;
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v40, (uint64_t)&v74, (uint64_t)v82, 16);
        if (v41)
        {
          uint64_t v45 = v41;
          uint64_t v46 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v75 != v46) {
                objc_enumerationMutation(v32);
              }
              v48 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              id v49 = objc_msgSend_type(v48, v42, v43, v44, v63);
              if (objc_msgSend_isEqual_(v49, v50, (uint64_t)v16, v51))
              {
                int v55 = objc_msgSend_identifier(v48, v52, v53, v54);
                int v58 = objc_msgSend_isEqual_(v55, v56, (uint64_t)v19, v57);

                if (v58) {
                  objc_msgSend_setState_(v48, v42, v73, v44);
                }
              }
              else
              {
              }
            }
            uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v42, (uint64_t)&v74, (uint64_t)v82, 16);
          }
          while (v45);
          id v7 = v66;
          id v5 = v67;
          uint64_t v10 = v65;
        }
        id v13 = v68;
      }

      if (!v72) {
        goto LABEL_57;
      }
      uint64_t v11 = v70 + 1;
    }
    while (v70 + 1 != v69);
    BOOL v60 = 1;
    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v59, (uint64_t)&v78, (uint64_t)v85, 16);
    if (v69) {
      continue;
    }
    break;
  }
LABEL_58:
  id v6 = v64;
LABEL_59:

  return v60;
}

- (BOOL)deltaComponents:(id *)a3 strongComponents:(id *)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v54 = (id)objc_opt_new();
  uint64_t v53 = objc_opt_new();
  id v65 = 0;
  id v66 = 0;
  char RepairDelta_error = objc_msgSend_queryRepairDelta_error_(self, v9, (uint64_t)&v66, (uint64_t)&v65);
  id v11 = v66;
  id v12 = v65;
  id v13 = v12;
  if (v12) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = RepairDelta_error;
  }
  if (!v14)
  {
    uint64_t v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D62C();
    }

    uint64_t v45 = v13;
    if (!a5) {
      goto LABEL_41;
    }
LABEL_40:
    *a5 = v45;
    goto LABEL_41;
  }
  v48 = a3;
  id v49 = a4;
  id v50 = v12;
  BOOL v51 = v14;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v52 = v11;
  id obj = v11;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v61, (uint64_t)v76, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v62;
    do
    {
      uint64_t v21 = 0;
      uint64_t v55 = v19;
      do
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v61 + 1) + 8 * v21);
        id v23 = objc_msgSend_objectForKeyedSubscript_(v22, v17, @"key", v18);
        BOOL v26 = objc_msgSend_objectForKeyedSubscript_(v22, v24, @"identifier", v25);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v22, v27, @"asid", v28);
        uint64_t v30 = handleForCategory(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v69 = "-[CRPreflightController deltaComponents:strongComponents:error:]";
          __int16 v70 = 2112;
          uint64_t v71 = v23;
          __int16 v72 = 2112;
          uint64_t v73 = v26;
          __int16 v74 = 2112;
          long long v75 = v29;
          _os_log_debug_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEBUG, "%s: key: %@ identifier: %@ asid: %@", buf, 0x2Au);
        }

        if (v23) {
          BOOL v31 = v26 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31)
        {
          uint64_t v32 = v20;
          id v33 = [CRPreflightRequestComponent alloc];
          uint64_t v35 = objc_msgSend_initWithComponentType_identifier_asid_(v33, v34, (uint64_t)v23, (uint64_t)v26, v29);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1633F8, v36, (uint64_t)&v57, (uint64_t)v67, 16);
          if (v37)
          {
            uint64_t v40 = v37;
            uint64_t v41 = *(void *)v58;
            while (2)
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v58 != v41) {
                  objc_enumerationMutation(&unk_26D1633F8);
                }
                if (objc_msgSend_isEqual_(*(void **)(*((void *)&v57 + 1) + 8 * i), v38, (uint64_t)v23, v39))
                {
                  objc_msgSend_addObject_(v53, v38, (uint64_t)v35, v39);
                  goto LABEL_26;
                }
              }
              uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1633F8, v38, (uint64_t)&v57, (uint64_t)v67, 16);
              if (v40) {
                continue;
              }
              break;
            }
          }
LABEL_26:
          objc_msgSend_addObject_(v54, v38, (uint64_t)v35, v39);

          uint64_t v20 = v32;
          uint64_t v19 = v55;
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v61, (uint64_t)v76, 16);
    }
    while (v19);
  }

  uint64_t v43 = handleForCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_21FC5D5B8();
  }

  uint64_t v44 = handleForCategory(0);
  id v11 = v52;
  BOOL v14 = v51;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    sub_21FC5D544();
  }

  id v13 = v50;
  if (v48) {
    id *v48 = v54;
  }
  uint64_t v45 = v53;
  a5 = v49;
  if (v49) {
    goto LABEL_40;
  }
LABEL_41:

  return v14;
}

- (BOOL)queryRepairDelta:(id *)a3 error:(id *)a4
{
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_21FBFF598;
  long long v57 = sub_21FBFF5A8;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = sub_21FBFF598;
  BOOL v51 = sub_21FBFF5A8;
  id v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  id v7 = objc_alloc(MEMORY[0x263F08D68]);
  long long v9 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v7, v8, @"com.apple.corerepair.preflightControl", 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v9;

  id v13 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v11, (uint64_t)&unk_26D168410, v12);
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v14, (uint64_t)v13, v15);

  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v24 = objc_msgSend_setWithObjects_(v16, v22, v17, v23, v18, v19, v20, v21, 0);
  uint64_t v28 = objc_msgSend_remoteObjectInterface(self->_connectionToService, v25, v26, v27);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v28, v29, (uint64_t)v24, (uint64_t)sel_queryRepairDeltaWithReply_, 1, 1);

  objc_msgSend_resume(self->_connectionToService, v30, v31, v32);
  id v33 = self->_connectionToService;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_21FC00A14;
  v42[3] = &unk_26452A680;
  v42[4] = &v47;
  uint64_t v36 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v33, v34, (uint64_t)v42, v35);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = sub_21FC00A88;
  v41[3] = &unk_26452A6A8;
  v41[6] = &v53;
  v41[7] = &v47;
  v41[4] = self;
  v41[5] = &v43;
  objc_msgSend_queryRepairDeltaWithReply_(v36, v37, (uint64_t)v41, v38);

  if (a3) {
    *a3 = (id) v54[5];
  }
  if (a4) {
    *a4 = (id) v48[5];
  }
  char v39 = *((unsigned char *)v44 + 24);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v39;
}

- (BOOL)issueRepairCert:(id *)a3 keyBlob:(id *)a4 error:(id *)a5
{
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = sub_21FBFF598;
  __int16 v72 = sub_21FBFF5A8;
  id v73 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = sub_21FBFF598;
  id v66 = sub_21FBFF5A8;
  id v67 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  long long v59 = sub_21FBFF598;
  long long v60 = sub_21FBFF5A8;
  id v61 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  long long v9 = objc_opt_new();
  if (objc_msgSend_miniPreflight(self, v10, v11, v12)) {
    objc_msgSend_setObject_forKeyedSubscript_(v9, v13, MEMORY[0x263EFFA88], @"miniPreflight");
  }
  uint64_t v19 = objc_msgSend_socksHost(self, v13, v14, v15);
  if (v19)
  {
    uint64_t v20 = objc_msgSend_socksPort(self, v16, v17, v18);

    if (v20)
    {
      uint64_t v24 = objc_msgSend_socksHost(self, v21, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v25, (uint64_t)v24, @"socksHost");

      uint64_t v29 = objc_msgSend_socksPort(self, v26, v27, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v30, (uint64_t)v29, @"socksPort");
    }
  }
  id v31 = objc_alloc(MEMORY[0x263F08D68]);
  id v33 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v31, v32, @"com.apple.corerepair.preflightControl", 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v33;

  uint64_t v37 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v35, (uint64_t)&unk_26D168410, v36);
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v38, (uint64_t)v37, v39);

  objc_msgSend_resume(self->_connectionToService, v40, v41, v42);
  uint64_t v43 = self->_connectionToService;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = sub_21FC00FB8;
  v51[3] = &unk_26452A680;
  v51[4] = &v56;
  char v46 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v43, v44, (uint64_t)v51, v45);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_21FC0102C;
  v50[3] = &unk_26452A6D0;
  v50[6] = &v62;
  v50[7] = &v68;
  v50[8] = &v56;
  v50[4] = self;
  v50[5] = &v52;
  objc_msgSend_issueRepairCert_withReply_(v46, v47, (uint64_t)v9, (uint64_t)v50);

  if (a3) {
    *a3 = (id) v69[5];
  }
  if (a4) {
    *a4 = (id) v63[5];
  }
  if (a5) {
    *a5 = (id) v57[5];
  }
  char v48 = *((unsigned char *)v53 + 24);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v48;
}

- (BOOL)challengeStrongComponents:(id)a3 responses:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v58 = 0;
  long long v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_21FBFF598;
  uint64_t v62 = sub_21FBFF5A8;
  id v63 = 0;
  uint64_t v54 = 0;
  char v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  BOOL v51 = sub_21FBFF598;
  uint64_t v52 = sub_21FBFF5A8;
  id v53 = 0;
  long long v9 = objc_opt_new();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v8, @"challenges");
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v18 = objc_msgSend_setWithObjects_(v11, v16, v12, v17, v13, v14, v15, 0);
  id v19 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v21 = objc_msgSend_initWithMachServiceName_options_(v19, v20, @"com.apple.corerepair.preflightControl", 0);
  uint64_t v24 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v22, (uint64_t)&unk_26D168410, v23);
  objc_msgSend_setRemoteObjectInterface_(v21, v25, (uint64_t)v24, v26);

  uint64_t v30 = objc_msgSend_remoteObjectInterface(v21, v27, v28, v29);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v30, v31, (uint64_t)v18, (uint64_t)sel_challengeStrongComponents_withReply_, 0, 0);

  uint64_t v35 = objc_msgSend_remoteObjectInterface(v21, v32, v33, v34);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v35, v36, (uint64_t)v18, (uint64_t)sel_challengeStrongComponents_withReply_, 1, 1);

  objc_msgSend_resume(v21, v37, v38, v39);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_21FC01554;
  v47[3] = &unk_26452A680;
  v47[4] = &v58;
  uint64_t v42 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v21, v40, (uint64_t)v47, v41);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_21FC015C8;
  v46[3] = &unk_26452A6A8;
  v46[6] = &v58;
  v46[7] = &v48;
  v46[4] = self;
  v46[5] = &v54;
  objc_msgSend_challengeStrongComponents_withReply_(v42, v43, (uint64_t)v9, (uint64_t)v46);

  if (a5) {
    *a5 = (id) v59[5];
  }
  if (a4) {
    *a4 = (id) v49[5];
  }
  char v44 = *((unsigned char *)v55 + 24);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v44;
}

- (BOOL)sendRequest:(id)a3 response:(id *)a4 keyBlob:(id)a5 error:(id *)a6
{
  uint64_t v197 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v145 = a5;
  queue = dispatch_get_global_queue(0, 0);
  uint64_t v181 = 0;
  v182 = &v181;
  uint64_t v183 = 0x3032000000;
  uint64_t v184 = sub_21FBFF598;
  uint64_t v185 = sub_21FBFF5A8;
  dispatch_group_t v186 = dispatch_group_create();
  uint64_t v175 = 0;
  v176 = &v175;
  uint64_t v177 = 0x3032000000;
  uint64_t v178 = sub_21FBFF598;
  uint64_t v179 = sub_21FBFF5A8;
  id v180 = 0;
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x3032000000;
  v172 = sub_21FBFF598;
  uint64_t v173 = sub_21FBFF5A8;
  id v174 = 0;
  uint64_t v163 = 0;
  uint64_t v164 = &v163;
  uint64_t v165 = 0x3032000000;
  id v166 = sub_21FBFF598;
  id v167 = sub_21FBFF5A8;
  id v168 = 0;
  uint64_t v157 = 0;
  uint64_t v158 = &v157;
  uint64_t v159 = 0x3032000000;
  uint64_t v160 = sub_21FBFF598;
  uint64_t v161 = sub_21FBFF5A8;
  id v162 = 0;
  uint64_t v153 = 0;
  v154 = &v153;
  uint64_t v155 = 0x2020000000;
  int v156 = 0;
  uint64_t v149 = 0;
  uint64_t v150 = &v149;
  uint64_t v151 = 0x2020000000;
  char v152 = 1;
  if (!v8)
  {
    uint64_t v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D6FC();
    }
    goto LABEL_17;
  }
  uint64_t v15 = objc_msgSend_server(v8, v9, v10, v11);
  if (!v15)
  {
    uint64_t v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D730();
    }
LABEL_17:
    id v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    v142 = 0;
    uint64_t v143 = 0;
    v144 = 0;
    id v19 = 0;
    uint64_t v15 = 0;
LABEL_18:
    BOOL v34 = 0;
    goto LABEL_19;
  }
  id v19 = objc_msgSend_payload(v8, v12, v13, v14);
  if (!v19)
  {
    uint64_t v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D764();
    }
    id v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    v142 = 0;
    uint64_t v143 = 0;
    v144 = 0;
    id v19 = 0;
    goto LABEL_18;
  }
  if (v145)
  {
    uint64_t v20 = objc_msgSend_signatureChallenge(v8, v16, v17, v18);
    BOOL v21 = v20 == 0;

    if (v21)
    {
      uint64_t v143 = 0;
      v144 = 0;
    }
    else
    {
      uint64_t v22 = handleForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "Signing server nonce ...", buf, 2u);
      }

      uint64_t v26 = objc_msgSend_signatureChallenge(v8, v23, v24, v25);
      uint64_t v143 = objc_msgSend_sign_keyBlob_(self, v27, (uint64_t)v26, (uint64_t)v145);

      if (!v143)
      {
        uint64_t v30 = handleForCategory(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_21FC5D9D0();
        }
        id v31 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        v142 = 0;
        uint64_t v143 = 0;
        goto LABEL_64;
      }
      v144 = objc_msgSend_base64EncodedStringWithOptions_(v143, v28, 0, v29);
      if (!v144)
      {
        uint64_t v30 = handleForCategory(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_21FC5DA04();
        }
        id v31 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        v142 = 0;
LABEL_64:
        v144 = 0;
        goto LABEL_18;
      }
    }
    uint64_t v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_DEFAULT, "Signing request ...", buf, 2u);
    }

    uint64_t v38 = objc_msgSend_sign_keyBlob_(self, v37, (uint64_t)v19, (uint64_t)v145);
    v142 = v38;
    if (!v38)
    {
      uint64_t v30 = handleForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D968();
      }
      id v31 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      v142 = 0;
      goto LABEL_18;
    }
    uint64_t v33 = objc_msgSend_base64EncodedStringWithOptions_(v38, v39, 0, v40);
    if (!v33)
    {
      uint64_t v30 = handleForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D99C();
      }
      id v31 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v143 = 0;
    v144 = 0;
    uint64_t v33 = 0;
    v142 = 0;
  }
  id v31 = objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x263F089E0], v16, (uint64_t)v15, 0, 120.0);
  objc_msgSend_setHTTPMethod_(v31, v41, @"POST", v42);
  objc_msgSend_setValue_forHTTPHeaderField_(v31, v43, @"*/*", @"Accept");
  objc_msgSend_setValue_forHTTPHeaderField_(v31, v44, @"application/xml", @"Content-Type");
  uint64_t v45 = NSString;
  uint64_t v49 = objc_msgSend_length(v19, v46, v47, v48);
  uint64_t v52 = objc_msgSend_stringWithFormat_(v45, v50, @"%d", v51, v49);
  objc_msgSend_setValue_forHTTPHeaderField_(v31, v53, (uint64_t)v52, @"Content-Length");

  if (v144) {
    objc_msgSend_setValue_forHTTPHeaderField_(v31, v54, (uint64_t)v144, @"signature");
  }
  if (v33) {
    objc_msgSend_setValue_forHTTPHeaderField_(v31, v54, (uint64_t)v33, @"ax_request_body_signature");
  }
  objc_msgSend_setHTTPBody_(v31, v54, (uint64_t)v19, v55);
  uint64_t v56 = handleForCategory(0);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v60 = objc_msgSend_length(v19, v57, v58, v59);
    sub_21FC5D920(v196, v60, v56);
  }

  id v61 = handleForCategory(0);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_phase(v8, v62, v63, v64);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v8, v65, v66, v67);
    objc_claimAutoreleasedReturnValue();
    sub_21FC5D8D8();
  }

  uint64_t v68 = handleForCategory(0);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_phase(v8, v69, v70, v71);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v19, v72, 0, v73);
    objc_claimAutoreleasedReturnValue();
    sub_21FC5D890();
  }

  uint64_t v32 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v74, v75, v76);
  uint64_t v83 = objc_msgSend_socksHost(self, v77, v78, v79);
  if (v83)
  {
    id v84 = objc_msgSend_socksPort(self, v80, v81, v82);
    BOOL v85 = v84 == 0;

    if (!v85)
    {
      v193[0] = @"SOCKSProxy";
      uint64_t v88 = objc_msgSend_socksHost(self, v80, v86, v87);
      v194[0] = v88;
      v193[1] = @"SOCKSPort";
      uint64_t v92 = objc_msgSend_socksPort(self, v89, v90, v91);
      v193[2] = @"SOCKSEnable";
      v194[1] = v92;
      v194[2] = MEMORY[0x263EFFA88];
      uint64_t v94 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v93, (uint64_t)v194, (uint64_t)v193, 3);
      objc_msgSend_setConnectionProxyDictionary_(v32, v95, (uint64_t)v94, v96);
    }
  }
  v97 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x263F08BF8], v80, (uint64_t)v32, (uint64_t)self, 0);
  v148[0] = MEMORY[0x263EF8330];
  v148[1] = 3221225472;
  v148[2] = sub_21FC02500;
  v148[3] = &unk_26452A6F8;
  v148[4] = &v169;
  v148[5] = &v163;
  v148[6] = &v149;
  v148[7] = &v157;
  v148[8] = &v153;
  v148[9] = &v181;
  uint64_t v99 = objc_msgSend_dataTaskWithRequest_completionHandler_(v97, v98, (uint64_t)v31, (uint64_t)v148);
  uint64_t v100 = (void *)v176[5];
  v176[5] = v99;

  uint64_t v101 = v182[5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC02698;
  block[3] = &unk_26452A720;
  block[4] = &v181;
  block[5] = &v175;
  dispatch_group_async(v101, queue, block);
  dispatch_group_wait((dispatch_group_t)v182[5], 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v102 = handleForCategory(0);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v103 = v158[5];
    *(_DWORD *)v191 = 138412290;
    uint64_t v192 = v103;
    _os_log_impl(&dword_21FBF2000, v102, OS_LOG_TYPE_DEFAULT, "HTTP Response Header: %@", v191, 0xCu);
  }

  uint64_t v104 = handleForCategory(0);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    int v105 = *((_DWORD *)v154 + 6);
    *(_DWORD *)v191 = 67109120;
    LODWORD(v192) = v105;
    _os_log_impl(&dword_21FBF2000, v104, OS_LOG_TYPE_DEFAULT, "HTTP Status: %d", v191, 8u);
  }

  uint64_t v106 = handleForCategory(0);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v107 = v170[5];
    *(_DWORD *)v191 = 138412290;
    uint64_t v192 = v107;
    _os_log_impl(&dword_21FBF2000, v106, OS_LOG_TYPE_DEFAULT, "HTTP Error: %@", v191, 0xCu);
  }

  if (a6) {
    *a6 = (id) v170[5];
  }
  uint64_t v110 = 0;
  if (a4)
  {
    uint64_t v30 = 0;
    if (v164[5])
    {
      uint64_t v111 = handleForCategory(0);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_phase(v8, v112, v113, v114);
        objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_((void *)v164[5], v115, 0, v116);
        objc_claimAutoreleasedReturnValue();
        sub_21FC5D848();
      }

      uint64_t v117 = v164[5];
      id v146 = 0;
      uint64_t v30 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v118, v117, 0, 0, &v146);
      id v119 = v146;
      uint64_t v110 = v119;
      if (!v30 || v119)
      {
        uint64_t v133 = handleForCategory(0);
        if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
          sub_21FC5D798();
        }

        if (a6) {
          *a6 = v110;
        }
        *((unsigned char *)v150 + 24) = 0;
      }
      else
      {
        uint64_t v120 = handleForCategory(0);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v189 = 138412290;
          uint64_t v190 = v30;
          _os_log_impl(&dword_21FBF2000, v120, OS_LOG_TYPE_DEFAULT, "Server Data: %@", v189, 0xCu);
        }

        uint64_t v121 = [CRPreflightResponse alloc];
        uint64_t v124 = objc_msgSend_initWithDictionary_(v121, v122, (uint64_t)v30, v123);
        uint64_t v125 = handleForCategory(0);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_phase(v8, v126, v127, v128);
          objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v124, v129, v130, v131);
          objc_claimAutoreleasedReturnValue();
          sub_21FC5D800();
        }

        id v132 = v124;
        *a4 = v132;

        uint64_t v110 = 0;
      }
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
  if (a6 && *((_DWORD *)v154 + 6) == 429)
  {
    uint64_t v139 = objc_msgSend_stringWithFormat_(NSString, v108, @"Request failed with status: %d error: %@", v109, 429, v170[5]);
    uint64_t v134 = (void *)MEMORY[0x263F087E8];
    uint64_t v187 = *MEMORY[0x263F08320];
    v188 = v139;
    v136 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v135, (uint64_t)&v188, (uint64_t)&v187, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v134, v137, @"com.apple.corerepair", -94, v136);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v34 = *((unsigned char *)v150 + 24) != 0;

LABEL_19:
  _Block_object_dispose(&v149, 8);
  _Block_object_dispose(&v153, 8);
  _Block_object_dispose(&v157, 8);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v169, 8);

  _Block_object_dispose(&v175, 8);
  _Block_object_dispose(&v181, 8);

  return v34;
}

- (BOOL)isErrorResponse:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (!v3)
  {
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DB08();
    }
    goto LABEL_9;
  }
  id v8 = objc_msgSend_errorCode(v3, v4, v5, v6);
  if (v8)
  {

    goto LABEL_7;
  }
  uint64_t v12 = objc_msgSend_errorMessage(v7, v9, v10, v11);

  if (v12)
  {
LABEL_7:
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DB3C(v7, (const char *)v12, v13, v14);
    }
LABEL_9:

    LOBYTE(v12) = 1;
  }

  return (char)v12;
}

- (id)createPEMFromCerts:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v7 = objc_msgSend_string(MEMORY[0x263F089D8], v4, v5, v6);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v38 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_msgSend_appendString_(v7, v10, @"-----BEGIN CERTIFICATE-----\n", v11);
        uint64_t v17 = objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
        uint64_t v21 = objc_msgSend_length(v17, v18, v19, v20);
        if (v21)
        {
          unint64_t v24 = v21;
          unint64_t v25 = 0;
          unint64_t v26 = v21;
          do
          {
            unint64_t v27 = v26 - 64;
            if (v26 >= 0x40) {
              objc_msgSend_substringWithRange_(v17, v22, v25, 64);
            }
            else {
            uint64_t v28 = objc_msgSend_substringWithRange_(v17, v22, v25, v26);
            }
            objc_msgSend_appendString_(v7, v29, (uint64_t)v28, v30);

            objc_msgSend_appendString_(v7, v31, @"\n", v32);
            v25 += 64;
            unint64_t v26 = v27;
          }
          while (v25 < v24);
        }
        objc_msgSend_appendString_(v7, v22, @"-----END CERTIFICATE-----\n", v23);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v12);
  }

  uint64_t v35 = objc_msgSend_dataUsingEncoding_(v7, v33, 4, v34);

  return v35;
}

- (id)getSupportedStrongComponents
{
  return &unk_26D1633F8;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = handleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "didReceiveChallenge", (uint8_t *)&v34, 2u);
  }

  uint64_t v12 = objc_msgSend_protectionSpace(v6, v9, v10, v11);
  uint64_t v16 = (__SecTrust *)objc_msgSend_serverTrust(v12, v13, v14, v15);

  CFArrayRef v17 = SecTrustCopyCertificateChain(v16);
  if (v17)
  {
    CFArrayRef v18 = v17;
    if (CFArrayGetCount(v17) < 1) {
      ValueAtIndex = 0;
    }
    else {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v18, 0);
    }
    CFRelease(v18);
  }
  else
  {
    ValueAtIndex = 0;
  }
  CFDataRef v20 = SecCertificateCopyData(ValueAtIndex);
  uint64_t v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412546;
    CFDataRef v35 = v20;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_21FBF2000, v21, OS_LOG_TYPE_DEFAULT, "Certificate:%@:%@", (uint8_t *)&v34, 0x16u);
  }

  uint64_t v22 = (void *)MEMORY[0x263F08BB8];
  unint64_t v26 = objc_msgSend_protectionSpace(v6, v23, v24, v25);
  uint64_t v30 = objc_msgSend_serverTrust(v26, v27, v28, v29);
  uint64_t v33 = objc_msgSend_credentialForTrust_(v22, v31, v30, v32);

  v7[2](v7, 0, v33);
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
}

- (BOOL)miniPreflight
{
  return self->_miniPreflight;
}

- (void)setMiniPreflight:(BOOL)a3
{
  self->_miniPreflight = a3;
}

- (NSString)socksHost
{
  return self->_socksHost;
}

- (void)setSocksHost:(id)a3
{
}

- (NSNumber)socksPort
{
  return self->_socksPort;
}

- (void)setSocksPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socksPort, 0);
  objc_storeStrong((id *)&self->_socksHost, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end