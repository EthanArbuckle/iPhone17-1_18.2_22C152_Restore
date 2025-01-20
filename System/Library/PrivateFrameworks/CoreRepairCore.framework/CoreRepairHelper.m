@interface CoreRepairHelper
+ (id)sharedInstance;
- (BOOL)_mount:(const char *)a3 withFlag:(int)a4;
- (BOOL)factoryServiceOn;
- (CoreRepairHelper)init;
- (void)challengeStrongComponents:(id)a3 withReply:(id)a4;
- (void)daemonControl:(id)a3 withReply:(id)a4;
- (void)decompressPearlFramesWithReply:(id)a3;
- (void)issueRepairCert:(id)a3 withReply:(id)a4;
- (void)queryRepairDeltaWithReply:(id)a3;
- (void)seal:(id)a3 withReply:(id)a4;
- (void)setFactoryServiceOn:(BOOL)a3;
- (void)setupModuleChallengeCallBack:(__AMFDR *)a3;
- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5;
- (void)updateBrunorDATFirmwareWithReply:(id)a3;
- (void)updateSavageDATFirmwareWithReply:(id)a3;
- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6;
- (void)verifyPSD3WithReply:(id)a3;
@end

@implementation CoreRepairHelper

- (void)setupModuleChallengeCallBack:(__AMFDR *)a3
{
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
}

- (CoreRepairHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CoreRepairHelper;
  result = [(CoreRepairHelper *)&v3 init];
  if (result) {
    result->_factoryServiceOn = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_267EF81E8 != -1) {
    dispatch_once(&qword_267EF81E8, &unk_26D157868);
  }
  v2 = (void *)qword_267EF81E0;
  return v2;
}

- (void)seal:(id)a3 withReply:(id)a4
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v156 = (void *)os_transaction_create();
  id v161 = 0;
  id v162 = 0;
  id v160 = 0;
  v8 = objc_opt_new();
  v11 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"doSeal", v10);
  int v15 = objc_msgSend_BOOLValue(v11, v12, v13, v14);

  v19 = objc_msgSend_mutableCopy(v6, v16, v17, v18);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v6, v20, @"keyBlob", v21);
  if (v22)
  {
    v26 = (void *)v22;
    v27 = objc_msgSend_objectForKeyedSubscript_(v6, v23, @"keyBlob", v25);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v29 = handleForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "Use Key Blob", buf, 2u);
      }

      v32 = objc_msgSend_objectForKeyedSubscript_(v6, v30, @"keyBlob", v31);
      objc_msgSend_setObject_forKey_(v19, v33, (uint64_t)v32, @"keyBlob");
    }
  }
  v34 = objc_msgSend_sharedSingleton(CRFileSystemController, v23, v24, v25);
  char v37 = objc_msgSend_setupAlternativeFDRPath_(v34, v35, (uint64_t)v6, v36);

  if ((v37 & 1) == 0)
  {
    v77 = handleForCategory(0);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_21FC620E8(v77);
    }
    goto LABEL_65;
  }
  v41 = objc_msgSend_sharedSingleton(CRFileSystemController, v38, v39, v40);
  uint64_t v45 = objc_msgSend_setupFileSystemForRepair(v41, v42, v43, v44);

  if (!v45)
  {
    v77 = handleForCategory(0);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_21FC61F60(v77);
    }
LABEL_65:
    v84 = 0;
    v150 = 0;
    v151 = 0;
    id v68 = 0;
    uint64_t v67 = -16;
    goto LABEL_28;
  }
  objc_msgSend_setObject_forKey_(v19, v46, v45, @"datapath");
  v47 = handleForCategory(0);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v168 = v45;
    _os_log_impl(&dword_21FBF2000, v47, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  v48 = handleForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "Starting to seal FDR", buf, 2u);
  }

  v151 = (void *)v45;
  if (!v15)
  {
    v56 = 0;
LABEL_25:
    v85 = handleForCategory(0);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v85, OS_LOG_TYPE_DEFAULT, "FDR Seal Successful", buf, 2u);
    }

    v150 = v56;
    v77 = objc_msgSend_handler(v56, v86, v87, v88);
    v84 = objc_msgSend_warnings(v77, v89, v90, v91);
    id v68 = 0;
    uint64_t v67 = 0;
    goto LABEL_28;
  }
  v49 = [CRFDRSeal alloc];
  uint64_t v52 = objc_msgSend_initWithParameters_(v49, v50, (uint64_t)v19, v51);
  if (!v52)
  {
    v77 = handleForCategory(0);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_21FC61FA4((uint64_t)v6, v77, v133, v134, v135, v136, v137, v138);
    }
    v84 = 0;
    id v68 = 0;
    v150 = 0;
    goto LABEL_23;
  }
  v56 = (void *)v52;
  if (objc_msgSend_factoryServiceOn(self, v53, v54, v55))
  {
    v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v59, OS_LOG_TYPE_DEFAULT, "Enable service board support", buf, 2u);
    }

    v63 = objc_msgSend_handler(v56, v60, v61, v62);
    objc_msgSend_setAllowFactoryReset_(v63, v64, 1, v65);
  }
  objc_msgSend_setDelegate_(v56, v57, (uint64_t)self, v58);
  id v159 = 0;
  uint64_t v67 = objc_msgSend_seal_oldSealingManifest_newSealingManifest_stats_(v56, v66, (uint64_t)&v159, (uint64_t)&v162, &v161, &v160);
  id v68 = v159;
  v71 = objc_msgSend_convertDataToHexInDictionary_(v8, v69, (uint64_t)v162, v70);
  id v72 = v162;
  id v162 = v71;

  v75 = objc_msgSend_convertDataToHexInDictionary_(v8, v73, (uint64_t)v161, v74);
  id v76 = v161;
  id v161 = v75;

  if (!v67)
  {
    if (v68)
    {
      v150 = v56;
      v77 = handleForCategory(0);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
        sub_21FC62010((uint64_t)v68, v77, v78, v79, v80, v81, v82, v83);
      }
      v84 = 0;
LABEL_23:
      uint64_t v67 = -3;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v150 = v56;
  v77 = handleForCategory(0);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
    sub_21FC6207C(v67, v77, v139, v140, v141, v142, v143, v144);
  }
  v84 = 0;
LABEL_28:

  v95 = objc_msgSend_sharedSingleton(CRFileSystemController, v92, v93, v94);
  int v99 = objc_msgSend_cleanupFileSystemForRepair(v95, v96, v97, v98);

  uint64_t v102 = -18;
  if (v67) {
    uint64_t v102 = v67;
  }
  if (v99) {
    uint64_t v103 = v67;
  }
  else {
    uint64_t v103 = v102;
  }
  if (v68)
  {
    v104 = objc_msgSend_getInnermostNSError_(CRUtils, v100, (uint64_t)v68, v101);
    v105 = NSNumber;
    uint64_t v109 = objc_msgSend_code(v104, v106, v107, v108);
    uint64_t v112 = objc_msgSend_numberWithInteger_(v105, v110, v109, v111);
    v158 = objc_msgSend_description(v104, v113, v114, v115);
  }
  else
  {
    uint64_t v112 = 0;
    v158 = 0;
  }
  v165[0] = @"statusCode";
  v152 = objc_msgSend_numberWithInteger_(NSNumber, v100, v103, v101);
  v165[1] = @"data";
  v166[0] = v152;
  v163[0] = @"fdrErrorCode";
  uint64_t v119 = v112;
  if (!v112)
  {
    uint64_t v119 = objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118);
  }
  v157 = v6;
  v149 = (void *)v119;
  v164[0] = v119;
  v163[1] = @"fdrErrorDescription";
  uint64_t v120 = (uint64_t)v158;
  if (!v158)
  {
    uint64_t v120 = objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118);
  }
  v155 = v8;
  v164[1] = v120;
  v163[2] = @"oldSealingManifest";
  id v121 = v162;
  id v122 = v162;
  if (!v162)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118);
    id v122 = (id)objc_claimAutoreleasedReturnValue();
  }
  v147 = v122;
  v148 = (void *)v120;
  v153 = (void *)v112;
  v164[2] = v122;
  v163[3] = @"newSealingManifest";
  id v123 = v161;
  id v124 = v161;
  if (!v161)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118);
    id v124 = (id)objc_claimAutoreleasedReturnValue();
  }
  v154 = v19;
  v125 = (void (**)(void, void))v7;
  id v145 = v124;
  v164[3] = v124;
  v163[4] = @"Stats";
  id v126 = v160;
  id v127 = v160;
  if (!v160)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118, v124, v147, v148, v149);
    id v127 = (id)objc_claimAutoreleasedReturnValue();
  }
  v128 = v68;
  v164[4] = v127;
  v163[5] = @"warnings";
  v129 = v84;
  if (!v84)
  {
    v129 = objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118);
  }
  v164[5] = v129;
  v130 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v116, (uint64_t)v164, (uint64_t)v163, 6, v145);
  v166[1] = v130;
  v132 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v131, (uint64_t)v166, (uint64_t)v165, 2);
  ((void (**)(void, void *))v125)[2](v125, v132);

  if (!v84) {
  if (!v126)
  }

  if (v123)
  {
    if (v121) {
      goto LABEL_54;
    }
  }
  else
  {

    if (v121) {
      goto LABEL_54;
    }
  }

LABEL_54:
  if (!v158) {

  }
  if (!v153) {
}
  }

- (void)daemonControl:(id)a3 withReply:(id)a4
{
}

- (void)queryRepairDeltaWithReply:(id)a3
{
  id v8 = a3;
  objc_super v3 = objc_opt_new();
  id v6 = v3;
  if (v3)
  {
    objc_msgSend_queryRepairDeltaWithReply_(v3, v4, (uint64_t)v8, v5);
  }
  else if (v8)
  {
    id v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v4, @"com.apple.corerepair", -81, 0);
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v7);
  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = objc_opt_new();
  id v8 = v6;
  if (v6)
  {
    objc_msgSend_issueRepairCert_withReply_(v6, v7, (uint64_t)v10, (uint64_t)v5);
  }
  else if (v5)
  {
    v9 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.corerepair", -81, 0);
    (*((void (**)(id, void, void, void, void *))v5 + 2))(v5, 0, 0, 0, v9);
  }
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = objc_opt_new();
  id v10 = v8;
  if (v8)
  {
    objc_msgSend_challengeStrongComponents_withReply_(v8, v9, (uint64_t)v12, (uint64_t)v6);
  }
  else if (v6)
  {
    v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, @"com.apple.corerepair", -81, 0);
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v11);
  }
  objc_sync_exit(v7);
}

- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5
{
  id v12 = (void (**)(id, void *))a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  v11 = objc_msgSend_sign_keyBlob_(v9, v10, (uint64_t)v8, (uint64_t)v7);

  if (v12) {
    v12[2](v12, v11);
  }
}

- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6
{
  id v16 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  uint64_t v14 = objc_msgSend_verify_signature_keyBlob_(v12, v13, (uint64_t)v11, (uint64_t)v10, v9);

  int v15 = v16;
  if (v16)
  {
    (*((void (**)(id, uint64_t))v16 + 2))(v16, v14);
    int v15 = v16;
  }
}

- (BOOL)_mount:(const char *)a3 withFlag:(int)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  long long v16 = 0u;
  long long v15 = 0u;
  id v6 = getfsfile(a3);
  if (!v6)
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = a3;
      id v10 = "get fs file failed for mount %s";
      id v11 = v7;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  fs_spec = v6->fs_spec;
  if (mount(v6->fs_vfstype, a3, a4, &fs_spec))
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)buf = 136315394;
      v19 = a3;
      __int16 v20 = 2080;
      uint64_t v21 = v9;
      id v10 = "mount failed for %s filesystem: %s\n";
      id v11 = v7;
      uint32_t v12 = 22;
LABEL_7:
      _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)decompressPearlFramesWithReply:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  id v7 = objc_msgSend_decompressPearlFrames(v3, v4, v5, v6);

  if (v8) {
    v8[2](v8, v7);
  }
}

- (void)updateSavageDATFirmwareWithReply:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  id v7 = objc_msgSend_updateSavageDATFirmware(v3, v4, v5, v6);

  if (v8) {
    v8[2](v8, v7);
  }
}

- (void)updateBrunorDATFirmwareWithReply:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  id v7 = objc_msgSend_updateBrunorDATFirmware(v3, v4, v5, v6);

  if (v8) {
    v8[2](v8, v7);
  }
}

- (void)verifyPSD3WithReply:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  objc_super v3 = objc_opt_new();
  id v7 = objc_msgSend_verifyPSD3(v3, v4, v5, v6);

  if (v8) {
    v8[2](v8, v7);
  }
}

- (BOOL)factoryServiceOn
{
  return self->_factoryServiceOn;
}

- (void)setFactoryServiceOn:(BOOL)a3
{
  self->_factoryServiceOn = a3;
}

@end