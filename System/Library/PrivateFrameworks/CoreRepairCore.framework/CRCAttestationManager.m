@interface CRCAttestationManager
- (BOOL)challengeComponentsWith:(id)a3 challengeResponse:(id *)a4 error:(id *)a5;
- (BOOL)getStrongComponentsWithError:(id *)a3 resultobtained:(id *)a4;
- (BOOL)sendCertIssueRequestWith:(id)a3 serverCertResponse:(id *)a4 error:(id *)a5;
- (BOOL)sendChallengeRequestWith:(id)a3 serverResponse:(id *)a4 error:(id *)a5;
- (BOOL)transformChallengeResponseWithError:(id *)a3 blockChallengeResponse:(id)a4 resultobtained:(id *)a5;
- (BOOL)transformServerCertResponseUsing:(id)a3 serverCertResponseArray:(id *)a4 error:(id *)a5;
- (BOOL)transformStrongWithError:(id *)a3 blockComponents:(id)a4 resultobtained:(id *)a5;
- (CRCAttestationManager)init;
- (NSProgress)progress;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)issueClientCertificateWithCompletionOnQueue:(id)a3 withOptions:(id)a4 completion:(id)a5;
@end

@implementation CRCAttestationManager

- (BOOL)transformChallengeResponseWithError:(id *)a3 blockChallengeResponse:(id)a4 resultobtained:(id *)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v9 = v7;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v71, (uint64_t)v77, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v72;
    v69 = a5;
    v70 = a3;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v72 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v71 + 1) + 8 * v14);
      v16 = objc_opt_new();
      uint64_t v20 = objc_msgSend_componentType(v15, v17, v18, v19);
      if (!v20) {
        break;
      }
      v24 = (void *)v20;
      v25 = objc_msgSend_identifier(v15, v21, v22, v23);

      if (!v25) {
        break;
      }
      v29 = objc_msgSend_componentType(v15, v26, v27, v28);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v30, (uint64_t)v29, @"Type");

      v34 = objc_msgSend_identifier(v15, v31, v32, v33);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v34, @"Identifier");

      v39 = objc_msgSend_signedResponse(v15, v36, v37, v38);

      if (v39)
      {
        v43 = objc_msgSend_signedResponse(v15, v40, v41, v42);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v44, (uint64_t)v43, @"Response");
      }
      v45 = objc_msgSend_properties(v15, v40, v41, v42);

      if (v45)
      {
        v49 = objc_msgSend_properties(v15, v46, v47, v48);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v50, (uint64_t)v49, @"Properties");
      }
      v51 = objc_msgSend_keyIndex(v15, v46, v47, v48);

      if (v51)
      {
        v55 = objc_msgSend_keyIndex(v15, v52, v53, v54);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v56, (uint64_t)v55, @"KeyIndex");
      }
      objc_msgSend_addObject_(v8, v52, (uint64_t)v16, v54);

      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v57, (uint64_t)&v71, (uint64_t)v77, 16);
        a5 = v69;
        a3 = v70;
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E758();
    }

    v60 = (void *)MEMORY[0x263F087E8];
    uint64_t v75 = *MEMORY[0x263F08320];
    v63 = objc_msgSend_stringWithFormat_(NSString, v61, @"Invalid ChallengeResponse:%@", v62, v15);
    v76 = v63;
    v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v64, (uint64_t)&v76, (uint64_t)&v75, 1);
    v58 = objc_msgSend_errorWithDomain_code_userInfo_(v60, v66, @"com.apple.corerepair", -38, v65);

    BOOL v67 = 0;
    a3 = v70;
    if (!v70) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_16:

  v58 = 0;
  if (a5) {
    *a5 = v8;
  }
  BOOL v67 = 1;
  if (a3) {
LABEL_21:
  }
    *a3 = v58;
LABEL_22:

  return v67;
}

- (BOOL)transformStrongWithError:(id *)a3 blockComponents:(id)a4 resultobtained:(id *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v7;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v59, (uint64_t)v65, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v60;
    v56 = a5;
    v57 = a3;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v60 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
      v15 = objc_opt_new();
      uint64_t v19 = objc_msgSend_componentType(v14, v16, v17, v18);
      if (!v19) {
        break;
      }
      uint64_t v23 = (void *)v19;
      v24 = objc_msgSend_identifier(v14, v20, v21, v22);

      if (!v24) {
        break;
      }
      uint64_t v28 = objc_msgSend_componentType(v14, v25, v26, v27);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v29, (uint64_t)v28, @"Type");

      uint64_t v33 = objc_msgSend_identifier(v14, v30, v31, v32);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v34, (uint64_t)v33, @"Identifier");

      uint64_t v38 = objc_msgSend_fwVersion(v14, v35, v36, v37);

      if (v38)
      {
        uint64_t v42 = objc_msgSend_fwVersion(v14, v39, v40, v41);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v43, (uint64_t)v42, @"FWVersion");
      }
      objc_msgSend_addObject_(v8, v39, (uint64_t)v15, v41);

      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v59, (uint64_t)v65, 16);
        a5 = v56;
        a3 = v57;
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E758();
    }

    uint64_t v47 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F08320];
    v50 = objc_msgSend_stringWithFormat_(NSString, v48, @"Invalid StrongComponent:%@", v49, v14);
    v64 = v50;
    v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v51, (uint64_t)&v64, (uint64_t)&v63, 1);
    v45 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v53, @"com.apple.corerepair", -38, v52);

    BOOL v54 = 0;
    a3 = v57;
    if (!v57) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_12:

  v45 = 0;
  if (a5) {
    *a5 = v8;
  }
  BOOL v54 = 1;
  if (a3) {
LABEL_17:
  }
    *a3 = v45;
LABEL_18:

  return v54;
}

- (void)issueClientCertificateWithCompletionOnQueue:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v323[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v310 = 0;
  v311 = &v310;
  uint64_t v312 = 0x3032000000;
  v313 = sub_21FC0C2A4;
  v314 = sub_21FC0C2B4;
  dispatch_get_global_queue(0, 0);
  id v315 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v304 = 0;
  v305 = &v304;
  uint64_t v306 = 0x3032000000;
  v307 = sub_21FC0C2A4;
  v308 = sub_21FC0C2B4;
  dispatch_group_t v309 = dispatch_group_create();
  uint64_t v298 = 0;
  v299 = &v298;
  uint64_t v300 = 0x3032000000;
  v301 = sub_21FC0C2A4;
  v302 = sub_21FC0C2B4;
  id v303 = 0;
  uint64_t v294 = 0;
  v295 = &v294;
  uint64_t v296 = 0x2020000000;
  uint64_t v297 = 0;
  uint64_t v288 = 0;
  v289 = (id *)&v288;
  uint64_t v290 = 0x3032000000;
  v291 = sub_21FC0C2A4;
  v292 = sub_21FC0C2B4;
  id v293 = 0;
  uint64_t v282 = 0;
  v283 = &v282;
  uint64_t v284 = 0x3032000000;
  v285 = sub_21FC0C2A4;
  v286 = sub_21FC0C2B4;
  id v287 = 0;
  v280[0] = 0;
  v280[1] = v280;
  v280[2] = 0x3032000000;
  v280[3] = sub_21FC0C2A4;
  v280[4] = sub_21FC0C2B4;
  id v216 = v8;
  id v281 = v216;
  uint64_t v276 = 0;
  v277 = &v276;
  uint64_t v278 = 0x2020000000;
  char v279 = 0;
  uint64_t v272 = 0;
  v273 = &v272;
  uint64_t v274 = 0x2020000000;
  char v275 = 0;
  uint64_t v266 = 0;
  v267 = &v266;
  uint64_t v268 = 0x3032000000;
  v269 = sub_21FC0C2A4;
  v270 = sub_21FC0C2B4;
  id v271 = 0;
  v221 = objc_opt_new();
  uint64_t v262 = 0;
  v263 = &v262;
  uint64_t v264 = 0x2020000000;
  char v265 = 0;
  uint64_t v259 = 0;
  v260[0] = &v259;
  v260[1] = 0x3032000000;
  v260[2] = sub_21FC0C2A4;
  v260[3] = sub_21FC0C2B4;
  id v261 = 0;
  v229 = objc_msgSend_date(MEMORY[0x263EFF910], v10, v11, v12);
  int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v13, @"ChMf", v14);
  char v258 = 0;
  v227 = objc_opt_new();
  v16 = v7;
  queue = v16;
  if (!v16) {
    queue = (id)v311[5];
  }
  uint64_t v17 = v305[5];
  uint64_t v18 = v311[5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC0C2BC;
  block[3] = &unk_26452A808;
  block[4] = &v304;
  block[5] = v280;
  block[6] = &v272;
  block[7] = &v282;
  block[8] = &v310;
  block[9] = &v298;
  block[10] = &v294;
  dispatch_group_async(v17, v18, block);
  if ((isFDRDataClassSupported & 1) == 0)
  {
    uint64_t v19 = v305[5];
    uint64_t v20 = v311[5];
    v256[0] = MEMORY[0x263EF8330];
    v256[1] = 3221225472;
    v256[2] = sub_21FC0C754;
    v256[3] = &unk_26452A830;
    v256[4] = self;
    v256[5] = &v304;
    v256[6] = &v262;
    v256[7] = &v259;
    v256[8] = &v266;
    dispatch_group_async(v19, v20, v256);
  }
  dispatch_group_wait((dispatch_group_t)v305[5], 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v23 = v283;
  if (*((unsigned char *)v273 + 24) || v283[5])
  {
    *((unsigned char *)v277 + 24) = *((unsigned char *)v273 + 24);
    objc_storeStrong(v289 + 5, (id)v23[5]);
    id v228 = 0;
    v217 = 0;
    v219 = 0;
    id v222 = 0;
    v223 = 0;
    v225 = 0;
    v226 = 0;
    id v26 = 0;
    v224 = 0;
    id v27 = 0;
    v220 = 0;
    uint64_t v28 = 0;
    id v29 = 0;
    id v30 = 0;
    uint64_t v31 = @"BAAFailed";
    goto LABEL_8;
  }
  objc_msgSend_setCompletedUnitCount_(self->progress, v21, 1, v22);
  objc_msgSend_timeIntervalSinceNow(v229, v34, v35, v36);
  if (!isFDRDataClassSupported)
  {
    uint64_t v87 = v260[0];
    if (*((unsigned char *)v263 + 24) && (v88 = (id *)(v260[0] + 40), !*(void *)(v260[0] + 40)) && (uint64_t v90 = v267[5]) != 0)
    {
      id v253 = 0;
      id v254 = 0;
      int v91 = objc_msgSend_transformStrongWithError_blockComponents_resultobtained_(self, v37, (uint64_t)&v254, v90, &v253);
      objc_storeStrong(v88, v254);
      id v228 = v253;
      *((unsigned char *)v263 + 24) = v91;
      uint64_t v92 = v260[0];
      if (v91 && !*(void *)(v260[0] + 40))
      {
        v226 = 0;
        goto LABEL_15;
      }
      *((unsigned char *)v277 + 24) = 1;
      objc_storeStrong(v289 + 5, *(id *)(v92 + 40));
    }
    else
    {
      *((unsigned char *)v277 + 24) = 1;
      objc_storeStrong(v289 + 5, *(id *)(v87 + 40));
      id v228 = 0;
    }
    v217 = 0;
    v219 = 0;
    id v222 = 0;
    v223 = 0;
    v225 = 0;
    v226 = 0;
    id v26 = 0;
    v224 = 0;
    id v27 = 0;
    v220 = 0;
LABEL_30:
    uint64_t v28 = 0;
    id v29 = 0;
LABEL_43:
    id v30 = 0;
LABEL_44:
    uint64_t v31 = @"BAAIssued";
    goto LABEL_8;
  }
  v226 = objc_opt_new();
  id v255 = 0;
  id v228 = (id)objc_msgSend_copyChallengeRequestWithError_(v226, v38, (uint64_t)&v255, v39);
  id v40 = v255;
  id v41 = v255;
  id v29 = v41;
  if (!v228 || v41 || !objc_msgSend_count(v228, v42, v43, v44))
  {
    v89 = handleForCategory(0);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E7C0();
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, v40);
    v217 = 0;
    v219 = 0;
    id v222 = 0;
    v223 = 0;
    id v26 = 0;
    v224 = 0;
    v225 = 0;
    id v27 = 0;
    v220 = 0;
    goto LABEL_42;
  }
LABEL_15:
  v45 = [CRCCertificate alloc];
  v217 = objc_msgSend_initWithRefKey_certificates_certType_(v45, v46, v295[3], v299[5], 0);
  objc_msgSend_objectAtIndexedSubscript_((void *)v299[5], v47, 0, v48);
  uint64_t v49 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  CFDataRef v50 = SecCertificateCopyData(v49);
  objc_msgSend_setObject_forKeyedSubscript_(v227, v51, (uint64_t)v50, @"BIKCertificate");

  objc_msgSend_setObject_forKeyedSubscript_(v227, v52, (uint64_t)v228, @"Components");
  v56 = objc_msgSend_UUID(MEMORY[0x263F08C38], v53, v54, v55);
  long long v60 = objc_msgSend_UUIDString(v56, v57, v58, v59);
  objc_msgSend_setObject_forKeyedSubscript_(v227, v61, (uint64_t)v60, @"RequestID");

  id v252 = 0;
  v225 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v62, (uint64_t)v227, 100, 0, &v252);
  id v63 = v252;
  id v64 = v252;
  id v29 = v64;
  if (!v225 || v64)
  {
    v93 = handleForCategory(0);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E7F4();
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, v63);
    id v222 = 0;
    v219 = 0;
    id v26 = 0;
    v224 = 0;
    id v27 = 0;
    goto LABEL_41;
  }
  uint64_t v66 = (id *)(v260[0] + 40);
  id obj = *(id *)(v260[0] + 40);
  id v251 = 0;
  int v67 = objc_msgSend_sendChallengeRequestWith_serverResponse_error_(self, v65, (uint64_t)v225, (uint64_t)&v251, &obj);
  id v27 = v251;
  objc_storeStrong(v66, obj);
  *((unsigned char *)v263 + 24) = v67;
  if (!v67 || *(void *)(v260[0] + 40) || !v27)
  {
    v94 = handleForCategory(0);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E9A0((uint64_t)v260, v94, v95, v96, v97, v98, v99, v100);
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, *(id *)(v260[0] + 40));
    id v222 = 0;
    v219 = 0;
    id v26 = 0;
    v224 = 0;
    goto LABEL_48;
  }
  id v249 = 0;
  v224 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v68, (uint64_t)v27, 0, 0, &v249);
  id v69 = v249;
  id v29 = v249;
  if (v29 || !v224)
  {
    v101 = handleForCategory(0);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E938();
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, v69);
    id v222 = 0;
    v219 = 0;
    id v26 = 0;
LABEL_41:
    v220 = 0;
    v223 = 0;
LABEL_42:
    uint64_t v28 = 0;
    goto LABEL_43;
  }
  objc_msgSend_setCompletedUnitCount_(self->progress, v70, 2, v71);
  v76 = objc_msgSend_objectForKeyedSubscript_(v224, v72, @"SessionID", v73);
  if (!v76
    || (objc_msgSend_objectForKeyedSubscript_(v224, v74, @"SessionID", v75),
        v77 = objc_claimAutoreleasedReturnValue(),
        BOOL v81 = objc_msgSend_length(v77, v78, v79, v80) == 0,
        v77,
        v76,
        v81))
  {
    v102 = handleForCategory(0);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E85C();
    }

    *((unsigned char *)v277 + 24) = 1;
    v103 = (void *)MEMORY[0x263F087E8];
    uint64_t v322 = *MEMORY[0x263F08320];
    v323[0] = @"Server response missing Challenge / Session ID";
    v105 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v104, (uint64_t)v323, (uint64_t)&v322, 1);
    uint64_t v107 = objc_msgSend_errorWithDomain_code_userInfo_(v103, v106, @"com.apple.corerepair", -38, v105);
    id v108 = v289[5];
    v289[5] = (id)v107;

    id v222 = 0;
    v219 = 0;
    id v26 = 0;
LABEL_48:
    v220 = 0;
    v223 = 0;
    goto LABEL_30;
  }
  v84 = objc_msgSend_objectForKeyedSubscript_(v224, v82, @"Challenges", v83);

  if (v84)
  {
    v223 = objc_msgSend_objectForKeyedSubscript_(v224, v85, @"Challenges", v86);
  }
  else
  {
    v223 = 0;
  }
  v220 = objc_msgSend_objectForKeyedSubscript_(v224, v85, @"SessionID", v86);
  v219 = objc_msgSend_date(MEMORY[0x263EFF910], v109, v110, v111);
  if (isFDRDataClassSupported)
  {
    id v244 = 0;
    id v222 = (id)objc_msgSend_copyAttestationRequestWithError_challenge_(v226, v112, (uint64_t)&v244, (uint64_t)v223);
    id v113 = v244;
    id v114 = v244;
    id v29 = v114;
    if (v222 && !v114 && objc_msgSend_count(v222, v115, v116, v117))
    {
      id v26 = 0;
      goto LABEL_62;
    }
    v188 = handleForCategory(0);
    if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E890();
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, v113);
    id v26 = 0;
    goto LABEL_42;
  }
  v183 = (id *)(v260[0] + 40);
  id v247 = *(id *)(v260[0] + 40);
  id v248 = 0;
  int v184 = objc_msgSend_challengeComponentsWith_challengeResponse_error_(self, v112, (uint64_t)v223, (uint64_t)&v248, &v247);
  id v26 = v248;
  objc_storeStrong(v183, v247);
  *((unsigned char *)v263 + 24) = v184;
  uint64_t v186 = v260[0];
  if (!v184 || (v187 = (id *)(v260[0] + 40), *(void *)(v260[0] + 40)))
  {
    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, *(id *)(v186 + 40));
    id v222 = 0;
    goto LABEL_30;
  }
  id v245 = 0;
  id v246 = 0;
  int v189 = objc_msgSend_transformChallengeResponseWithError_blockChallengeResponse_resultobtained_(self, v185, (uint64_t)&v246, (uint64_t)v26, &v245);
  objc_storeStrong(v187, v246);
  id v222 = v245;
  *((unsigned char *)v263 + 24) = v189;
  uint64_t v190 = v260[0];
  if (!v189 || *(void *)(v260[0] + 40))
  {
    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, *(id *)(v190 + 40));
    goto LABEL_30;
  }
LABEL_62:
  v121 = v220;
  if (!v220)
  {
    v121 = objc_msgSend_null(MEMORY[0x263EFF9D0], v118, v119, v120);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v221, v118, (uint64_t)v121, @"SessionID");
  if (!v220) {

  }
  v127 = objc_msgSend_objectForKeyedSubscript_(v227, v122, @"RequestID", v123);
  v128 = v127;
  if (!v127)
  {
    v128 = objc_msgSend_null(MEMORY[0x263EFF9D0], v124, v125, v126);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v221, v124, (uint64_t)v128, @"RequestID");
  if (!v127) {

  }
  objc_msgSend_setCompletedUnitCount_(self->progress, v129, 3, v130);
  objc_msgSend_timeIntervalSinceNow(v219, v131, v132, v133);
  objc_msgSend_setObject_forKeyedSubscript_(v221, v134, (uint64_t)v222, @"Components");
  v135 = handleForCategory(0);
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v321 = v221;
    _os_log_impl(&dword_21FBF2000, v135, OS_LOG_TYPE_DEFAULT, "Cert Issue request:%@", buf, 0xCu);
  }

  id v243 = 0;
  uint64_t v28 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v136, (uint64_t)v221, 100, 0, &v243);
  id v137 = v243;
  id v138 = v243;
  id v29 = v138;
  if (!v28 || v138)
  {
    v191 = handleForCategory(0);
    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E7F4();
    }

    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, v137);
    id v30 = 0;
    goto LABEL_44;
  }
  v140 = (id *)(v260[0] + 40);
  id v241 = *(id *)(v260[0] + 40);
  id v242 = v27;
  int v141 = objc_msgSend_sendCertIssueRequestWith_serverCertResponse_error_(self, v139, (uint64_t)v28, (uint64_t)&v242, &v241);
  id v142 = v242;

  objc_storeStrong(v140, v241);
  *((unsigned char *)v263 + 24) = v141;
  uint64_t v143 = v260[0];
  if (!v141 || *(void *)(v260[0] + 40) || !v142)
  {
    *((unsigned char *)v277 + 24) = 1;
    objc_storeStrong(v289 + 5, *(id *)(v143 + 40));
    id v29 = 0;
    id v30 = 0;
    id v27 = v142;
    goto LABEL_44;
  }
  v144 = handleForCategory(0);
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v321 = v142;
    _os_log_impl(&dword_21FBF2000, v144, OS_LOG_TYPE_DEFAULT, "serverCertResponse:%@", buf, 0xCu);
  }

  objc_msgSend_setCompletedUnitCount_(self->progress, v145, 4, v146);
  v147 = (id *)(v260[0] + 40);
  id v239 = *(id *)(v260[0] + 40);
  id v240 = 0;
  int v149 = objc_msgSend_transformServerCertResponseUsing_serverCertResponseArray_error_(self, v148, (uint64_t)v142, (uint64_t)&v240, &v239);
  id v30 = v240;
  objc_storeStrong(v147, v239);
  *((unsigned char *)v263 + 24) = v149;
  uint64_t v153 = v260[0];
  if (v149 && !*(void *)(v260[0] + 40) && v30)
  {
    if (objc_msgSend_count(v30, v150, v151, v152) == 2)
    {
      v154 = [CRCCertificate alloc];
      v215 = objc_msgSend_initWithRefKey_certificates_certType_(v154, v155, v295[3], (uint64_t)v30, 1);

      v156 = (id *)(v260[0] + 40);
      id v238 = *(id *)(v260[0] + 40);
      v159 = objc_msgSend_extractCAAAttestationOIDDataWithError_(v215, v157, (uint64_t)&v238, v158);
      objc_storeStrong(v156, v238);

      if (v159)
      {
        objc_msgSend_referenceKey(v215, v160, v161, v162);
        v166 = objc_msgSend_certificates(v215, v163, v164, v165);
        v214 = objc_msgSend_objectAtIndexedSubscript_(v166, v167, 0, v168);
        v218 = objc_msgSend_certificates(v215, v169, v170, v171);
        v174 = objc_msgSend_objectAtIndexedSubscript_(v218, v172, 1, v173);
        v175 = (id *)(v260[0] + 40);
        id v237 = *(id *)(v260[0] + 40);
        char v176 = DeviceIdentityValidateIdentity();
        objc_storeStrong(v175, v237);
        *((unsigned char *)v263 + 24) = v176;

        uint64_t v178 = v260[0];
        if (*((unsigned char *)v263 + 24) && !*(void *)(v260[0] + 40))
        {
          v206 = handleForCategory(0);
          if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FBF2000, v206, OS_LOG_TYPE_DEFAULT, "CAA cert issue success, overwriting BAA cert", buf, 2u);
          }

          objc_msgSend_timeIntervalSinceNow(v229, v207, v208, v209);
          id v29 = 0;
          *((unsigned char *)v277 + 24) = 1;
          uint64_t v31 = @"CAAIssued";
          v217 = v215;
          goto LABEL_104;
        }
        *((unsigned char *)v277 + 24) = 1;
        v179 = *(void **)(v178 + 40);
        if (!v179)
        {
          v200 = (void *)MEMORY[0x263F087E8];
          uint64_t v316 = *MEMORY[0x263F08320];
          v317 = @"Cert EvaluateTrust failed";
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v177, (uint64_t)&v317, (uint64_t)&v316, 1);
          id v182 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v202 = objc_msgSend_errorWithDomain_code_userInfo_(v200, v201, @"com.apple.corerepair", -41, v182);
          id v203 = v289[5];
          v289[5] = (id)v202;

          goto LABEL_110;
        }
      }
      else
      {
        v192 = handleForCategory(0);
        if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR)) {
          sub_21FC5E8C4((uint64_t)v260, v192, v193, v194, v195, v196, v197, v198);
        }

        *((unsigned char *)v277 + 24) = 1;
        v179 = *(void **)(v260[0] + 40);
        if (!v179)
        {
          v210 = (void *)MEMORY[0x263F087E8];
          uint64_t v318 = *MEMORY[0x263F08320];
          v319 = @"Server response missing CAA OID";
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v199, (uint64_t)&v319, (uint64_t)&v318, 1);
          id v182 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v212 = objc_msgSend_errorWithDomain_code_userInfo_(v210, v211, @"com.apple.corerepair", -41, v182);
          id v213 = v289[5];
          v289[5] = (id)v212;

          goto LABEL_110;
        }
      }
      v180 = v289;
      id v181 = v179;
      id v182 = v180[5];
      v180[5] = v181;
LABEL_110:

      v204 = [CRCCertificate alloc];
      v217 = objc_msgSend_initWithRefKey_certificates_certType_(v204, v205, v295[3], v299[5], 0);

      goto LABEL_103;
    }
    uint64_t v153 = v260[0];
  }
  *((unsigned char *)v277 + 24) = 1;
  objc_storeStrong(v289 + 5, *(id *)(v153 + 40));
LABEL_103:
  id v29 = 0;
  uint64_t v31 = @"BAAIssued";
LABEL_104:
  id v27 = v142;
LABEL_8:
  objc_msgSend_setCompletedUnitCount_(self->progress, v24, 5, v25);
  v232[0] = MEMORY[0x263EF8330];
  v232[1] = 3221225472;
  v232[2] = sub_21FC0C7F4;
  v232[3] = &unk_26452A858;
  id v32 = v9;
  id v234 = v32;
  v235 = &v276;
  id v33 = v217;
  id v233 = v33;
  v236 = &v288;
  dispatch_async(queue, v232);
  if (MEMORY[0x263F34218])
  {
    AnalyticsSendEventLazy();
  }
  _Block_object_dispose(&v259, 8);

  _Block_object_dispose(&v262, 8);
  _Block_object_dispose(&v266, 8);

  _Block_object_dispose(&v272, 8);
  _Block_object_dispose(&v276, 8);

  _Block_object_dispose(v280, 8);
  _Block_object_dispose(&v282, 8);

  _Block_object_dispose(&v288, 8);
  _Block_object_dispose(&v294, 8);

  _Block_object_dispose(&v298, 8);
  _Block_object_dispose(&v304, 8);

  _Block_object_dispose(&v310, 8);
}

- (BOOL)getStrongComponentsWithError:(id *)a3 resultobtained:(id *)a4
{
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x3032000000;
  long long v62 = sub_21FC0C2A4;
  id v63 = sub_21FC0C2B4;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_21FC0C2A4;
  v57 = sub_21FC0C2B4;
  id v58 = 0;
  uint64_t v49 = 0;
  CFDataRef v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_21FC0C2A4;
  uint64_t v47 = sub_21FC0C2B4;
  id v48 = 0;
  id v6 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, @"com.apple.corerepair", 0);
  id v9 = (void *)v60[5];
  v60[5] = v8;

  uint64_t v12 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v10, (uint64_t)&unk_26D165C58, v11);
  objc_msgSend_setRemoteObjectInterface_((void *)v60[5], v13, (uint64_t)v12, v14);

  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v24 = objc_msgSend_setWithObjects_(v15, v22, v16, v23, v17, v18, v19, v20, v21, 0);
  uint64_t v28 = objc_msgSend_remoteObjectInterface((void *)v60[5], v25, v26, v27);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v28, v29, (uint64_t)v24, (uint64_t)sel_getStrongComponentsWithReply_, 1, 1);

  objc_msgSend_resume((void *)v60[5], v30, v31, v32);
  id v33 = (void *)v60[5];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_21FC0CE88;
  v42[3] = &unk_26452A680;
  v42[4] = &v53;
  uint64_t v36 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v33, v34, (uint64_t)v42, v35);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = sub_21FC0CEFC;
  v41[3] = &unk_26452A8A8;
  v41[4] = &v53;
  v41[5] = &v49;
  v41[6] = &v43;
  v41[7] = &v59;
  objc_msgSend_getStrongComponentsWithReply_(v36, v37, (uint64_t)v41, v38);

  if (a3) {
    *a3 = (id) v54[5];
  }
  if (a4) {
    *a4 = (id) v44[5];
  }
  char v39 = *((unsigned char *)v50 + 24);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v39;
}

- (BOOL)challengeComponentsWith:(id)a3 challengeResponse:(id *)a4 error:(id *)a5
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = sub_21FC0C2A4;
  v105 = sub_21FC0C2B4;
  id v106 = 0;
  uint64_t v95 = 0;
  uint64_t v96 = &v95;
  uint64_t v97 = 0x3032000000;
  uint64_t v98 = sub_21FC0C2A4;
  uint64_t v99 = sub_21FC0C2B4;
  id v100 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = sub_21FC0C2A4;
  v89 = sub_21FC0C2B4;
  id v90 = 0;
  v77 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v5;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v81, (uint64_t)v109, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v82;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v82 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v81 + 1) + 8 * v11);
        if (v12
          && (objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v81 + 1) + 8 * v11), v7, @"Type", v8), (v15 = objc_claimAutoreleasedReturnValue()) != 0)&& (objc_msgSend_objectForKeyedSubscript_(v12, v13, @"nonce", v14), v16 = objc_claimAutoreleasedReturnValue(), BOOL v17 = v16 == 0, v16, v15, !v17))
        {
          uint64_t v18 = [CRChallengeObject alloc];
          uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v12, v19, @"Type", v20);
          v24 = objc_msgSend_objectForKeyedSubscript_(v12, v22, @"nonce", v23);
          uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v12, v25, @"KeyIndex", v26);
          id v30 = objc_msgSend_objectForKeyedSubscript_(v12, v28, @"Properties", v29);
          uint64_t v32 = objc_msgSend_initWithComponentType_challenge_keyIndex_properties_(v18, v31, (uint64_t)v21, (uint64_t)v24, v27, v30);

          if (v32) {
            objc_msgSend_addObject_(v77, v33, (uint64_t)v32, v34);
          }
        }
        else
        {
          uint64_t v32 = handleForCategory(0);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v108 = v12;
            _os_log_error_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_ERROR, "Ignoring Invalid Challenge:%@", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v81, (uint64_t)v109, 16);
    }
    while (v9);
  }

  id v35 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v37 = objc_msgSend_initWithMachServiceName_options_(v35, v36, @"com.apple.corerepair", 0);
  uint64_t v38 = (void *)v102[5];
  v102[5] = v37;

  id v41 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v39, (uint64_t)&unk_26D165C58, v40);
  objc_msgSend_setRemoteObjectInterface_((void *)v102[5], v42, (uint64_t)v41, v43);

  uint64_t v44 = (void *)MEMORY[0x263EFFA08];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v54 = objc_msgSend_setWithObjects_(v44, v52, v45, v53, v46, v47, v48, v49, v50, v51, 0);
  id v58 = objc_msgSend_remoteObjectInterface((void *)v102[5], v55, v56, v57);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v58, v59, (uint64_t)v54, (uint64_t)sel_challengeComponentsWith_withReply_, 0, 0);

  id v63 = objc_msgSend_remoteObjectInterface((void *)v102[5], v60, v61, v62);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v63, v64, (uint64_t)v54, (uint64_t)sel_challengeComponentsWith_withReply_, 1, 1);

  objc_msgSend_resume((void *)v102[5], v65, v66, v67);
  v68 = (void *)v102[5];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = sub_21FC0D730;
  v80[3] = &unk_26452A680;
  v80[4] = &v95;
  uint64_t v71 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v68, v69, (uint64_t)v80, v70);
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = sub_21FC0D7A4;
  v79[3] = &unk_26452A8A8;
  v79[4] = &v91;
  v79[5] = &v95;
  v79[6] = &v85;
  v79[7] = &v101;
  objc_msgSend_challengeComponentsWith_withReply_(v71, v72, (uint64_t)v77, (uint64_t)v79);

  if (a5) {
    *a5 = (id) v96[5];
  }
  if (a4) {
    *a4 = (id) v86[5];
  }
  BOOL v73 = *((unsigned char *)v92 + 24) != 0;

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
  return v73;
}

- (BOOL)sendChallengeRequestWith:(id)a3 serverResponse:(id *)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v8, @"ChMf", v9);
  uint64_t v13 = objc_msgSend_URLWithString_(NSURL, v11, @"https://sklaxm.apple.com/axiom/components/challenge", v12);
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x3032000000;
  uint64_t v103 = sub_21FC0C2A4;
  v104 = sub_21FC0C2B4;
  id v105 = 0;
  uint64_t v14 = dispatch_get_global_queue(0, 0);
  uint64_t v94 = 0;
  uint64_t v95 = &v94;
  uint64_t v96 = 0x3032000000;
  uint64_t v97 = sub_21FC0C2A4;
  uint64_t v98 = sub_21FC0C2B4;
  dispatch_group_t v99 = dispatch_group_create();
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  uint64_t v91 = sub_21FC0C2A4;
  uint64_t v92 = sub_21FC0C2B4;
  id v93 = 0;
  uint64_t v82 = 0;
  long long v83 = &v82;
  uint64_t v84 = 0x3032000000;
  uint64_t v85 = sub_21FC0C2A4;
  uint64_t v86 = sub_21FC0C2B4;
  id v87 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 1;
  if (!MGGetBoolAnswer())
  {
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  id v17 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v20 = objc_msgSend_persistentDomainForName_(v17, v18, @"com.apple.corerepair", v19);

  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"ServerEnvironment", v22);
  char isEqualToString = objc_msgSend_isEqualToString_(v23, v24, @"DEV", v25);

  if (isEqualToString)
  {
    objc_msgSend_URLWithString_(NSURL, v27, @"http://localhost:8080/axiom/components/challenge", v28);
  }
  else
  {
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v20, v27, @"ServerEnvironment", v28);
    char v32 = objc_msgSend_isEqualToString_(v29, v30, @"UAT", v31);

    if (v32)
    {
      objc_msgSend_URLWithString_(NSURL, v33, @"https://ma-axiom-uat.corp.apple.com/axiom/components/challenge", v34);
    }
    else
    {
      id v35 = objc_msgSend_objectForKeyedSubscript_(v20, v33, @"ServerEnvironment", v34);
      int v38 = objc_msgSend_isEqualToString_(v35, v36, @"STG", v37);

      if (!v38) {
        goto LABEL_10;
      }
      objc_msgSend_URLWithString_(NSURL, v15, @"https://axiom-stg.corp.apple.com/axiom/components/challenge", v16);
    }
  uint64_t v39 = };

  uint64_t v13 = (void *)v39;
LABEL_10:
  if (isFDRDataClassSupported)
  {
    uint64_t v40 = objc_msgSend_URLWithString_(NSURL, v15, @"https://axiom-stg.corp.apple.com/axiom/components/challenge", v16);

    uint64_t v13 = (void *)v40;
  }
  id v41 = objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x263F089E0], v15, (uint64_t)v13, 0, 120.0);
  objc_msgSend_setHTTPMethod_(v41, v42, @"POST", v43);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v44, @"*/*", @"Accept");
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v45, @"application/xml", @"Content-Type");
  uint64_t v46 = NSString;
  uint64_t v50 = objc_msgSend_length(v7, v47, v48, v49);
  uint64_t v53 = objc_msgSend_stringWithFormat_(v46, v51, @"%d", v52, v50);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v54, (uint64_t)v53, @"Content-Length");

  objc_msgSend_setHTTPBody_(v41, v55, (uint64_t)v7, v56);
  uint64_t v57 = handleForCategory(0);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    int v61 = objc_msgSend_length(v7, v58, v59, v60);
    *(_DWORD *)buf = 67109120;
    int v107 = v61;
    _os_log_impl(&dword_21FBF2000, v57, OS_LOG_TYPE_DEFAULT, "content length is:%d", buf, 8u);
  }

  uint64_t v62 = (void *)MEMORY[0x263F08BF8];
  uint64_t v66 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v63, v64, v65);
  v68 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(v62, v67, (uint64_t)v66, (uint64_t)self, 0);
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = sub_21FC0DF08;
  v77[3] = &unk_26452A8D0;
  v77[4] = &v88;
  v77[5] = &v82;
  v77[6] = &v78;
  v77[7] = &v94;
  uint64_t v70 = objc_msgSend_dataTaskWithRequest_completionHandler_(v68, v69, (uint64_t)v41, (uint64_t)v77);
  uint64_t v71 = (void *)v101[5];
  v101[5] = v70;

  long long v72 = v95[5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC0E280;
  block[3] = &unk_26452A720;
  block[4] = &v94;
  block[5] = &v100;
  dispatch_group_async(v72, v14, block);
  dispatch_group_wait((dispatch_group_t)v95[5], 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v89[5];
  }
  if (a4) {
    *a4 = (id) v83[5];
  }
  BOOL v73 = *((unsigned char *)v79 + 24) != 0;

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(&v100, 8);
  return v73;
}

- (BOOL)transformServerCertResponseUsing:(id)a3 serverCertResponseArray:(id *)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v11 = objc_msgSend_mutableCopy(@"-----BEGIN CERTIFICATE-----", v8, v9, v10);
  v15 = objc_msgSend_mutableCopy(@"-----BEGIN CERTIFICATE-----", v12, v13, v14);
  id v69 = objc_opt_new();
  id v16 = [NSString alloc];
  uint64_t v70 = v7;
  uint64_t v18 = objc_msgSend_initWithData_encoding_(v16, v17, (uint64_t)v7, 4);
  uint64_t v21 = objc_msgSend_componentsSeparatedByString_(v18, v19, @"-----BEGIN CERTIFICATE-----", v20);
  uint64_t v25 = v21;
  if (v21 && objc_msgSend_count(v21, v22, v23, v24) == 3)
  {
    v68 = a4;
    uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, 1, v27);
    objc_msgSend_appendString_(v11, v29, (uint64_t)v28, v30);

    id v33 = objc_msgSend_objectAtIndexedSubscript_(v25, v31, 2, v32);
    objc_msgSend_appendString_(v15, v34, (uint64_t)v33, v35);

    objc_msgSend_dataUsingEncoding_(v11, v36, 4, v37);
    int v38 = (void *)SecCertificateCreateWithPEM();
    objc_msgSend_dataUsingEncoding_(v15, v39, 4, v40);
    id v41 = (void *)SecCertificateCreateWithPEM();
    uint64_t v42 = handleForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v74 = v38;
      _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, "CAA leafRef : %@", buf, 0xCu);
    }

    uint64_t v43 = handleForCategory(0);
    uint64_t v44 = v69;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v74 = v41;
      _os_log_impl(&dword_21FBF2000, v43, OS_LOG_TYPE_DEFAULT, "CAA intermediateRef: %@", buf, 0xCu);
    }

    if (v38 && v41)
    {
      objc_msgSend_addObject_(v69, v45, (uint64_t)v38, v46);

      objc_msgSend_addObject_(v69, v47, (uint64_t)v41, v48);
    }
    uint64_t v49 = 0;
    if (v68) {
      id *v68 = v69;
    }
    BOOL v66 = 1;
    if (!a5) {
      goto LABEL_16;
    }
LABEL_15:
    *a5 = v49;
    goto LABEL_16;
  }
  uint64_t v50 = v18;
  uint64_t v51 = v15;
  uint64_t v52 = v11;
  uint64_t v53 = a5;
  uint64_t v54 = handleForCategory(0);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    sub_21FC5EC1C();
  }

  uint64_t v55 = (void *)MEMORY[0x263F087E8];
  uint64_t v71 = *MEMORY[0x263F08320];
  uint64_t v56 = NSString;
  id v57 = [NSString alloc];
  uint64_t v59 = objc_msgSend_initWithData_encoding_(v57, v58, (uint64_t)v70, 4);
  uint64_t v62 = objc_msgSend_stringWithFormat_(v56, v60, @"CAA attestation failed:%@", v61, v59);
  long long v72 = v62;
  uint64_t v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)&v72, (uint64_t)&v71, 1);
  uint64_t v49 = objc_msgSend_errorWithDomain_code_userInfo_(v55, v65, @"com.apple.corerepair", -38, v64);

  BOOL v66 = 0;
  a5 = v53;
  uint64_t v11 = v52;
  v15 = v51;
  uint64_t v18 = v50;
  uint64_t v44 = v69;
  if (a5) {
    goto LABEL_15;
  }
LABEL_16:

  return v66;
}

- (BOOL)sendCertIssueRequestWith:(id)a3 serverCertResponse:(id *)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v8, @"ChMf", v9);
  uint64_t v13 = objc_msgSend_URLWithString_(NSURL, v11, @"https://sklaxm.apple.com/axiom/components/attest", v12);
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x3032000000;
  uint64_t v103 = sub_21FC0C2A4;
  v104 = sub_21FC0C2B4;
  id v105 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = &v94;
  uint64_t v96 = 0x3032000000;
  uint64_t v97 = sub_21FC0C2A4;
  uint64_t v98 = sub_21FC0C2B4;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  uint64_t v91 = sub_21FC0C2A4;
  uint64_t v92 = sub_21FC0C2B4;
  id v93 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 1;
  uint64_t v14 = dispatch_get_global_queue(0, 0);
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x3032000000;
  char v81 = sub_21FC0C2A4;
  uint64_t v82 = sub_21FC0C2B4;
  dispatch_group_t v83 = dispatch_group_create();
  if (!MGGetBoolAnswer())
  {
    uint64_t v20 = 0;
    goto LABEL_10;
  }
  id v17 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v20 = objc_msgSend_persistentDomainForName_(v17, v18, @"com.apple.corerepair", v19);

  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"ServerEnvironment", v22);
  char isEqualToString = objc_msgSend_isEqualToString_(v23, v24, @"DEV", v25);

  if (isEqualToString)
  {
    objc_msgSend_URLWithString_(NSURL, v27, @"http://localhost:8080/axiom/components/attest", v28);
  }
  else
  {
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v20, v27, @"ServerEnvironment", v28);
    char v32 = objc_msgSend_isEqualToString_(v29, v30, @"UAT", v31);

    if (v32)
    {
      objc_msgSend_URLWithString_(NSURL, v33, @"https://ma-axiom-uat.corp.apple.com/axiom/components/attest", v34);
    }
    else
    {
      uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v20, v33, @"ServerEnvironment", v34);
      int v38 = objc_msgSend_isEqualToString_(v35, v36, @"STG", v37);

      if (!v38) {
        goto LABEL_10;
      }
      objc_msgSend_URLWithString_(NSURL, v15, @"https://axiom-stg.corp.apple.com/axiom/components/attest", v16);
    }
  uint64_t v39 = };

  uint64_t v13 = (void *)v39;
LABEL_10:
  if (isFDRDataClassSupported)
  {
    uint64_t v40 = objc_msgSend_URLWithString_(NSURL, v15, @"https://axiom-stg.corp.apple.com/axiom/components/attest", v16);

    uint64_t v13 = (void *)v40;
  }
  id v41 = objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x263F089E0], v15, (uint64_t)v13, 0, 120.0);
  objc_msgSend_setHTTPMethod_(v41, v42, @"POST", v43);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v44, @"*/*", @"Accept");
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v45, @"application/xml", @"Content-Type");
  uint64_t v46 = NSString;
  uint64_t v50 = objc_msgSend_length(v7, v47, v48, v49);
  uint64_t v53 = objc_msgSend_stringWithFormat_(v46, v51, @"%d", v52, v50);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v54, (uint64_t)v53, @"Content-Length");

  objc_msgSend_setHTTPBody_(v41, v55, (uint64_t)v7, v56);
  id v57 = handleForCategory(0);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    int v61 = objc_msgSend_length(v7, v58, v59, v60);
    *(_DWORD *)buf = 67109120;
    int v107 = v61;
    _os_log_impl(&dword_21FBF2000, v57, OS_LOG_TYPE_DEFAULT, "content length is:%d", buf, 8u);
  }

  uint64_t v62 = (void *)MEMORY[0x263F08BF8];
  BOOL v66 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v63, v64, v65);
  v68 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(v62, v67, (uint64_t)v66, (uint64_t)self, 0);
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = sub_21FC0ECAC;
  v77[3] = &unk_26452A8D0;
  v77[4] = &v94;
  v77[5] = &v88;
  v77[6] = &v84;
  v77[7] = &v78;
  uint64_t v70 = objc_msgSend_dataTaskWithRequest_completionHandler_(v68, v69, (uint64_t)v41, (uint64_t)v77);
  uint64_t v71 = (void *)v101[5];
  v101[5] = v70;

  long long v72 = v79[5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC0F024;
  block[3] = &unk_26452A720;
  block[4] = &v78;
  block[5] = &v100;
  dispatch_group_async(v72, v14, block);
  dispatch_group_wait((dispatch_group_t)v79[5], 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v95[5];
  }
  if (a4) {
    *a4 = (id) v89[5];
  }
  BOOL v73 = *((unsigned char *)v85 + 24) != 0;

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  return v73;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  uint64_t v8 = handleForCategory(0);
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
  uint64_t v26 = objc_msgSend_protectionSpace(v6, v23, v24, v25);
  uint64_t v30 = objc_msgSend_serverTrust(v26, v27, v28, v29);
  id v33 = objc_msgSend_credentialForTrust_(v22, v31, v30, v32);

  v7[2](v7, 0, v33);
}

- (CRCAttestationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRCAttestationManager;
  v4 = [(CRCAttestationManager *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x263F08AB8], v2, 5, v3);
    progress = v4->progress;
    v4->progress = (NSProgress *)v5;
  }
  return v4;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end