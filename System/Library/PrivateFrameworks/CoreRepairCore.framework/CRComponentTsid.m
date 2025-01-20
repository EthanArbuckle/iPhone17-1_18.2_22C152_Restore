@interface CRComponentTsid
+ (id)sharedSingleton;
- (BOOL)connectToIO:(unsigned int *)a3 withError:(id *)a4;
- (BOOL)issueChallenge:(id)a3 index:(int)a4 reponse:(id *)a5 options:(unint64_t)a6 connection:(unsigned int)a7 withError:(id *)a8;
- (CRComponentTsid)init;
- (id)_init;
- (id)identifierBase64;
- (void)challengeComponentWith:(id)a3 withReply:(id)a4;
- (void)setIdentifierBase64:(id)a3;
@end

@implementation CRComponentTsid

- (CRComponentTsid)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedSingleton);
  v9 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v4, v10, v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9);

  return 0;
}

- (id)_init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)CRComponentTsid;
  v2 = [(CRComponentBase *)&v16 init];
  v15 = 0;
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!AMFDRCreateWithOptions())
  {
    v3 = handleForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21FC61424(v3);
    }
  }
  if (AMFDRSealingMapCopyManifestPropertiesForDevice()) {
    BOOL v4 = v15 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = 0;
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "properties are:%@", buf, 0xCu);
    }

    v12 = v2;
  }
  else
  {
    uint64_t v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC613A8(&v15, v5, v6, v7, v8, v9, v10, v11);
    }

    v12 = 0;
    v15 = 0;
  }

  return v12;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC1E374;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC13408 != -1) {
    dispatch_once(&qword_26AC13408, block);
  }
  v2 = (void *)qword_26AC13440;
  return v2;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  v76[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = (void (**)(id, uint64_t, id, void *))a4;
  unsigned int v70 = 0;
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v11 = objc_msgSend_nonce(v6, v7, v8, v9);
  if (!v11
    || (v15 = (void *)v11,
        objc_msgSend_nonce(v6, v12, v13, v14),
        objc_super v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = objc_msgSend_length(v16, v17, v18, v19),
        v16,
        v15,
        !v20))
  {
LABEL_14:
    v51 = handleForCategory(0);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_21FC61468(v51);
    }

    v52 = (void *)MEMORY[0x263F087E8];
    uint64_t v75 = *MEMORY[0x263F08320];
    v76[0] = @"Invalid Params and Nonce";
    v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)v76, (uint64_t)&v75, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v52, v54, @"com.apple.corerepair", -39, v47);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  id v69 = 0;
  int v22 = objc_msgSend_connectToIO_withError_(self, v21, (uint64_t)&v70, (uint64_t)&v69);
  id v23 = v69;
  id v27 = v23;
  if (!v22 || v23)
  {
    v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_21FC61518((uint64_t)v27, v47, v55, v56, v57, v58, v59, v60);
    }
LABEL_17:
    id v39 = 0;
LABEL_18:
    uint64_t v50 = 0;
    v49 = 0;
    goto LABEL_19;
  }
  v28 = objc_msgSend_nonce(v6, v24, v25, v26);
  v32 = objc_msgSend_keyIndex(v6, v29, v30, v31);
  uint64_t v36 = objc_msgSend_intValue(v32, v33, v34, v35);
  id v67 = 0;
  id v68 = 0;
  int v38 = objc_msgSend_issueChallenge_index_reponse_options_connection_withError_(self, v37, (uint64_t)v28, v36, &v68, 1, v70, &v67);
  id v39 = v68;
  id v27 = v67;

  v40 = handleForCategory(0);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v72 = v38;
    __int16 v73 = 2112;
    id v74 = v39;
    _os_log_impl(&dword_21FBF2000, v40, OS_LOG_TYPE_DEFAULT, "Lightning Controller:%d:%@", buf, 0x12u);
  }

  if (v27) {
    int v41 = 0;
  }
  else {
    int v41 = v38;
  }
  if (v41 != 1 || !v39)
  {
    v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_21FC614AC((uint64_t)v27, v47, v61, v62, v63, v64, v65, v66);
    }
    goto LABEL_18;
  }
  v42 = [CRChallengeResponse alloc];
  identifierBase64 = self->identifierBase64;
  v47 = objc_msgSend_keyIndex(v6, v44, v45, v46);
  v49 = objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v42, v48, @"tsid", (uint64_t)identifierBase64, v39, v47, 0);
  id v27 = 0;
  uint64_t v50 = 1;
LABEL_19:

  v10[2](v10, v50, v27, v49);
}

- (BOOL)connectToIO:(unsigned int *)a3 withError:(id *)a4
{
  kern_return_t v10;
  BOOL v11;
  mach_error_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void v34[2];

  v34[1] = *MEMORY[0x263EF8340];
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  if (ServiceWithPrimaryPort)
  {
    io_object_t v9 = ServiceWithPrimaryPort;
    uint64_t v10 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x263EF8960], 0, a3);
    uint64_t v11 = v10 == 0;
    if (v10)
    {
      v12 = v10;
      uint64_t v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC61604(v12, v13);
      }

      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v15 = NSString;
      objc_super v16 = mach_error_string(v12);
      uint64_t v19 = objc_msgSend_stringWithFormat_(v15, v17, @"could not open IOAccessoryManager service: %s\n", v18, v16, v31);
      v32 = v19;
      v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v32, (uint64_t)&v31, 1);
      id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v22, @"com.apple.corerepair", -36, v21);
    }
    else
    {
      id v23 = 0;
    }
    IOObjectRelease(v9);
    if (a4) {
LABEL_12:
    }
      *a4 = v23;
  }
  else
  {
    v24 = (void *)MEMORY[0x263F087E8];
    v33 = *MEMORY[0x263F08320];
    uint64_t v25 = objc_msgSend_stringWithFormat_(NSString, v7, @"Could not find IOAccessoryManager service for port %d\n", v8, 1);
    v34[0] = v25;
    id v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)v34, (uint64_t)&v33, 1);
    id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, @"com.apple.corerepair", -36, v27);

    v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC61584(v29);
    }

    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }

  return v11;
}

- (BOOL)issueChallenge:(id)a3 index:(int)a4 reponse:(id *)a5 options:(unint64_t)a6 connection:(unsigned int)a7 withError:(id *)a8
{
  char v9 = a6;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint64_t v40 = 0;
  memset(v41, 0, 15);
  uint64_t v39 = 0;
  objc_super v16 = objc_msgSend_data(MEMORY[0x263EFF990], v13, v14, v15);
  v17 = handleForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = a4;
    _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "TSID KeyIndex is:%d", buf, 8u);
  }

  if (v12) {
    objc_msgSend_getBytes_length_(v12, v18, (uint64_t)v41, 8);
  }
  mach_error_t v19 = IOAccessoryManagerChallengeCryptoDock();
  mach_error_t v21 = v19;
  if (v19)
  {
    int v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    id v23 = NSString;
    v24 = mach_error_string(v19);
    id v27 = objc_msgSend_stringWithFormat_(v23, v25, @"Challenge encountered an error: %s", v26, v24);
    int v38 = v27;
    v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v38, (uint64_t)&v37, 1);
    uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(v22, v30, @"com.apple.corerepair", -37, v29);

    v32 = handleForCategory(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = mach_error_string(v21);
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = v33;
      _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "Challenge encountered an error: %s", buf, 0xCu);
    }

    if (a5) {
LABEL_9:
    }
      *a5 = v16;
  }
  else
  {
    if (v9) {
      objc_msgSend_appendBytes_length_(v16, v20, (uint64_t)&v39, 8);
    }
    if ((v9 & 2) != 0) {
      objc_msgSend_appendBytes_length_(v16, v20, (uint64_t)&v40, 8);
    }
    uint64_t v31 = 0;
    if (a5) {
      goto LABEL_9;
    }
  }
  if (a8) {
    *a8 = v31;
  }

  return v21 == 0;
}

- (id)identifierBase64
{
  return self->identifierBase64;
}

- (void)setIdentifierBase64:(id)a3
{
}

- (void).cxx_destruct
{
}

@end