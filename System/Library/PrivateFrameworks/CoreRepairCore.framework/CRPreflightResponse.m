@interface CRPreflightResponse
- (CRPreflightResponse)initWithDictionary:(id)a3;
- (NSArray)details;
- (NSData)signatureChallenge;
- (NSDictionary)rawResponse;
- (NSMutableArray)activationChallenges;
- (NSMutableArray)componentChallenges;
- (NSString)errorCode;
- (NSString)errorMessage;
- (NSString)requestID;
- (NSString)sessionID;
- (NSString)specVersion;
- (NSString)status;
- (id)description;
- (void)setActivationChallenges:(id)a3;
- (void)setComponentChallenges:(id)a3;
- (void)setDetails:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setRawResponse:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSignatureChallenge:(id)a3;
- (void)setSpecVersion:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation CRPreflightResponse

- (CRPreflightResponse)initWithDictionary:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v131.receiver = self;
  v131.super_class = (Class)CRPreflightResponse;
  v6 = [(CRPreflightResponse *)&v131 init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v121 = 0;
      goto LABEL_49;
    }
    objc_storeStrong((id *)&v6->_rawResponse, a3);
    v10 = objc_msgSend_objectForKeyedSubscript_(v5, v8, @"RequestID", v9);

    if (v10)
    {
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"RequestID", v12);
      requestID = v7->_requestID;
      v7->_requestID = (NSString *)v13;
    }
    v15 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"SessionID", v12);

    if (v15)
    {
      uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"SessionID", v17);
      sessionID = v7->_sessionID;
      v7->_sessionID = (NSString *)v18;
    }
    v20 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"status", v17);

    if (v20)
    {
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"status", v22);
      status = v7->_status;
      v7->_status = (NSString *)v23;
    }
    v25 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"details", v22);

    if (v25)
    {
      uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v5, v26, @"details", v27);
      details = v7->_details;
      v7->_details = (NSArray *)v28;
    }
    v30 = objc_msgSend_objectForKeyedSubscript_(v5, v26, @"ErrorCode", v27);

    if (v30)
    {
      uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v5, v31, @"ErrorCode", v32);
      errorCode = v7->_errorCode;
      v7->_errorCode = (NSString *)v33;
    }
    v35 = objc_msgSend_objectForKeyedSubscript_(v5, v31, @"ErrorMessage", v32);

    if (v35)
    {
      uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v5, v36, @"ErrorMessage", v37);
      errorMessage = v7->_errorMessage;
      v7->_errorMessage = (NSString *)v38;
    }
    v40 = objc_msgSend_objectForKeyedSubscript_(v5, v36, @"SpecVersion", v37);

    if (v40)
    {
      uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v5, v41, @"SpecVersion", v42);
      specVersion = v7->_specVersion;
      v7->_specVersion = (NSString *)v43;
    }
    v45 = objc_msgSend_objectForKeyedSubscript_(v5, v41, @"SignatureChallenge", v42);

    if (v45)
    {
      uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v5, v46, @"SignatureChallenge", v47);
      signatureChallenge = v7->_signatureChallenge;
      v7->_signatureChallenge = (NSData *)v48;
    }
    v50 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    componentChallenges = v7->_componentChallenges;
    v7->_componentChallenges = v50;

    v52 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activationChallenges = v7->_activationChallenges;
    v7->_activationChallenges = v52;

    v56 = objc_msgSend_objectForKeyedSubscript_(v5, v54, @"Challenges", v55);

    if (v56)
    {
      id v123 = v5;
      v59 = objc_msgSend_objectForKeyedSubscript_(v5, v57, @"Challenges", v58);
      v60 = handleForCategory(0);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v59;
        _os_log_impl(&dword_21FBF2000, v60, OS_LOG_TYPE_DEFAULT, "Challenges: %@", buf, 0xCu);
      }

      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id obj = v59;
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v127, (uint64_t)v132, 16);
      if (v62)
      {
        uint64_t v65 = v62;
        uint64_t v66 = *(void *)v128;
        v125 = v7;
        do
        {
          for (uint64_t i = 0; i != v65; ++i)
          {
            if (*(void *)v128 != v66) {
              objc_enumerationMutation(obj);
            }
            v68 = *(void **)(*((void *)&v127 + 1) + 8 * i);
            v69 = objc_msgSend_objectForKeyedSubscript_(v68, v63, @"Type", v64);
            uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v68, v70, @"Identifier", v71);
            v75 = (void *)v72;
            if (v69) {
              BOOL v76 = v72 == 0;
            }
            else {
              BOOL v76 = 1;
            }
            if (!v76)
            {
              v77 = objc_msgSend_objectForKeyedSubscript_(v68, v73, @"nonce", v74);

              if (v77)
              {
                v80 = objc_opt_new();
                v83 = objc_msgSend_objectForKeyedSubscript_(v68, v81, @"nonce", v82);
                objc_msgSend_setObject_forKeyedSubscript_(v80, v84, (uint64_t)v69, @"key");
                objc_msgSend_setObject_forKeyedSubscript_(v80, v85, (uint64_t)v83, @"nonce");
                objc_msgSend_addObject_(v7->_componentChallenges, v86, (uint64_t)v80, v87);
              }
              uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v68, v78, @"Properties", v79);
              if (v88)
              {
                v91 = (void *)v88;
                v92 = objc_msgSend_objectForKeyedSubscript_(v68, v89, @"Properties", v90);
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v96 = objc_msgSend_objectForKeyedSubscript_(v68, v94, @"Properties", v95);
                  uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v96, v97, @"activation", v98);
                  if (v99)
                  {
                    v102 = (void *)v99;
                    v103 = objc_msgSend_objectForKeyedSubscript_(v96, v100, @"activation", v101);
                    objc_opt_class();
                    char v104 = objc_opt_isKindOfClass();

                    if (v104)
                    {
                      v105 = objc_opt_new();
                      v108 = objc_msgSend_objectForKeyedSubscript_(v68, v106, @"Type", v107);
                      v111 = objc_msgSend_objectForKeyedSubscript_(v96, v109, @"activation", v110);
                      v114 = objc_msgSend_objectForKeyedSubscript_(v111, v112, @"status", v113);
                      v124 = v111;
                      v117 = objc_msgSend_objectForKeyedSubscript_(v111, v115, @"activationToken", v116);
                      objc_msgSend_setObject_forKeyedSubscript_(v105, v118, (uint64_t)v108, @"key");
                      if (v117) {
                        objc_msgSend_setObject_forKeyedSubscript_(v105, v119, (uint64_t)v117, @"activationToken");
                      }
                      if (v114 && objc_msgSend_isEqual_(v114, v119, @"NOCHALLENGE", v120)) {
                        objc_msgSend_setObject_forKeyedSubscript_(v105, v119, (uint64_t)&stru_26D158688, @"activationToken");
                      }
                      objc_msgSend_addObject_(v125->_activationChallenges, v119, (uint64_t)v105, v120);
                    }
                  }

                  v7 = v125;
                }
              }
            }
          }
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v127, (uint64_t)v132, 16);
        }
        while (v65);
      }

      id v5 = v123;
    }
  }
  v121 = v7;
LABEL_49:

  return v121;
}

- (id)description
{
  id v47 = (id)NSString;
  v3 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v3);
  v7 = objc_msgSend_requestID(self, v4, v5, v6);
  v11 = objc_msgSend_sessionID(self, v8, v9, v10);
  v15 = objc_msgSend_componentChallenges(self, v12, v13, v14);
  v19 = objc_msgSend_activationChallenges(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_status(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_details(self, v24, v25, v26);
  v31 = objc_msgSend_errorCode(self, v28, v29, v30);
  v35 = objc_msgSend_errorMessage(self, v32, v33, v34);
  v39 = objc_msgSend_specVersion(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_signatureChallenge(self, v40, v41, v42);
  objc_msgSend_stringWithFormat_(v47, v44, @"<%@: RequestID = %@ SessionID = %@ ComponentChallenges = %@ ActivationChallenges = %@ Status = %@ details = %@ errorCode = %@ errorMessage = %@ specVersion = %@ signatureChallenge = %@>", v45, v49, v7, v11, v15, v19, v23, v27, v31, v35, v39, v43);
  id v48 = (id)objc_claimAutoreleasedReturnValue();

  return v48;
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

- (NSMutableArray)componentChallenges
{
  return self->_componentChallenges;
}

- (void)setComponentChallenges:(id)a3
{
}

- (NSMutableArray)activationChallenges
{
  return self->_activationChallenges;
}

- (void)setActivationChallenges:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void)setSpecVersion:(id)a3
{
}

- (NSData)signatureChallenge
{
  return self->_signatureChallenge;
}

- (void)setSignatureChallenge:(id)a3
{
}

- (NSDictionary)rawResponse
{
  return self->_rawResponse;
}

- (void)setRawResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_signatureChallenge, 0);
  objc_storeStrong((id *)&self->_specVersion, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_activationChallenges, 0);
  objc_storeStrong((id *)&self->_componentChallenges, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end