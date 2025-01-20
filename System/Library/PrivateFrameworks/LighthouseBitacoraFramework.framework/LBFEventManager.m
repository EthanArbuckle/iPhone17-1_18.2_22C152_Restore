@interface LBFEventManager
+ (id)sharedInstance;
- (BOOL)addDprivacydEvent:(id)a3 identifiers:(id)a4 error:(id *)a5;
- (BOOL)addLighthousePluginEvent:(id)a3;
- (BOOL)addLighthousePluginEvent:(id)a3 identifiers:(id)a4 error:(id *)a5;
- (BOOL)addMLRuntimedEvent:(id)a3 identifiers:(id)a4 error:(id *)a5;
- (BOOL)addTrialdEvent:(id)a3 identifiers:(id)a4 error:(id *)a5;
- (BOOL)isEqualIdentifiers:(id)a3 identifiers:(id)a4;
- (LBFBiomeManager)biomeManagerDprivacyd;
- (LBFBiomeManager)biomeManagerLighthouse;
- (LBFBiomeManager)biomeManagerMLRuntimed;
- (LBFBiomeManager)biomeManagerTrial;
- (LBFEventManager)init;
- (id)convertToLBFTrialIdentifiers:(id)a3;
- (id)ensureBiomeManagerDprivacyd;
- (id)ensureBiomeManagerLighthouse;
- (id)ensureBiomeManagerMLRuntimed;
- (id)ensureBiomeManagerTrial;
- (id)getLastDprivacyEvent:(id)a3;
- (id)getLastLighthousePluginEvent:(id)a3;
- (id)getLastMLRuntimeEvent:(id)a3;
- (id)getLastTrialEvent:(id)a3;
- (void)enumerateLastDprivacyEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6;
- (void)enumerateLastLighthousePluginEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6;
- (void)enumerateLastMLRuntimeEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6;
- (void)enumerateLastTrialEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6;
- (void)setBiomeManagerDprivacyd:(id)a3;
- (void)setBiomeManagerLighthouse:(id)a3;
- (void)setBiomeManagerMLRuntimed:(id)a3;
- (void)setBiomeManagerTrial:(id)a3;
@end

@implementation LBFEventManager

+ (id)sharedInstance
{
  if (qword_26B269D80 != -1) {
    dispatch_once(&qword_26B269D80, &unk_2703DD2B8);
  }
  v2 = (void *)qword_26B269D88;
  return v2;
}

- (LBFEventManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)LBFEventManager;
  v2 = [(LBFEventManager *)&v8 init];
  if (v2)
  {
    LBFLoggingUtilsInit();
    biomeManagerLighthouse = v2->_biomeManagerLighthouse;
    v2->_biomeManagerLighthouse = 0;

    biomeManagerMLRuntimed = v2->_biomeManagerMLRuntimed;
    v2->_biomeManagerMLRuntimed = 0;

    biomeManagerTrial = v2->_biomeManagerTrial;
    v2->_biomeManagerTrial = 0;

    biomeManagerDprivacyd = v2->_biomeManagerDprivacyd;
    v2->_biomeManagerDprivacyd = 0;
  }
  return v2;
}

- (id)ensureBiomeManagerLighthouse
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_254563D08;
  block[3] = &unk_2653ADD08;
  block[4] = self;
  if (onceTokenBiomeManagerLighthouse != -1) {
    dispatch_once(&onceTokenBiomeManagerLighthouse, block);
  }
  return self->_biomeManagerLighthouse;
}

- (id)ensureBiomeManagerTrial
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_254563E78;
  block[3] = &unk_2653ADD08;
  block[4] = self;
  if (onceTokenBiomeManagerTrial != -1) {
    dispatch_once(&onceTokenBiomeManagerTrial, block);
  }
  return self->_biomeManagerTrial;
}

- (id)ensureBiomeManagerMLRuntimed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_254563FE8;
  block[3] = &unk_2653ADD08;
  block[4] = self;
  if (onceTokenBiomeManagerMLRuntimed != -1) {
    dispatch_once(&onceTokenBiomeManagerMLRuntimed, block);
  }
  return self->_biomeManagerMLRuntimed;
}

- (id)ensureBiomeManagerDprivacyd
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_254564158;
  block[3] = &unk_2653ADD08;
  block[4] = self;
  if (onceTokenBiomeManagerDprivacyd != -1) {
    dispatch_once(&onceTokenBiomeManagerDprivacyd, block);
  }
  return self->_biomeManagerDprivacyd;
}

- (BOOL)addTrialdEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v13 = a4;
  if (!v13)
  {
    if (objc_msgSend_eventType(v8, v9, v10, v11, v12) == 1)
    {
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
        sub_25458643C();
      }
      id v32 = objc_alloc(NSDictionary);
      uint64_t v36 = objc_msgSend_initWithObjectsAndKeys_(v32, v33, @"Allocation event cannot have identifiers.", v34, v35, @"NSLocalizedDescriptionKey", 0);
    }
    else if (objc_msgSend_eventType(v8, v28, v29, v30, v31) == 2)
    {
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
        sub_254586470();
      }
      id v48 = objc_alloc(NSDictionary);
      uint64_t v36 = objc_msgSend_initWithObjectsAndKeys_(v48, v49, @"Activation event must have identifiers.", v50, v51, @"NSLocalizedDescriptionKey", 0);
    }
    else
    {
      if (objc_msgSend_eventType(v8, v44, v45, v46, v47) != 3) {
        goto LABEL_2;
      }
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
        sub_2545864A4();
      }
      id v52 = objc_alloc(NSDictionary);
      uint64_t v36 = objc_msgSend_initWithObjectsAndKeys_(v52, v53, @"Deactivation event must have identifiers.", v54, v55, @"NSLocalizedDescriptionKey", 0);
    }
    v16 = (void *)v36;
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v37, @"com.apple.LighthouseBitacoraFramework", 1, v36);
      BOOL v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_28:
    BOOL v27 = 0;
    goto LABEL_29;
  }
LABEL_2:
  v14 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_254547000, v14, OS_LOG_TYPE_INFO, "Converting dict to event.", buf, 2u);
  }
  v16 = objc_msgSend_createTrialdEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v15, (uint64_t)v8, (uint64_t)v13, 0);
  v17 = LBFLogContextEventManager;
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254585010();
    }
    id v38 = objc_alloc(NSDictionary);
    v43 = objc_msgSend_initWithObjectsAndKeys_(v38, v39, @"Biome event could not be generated.", v40, v41, @"NSLocalizedDescriptionKey", 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v42, @"com.apple.LighthouseBitacoraFramework", 1, (uint64_t)v43);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_254547000, v17, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", v58, 2u);
  }
  v22 = objc_msgSend_ensureBiomeManagerTrial(self, v18, v19, v20, v21);
  objc_msgSend_writeData_(v22, v23, (uint64_t)v16, v24, v25);

  v26 = LBFLogContextEventManager;
  BOOL v27 = 1;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v57 = 0;
    _os_log_impl(&dword_254547000, v26, OS_LOG_TYPE_INFO, "Finished writing proto.", v57, 2u);
  }
LABEL_29:

  return v27;
}

- (BOOL)addLighthousePluginEvent:(id)a3
{
  v3 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_254547000, v3, OS_LOG_TYPE_INFO, "Call to deprecated addLighthousePluginEvent method.", v5, 2u);
  }
  return 1;
}

- (BOOL)addLighthousePluginEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_254547000, v10, OS_LOG_TYPE_INFO, "Converting dict to proto.", buf, 2u);
  }
  uint64_t v12 = objc_msgSend_createLighthousePluginEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v11, (uint64_t)v8, (uint64_t)v9, 0);
  id v13 = LBFLogContextEventManager;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_254547000, v13, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", v28, 2u);
    }
    v18 = objc_msgSend_ensureBiomeManagerLighthouse(self, v14, v15, v16, v17);
    objc_msgSend_writeData_(v18, v19, (uint64_t)v12, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254585010();
    }
    id v22 = objc_alloc(NSDictionary);
    v18 = objc_msgSend_initWithObjectsAndKeys_(v22, v23, @"Biome event could not be generated.", v24, v25, @"NSLocalizedDescriptionKey", 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, @"com.apple.LighthouseBitacoraFramework", 1, (uint64_t)v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12 != 0;
}

- (BOOL)addMLRuntimedEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_createMLRuntimedEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, a2, (uint64_t)a3, (uint64_t)a4, 0);
  id v8 = LBFLogContextEventManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_254547000, v8, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", buf, 2u);
    }
    id v13 = objc_msgSend_ensureBiomeManagerMLRuntimed(self, v9, v10, v11, v12);
    objc_msgSend_writeData_(v13, v14, (uint64_t)v7, v15, v16);

    uint64_t v17 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_254547000, v17, OS_LOG_TYPE_INFO, "Finished writing proto.", v25, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254585010();
    }
    id v18 = objc_alloc(NSDictionary);
    v23 = objc_msgSend_initWithObjectsAndKeys_(v18, v19, @"Biome event could not be generated.", v20, v21, @"NSLocalizedDescriptionKey", 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v22, @"com.apple.LighthouseBitacoraFramework", 1, (uint64_t)v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7 != 0;
}

- (BOOL)addDprivacydEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_createDprivacydEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, a2, (uint64_t)a3, (uint64_t)a4, 0);
  id v8 = LBFLogContextEventManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_254547000, v8, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", buf, 2u);
    }
    id v13 = objc_msgSend_ensureBiomeManagerDprivacyd(self, v9, v10, v11, v12);
    objc_msgSend_writeData_(v13, v14, (uint64_t)v7, v15, v16);

    uint64_t v17 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_254547000, v17, OS_LOG_TYPE_INFO, "Finished writing proto.", v25, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR)) {
      sub_254585010();
    }
    id v18 = objc_alloc(NSDictionary);
    v23 = objc_msgSend_initWithObjectsAndKeys_(v18, v19, @"Biome event could not be generated.", v20, v21, @"NSLocalizedDescriptionKey", 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v22, @"com.apple.LighthouseBitacoraFramework", 1, (uint64_t)v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7 != 0;
}

- (BOOL)isEqualIdentifiers:(id)a3 identifiers:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v11 = (void *)v6;
  if (!(v5 | v6))
  {
    LOBYTE(v12) = 1;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
  if (v6) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v5 != 0;
  }
  if (v6) {
    BOOL v14 = v5 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v14 && !v13)
  {
    uint64_t v15 = objc_msgSend_bmltIdentifiers((void *)v5, v7, v8, v9, v10);
    if (v15
      && (uint64_t v20 = (void *)v15, v21 = objc_msgSend_identifierType(v11, v16, v17, v18, v19), v20, v21 == 2))
    {
      id v22 = objc_msgSend_bmltIdentifiers((void *)v5, v16, v17, v18, v19);
      BOOL v27 = objc_msgSend_trialDeploymentID(v22, v23, v24, v25, v26);
      id v32 = objc_msgSend_deploymentID(v11, v28, v29, v30, v31);
      int isEqualToString = objc_msgSend_isEqualToString_(v27, v33, (uint64_t)v32, v34, v35);

      if (isEqualToString)
      {
        uint64_t v41 = objc_msgSend_bmltIdentifiers((void *)v5, v37, v38, v39, v40);
        uint64_t v46 = objc_msgSend_trialTaskID(v41, v42, v43, v44, v45);
        uint64_t v51 = objc_msgSend_trialTaskID(v11, v47, v48, v49, v50);
LABEL_20:
        v110 = (void *)v51;
        LOBYTE(v12) = objc_msgSend_isEqualToString_(v46, v52, v51, v53, v54);

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v12 = objc_msgSend_experimentIdentifiers((void *)v5, v16, v17, v18, v19);
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v59 = objc_msgSend_identifierType(v11, v55, v56, v57, v58);

      if (v59 == 1)
      {
        v64 = objc_msgSend_experimentIdentifiers((void *)v5, v60, v61, v62, v63);
        v69 = objc_msgSend_trialDeploymentID(v64, v65, v66, v67, v68);
        v74 = objc_msgSend_deploymentID(v11, v70, v71, v72, v73);
        int v78 = objc_msgSend_isEqualToString_(v69, v75, (uint64_t)v74, v76, v77);

        if (v78)
        {
          v83 = objc_msgSend_experimentIdentifiers((void *)v5, v79, v80, v81, v82);
          v88 = objc_msgSend_trialExperimentID(v83, v84, v85, v86, v87);
          v93 = objc_msgSend_experimentID(v11, v89, v90, v91, v92);
          int v97 = objc_msgSend_isEqualToString_(v88, v94, (uint64_t)v93, v95, v96);

          if (v97)
          {
            uint64_t v41 = objc_msgSend_experimentIdentifiers((void *)v5, v98, v99, v100, v101);
            uint64_t v46 = objc_msgSend_trialTreatmentID(v41, v102, v103, v104, v105);
            uint64_t v51 = objc_msgSend_treatmentID(v11, v106, v107, v108, v109);
            goto LABEL_20;
          }
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_22:

  return (char)v12;
}

- (id)convertToLBFTrialIdentifiers:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_bmltIdentifiers(v3, v4, v5, v6, v7);

  if (v8)
  {
    BOOL v13 = [LBFTrialIdentifiers alloc];
    uint64_t v18 = objc_msgSend_bmltIdentifiers(v3, v14, v15, v16, v17);
    v23 = objc_msgSend_trialTaskID(v18, v19, v20, v21, v22);
    v28 = objc_msgSend_bmltIdentifiers(v3, v24, v25, v26, v27);
    v33 = objc_msgSend_trialDeploymentID(v28, v29, v30, v31, v32);
    uint64_t v38 = objc_msgSend_intValue(v33, v34, v35, v36, v37);
    uint64_t v41 = objc_msgSend_initWithBMLTTaskID_deploymentID_(v13, v39, (uint64_t)v23, v38, v40);
LABEL_5:

    goto LABEL_6;
  }
  v42 = objc_msgSend_experimentIdentifiers(v3, v9, v10, v11, v12);

  if (v42)
  {
    uint64_t v43 = [LBFTrialIdentifiers alloc];
    uint64_t v18 = objc_msgSend_experimentIdentifiers(v3, v44, v45, v46, v47);
    v23 = objc_msgSend_trialExperimentID(v18, v48, v49, v50, v51);
    v28 = objc_msgSend_experimentIdentifiers(v3, v52, v53, v54, v55);
    v33 = objc_msgSend_trialDeploymentID(v28, v56, v57, v58, v59);
    uint64_t v64 = objc_msgSend_intValue(v33, v60, v61, v62, v63);
    v69 = objc_msgSend_experimentIdentifiers(v3, v65, v66, v67, v68);
    v74 = objc_msgSend_trialTreatmentID(v69, v70, v71, v72, v73);
    uint64_t v41 = objc_msgSend_initWithExperimentID_deploymentID_treatmentID_(v43, v75, (uint64_t)v23, v64, (uint64_t)v74);

    goto LABEL_5;
  }
  uint64_t v41 = 0;
LABEL_6:

  return v41;
}

- (void)enumerateLastTrialEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = a6;
  if (v10)
  {
    uint64_t v18 = objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_254564F58;
    v20[3] = &unk_2653ADE00;
    id v21 = v10;
    uint64_t v22 = self;
    id v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2545864D8();
  }
}

- (id)getLastTrialEvent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_254565224;
  BOOL v13 = sub_254565234;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_25456523C;
  v8[3] = &unk_2653ADE28;
  v8[4] = &v9;
  objc_msgSend_enumerateLastTrialEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastLighthousePluginEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = a6;
  if (v10)
  {
    uint64_t v18 = objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_25456539C;
    v20[3] = &unk_2653ADE00;
    id v21 = v10;
    uint64_t v22 = self;
    id v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2545864D8();
  }
}

- (id)getLastLighthousePluginEvent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_254565224;
  BOOL v13 = sub_254565234;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_254565884;
  v8[3] = &unk_2653ADE50;
  v8[4] = &v9;
  objc_msgSend_enumerateLastLighthousePluginEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastMLRuntimeEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = a6;
  if (v10)
  {
    uint64_t v18 = objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_2545659E4;
    v20[3] = &unk_2653ADE00;
    id v21 = v10;
    uint64_t v22 = self;
    id v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2545864D8();
  }
}

- (id)getLastMLRuntimeEvent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_254565224;
  BOOL v13 = sub_254565234;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_254565F28;
  v8[3] = &unk_2653ADE78;
  v8[4] = &v9;
  objc_msgSend_enumerateLastMLRuntimeEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastDprivacyEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = a6;
  if (v10)
  {
    uint64_t v18 = objc_msgSend_ensureBiomeManagerDprivacyd(self, v13, v14, v15, v16);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_254566088;
    v20[3] = &unk_2653ADE00;
    id v21 = v10;
    uint64_t v22 = self;
    id v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);
  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2545864D8();
  }
}

- (id)getLastDprivacyEvent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_254565224;
  BOOL v13 = sub_254565234;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2545663CC;
  v8[3] = &unk_2653ADEA0;
  v8[4] = &v9;
  objc_msgSend_enumerateLastDprivacyEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (LBFBiomeManager)biomeManagerLighthouse
{
  return self->_biomeManagerLighthouse;
}

- (void)setBiomeManagerLighthouse:(id)a3
{
}

- (LBFBiomeManager)biomeManagerTrial
{
  return self->_biomeManagerTrial;
}

- (void)setBiomeManagerTrial:(id)a3
{
}

- (LBFBiomeManager)biomeManagerMLRuntimed
{
  return self->_biomeManagerMLRuntimed;
}

- (void)setBiomeManagerMLRuntimed:(id)a3
{
}

- (LBFBiomeManager)biomeManagerDprivacyd
{
  return self->_biomeManagerDprivacyd;
}

- (void)setBiomeManagerDprivacyd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeManagerDprivacyd, 0);
  objc_storeStrong((id *)&self->_biomeManagerMLRuntimed, 0);
  objc_storeStrong((id *)&self->_biomeManagerTrial, 0);
  objc_storeStrong((id *)&self->_biomeManagerLighthouse, 0);
}

@end