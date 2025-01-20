@interface CRPersonalizationManager
+ (BOOL)IsTatsuErrorNetworkingRelated:(int64_t)a3;
+ (BOOL)shouldPersonalizeWithSSOByDefault;
+ (__AMAuthInstall)createBaseAMAIObject;
+ (__AMAuthInstall)getDefaultAMAuthInstallRef;
+ (__CFNumber)_copySikaFuse;
+ (id)defaultManager;
+ (id)initWithAuthInstallObj:(__AMAuthInstall *)a3;
+ (int)enableSSO:(__AMAuthInstall *)a3;
- (BOOL)_personalizeWithElement:(id)a3 useCache:(BOOL)a4 parsedResponseData:(id *)a5 error:(id *)a6;
- (BOOL)addCustomPersonalizationElementWithId:(id)a3 personalizationElement:(id)a4 error:(id *)a5;
- (BOOL)getApTicketForLthTransferWithOptions:(id)a3 apTicketData:(id *)a4 error:(id *)a5;
- (BOOL)getApTicketForSeaCookiePairingWithOptions:(id)a3 pairingTicket:(id *)a4 error:(id *)a5;
- (BOOL)getBMUTicketForVeridianFWUpdateWithOptions:(id)a3 BMUTicket:(id *)a4 error:(id *)a5;
- (BOOL)getBrunorTicketForBrunorFWUpdateWithOptions:(id)a3 BrunorTicket:(id *)a4 auth:(BOOL)a5 error:(id *)a6;
- (BOOL)getPDIAPTicketUsingCache:(BOOL)a3 apTicketData:(id *)a4 error:(id *)a5;
- (BOOL)getRemoteTrustObjectDigestWithExistedDigest:(id)a3 digestData:(id *)a4 error:(id *)a5;
- (BOOL)getRepairTicket:(id *)a3 error:(id *)a4;
- (BOOL)getSavageTicketForSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5;
- (BOOL)getSavageTicketForZenithSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5;
- (BOOL)getYonkersTicketForYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5;
- (BOOL)getYonkersTicketForZenithYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5;
- (BOOL)personalizeVeridianWithError:(id *)a3 parsedResponseData:(id *)a4;
- (BOOL)personalizeWithElements:(id)a3 error:(id *)a4;
- (CRPersonalizationManager)init;
- (id)_init:(__AMAuthInstall *)a3;
@end

@implementation CRPersonalizationManager

- (CRPersonalizationManager)init
{
  return 0;
}

- (id)_init:(__AMAuthInstall *)a3
{
  v62[11] = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)CRPersonalizationManager;
  v4 = [(CRPersonalizationManager *)&v60 init];
  v5 = v4;
  if (v4)
  {
    personalizationMap = v4->personalizationMap;
    v4->personalizationMap = 0;

    if (a3)
    {
      v5->amai = a3;
    }
    else
    {
      uint64_t BaseAMAIObject = objc_msgSend_createBaseAMAIObject(CRPersonalizationManager, v7, v8, v9);
      v5->amai = (__AMAuthInstall *)BaseAMAIObject;
      if (!BaseAMAIObject)
      {
        v53 = handleForCategory(0);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_21FC62710();
        }

        goto LABEL_29;
      }
    }
    v11 = [CRPersonalizationElement alloc];
    v13 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v11, v12, @"trustObject", 0, off_267EF7F98, off_267EF7F90);
    v14 = [CRPersonalizationElement alloc];
    v16 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v14, v15, @"personalizedDiskImage", @"/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg", off_267EF7FB0, off_267EF7FB8);
    v17 = [CRPersonalizationElement alloc];
    uint64_t v19 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v17, v18, @"seacookie", 0, off_267EF8000, off_267EF8008);
    v20 = (void *)v19;
    if (v13 && v16 && v19)
    {
      v57 = (void *)v19;
      v58 = v16;
      v59 = v13;
      v21 = [CRPersonalizationElement alloc];
      uint64_t v23 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v21, v22, @"veridianFirmware", 0, off_267EF7FC0, off_267EF7FD8);
      v24 = [CRPersonalizationElement alloc];
      v55 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v24, v25, @"zenithSavageFirmware", 0, off_267EF7FD0, off_267EF7FE0);
      v26 = [CRPersonalizationElement alloc];
      v28 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v26, v27, @"zenithYonkersFirmware", 0, off_267EF7FF0, off_267EF7FF8);
      v29 = [CRPersonalizationElement alloc];
      uint64_t v31 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v29, v30, @"ramdiskSavageFirmware", 0, off_267EF7FC8, off_267EF7FE0);
      v32 = [CRPersonalizationElement alloc];
      v34 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v32, v33, @"ramdiskYonkersFirmware", 0, off_267EF7FE8, off_267EF7FF8);
      v35 = [CRPersonalizationElement alloc];
      uint64_t v37 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v35, v36, @"brunorFirmware", 0, off_267EF8028, off_267EF8020);
      v38 = [CRPersonalizationElement alloc];
      v40 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v38, v39, @"lthTransfer", 0, off_267EF8010, off_267EF8018);
      v41 = [CRPersonalizationElement alloc];
      uint64_t v43 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v41, v42, @"repairTicket", 0, off_267EF7FA8, off_267EF7FA0);
      v45 = (void *)v43;
      v56 = v23;
      if (v23 && v55 && v28 && v31 && v34 && v37 && v40 && v43)
      {
        v61[0] = @"trustObject";
        v61[1] = @"personalizedDiskImage";
        v62[0] = v59;
        v62[1] = v58;
        v61[2] = @"veridianFirmware";
        v61[3] = @"zenithSavageFirmware";
        v62[2] = v23;
        v62[3] = v55;
        v61[4] = @"zenithYonkersFirmware";
        v61[5] = @"ramdiskSavageFirmware";
        v62[4] = v28;
        v62[5] = v31;
        v61[6] = @"ramdiskYonkersFirmware";
        v61[7] = @"brunorFirmware";
        v62[6] = v34;
        v62[7] = v37;
        v61[8] = @"lthTransfer";
        v61[9] = @"repairTicket";
        v62[8] = v40;
        v62[9] = v43;
        v61[10] = @"seacookie";
        v62[10] = v57;
        v46 = (void *)v37;
        uint64_t v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v44, (uint64_t)v62, (uint64_t)v61, 11);
        v48 = (void *)v31;
        int v49 = 0;
        p_super = &v5->personalizationMap->super;
        v5->personalizationMap = (NSDictionary *)v47;
      }
      else
      {
        v46 = (void *)v37;
        v48 = (void *)v31;
        p_super = handleForCategory(0);
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          sub_21FC62744();
        }
        int v49 = 1;
      }

      v16 = v58;
      v13 = v59;
      v51 = v56;
      v20 = v57;
    }
    else
    {
      v51 = handleForCategory(0);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_21FC62744();
      }
      int v49 = 1;
    }

    if (!v49) {
      goto LABEL_25;
    }
LABEL_29:
    v52 = 0;
    goto LABEL_30;
  }
LABEL_25:
  v52 = v5;
LABEL_30:

  return v52;
}

+ (id)defaultManager
{
  id v2 = objc_alloc((Class)a1);
  v5 = objc_msgSend__init_(v2, v3, 0, v4);
  return v5;
}

+ (id)initWithAuthInstallObj:(__AMAuthInstall *)a3
{
  id v4 = objc_alloc((Class)a1);
  v7 = objc_msgSend__init_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

- (BOOL)personalizeWithElements:(id)a3 error:(id *)a4
{
  v119[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  v98 = objc_opt_new();
  uint64_t v107 = 0;
  v97 = v5;
  if (!v5 || !objc_msgSend_count(v5, v7, v8, v9))
  {
    v54 = handleForCategory(0);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_21FC62778();
    }

    if (a4)
    {
      v56 = (void *)MEMORY[0x263F087E8];
      uint64_t v118 = *MEMORY[0x263F08320];
      v119[0] = @"Invalid CRPersonalizationElementIds";
      v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v119, (uint64_t)&v118, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v56, v57, *MEMORY[0x263F8BEF8], 1, v51);
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_53:
    BOOL v62 = 0;
    goto LABEL_54;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v10 = v5;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v103, (uint64_t)v117, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v104 != v15) {
          objc_enumerationMutation(v10);
        }
        personalizationMap = v6->personalizationMap;
        if (personalizationMap)
        {
          uint64_t v18 = *(void *)(*((void *)&v103 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(personalizationMap, v12, v18, v13);
          if (v19)
          {
            v20 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v12, v18, v13);
            v24 = objc_msgSend_personalizationMeasurementCreator(v20, v21, v22, v23);
            BOOL v25 = v24 == 0;

            if (!v25)
            {
              v26 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v12, v18, v13);
              objc_msgSend_personalizationMeasurementCreator(v26, v27, v28, v29);
              v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v31, v18, v32);
              uint64_t v37 = objc_msgSend_param(v33, v34, v35, v36);
              v38 = ((void (**)(void, void *))v30)[2](v30, v37);
              objc_msgSend_addEntriesFromDictionary_(v98, v39, (uint64_t)v38, v40);
            }
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v103, (uint64_t)v117, 16);
    }
    while (v14);
  }

  if (!v98 || !objc_msgSend_count(v98, v41, v42, v43))
  {
    v58 = handleForCategory(0);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_21FC627AC();
    }

    if (a4)
    {
      objc_super v60 = (void *)MEMORY[0x263F087E8];
      uint64_t v115 = *MEMORY[0x263F08320];
      v116 = @"Invalid measurementDict";
      v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v116, (uint64_t)&v115, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v60, v61, *MEMORY[0x263F8BEF8], 1, v51);
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_53;
  }
  v44 = handleForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v114 = v98;
    _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "final measurement dict:%@", buf, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(v98, v45, *MEMORY[0x263F8BF50], v46);
  unsigned int v47 = AMAuthInstallApImg4ServerRequestAddRequiredTags();
  if (!v47)
  {
    unsigned int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    if (!PersonalizedResponse && v107)
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v64 = v10;
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v99, (uint64_t)v108, 16);
      if (v68)
      {
        uint64_t v69 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v68; ++j)
          {
            if (*(void *)v100 != v69) {
              objc_enumerationMutation(v64);
            }
            v71 = v6->personalizationMap;
            if (v71)
            {
              uint64_t v72 = *(void *)(*((void *)&v99 + 1) + 8 * j);
              v73 = objc_msgSend_objectForKeyedSubscript_(v71, v66, v72, v67);
              if (v73)
              {
                v74 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v66, v72, v67);
                v78 = objc_msgSend_personalizationResponseParser(v74, v75, v76, v77);
                BOOL v79 = v78 == 0;

                if (!v79)
                {
                  v80 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v66, v72, v67);
                  objc_msgSend_personalizationResponseParser(v80, v81, v82, v83);
                  v84 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
                  v85 = v84[2](v84, v107);
                  v88 = objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v86, v72, v87);
                  objc_msgSend_setData_(v88, v89, (uint64_t)v85, v90);
                }
              }
            }
          }
          uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v99, (uint64_t)v108, 16);
        }
        while (v68);
      }

      v51 = handleForCategory(0);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "PersonalizeWithElements Successful", buf, 2u);
      }
      BOOL v62 = 1;
      goto LABEL_32;
    }
    v91 = handleForCategory(0);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      sub_21FC627E0();
    }

    if (a4)
    {
      v93 = (void *)MEMORY[0x263F087E8];
      uint64_t v109 = *MEMORY[0x263F08320];
      v110 = @"Failed to create response dict";
      v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)&v110, (uint64_t)&v109, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v93, v94, *MEMORY[0x263F8BEF8], PersonalizedResponse, v51);
      id v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_53;
  }
  v48 = handleForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    sub_21FC62814();
  }

  if (!a4) {
    goto LABEL_53;
  }
  v50 = (void *)MEMORY[0x263F087E8];
  uint64_t v111 = *MEMORY[0x263F08320];
  v112 = @"Failed to create request dict";
  v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v49, (uint64_t)&v112, (uint64_t)&v111, 1);
  objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, *MEMORY[0x263F8BEF8], v47, v51);
  id v53 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
  BOOL v62 = 0;
  *a4 = v53;
LABEL_32:

LABEL_54:
  AMSupportSafeRelease();

  objc_sync_exit(v6);
  return v62;
}

- (BOOL)_personalizeWithElement:(id)a3 useCache:(BOOL)a4 parsedResponseData:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v47[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (!v12 || !a5)
  {
    v45 = handleForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_21FC62848();
    }

    goto LABEL_16;
  }
  if (!v8) {
    goto LABEL_7;
  }
  personalizationMap = self->personalizationMap;
  if (!personalizationMap) {
    goto LABEL_7;
  }
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, (uint64_t)v12, v11);
  if (!v14) {
    goto LABEL_7;
  }
  v16 = (void *)v14;
  v17 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v10, (uint64_t)v12, v15);
  v21 = objc_msgSend_data(v17, v18, v19, v20);

  if (!v21)
  {
LABEL_7:
    v47[0] = v12;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v47, 1);
    int v25 = objc_msgSend_personalizeWithElements_error_(self, v24, (uint64_t)v23, (uint64_t)a6);

    if (v25)
    {
      uint64_t v28 = self->personalizationMap;
      if (!v28) {
        goto LABEL_12;
      }
      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v28, v26, (uint64_t)v12, v27);
      if (!v29) {
        goto LABEL_12;
      }
      uint64_t v32 = (void *)v29;
      v33 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v30, (uint64_t)v12, v31);
      uint64_t v37 = objc_msgSend_data(v33, v34, v35, v36);

      if (!v37) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_16:
    BOOL v44 = 0;
    goto LABEL_17;
  }
LABEL_11:
  v38 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v10, (uint64_t)v12, v22);
  uint64_t v42 = objc_msgSend_data(v38, v39, v40, v41);
  id v43 = *a5;
  *a5 = v42;

LABEL_12:
  BOOL v44 = 1;
LABEL_17:

  return v44;
}

- (BOOL)getRemoteTrustObjectDigestWithExistedDigest:(id)a3 digestData:(id *)a4 error:(id *)a5
{
  personalizationMap = self->personalizationMap;
  id v9 = a3;
  id v12 = objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, @"trustObject", v11);
  objc_msgSend_setParam_(v12, v13, (uint64_t)v9, v14);

  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v15, @"trustObject", 0, a4, a5);
}

- (BOOL)getPDIAPTicketUsingCache:(BOOL)a3 apTicketData:(id *)a4 error:(id *)a5
{
  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, a2, @"personalizedDiskImage", a3, a4, a5);
}

- (BOOL)getBMUTicketForVeridianFWUpdateWithOptions:(id)a3 BMUTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"veridianFirmware", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"veridianFirmware", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend_personalizeVeridianWithError_parsedResponseData_(self, v18, (uint64_t)a5, (uint64_t)a4);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getSavageTicketForSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"ramdiskSavageFirmware", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"ramdiskSavageFirmware", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"ramdiskSavageFirmware", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getYonkersTicketForYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"ramdiskYonkersFirmware", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"ramdiskYonkersFirmware", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"ramdiskYonkersFirmware", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getSavageTicketForZenithSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"zenithSavageFirmware", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"zenithSavageFirmware", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"zenithSavageFirmware", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getYonkersTicketForZenithYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"zenithYonkersFirmware", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"zenithYonkersFirmware", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"zenithYonkersFirmware", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getBrunorTicketForBrunorFWUpdateWithOptions:(id)a3 BrunorTicket:(id *)a4 auth:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v27[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (v12
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, @"brunorFirmware", v11),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v26[0] = @"updaterOptions";
    v26[1] = @"auth";
    uint64_t v16 = MEMORY[0x263EFFA80];
    if (v7) {
      uint64_t v16 = MEMORY[0x263EFFA88];
    }
    v27[0] = v12;
    v27[1] = v16;
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v27, (uint64_t)v26, 2);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v18, @"brunorFirmware", v19);
    objc_msgSend_setParam_(v20, v21, (uint64_t)v17, v22);

    char v24 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v23, @"brunorFirmware", 0, a4, a6);
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (BOOL)getApTicketForSeaCookiePairingWithOptions:(id)a3 pairingTicket:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  personalizationMap = self->personalizationMap;
  if (personalizationMap
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"seacookie", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"seacookie", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"seacookie", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)getApTicketForLthTransferWithOptions:(id)a3 apTicketData:(id *)a4 error:(id *)a5
{
  id v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, @"lthTransfer", v9),
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, @"lthTransfer", v14);
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    char v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, @"lthTransfer", 0, a4, a5);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

+ (__AMAuthInstall)getDefaultAMAuthInstallRef
{
  return (__AMAuthInstall *)objc_msgSend_createBaseAMAIObject(CRPersonalizationManager, a2, v2, v3);
}

+ (__AMAuthInstall)createBaseAMAIObject
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  memset(v43, 0, sizeof(v43));
  AMAuthInstallLogSetHandler();
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "built from %@", buf, 0xCu);
  }

  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v5 = (__AMAuthInstall *)AMAuthInstallCreate();
  if (!v5) {
    goto LABEL_53;
  }
  CFURLRef v6 = CFURLCreateWithString(v4, @"https://gs.apple.com:443", 0);
  BOOL v7 = handleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t LibraryVersionString = (uint64_t)v6;
    _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "using default signing server: %@", buf, 0xCu);
  }

  if (!v6)
  {
    uint64_t v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC6287C();
    }

    goto LABEL_53;
  }
  if (AMAuthInstallSetSigningServerURL())
  {
    uint64_t v37 = handleForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_21FC62990((uint64_t)v6, v37);
    }

    goto LABEL_53;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
LABEL_53:
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  uint64_t v39 = MGCopyAnswer();
  uint64_t v9 = MGCopyAnswer();
  uint64_t v10 = MGCopyAnswer();
  uint64_t v11 = MGCopyAnswer();
  uint64_t v40 = MGCopyAnswer();
  uint64_t v12 = MGCopyAnswer();
  int v13 = img4_nonce_domain_copy_nonce();
  if (v13)
  {
    int v14 = v13;
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC62918(v14, v15);
    }

LABEL_13:
    uint64_t v16 = 0;
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_40;
  }
  id v18 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v20 = objc_msgSend_initWithBytes_length_(v18, v19, (uint64_t)v43 + 2, HIDWORD(v44));
  if (!v20)
  {
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC628B0();
    }

    goto LABEL_13;
  }
  uint64_t v16 = (void *)v20;
  v21 = (const void *)*MEMORY[0x263EFFD08];
  if (v10) {
    uint64_t v22 = (const void *)v10;
  }
  else {
    uint64_t v22 = (const void *)*MEMORY[0x263EFFD08];
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BE80], v22);
  if (v39) {
    uint64_t v23 = (const void *)v39;
  }
  else {
    uint64_t v23 = v21;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BE78], v23);
  if (v9) {
    char v24 = (const void *)v9;
  }
  else {
    char v24 = v21;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BE70], v24);
  if (v12) {
    int v25 = (const void *)v12;
  }
  else {
    int v25 = &unk_26D163308;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEB0], v25);
  if (v40) {
    v26 = (const void *)v40;
  }
  else {
    v26 = v21;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEB8], v26);
  if (v11) {
    uint64_t v27 = (const void *)v11;
  }
  else {
    uint64_t v27 = v21;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEA0], v27);
  uint64_t v28 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEC8], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BE68], v16);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEA8], v28);
  uint64_t v32 = (const void *)objc_msgSend__copySikaFuse(a1, v29, v30, v31);
  if (v32)
  {
    v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t LibraryVersionString = (uint64_t)v32;
      _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "setting SiKA Fuse: %@", buf, 0xCu);
    }

    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F8BEC0], v32);
  }
  if (AMAuthInstallApSetParameters())
  {
    v38 = handleForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_21FC628E4();
    }

    goto LABEL_14;
  }
  BOOL v17 = AMAuthInstallApImg4ForceServerSigning() == 0;
LABEL_40:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (!v17)
  {
    AMSupportSafeRelease();
    id v5 = 0;
  }

  return v5;
}

- (BOOL)addCustomPersonalizationElementWithId:(id)a3 personalizationElement:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v13 = objc_msgSend_mutableCopy(self->personalizationMap, v10, v11, v12);
  int v14 = objc_opt_new();
  int HasEntitlement = objc_msgSend_currentProcessHasEntitlement_(v14, v15, @"com.apple.corerepair.AllowPersonalizationOverride", v16);

  if (HasEntitlement)
  {
    if (v8)
    {
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_setObject_forKeyedSubscript_(v13, v18, (uint64_t)v9, (uint64_t)v8);
            uint64_t v22 = (NSDictionary *)objc_msgSend_copy(v13, v19, v20, v21);
            personalizationMap = self->personalizationMap;
            self->personalizationMap = v22;

            LOBYTE(a5) = 1;
            goto LABEL_16;
          }
        }
      }
    }
    uint64_t v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC62A08();
    }

    if (a5)
    {
      uint64_t v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F8BEF8];
      uint64_t v38 = *MEMORY[0x263F08320];
      v39[0] = @"Parameters Invalid";
      uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v39, (uint64_t)&v38, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, v33, 1, v28);
      goto LABEL_15;
    }
  }
  else
  {
    char v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC62A3C();
    }

    if (a5)
    {
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F8BEF8];
      uint64_t v36 = *MEMORY[0x263F08320];
      uint64_t v37 = @"Process is not entitled to perform addCustomPersonalizationElementWithId";
      uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v37, (uint64_t)&v36, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v26, v29, v27, 14, v28);
LABEL_15:
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }
LABEL_16:

  return (char)a5;
}

+ (BOOL)IsTatsuErrorNetworkingRelated:(int64_t)a3
{
  BOOL result = 1;
  if ((unint64_t)a3 > 0x10 || ((1 << a3) & 0x11800) == 0) {
    return a3 == 3099;
  }
  return result;
}

- (BOOL)personalizeVeridianWithError:(id *)a3 parsedResponseData:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = self;
  objc_sync_enter(v5);
  id v8 = objc_opt_new();
  personalizationMap = v5->personalizationMap;
  if (personalizationMap)
  {
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(personalizationMap, v6, @"veridianFirmware", v7);
    if (v12)
    {
      int v13 = objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v10, @"veridianFirmware", v11);
      BOOL v17 = objc_msgSend_personalizationMeasurementCreator(v13, v14, v15, v16);

      if (v17)
      {
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v18, @"veridianFirmware", v19);
        objc_msgSend_personalizationMeasurementCreator(v20, v21, v22, v23);
        char v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v25, @"veridianFirmware", v26);
        uint64_t v31 = objc_msgSend_param(v27, v28, v29, v30);
        uint64_t v32 = ((void (**)(void, void *))v24)[2](v24, v31);
        objc_msgSend_addEntriesFromDictionary_(v8, v33, (uint64_t)v32, v34);
      }
    }
  }
  uint64_t v35 = handleForCategory(0);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v8;
    _os_log_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_DEFAULT, "final measurement dict:%@", buf, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(v8, v36, *MEMORY[0x263F8BF50], v37);
  unsigned int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
  uint64_t v39 = handleForCategory(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    sub_21FC627E0();
  }

  if (a3)
  {
    uint64_t v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F08320];
    uint64_t v46 = @"Failed to create response dict";
    uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)&v46, (uint64_t)&v45, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v43, *MEMORY[0x263F8BEF8], PersonalizedResponse, v42);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  AMSupportSafeRelease();

  objc_sync_exit(v5);
  return 0;
}

- (BOOL)getRepairTicket:(id *)a3 error:(id *)a4
{
  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, a2, @"repairTicket", 0, a3, a4);
}

+ (BOOL)shouldPersonalizeWithSSOByDefault
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  uint64_t v2 = [CRUserDefaults alloc];
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.corerepaird.test", v4);
  if (!v5) {
    return 0;
  }
  id v8 = v5;
  char v9 = objc_msgSend_BOOLForKey_(v5, v6, @"personalizeWithSSO", v7);

  return v9;
}

+ (int)enableSSO:(__AMAuthInstall *)a3
{
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Enabling SSO", v18, 2u);
  }

  if ((os_variant_has_internal_content() & 1) == 0)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC62B0C();
    }
    int v15 = 0;
    goto LABEL_19;
  }
  int v4 = AMAuthInstallSsoInitialize();
  if (v4)
  {
    int v15 = v4;
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC62AD8();
    }
    goto LABEL_19;
  }
  int v5 = AMAuthInstallSsoEnable();
  if (v5)
  {
    int v15 = v5;
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC62AA4();
    }
    goto LABEL_19;
  }
  char v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8);
  int v12 = objc_msgSend_fileExistsAtPath_(v9, v10, @"/var/MobileSoftwareUpdate/Controller/RepairServices/sso_token", v11);

  if (!v12) {
    return 0;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v13, @"/var/MobileSoftwareUpdate/Controller/RepairServices/sso_token", v14);
  int v15 = AMAuthInstallSsoSetToken();
  if (v15)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC62A70();
    }
LABEL_19:
  }
  return v15;
}

+ (__CFNumber)_copySikaFuse
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/chosen");
  if (v2)
  {
    io_object_t v3 = v2;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, @"esdm-fuses", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!CFProperty)
    {
      uint64_t v14 = handleForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "unable to lookup esdm-fuses property", buf, 2u);
      }

      char v9 = 0;
      goto LABEL_18;
    }
    CFDataRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v6);
      char v9 = CFNumberCreate(v4, kCFNumberIntType, BytePtr);
      if (v9)
      {
LABEL_17:
        CFRelease(v6);
LABEL_18:
        IOObjectRelease(v3);
        return v9;
      }
      uint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        uint64_t v11 = "could not create CFNumber for esdm-fuses";
        int v12 = (uint8_t *)&v19;
LABEL_15:
        _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }
    else
    {
      uint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        uint64_t v11 = "esdm-fuses property is not a CFData";
        int v12 = v18;
        goto LABEL_15;
      }
    }

    char v9 = 0;
    goto LABEL_17;
  }
  int v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "unable to find 'chosen' registry entry", v16, 2u);
  }

  return 0;
}

- (void).cxx_destruct
{
}

@end