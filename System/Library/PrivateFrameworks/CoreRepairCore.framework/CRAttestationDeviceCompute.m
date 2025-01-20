@interface CRAttestationDeviceCompute
+ (id)getDataInstance;
+ (id)getLiveChMf;
- (CRAttestationDeviceCompute)init;
- (id)copyAttestationRequestWithError:(id *)a3 challenge:(id)a4;
- (id)copyChallengeRequestWithError:(id *)a3;
@end

@implementation CRAttestationDeviceCompute

+ (id)getDataInstance
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)AMFDRSealingMapCopyInstanceForClass();
  v3 = handleForCategory(0);
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = @"ChMf";
      __int16 v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing map: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_21FC5E040();
  }

  AMSupportSafeRelease();
  return v2;
}

+ (id)getLiveChMf
{
  if (copyFdrBlob())
  {
    v2 = handleForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E074();
    }
  }
  return 0;
}

- (CRAttestationDeviceCompute)init
{
  v14.receiver = self;
  v14.super_class = (Class)CRAttestationDeviceCompute;
  v5 = [(CRAttestationDeviceCompute *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_getDataInstance(CRAttestationDeviceCompute, v2, v3, v4);
    instance = v5->instance;
    v5->instance = (NSString *)v6;

    uint64_t v11 = objc_msgSend_getLiveChMf(CRAttestationDeviceCompute, v8, v9, v10);
    liveChMf = v5->liveChMf;
    v5->liveChMf = (NSDictionary *)v11;
  }
  return v5;
}

- (id)copyChallengeRequestWithError:(id *)a3
{
  v65[1] = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v54 = objc_opt_new();
  instance = self->instance;
  v8 = handleForCategory(0);
  uint64_t v9 = v8;
  if (!instance)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E0A8();
    }

    v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    v65[0] = @"Unable to fetch live instance";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v65, (uint64_t)&v64, 1);
    v47 = LABEL_24:;
    v43 = objc_msgSend_errorWithDomain_code_userInfo_(v44, v48, @"com.apple.corerepair", -72, v47);

    if (!a3) {
      goto LABEL_26;
    }
LABEL_25:
    *a3 = v43;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->instance;
    *(_DWORD *)buf = 138412290;
    v63 = (NSDictionary *)v10;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "fetched live instance:%@", buf, 0xCu);
  }

  liveChMf = self->liveChMf;
  v12 = handleForCategory(0);
  v13 = v12;
  if (!liveChMf)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E0DC();
    }

    v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    v61 = @"Unable to fetch live instance";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)&v61, (uint64_t)&v60, 1);
    goto LABEL_24;
  }
  v50 = a3;
  v52 = v5;
  v53 = v6;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v14 = self->liveChMf;
    *(_DWORD *)buf = 138412290;
    v63 = v14;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163410, v15, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(&unk_26D163410);
        }
        uint64_t v21 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        v22 = objc_opt_new();
        v25 = objc_msgSend_objectForKeyedSubscript_(self->liveChMf, v23, v21, v24);
        v28 = objc_msgSend_base64EncodedStringWithOptions_(v25, v26, 0, v27);

        objc_msgSend_setObject_forKeyedSubscript_(v22, v29, v21, @"Type");
        if (v28) {
          objc_msgSend_setObject_forKeyedSubscript_(v22, v30, (uint64_t)v28, @"Identifier");
        }
        objc_msgSend_addObject_(v54, v30, (uint64_t)v22, v31, v50);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163410, v32, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v18);
  }
  v5 = v52;
  objc_msgSend_setObject_forKeyedSubscript_(v52, v17, (uint64_t)v54, @"SubComponents", v50);
  objc_msgSend_setObject_forKeyedSubscript_(v52, v33, @"ChMf", @"Type");
  v36 = objc_msgSend_dataUsingEncoding_(self->instance, v34, 4, v35);
  v39 = objc_msgSend_base64EncodedStringWithOptions_(v36, v37, 0, v38);
  objc_msgSend_setObject_forKeyedSubscript_(v52, v40, (uint64_t)v39, @"Identifier");

  uint64_t v6 = v53;
  objc_msgSend_addObject_(v53, v41, (uint64_t)v52, v42);
  v43 = 0;
  a3 = v51;
  if (v51) {
    goto LABEL_25;
  }
LABEL_26:

  return v6;
}

- (id)copyAttestationRequestWithError:(id *)a3 challenge:(id)a4
{
  uint64_t v217 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v204 = 0;
  uint64_t v6 = objc_opt_new();
  v7 = objc_opt_new();
  id v203 = 0;
  v8 = objc_opt_new();
  uint64_t v11 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v9, (uint64_t)&unk_26D163410, v10);
  v176 = objc_opt_new();
  uint64_t v201 = 0;
  uint64_t v202 = 0;
  v12 = objc_opt_new();
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  AMFDRCreateWithOptions();
  AMFDRSealingMapCopyManifestPropertiesForDevice();
  uint64_t v16 = objc_msgSend_copy(0, v13, v14, v15);

  v17 = objc_opt_new();
  v162 = objc_msgSend_convertDataToHexInDictionary_(v17, v18, (uint64_t)v16, v19);

  v168 = self;
  instance = self->instance;
  uint64_t v21 = handleForCategory(0);
  v22 = v21;
  if (!instance)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E0A8();
    }
    long long v57 = 0;
    goto LABEL_31;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v168->instance;
    *(_DWORD *)buf = 138412290;
    v216 = (NSDictionary *)v23;
    _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "fetched live instance:%@", buf, 0xCu);
  }

  liveChMf = v168->liveChMf;
  v25 = handleForCategory(0);
  v26 = v25;
  if (!liveChMf)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E0DC();
    }

    long long v58 = (void *)MEMORY[0x263F087E8];
    uint64_t v213 = *MEMORY[0x263F08320];
    v214 = @"Unable to fetch live instance";
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v214, (uint64_t)&v213, 1);
    long long v57 = objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, @"com.apple.corerepair", -72, v22);
LABEL_31:
    id v175 = 0;
    v61 = a3;
    goto LABEL_79;
  }
  v163 = v16;
  v164 = v11;
  v160 = v7;
  v165 = v6;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = v168->liveChMf;
    *(_DWORD *)buf = 138412290;
    v216 = v27;
    _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v159 = v5;
  obuint64_t j = v5;
  uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v197, (uint64_t)v212, 16);
  if (v172)
  {
    uint64_t v170 = *(void *)v198;
    do
    {
      for (uint64_t i = 0; i != v172; ++i)
      {
        if (*(void *)v198 != v170) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(*((void *)&v197 + 1) + 8 * i);
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        id v174 = v30;
        v33 = objc_msgSend_objectForKeyedSubscript_(v30, v31, @"nonce", v32);
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v193, (uint64_t)v211, 16);
        if (v35)
        {
          uint64_t v38 = v35;
          uint64_t v39 = *(void *)v194;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v194 != v39) {
                objc_enumerationMutation(v33);
              }
              v41 = *(void **)(*((void *)&v193 + 1) + 8 * j);
              uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v41, v36, @"nonce", v37, v159);
              v45 = objc_msgSend_objectForKeyedSubscript_(v41, v43, @"Type", v44);
              objc_msgSend_setObject_forKeyedSubscript_(v8, v46, (uint64_t)v42, (uint64_t)v45);
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v193, (uint64_t)v211, 16);
          }
          while (v38);
        }
      }
      uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v197, (uint64_t)v212, 16);
    }
    while (v172);
  }

  v51 = objc_msgSend_copy(v8, v48, v49, v50);
  int v52 = copyChallengeResponse();

  if (!v52)
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v175 = v203;
    uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v62, (uint64_t)&v189, (uint64_t)v208, 16);
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v190;
      do
      {
        for (uint64_t k = 0; k != v64; ++k)
        {
          if (*(void *)v190 != v65) {
            objc_enumerationMutation(v175);
          }
          uint64_t v67 = *(void *)(*((void *)&v189 + 1) + 8 * k);
          v68 = objc_opt_new();
          v71 = objc_msgSend_objectForKeyedSubscript_(v168->liveChMf, v69, v67, v70);
          v74 = objc_msgSend_base64EncodedStringWithOptions_(v71, v72, 0, v73);

          objc_msgSend_setObject_forKeyedSubscript_(v68, v75, v67, @"Type");
          if (v74) {
            objc_msgSend_setObject_forKeyedSubscript_(v68, v76, (uint64_t)v74, @"Identifier");
          }
          v78 = objc_msgSend_objectForKeyedSubscript_(v175, v76, v67, v77, v159);
          v81 = objc_msgSend_base64EncodedStringWithOptions_(v78, v79, 0, v80);
          objc_msgSend_setObject_forKeyedSubscript_(v68, v82, (uint64_t)v81, @"Response");

          objc_msgSend_addObject_(v165, v83, (uint64_t)v68, v84);
        }
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v85, (uint64_t)&v189, (uint64_t)v208, 16);
      }
      while (v64);
    }

    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    v86 = v168->liveChMf;
    uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v87, (uint64_t)&v185, (uint64_t)v207, 16);
    uint64_t v11 = v164;
    if (v88)
    {
      uint64_t v91 = v88;
      uint64_t v92 = *(void *)v186;
      do
      {
        for (uint64_t m = 0; m != v91; ++m)
        {
          if (*(void *)v186 != v92) {
            objc_enumerationMutation(v86);
          }
          uint64_t v94 = *(void *)(*((void *)&v185 + 1) + 8 * m);
          if ((objc_msgSend_containsObject_(v11, v89, v94, v90, v159) & 1) == 0)
          {
            v95 = objc_opt_new();
            v98 = objc_msgSend_objectForKeyedSubscript_(v168->liveChMf, v96, v94, v97);
            v101 = objc_msgSend_base64EncodedStringWithOptions_(v98, v99, 0, v100);

            objc_msgSend_setObject_forKeyedSubscript_(v95, v102, v94, @"Type");
            if (v101) {
              objc_msgSend_setObject_forKeyedSubscript_(v95, v103, (uint64_t)v101, @"Identifier");
            }
            objc_msgSend_addObject_(v165, v103, (uint64_t)v95, v104);

            uint64_t v11 = v164;
          }
        }
        uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v89, (uint64_t)&v185, (uint64_t)v207, 16);
      }
      while (v91);
    }

    v7 = v160;
    uint64_t v6 = v165;
    objc_msgSend_setObject_forKeyedSubscript_(v160, v105, (uint64_t)v165, @"SubComponents");
    objc_msgSend_setObject_forKeyedSubscript_(v160, v106, @"ChMf", @"Type");
    v109 = objc_msgSend_dataUsingEncoding_(v168->instance, v107, 4, v108);
    v112 = objc_msgSend_base64EncodedStringWithOptions_(v109, v110, 0, v111);
    objc_msgSend_setObject_forKeyedSubscript_(v160, v113, (uint64_t)v112, @"Identifier");

    objc_msgSend_addObject_(v176, v114, (uint64_t)v160, v115);
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    v22 = v162;
    uint64_t v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v116, (uint64_t)&v181, (uint64_t)v206, 16);
    if (!v171)
    {
      long long v57 = 0;
      id v5 = v159;
      v61 = a3;
      uint64_t v16 = v163;
      goto LABEL_79;
    }
    uint64_t v119 = *(void *)v182;
    uint64_t v16 = v163;
    obja = v22;
    uint64_t v169 = *(void *)v182;
LABEL_54:
    uint64_t v120 = 0;
    while (1)
    {
      if (*(void *)v182 != v119) {
        objc_enumerationMutation(v22);
      }
      v121 = *(void **)(*((void *)&v181 + 1) + 8 * v120);
      if (objc_msgSend_isEqualToString_(v121, v117, @"ChMf", v118, v159)) {
        goto LABEL_75;
      }
      uint64_t v173 = v120;
      v122 = objc_msgSend_objectForKeyedSubscript_(v22, v117, (uint64_t)v121, v118);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      v144 = objc_msgSend_objectForKeyedSubscript_(v16, v124, (uint64_t)v121, v125);
      objc_opt_class();
      char v145 = objc_opt_isKindOfClass();

      uint64_t v120 = v173;
      if (v145)
      {
        v126 = objc_opt_new();
        v148 = objc_msgSend_objectForKeyedSubscript_(v16, v146, (uint64_t)v121, v147);
        v151 = objc_msgSend_dataUsingEncoding_(v148, v149, 4, v150);
        v154 = objc_msgSend_base64EncodedStringWithOptions_(v151, v152, 0, v153);

        objc_msgSend_setObject_forKeyedSubscript_(v126, v155, (uint64_t)v121, @"Type");
        if (v154) {
          objc_msgSend_setObject_forKeyedSubscript_(v126, v156, (uint64_t)v154, @"Identifier");
        }
        objc_msgSend_addObject_(v176, v156, (uint64_t)v126, v157);

LABEL_73:
        uint64_t v119 = v169;
LABEL_74:

        uint64_t v120 = v173;
      }
LABEL_75:
      if (++v120 == v171)
      {
        uint64_t v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v117, (uint64_t)&v181, (uint64_t)v206, 16);
        if (!v171)
        {
          long long v57 = 0;
          goto LABEL_78;
        }
        goto LABEL_54;
      }
    }
    v126 = objc_msgSend_objectForKeyedSubscript_(v22, v124, (uint64_t)v121, v125);
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v127, (uint64_t)&v177, (uint64_t)v205, 16);
    if (v128)
    {
      uint64_t v129 = v128;
      uint64_t v130 = *(void *)v178;
      do
      {
        for (uint64_t n = 0; n != v129; ++n)
        {
          if (*(void *)v178 != v130) {
            objc_enumerationMutation(v126);
          }
          v132 = *(void **)(*((void *)&v177 + 1) + 8 * n);
          v133 = objc_opt_new();
          v136 = objc_msgSend_dataUsingEncoding_(v132, v134, 4, v135);
          v139 = objc_msgSend_base64EncodedStringWithOptions_(v136, v137, 0, v138);

          objc_msgSend_setObject_forKeyedSubscript_(v133, v140, (uint64_t)v121, @"Type");
          if (v139) {
            objc_msgSend_setObject_forKeyedSubscript_(v133, v141, (uint64_t)v139, @"Identifier");
          }
          objc_msgSend_addObject_(v176, v141, (uint64_t)v133, v142);
        }
        uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v143, (uint64_t)&v177, (uint64_t)v205, 16);
      }
      while (v129);
      uint64_t v6 = v165;
      v22 = obja;
      uint64_t v16 = v163;
      goto LABEL_73;
    }
    goto LABEL_74;
  }
  v53 = handleForCategory(0);
  uint64_t v6 = v165;
  uint64_t v16 = v163;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_21FC5E110();
  }

  v54 = (void *)MEMORY[0x263F087E8];
  uint64_t v209 = *MEMORY[0x263F08320];
  v210 = @"Unable to challenge response";
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)&v210, (uint64_t)&v209, 1);
  long long v57 = objc_msgSend_errorWithDomain_code_userInfo_(v54, v56, @"com.apple.corerepair", -42, v22);
  id v175 = 0;
LABEL_78:
  id v5 = v159;
  v7 = v160;
  v61 = a3;
  uint64_t v11 = v164;
LABEL_79:

  if (v61) {
    id *v61 = v57;
  }

  return v176;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->liveChMf, 0);
  objc_storeStrong((id *)&self->instance, 0);
}

@end