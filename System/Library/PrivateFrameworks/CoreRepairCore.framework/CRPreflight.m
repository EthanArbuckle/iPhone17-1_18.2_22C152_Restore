@interface CRPreflight
- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5;
- (id)_extractCertsFromResponse:(id)a3;
- (id)_getVersionInfo:(id)a3;
- (id)_httpSendRequest:(id)a3 proxySettings:(id)a4 withError:(id *)a5;
- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5 withError:(id *)a6;
- (id)sha256Data:(id)a3;
- (id)sign:(id)a3 keyBlob:(id)a4;
- (void)challengeStrongComponents:(id)a3 withReply:(id)a4;
- (void)issueRepairCert:(id)a3 withReply:(id)a4;
- (void)queryRepairDeltaWithReply:(id)a3;
@end

@implementation CRPreflight

- (void)queryRepairDeltaWithReply:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, uint64_t, void *, void *))a3;
  v4 = objc_opt_new();
  id v68 = 0;
  v7 = objc_msgSend_findUnsealedDataWithError_(CRFDRUtils, v5, (uint64_t)&v68, v6);
  id v8 = v68;
  v12 = v8;
  if (v7) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  uint64_t v14 = v13;
  if (v13)
  {
    if (objc_msgSend_count(v7, v9, v10, v11))
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v44 = v7;
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v15, (uint64_t)&v64, (uint64_t)v80, 16);
      if (v58)
      {
        unsigned int v52 = v14;
        v53 = v12;
        v54 = v7;
        v55 = v3;
        uint64_t v56 = *(void *)v65;
        v57 = v44;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v65 != v56) {
              objc_enumerationMutation(v44);
            }
            uint64_t v59 = v18;
            uint64_t v19 = *(void *)(*((void *)&v64 + 1) + 8 * v18);
            v20 = objc_msgSend_objectForKeyedSubscript_(v44, v16, v19, v17);
            v21 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass();
            v22 = handleForCategory(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v75 = "-[CRPreflight queryRepairDeltaWithReply:]";
              __int16 v76 = 2112;
              uint64_t v77 = v19;
              __int16 v78 = 2112;
              v79 = v21;
              _os_log_debug_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEBUG, "%s: key: %@, asid: %@", buf, 0x20u);
            }

            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v23 = v20;
            uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v60, (uint64_t)v73, 16);
            if (v25)
            {
              uint64_t v28 = v25;
              uint64_t v29 = *(void *)v61;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v61 != v29) {
                    objc_enumerationMutation(v23);
                  }
                  v31 = objc_msgSend_dataUsingEncoding_(*(void **)(*((void *)&v60 + 1) + 8 * i), v26, 4, v27);
                  v34 = objc_msgSend_base64EncodedStringWithOptions_(v31, v32, 0, v33);

                  if (v21)
                  {
                    uint64_t v36 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v21, v35, @"-", @",");
                    v38 = (void *)v36;
                    if (v36)
                    {
                      v71[0] = @"key";
                      v71[1] = @"identifier";
                      v72[0] = v19;
                      v72[1] = v34;
                      v71[2] = @"asid";
                      v72[2] = v36;
                      v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v72, (uint64_t)v71, 3);
                      objc_msgSend_addObject_(v4, v40, (uint64_t)v39, v41);
                    }
                    else
                    {
                      v39 = handleForCategory(0);
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v75 = (const char *)v21;
                        _os_log_error_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_ERROR, "Failed to change asid format: %@", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    v69[0] = @"key";
                    v69[1] = @"identifier";
                    v70[0] = v19;
                    v70[1] = v34;
                    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v70, (uint64_t)v69, 2);
                    objc_msgSend_addObject_(v4, v42, (uint64_t)v38, v43);
                  }
                }
                uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v60, (uint64_t)v73, 16);
              }
              while (v28);
            }

            uint64_t v18 = v59 + 1;
            v44 = v57;
          }
          while (v59 + 1 != v58);
          uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v16, (uint64_t)&v64, (uint64_t)v80, 16);
        }
        while (v58);
        v7 = v54;
        v3 = v55;
        v12 = v53;
        uint64_t v14 = v52;
      }
    }
    else
    {
      v44 = handleForCategory(0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
      }
    }
  }
  else
  {
    v44 = handleForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CD64((uint64_t)v12, v44, v46, v47, v48, v49, v50, v51);
    }
  }

  if (v3) {
    v3[2](v3, v14, v4, v12);
  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, void *, id))a4;
  id v90 = 0;
  id v8 = handleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v104 = "-[CRPreflight issueRepairCert:withReply:]";
    __int16 v105 = 2112;
    id v106 = v6;
    _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "%s parameters: %@", buf, 0x16u);
  }

  if (!v6)
  {
    v34 = 0;
    uint64_t v29 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"miniPreflight", v11);
  if (v12
    && (v15 = (void *)v12,
        objc_msgSend_objectForKeyedSubscript_(v6, v13, @"miniPreflight", v14),
        v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        v15,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v6, v13, @"miniPreflight", v14);
    char v22 = objc_msgSend_BOOLValue(v18, v19, v20, v21);
  }
  else
  {
    char v22 = 0;
  }
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v6, v13, @"socksHost", v14);
  if (v23
    && (v26 = (void *)v23,
        objc_msgSend_objectForKeyedSubscript_(v6, v24, @"socksHost", v25),
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v28 = objc_opt_isKindOfClass(),
        v27,
        v26,
        (v28 & 1) != 0))
  {
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v6, v24, @"socksHost", v25);
  }
  else
  {
    uint64_t v29 = 0;
  }
  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v6, v24, @"socksPort", v25);
  if (!v30
    || (v31 = (void *)v30,
        objc_msgSend_objectForKeyedSubscript_(v6, v9, @"socksPort", v11),
        v32 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v33 = objc_opt_isKindOfClass(),
        v32,
        v31,
        (v33 & 1) == 0))
  {
    v34 = 0;
    v35 = 0;
    if (v22) {
      goto LABEL_31;
    }
LABEL_19:
    uint64_t DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v9, v10, v11);
    if (DefaultAMAuthInstallRef)
    {
      uint64_t v40 = DefaultAMAuthInstallRef;
      if (v29 && v34) {
        AMAuthInstallSetSOCKSProxyInformation();
      }
      if (!objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v37, v38, v39)|| !objc_msgSend_enableSSO_(CRPersonalizationManager, v41, v40, v42))
      {
        uint64_t v50 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v41, v40, v42);
        id v89 = 0;
        int RepairTicket_error = objc_msgSend_getRepairTicket_error_(v50, v51, (uint64_t)&v90, (uint64_t)&v89);
        id v53 = v89;

        if (!RepairTicket_error || v53)
        {
          v87 = (void *)v29;
          v69 = (void *)MEMORY[0x263F087E8];
          uint64_t v97 = *MEMORY[0x263F08320];
          v70 = objc_msgSend_stringWithFormat_(NSString, v9, @"Failed to get repair ticket: %@", v54, v53);
          v98 = v70;
          v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v71, (uint64_t)&v98, (uint64_t)&v97, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v69, v73, @"com.apple.corerepair", -85, v72);
          id v46 = (id)objc_claimAutoreleasedReturnValue();

          v57 = 0;
          uint64_t v58 = 0;
          v35 = 0;
          goto LABEL_44;
        }
        goto LABEL_28;
      }
      v87 = (void *)v29;
      uint64_t v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v99 = *MEMORY[0x263F08320];
      v100 = @"Failed to enable SSO";
      v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)&v100, (uint64_t)&v99, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v45, @"com.apple.corerepair", -85, v44);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = (void *)v29;
      long long v61 = (void *)MEMORY[0x263F087E8];
      uint64_t v101 = *MEMORY[0x263F08320];
      long long v62 = objc_msgSend_stringWithFormat_(NSString, v37, @"Failed to get auth ref", v39);
      v102 = v62;
      long long v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v102, (uint64_t)&v101, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v61, v65, @"com.apple.corerepair", -85, v64);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
    }
    v57 = 0;
    uint64_t v58 = 0;
    v35 = 0;
LABEL_38:
    id v53 = 0;
    goto LABEL_44;
  }
  v34 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"socksPort", v11);
  if ((v22 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_28:
  v35 = 0;
  if (v29 && v34)
  {
    v95[0] = @"socksHost";
    v95[1] = @"socksPort";
    v96[0] = v29;
    v96[1] = v34;
    v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v96, (uint64_t)v95, 2);
  }
LABEL_31:
  v55 = objc_alloc_init(CRRIK);
  v87 = (void *)v29;
  if (!v55)
  {
    long long v66 = (void *)MEMORY[0x263F087E8];
    uint64_t v93 = *MEMORY[0x263F08320];
    v94 = @"Create RIK failed";
    long long v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v56, (uint64_t)&v94, (uint64_t)&v93, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v66, v68, @"com.apple.corerepair", -75, v67);
    id v46 = (id)objc_claimAutoreleasedReturnValue();

    v57 = 0;
    uint64_t v58 = 0;
    goto LABEL_38;
  }
  v57 = v55;
  id v88 = 0;
  uint64_t v58 = objc_msgSend_requestBAACertificates_apticket_proxySettings_withError_(self, v56, (uint64_t)v55, (uint64_t)v90, v35, &v88);
  id v59 = v88;
  id v53 = v59;
  if (v58 && !v59)
  {
    id v46 = 0;
    uint64_t v60 = 1;
    goto LABEL_45;
  }
  if (v59)
  {
    v74 = objc_msgSend_domain(v59, v47, v48, v49);
    int isEqual = objc_msgSend_isEqual_(v74, v75, @"com.apple.corerepair", v76);

    if (isEqual)
    {
      id v46 = v53;
      uint64_t v60 = 0;
      id v53 = v46;
      goto LABEL_45;
    }
  }
  __int16 v78 = (void *)MEMORY[0x263F087E8];
  uint64_t v91 = *MEMORY[0x263F08320];
  v79 = objc_msgSend_stringWithFormat_(NSString, v47, @"Failed to request BAA: %@", v49, v53);
  v92 = v79;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v80, (uint64_t)&v92, (uint64_t)&v91, 1);
  uint64_t v81 = v7;
  v83 = v82 = v34;
  objc_msgSend_errorWithDomain_code_userInfo_(v78, v84, @"com.apple.corerepair", -76, v83);
  id v46 = (id)objc_claimAutoreleasedReturnValue();

  v34 = v82;
  v7 = v81;

LABEL_44:
  uint64_t v60 = 0;
LABEL_45:
  if (v7)
  {
    objc_msgSend_keyBlob(v57, v47, v48, v49);
    v86 = v85 = v34;
    v7[2](v7, v60, v86, v58, v46);

    v34 = v85;
  }
  AMSupportSafeRelease();
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void *, void *))a4;
  v7 = objc_opt_new();
  long long v67 = objc_opt_new();
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v8, @"challenges", v9);
  if (v10)
  {
    BOOL v13 = v10;
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"challenges", v12);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"challenges", v17);
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v10 = 0;
  }
LABEL_6:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v10;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v74, (uint64_t)v86, 16);
  if (!v19)
  {
    uint64_t v56 = 0;
    uint64_t v57 = 1;
    goto LABEL_55;
  }
  uint64_t v22 = v19;
  long long v66 = v7;
  long long v63 = v6;
  id v64 = v5;
  uint64_t v23 = *(void *)v75;
LABEL_8:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v75 != v23) {
      objc_enumerationMutation(obj);
    }
    uint64_t v25 = *(void **)(*((void *)&v74 + 1) + 8 * v24);
    CFDataRef v72 = 0;
    CFDataRef v73 = 0;
    int v71 = 0;
    v26 = objc_msgSend_objectForKeyedSubscript_(v25, v20, @"key", v21);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v25, v27, @"nonce", v28);
    v32 = (void *)v29;
    if (v26) {
      BOOL v33 = v29 == 0;
    }
    else {
      BOOL v33 = 1;
    }
    if (v33) {
      goto LABEL_44;
    }
    if (objc_msgSend_isEqual_(v26, v30, @"vcrt", v31))
    {
      uint64_t v36 = objc_msgSend_sha256Data_(self, v34, (uint64_t)v32, v35);
      objc_msgSend_vcrtSign_outSignature_outDeviceNonce_outError_(v67, v37, (uint64_t)v36, (uint64_t)&v73, &v72, &v71);

LABEL_17:
      int v40 = 1;
      goto LABEL_23;
    }
    if (objc_msgSend_isEqual_(v26, v34, @"bcrt", v35))
    {
      objc_msgSend_bcrtSign_outSignature_outDeviceNonce_outError_(v67, v41, (uint64_t)v32, (uint64_t)&v73, 0, &v71);
    }
    else
    {
      if (!objc_msgSend_isEqual_(v26, v41, @"tcrt", v42))
      {
        if (!objc_msgSend_isEqual_(v26, v43, @"prpc", v44))
        {
          uint64_t v51 = handleForCategory(0);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            sub_21FC5CDD0(&buf, v70, v51);
          }
          goto LABEL_43;
        }
        objc_msgSend_prpcSign_outSignature_outDeviceNonce_outError_(v67, v54, (uint64_t)v32, (uint64_t)&v73, &v72, &v71);
        goto LABEL_17;
      }
      objc_msgSend_tcrtSign_outSignature_outDeviceNonce_outError_(v67, v43, (uint64_t)v32, (uint64_t)&v73, 0, &v71);
    }
    int v40 = 0;
LABEL_23:
    CFDataRef v45 = v73;
    if (!v73)
    {
      id v46 = handleForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(void *)((char *)&bytes + 4) = v26;
        _os_log_error_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_ERROR, "Failed to get strong component signature: %@", (uint8_t *)&bytes, 0xCu);
      }

      long long bytes = 0uLL;
      int v85 = 0;
      CFDataRef v45 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      CFDataRef v73 = v45;
    }
    CFDataRef v47 = v72;
    if (v72) {
      int v48 = 0;
    }
    else {
      int v48 = v40;
    }
    if (v48 == 1)
    {
      uint64_t v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(void *)((char *)&bytes + 4) = v26;
        _os_log_error_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_ERROR, "Failed to get strong component nonce: %@", (uint8_t *)&bytes, 0xCu);
      }

      long long bytes = 0uLL;
      int v85 = 0;
      CFDataRef v47 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      CFDataRef v72 = v47;
      CFDataRef v45 = v73;
    }
    char v50 = v47 ? 0 : v40;
    if (!v45 || (v50 & 1) != 0) {
      break;
    }
    if (v40)
    {
      v80[0] = @"key";
      v80[1] = @"signature";
      v81[0] = v26;
      v81[1] = v45;
      v80[2] = @"deviceNonce";
      v81[2] = v47;
      uint64_t v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v81, (uint64_t)v80, 3);
    }
    else
    {
      v78[0] = @"key";
      v78[1] = @"signature";
      v79[0] = v26;
      v79[1] = v45;
      uint64_t v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v79, (uint64_t)v78, 2);
    }

    objc_msgSend_addObject_(v7, v52, (uint64_t)v51, v53);
LABEL_43:

LABEL_44:
    if (v22 == ++v24)
    {
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v74, (uint64_t)v86, 16);
      uint64_t v22 = v55;
      if (!v55)
      {
        uint64_t v56 = 0;
        uint64_t v57 = 1;
        goto LABEL_53;
      }
      goto LABEL_8;
    }
  }
  uint64_t v58 = (void *)MEMORY[0x263F087E8];
  uint64_t v82 = *MEMORY[0x263F08320];
  id v59 = objc_msgSend_stringWithFormat_(NSString, v38, @"Failed to challenge strong component: %@", v39, v26);
  v83 = v59;
  long long v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v60, (uint64_t)&v83, (uint64_t)&v82, 1);
  uint64_t v56 = objc_msgSend_errorWithDomain_code_userInfo_(v58, v62, @"com.apple.corerepair", -42, v61);

  uint64_t v57 = 0;
LABEL_53:
  id v6 = v63;
  id v5 = v64;
  v7 = v66;
LABEL_55:

  if (v6) {
    v6[2](v6, v57, v7, v56);
  }
}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [CRRIK alloc];
      uint64_t v11 = objc_msgSend_initWithKeyBlob_(v8, v9, (uint64_t)v7, v10);
      if (v11)
      {
        uint64_t v14 = v11;
        uint64_t v15 = objc_msgSend_sha256Data_(self, v12, (uint64_t)v6, v13);
        if (v15)
        {
          uint64_t v18 = (void *)v15;
          uint64_t v19 = objc_msgSend_sign_(v14, v16, v15, v17);

          goto LABEL_16;
        }
        uint64_t v20 = handleForCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_21FC5CEAC();
        }
      }
      else
      {
        uint64_t v14 = handleForCategory(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_21FC5CE78();
        }
      }
    }
    else
    {
      uint64_t v14 = handleForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_21FC5CE44();
      }
    }
  }
  else
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CE10();
    }
  }
  uint64_t v19 = 0;
LABEL_16:

  return v19;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CE10();
    }
    goto LABEL_12;
  }
  uint64_t v11 = [CRRIK alloc];
  uint64_t v14 = objc_msgSend_initWithKeyBlob_(v11, v12, (uint64_t)v10, v13);
  if (!v14)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CE78();
    }
    goto LABEL_12;
  }
  uint64_t v17 = v14;
  uint64_t v18 = objc_msgSend_sha256Data_(self, v15, (uint64_t)v8, v16);
  if (!v18)
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CEAC();
    }

LABEL_12:
    char v21 = 0;
    goto LABEL_13;
  }
  uint64_t v20 = (void *)v18;
  char v21 = objc_msgSend_verify_signature_(v17, v19, v18, (uint64_t)v9);

LABEL_13:
  return v21;
}

- (id)sha256Data:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_length(v3, v4, v5, v6, 0, 0, 0, 0);
  if ((unint64_t)(v7 - 1) > 0xFFFFFFFD)
  {
    uint64_t v15 = 0;
  }
  else
  {
    CC_LONG v8 = v7;
    id v9 = v3;
    uint64_t v13 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12);
    CC_SHA256(v13, v8, (unsigned __int8 *)&v17);
    uint64_t v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v14, (uint64_t)&v17, 32);
  }

  return v15;
}

- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5 withError:(id *)a6
{
  v65[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v63 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
  long long v62 = v11;
  if (!v10)
  {
    CFDataRef v45 = handleForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CEE0();
    }
    goto LABEL_16;
  }
  uint64_t v16 = objc_msgSend_attestationBlob(v10, v13, v14, v15);
  if (!v16)
  {
    CFDataRef v45 = handleForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CF14();
    }
LABEL_16:

    uint64_t v36 = 0;
    uint64_t v41 = 0;
    uint64_t v23 = 0;
    uint64_t v20 = 0;
LABEL_17:
    id v33 = 0;
    id v46 = 0;
    uint64_t v31 = 0;
    goto LABEL_18;
  }
  uint64_t v20 = (void *)v16;
  uint64_t v21 = objc_msgSend_pubKeyBlob(v10, v17, v18, v19);
  if (!v21)
  {
    uint64_t v49 = handleForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CF48();
    }

    uint64_t v36 = 0;
    uint64_t v41 = 0;
    uint64_t v23 = 0;
    goto LABEL_17;
  }
  uint64_t v23 = (void *)v21;
  uint64_t v60 = a6;
  if (v11) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v22, (uint64_t)v11, *MEMORY[0x263F39938]);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v12, v22, (uint64_t)v20, *MEMORY[0x263F39910]);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v24, (uint64_t)v23, *MEMORY[0x263F39918]);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v25, MEMORY[0x263EFFA88], *MEMORY[0x263F399D0]);
  uint64_t v26 = *MEMORY[0x263F39968];
  v65[0] = *MEMORY[0x263F399B8];
  v65[1] = v26;
  uint64_t v27 = *MEMORY[0x263F39990];
  v65[2] = *MEMORY[0x263F39980];
  v65[3] = v27;
  v65[4] = *MEMORY[0x263F39970];
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v28, (uint64_t)v65, 5);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v30, (uint64_t)v29, *MEMORY[0x263F399B0]);

  v64[1] = 0;
  uint64_t v31 = DeviceIdentityCreateClientCertificateRequest();
  id v32 = 0;
  id v33 = v32;
  if (!v31 || v32)
  {
    char v50 = handleForCategory(0);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_21FC5CF7C((uint64_t)v33, v50, v51, v52, v53, v54, v55, v56);
    }

    uint64_t v36 = 0;
    uint64_t v41 = 0;
    id v46 = 0;
    goto LABEL_18;
  }
  int v34 = MGGetBoolAnswer();
  uint64_t v35 = @"corerepaird-SB";
  if (v34) {
    uint64_t v35 = @"corerepaird-CB";
  }
  uint64_t v36 = v35;
  uint64_t v41 = objc_msgSend__getVersionInfo_(self, v37, (uint64_t)v31, v38);
  if (v41)
  {
    uint64_t v42 = objc_msgSend_stringWithFormat_(NSString, v39, @"%@ - %@", v40, v41, v36);
    objc_msgSend_setValue_forHTTPHeaderField_(v31, v43, (uint64_t)v42, @"User-Agent");
  }
  else
  {
    objc_msgSend_setValue_forHTTPHeaderField_(v31, v39, (uint64_t)v36, @"User-Agent");
  }
  v64[0] = 0;
  id v46 = objc_msgSend__httpSendRequest_proxySettings_withError_(self, v44, (uint64_t)v31, (uint64_t)v63, v64);
  id v57 = v64[0];
  id v33 = v57;
  if (v46 && !v57)
  {
    objc_msgSend__extractCertsFromResponse_(self, v58, (uint64_t)v46, v59);
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v60)
  {
LABEL_18:
    id v47 = 0;
    goto LABEL_19;
  }
  id v33 = v57;
  id v47 = 0;
  *uint64_t v60 = v33;
LABEL_19:

  return v47;
}

- (id)_httpSendRequest:(id)a3 proxySettings:(id)a4 withError:(id *)a5
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v11 = v7;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  uint64_t v97 = sub_21FBFD358;
  v98 = sub_21FBFD368;
  id v99 = 0;
  uint64_t v88 = 0;
  id v89 = &v88;
  uint64_t v90 = 0x3032000000;
  uint64_t v91 = sub_21FBFD358;
  v92 = sub_21FBFD368;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  int v85 = sub_21FBFD358;
  v86 = sub_21FBFD368;
  id v87 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  int v81 = 0;
  if (v6)
  {
    if (v7)
    {
      id v12 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"socksHost", v10);
      BOOL v13 = v12 == 0;

      if (v13)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v11, v14, @"socksHost", v15);
      }
      uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v11, v14, @"socksPort", v15);
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v11, v8, @"socksPort", v10);
LABEL_13:
        uint64_t v21 = objc_msgSend_allHTTPHeaderFields(v6, v8, v9, v10);
        uint64_t v22 = handleForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = objc_msgSend_description(v6, v23, v24, v25);
          *(_DWORD *)uint8_t buf = 138412290;
          v109 = v26;
          _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "HTTP Request: %@", buf, 0xCu);
        }
        uint64_t v27 = handleForCategory(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          v109 = v21;
          _os_log_impl(&dword_21FBF2000, v27, OS_LOG_TYPE_DEFAULT, "HTTP Request Header: %@", buf, 0xCu);
        }

        id v33 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v28, v29, v30);
        if (v33)
        {
          if (v16 && v20)
          {
            v106[0] = @"SOCKSProxy";
            v106[1] = @"SOCKSPort";
            v107[0] = v16;
            v107[1] = v20;
            v106[2] = @"SOCKSEnable";
            v107[2] = MEMORY[0x263EFFA88];
            int v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v107, (uint64_t)v106, 3);
            objc_msgSend_setConnectionProxyDictionary_(v33, v35, (uint64_t)v34, v36);
          }
          v37 = objc_msgSend_sessionWithConfiguration_(MEMORY[0x263F08BF8], v31, (uint64_t)v33, v32);
          if (v37)
          {
            dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
            v72[0] = MEMORY[0x263EF8330];
            v72[1] = 3221225472;
            v72[2] = sub_21FBFD370;
            void v72[3] = &unk_26452A598;
            long long v74 = &v88;
            long long v75 = &v78;
            long long v76 = &v94;
            long long v77 = &v82;
            uint64_t v39 = v38;
            CFDataRef v73 = v39;
            v70 = objc_msgSend_dataTaskWithRequest_completionHandler_(v37, v40, (uint64_t)v6, (uint64_t)v72);
            objc_msgSend_resume(v70, v41, v42, v43);
            dispatch_time_t v44 = dispatch_time(0, 90000000000);
            if (dispatch_semaphore_wait(v39, v44))
            {
              if (a5)
              {
                id v46 = (void *)MEMORY[0x263F087E8];
                uint64_t v104 = *MEMORY[0x263F08320];
                __int16 v105 = @"Request BAA timeout";
                id v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)&v105, (uint64_t)&v104, 1);
                objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, @"com.apple.corerepair", -76, v47);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v17 = 0;
            }
            else
            {
              uint64_t v49 = handleForCategory(0);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                char v50 = (void *)v89[5];
                *(_DWORD *)uint8_t buf = 138412290;
                v109 = v50;
                _os_log_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_DEFAULT, "HTTP Response Header: %@", buf, 0xCu);
              }

              uint64_t v51 = handleForCategory(0);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                int v52 = *((_DWORD *)v79 + 6);
                *(_DWORD *)uint8_t buf = 67109120;
                LODWORD(v109) = v52;
                _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "HTTP Status: %d", buf, 8u);
              }

              uint64_t v53 = handleForCategory(0);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v54 = (void *)v83[5];
                *(_DWORD *)uint8_t buf = 138412290;
                v109 = v54;
                _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "HTTP Error: %@", buf, 0xCu);
              }

              if (v95[5])
              {
                id v57 = [NSString alloc];
                uint64_t v59 = objc_msgSend_initWithData_encoding_(v57, v58, v95[5], 4);
                uint64_t v60 = handleForCategory(0);
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint8_t buf = 138412290;
                  v109 = v59;
                  _os_log_impl(&dword_21FBF2000, v60, OS_LOG_TYPE_DEFAULT, "HTTP Response: %@", buf, 0xCu);
                }
              }
              if (a5)
              {
                uint64_t v61 = v83[5];
                if (v61 || *((_DWORD *)v79 + 6) != 200)
                {
                  uint64_t v62 = objc_msgSend_stringWithFormat_(NSString, v55, @"Request BAA failed with status: %d error: %@", v56, *((unsigned int *)v79 + 6), v61);
                  id v64 = (void *)v62;
                  v69 = (void *)MEMORY[0x263F087E8];
                  if (*((_DWORD *)v79 + 6) == 429)
                  {
                    uint64_t v102 = *MEMORY[0x263F08320];
                    uint64_t v103 = v62;
                    long long v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v103, (uint64_t)&v102, 1);
                    objc_msgSend_errorWithDomain_code_userInfo_(v69, v66, @"com.apple.corerepair", -94, v65);
                  }
                  else
                  {
                    uint64_t v100 = *MEMORY[0x263F08320];
                    uint64_t v101 = v62;
                    long long v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v101, (uint64_t)&v100, 1);
                    objc_msgSend_errorWithDomain_code_userInfo_(v69, v67, @"com.apple.corerepair", -76, v65);
                  }
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
              id v17 = (id)v95[5];
            }
          }
          else
          {
            uint64_t v39 = handleForCategory(0);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              sub_21FC5D050();
            }
            id v17 = 0;
          }
        }
        else
        {
          v37 = handleForCategory(0);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_21FC5D01C();
          }
          id v17 = 0;
        }

        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v20 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = handleForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_21FC5CFE8();
  }
  id v17 = 0;
LABEL_53:

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  return v17;
}

- (id)_extractCertsFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_21FBFD358;
  int v34 = sub_21FBFD368;
  objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [NSString alloc];
  uint64_t v9 = objc_msgSend_initWithData_encoding_(v7, v8, (uint64_t)v3, 4);
  id v11 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], v10, @"-----BEGIN CERTIFICATE-----(.+?)-----END CERTIFICATE-----\n", 40, 0);
  uint64_t v15 = objc_msgSend_length(v9, v12, v13, v14);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_21FBFD644;
  uint64_t v27 = &unk_26452A5C0;
  id v16 = v9;
  id v28 = v16;
  uint64_t v29 = &v30;
  objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v11, v17, (uint64_t)v16, 0, 0, v15, &v24);
  if (objc_msgSend_count((void *)v31[5], v18, v19, v20, v24, v25, v26, v27))
  {
    id v21 = (id)v31[5];
  }
  else
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC5D084();
    }

    id v21 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v21;
}

- (id)_getVersionInfo:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_allHTTPHeaderFields(a3, a2, (uint64_t)a3, v3);
  uint64_t v5 = handleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    uint64_t v36 = v4;
    _os_log_impl(&dword_21FBF2000, v5, OS_LOG_TYPE_DEFAULT, "Original Headers: %@", buf, 0xCu);
  }

  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v6, @"User-Agent", v7);
  if (v9)
  {
    id v34 = 0;
    uint64_t v10 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], v8, @"^.*\\(MobileActivation-.*?\\)", 0, &v34);
    id v11 = v34;
    uint64_t v15 = v11;
    if (!v10 || v11)
    {
      uint64_t v22 = handleForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D0EC((uint64_t)v15, v22, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      uint64_t v16 = objc_msgSend_length(v9, v12, v13, v14);
      uint64_t v18 = objc_msgSend_firstMatchInString_options_range_(v10, v17, (uint64_t)v9, 0, 0, v16);
      uint64_t v22 = v18;
      if (v18)
      {
        uint64_t v23 = objc_msgSend_range(v18, v19, v20, v21);
        uint64_t v25 = objc_msgSend_substringWithRange_(v9, v24, v23, (uint64_t)v24);
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v32 = handleForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_21FC5D158();
      }
    }
    uint64_t v25 = 0;
    goto LABEL_17;
  }
  uint64_t v15 = handleForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D0B8();
  }
  uint64_t v25 = 0;
LABEL_18:

  return v25;
}

@end