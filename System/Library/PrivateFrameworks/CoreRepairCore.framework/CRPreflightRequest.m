@interface CRPreflightRequest
+ (id)request;
- (CRPreflightRequest)init;
- (NSArray)activationResponses;
- (NSArray)componentResponses;
- (NSArray)components;
- (NSData)bikCertificate;
- (NSData)signatureChallenge;
- (NSString)phase;
- (NSString)requestID;
- (NSString)sessionID;
- (NSURL)server;
- (id)description;
- (id)payload;
- (void)setActivationResponses:(id)a3;
- (void)setBikCertificate:(id)a3;
- (void)setComponentResponses:(id)a3;
- (void)setComponents:(id)a3;
- (void)setPhase:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setServer:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSignatureChallenge:(id)a3;
@end

@implementation CRPreflightRequest

- (CRPreflightRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRPreflightRequest;
  return [(CRPreflightRequest *)&v3 init];
}

+ (id)request
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)payload
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = objc_msgSend_requestID(self, v4, v5, v6);

  if (v7)
  {
    v11 = objc_msgSend_requestID(self, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"RequestID");
  }
  v13 = objc_msgSend_bikCertificate(self, v8, v9, v10);

  if (v13)
  {
    v17 = objc_msgSend_bikCertificate(self, v14, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"BIKCertificate");
  }
  v19 = objc_msgSend_sessionID(self, v14, v15, v16);

  if (v19)
  {
    v23 = objc_msgSend_sessionID(self, v20, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, @"SessionID");
  }
  v25 = objc_msgSend_components(self, v20, v21, v22);

  if (v25)
  {
    v129 = v3;
    id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    objc_msgSend_components(self, v28, v29, v30);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v146, (uint64_t)v152, 16);
    if (v32)
    {
      uint64_t v36 = v32;
      uint64_t v37 = *(void *)v147;
      v131 = v27;
      v132 = self;
      uint64_t v130 = *(void *)v147;
      do
      {
        uint64_t v38 = 0;
        uint64_t v133 = v36;
        do
        {
          if (*(void *)v147 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v146 + 1) + 8 * v38);
          uint64_t v40 = objc_msgSend_type(v39, v33, v34, v35);
          if (v40)
          {
            v41 = (void *)v40;
            v42 = objc_msgSend_identifier(v39, v33, v34, v35);

            if (v42)
            {
              uint64_t v135 = v38;
              id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              v48 = objc_msgSend_type(v39, v45, v46, v47);
              objc_msgSend_setObject_forKeyedSubscript_(v43, v49, (uint64_t)v48, @"Type");

              v53 = objc_msgSend_identifier(v39, v50, v51, v52);
              objc_msgSend_setObject_forKeyedSubscript_(v43, v54, (uint64_t)v53, @"Identifier");

              v58 = objc_msgSend_asid(v39, v55, v56, v57);

              if (v58)
              {
                v62 = objc_msgSend_asid(v39, v59, v60, v61);
                objc_msgSend_setObject_forKeyedSubscript_(v44, v63, (uint64_t)v62, @"asid");
              }
              v136 = v44;
              long long v144 = 0u;
              long long v145 = 0u;
              long long v142 = 0u;
              long long v143 = 0u;
              v64 = objc_msgSend_componentResponses(self, v59, v60, v61);
              uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v142, (uint64_t)v151, 16);
              if (v66)
              {
                uint64_t v69 = v66;
                uint64_t v70 = *(void *)v143;
                do
                {
                  for (uint64_t i = 0; i != v69; ++i)
                  {
                    if (*(void *)v143 != v70) {
                      objc_enumerationMutation(v64);
                    }
                    v72 = *(void **)(*((void *)&v142 + 1) + 8 * i);
                    v73 = objc_msgSend_objectForKeyedSubscript_(v72, v67, @"key", v68);
                    v76 = objc_msgSend_objectForKeyedSubscript_(v72, v74, @"signature", v75);
                    v81 = objc_msgSend_objectForKeyedSubscript_(v72, v77, @"deviceNonce", v78);
                    if (v73) {
                      BOOL v82 = v76 == 0;
                    }
                    else {
                      BOOL v82 = 1;
                    }
                    if (!v82)
                    {
                      v83 = objc_msgSend_objectForKeyedSubscript_(v43, v79, @"Type", v80);
                      int isEqual = objc_msgSend_isEqual_(v83, v84, (uint64_t)v73, v85);

                      if (isEqual)
                      {
                        objc_msgSend_setObject_forKeyedSubscript_(v43, v87, (uint64_t)v76, @"Response");
                        if (v81) {
                          objc_msgSend_setObject_forKeyedSubscript_(v136, v88, (uint64_t)v81, @"deviceNonce");
                        }
                      }
                    }
                  }
                  uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v142, (uint64_t)v151, 16);
                }
                while (v69);
              }

              long long v140 = 0u;
              long long v141 = 0u;
              long long v138 = 0u;
              long long v139 = 0u;
              self = v132;
              v92 = objc_msgSend_activationResponses(v132, v89, v90, v91);
              uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v138, (uint64_t)v150, 16);
              if (v94)
              {
                uint64_t v97 = v94;
                uint64_t v98 = *(void *)v139;
                do
                {
                  for (uint64_t j = 0; j != v97; ++j)
                  {
                    if (*(void *)v139 != v98) {
                      objc_enumerationMutation(v92);
                    }
                    v100 = *(void **)(*((void *)&v138 + 1) + 8 * j);
                    v101 = objc_msgSend_objectForKeyedSubscript_(v100, v95, @"key", v96);
                    uint64_t v104 = objc_msgSend_objectForKeyedSubscript_(v100, v102, @"activationToken", v103);
                    v107 = (void *)v104;
                    if (v101) {
                      BOOL v108 = v104 == 0;
                    }
                    else {
                      BOOL v108 = 1;
                    }
                    if (!v108)
                    {
                      v109 = objc_msgSend_objectForKeyedSubscript_(v43, v105, @"Type", v106);
                      int v112 = objc_msgSend_isEqual_(v109, v110, (uint64_t)v101, v111);

                      if (v112) {
                        objc_msgSend_setObject_forKeyedSubscript_(v136, v113, (uint64_t)v107, @"activationToken");
                      }
                    }
                  }
                  uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v138, (uint64_t)v150, 16);
                }
                while (v97);
              }

              if (objc_msgSend_count(v136, v114, v115, v116)) {
                objc_msgSend_setObject_forKeyedSubscript_(v43, v117, (uint64_t)v136, @"Properties");
              }
              id v27 = v131;
              objc_msgSend_addObject_(v131, v117, (uint64_t)v43, v118);

              uint64_t v36 = v133;
              uint64_t v37 = v130;
              uint64_t v38 = v135;
            }
          }
          ++v38;
        }
        while (v38 != v36);
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v146, (uint64_t)v152, 16);
      }
      while (v36);
    }

    id v3 = v129;
    if (objc_msgSend_count(v27, v119, v120, v121)) {
      objc_msgSend_setObject_forKeyedSubscript_(v129, v122, (uint64_t)v27, @"Components");
    }
  }
  id v137 = 0;
  v123 = v3;
  v124 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v26, (uint64_t)v3, 100, 0, &v137);
  id v125 = v137;
  if (v125)
  {
    v126 = handleForCategory(0);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C8F4((uint64_t)v125, v126);
    }

    id v127 = 0;
  }
  else
  {
    id v127 = v124;
  }

  return v127;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_requestID(self, v6, v7, v8);
  v13 = objc_msgSend_sessionID(self, v10, v11, v12);
  v17 = objc_msgSend_bikCertificate(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_components(self, v18, v19, v20);
  v25 = objc_msgSend_componentResponses(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_activationResponses(self, v26, v27, v28);
  v33 = objc_msgSend_signatureChallenge(self, v30, v31, v32);
  uint64_t v36 = objc_msgSend_stringWithFormat_(v3, v34, @"<%@: RequestID = %@ SessionID = %@ bikCertificate = %@ components = %@ componentResponses = %@ activationResponses = %@, signatureChallenge = %@>", v35, v5, v9, v13, v17, v21, v25, v29, v33);

  return v36;
}

- (NSURL)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSData)signatureChallenge
{
  return self->_signatureChallenge;
}

- (void)setSignatureChallenge:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)bikCertificate
{
  return self->_bikCertificate;
}

- (void)setBikCertificate:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (NSArray)componentResponses
{
  return self->_componentResponses;
}

- (void)setComponentResponses:(id)a3
{
}

- (NSArray)activationResponses
{
  return self->_activationResponses;
}

- (void)setActivationResponses:(id)a3
{
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_activationResponses, 0);
  objc_storeStrong((id *)&self->_componentResponses, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_bikCertificate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_signatureChallenge, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end