@interface CRComponentVeridian
+ (id)sharedSingleton;
- (CRComponentVeridian)init;
- (id)_init;
- (id)identifierBase64;
- (void)challengeComponentWith:(id)a3 withReply:(id)a4;
- (void)setIdentifierBase64:(id)a3;
- (void)signVeridianWith:(id)a3 withReply:(id)a4;
@end

@implementation CRComponentVeridian

- (CRComponentVeridian)init
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
  v19.receiver = self;
  v19.super_class = (Class)CRComponentVeridian;
  v2 = [(CRComponentBase *)&v19 init];
  v18 = 0;
  if (!v2)
  {
    v7 = 0;
    goto LABEL_9;
  }
  v3 = (void *)AMFDRSealingMapCopyInstanceForClass();
  v7 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6))
  {
    v10 = objc_msgSend_dataUsingEncoding_(v7, v8, 4, v9);
    uint64_t v13 = objc_msgSend_base64EncodedStringWithOptions_(v10, v11, 0, v12);
    identifierBase64 = v2->identifierBase64;
    v2->identifierBase64 = (NSString *)v13;

LABEL_9:
    v16 = v2;
    goto LABEL_10;
  }
  v15 = handleForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_21FC62ECC(&v18, v15);
  }

  v16 = 0;
  v18 = 0;
LABEL_10:

  return v16;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC2E304;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC13418 != -1) {
    dispatch_once(&qword_26AC13418, block);
  }
  v2 = (void *)qword_26AC13450;
  return v2;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  v69[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *, void *))a4;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_21FC2E7E0;
  v58 = sub_21FC2E7F0;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_21FC2E7E0;
  v52 = sub_21FC2E7F0;
  id v53 = 0;
  v11 = objc_opt_new();
  if (!v6
    || (objc_msgSend_nonce(v6, v8, v9, v10), (v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_nonce(v6, v12, v13, v14),
        v16 = objc_claimAutoreleasedReturnValue(),
        BOOL v20 = objc_msgSend_length(v16, v17, v18, v19) == 0,
        v16,
        v15,
        v20))
  {
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC62F54();
    }

    *((unsigned char *)v61 + 24) = 0;
    v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v68 = *MEMORY[0x263F08320];
    v69[0] = @"Invalid Params and Nonce";
    v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v69, (uint64_t)&v68, 1);
    uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, @"com.apple.corerepair", -39, v39);
    goto LABEL_13;
  }
  v24 = objc_msgSend_nonce(v6, v21, v22, v23);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_21FC2E7F8;
  v47[3] = &unk_26452AAB0;
  v47[4] = &v60;
  v47[5] = &v54;
  v47[6] = &v48;
  objc_msgSend_signVeridianWith_withReply_(self, v25, (uint64_t)v24, (uint64_t)v47);

  if (!*((unsigned char *)v61 + 24) || (uint64_t v27 = v55[5]) == 0 || !v49[5])
  {
    *((unsigned char *)v61 + 24) = 0;
    v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v66 = *MEMORY[0x263F08320];
    v67 = @"Challenge Veridian failed";
    v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v67, (uint64_t)&v66, 1);
    uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(v42, v43, @"com.apple.corerepair", -37, v39);
LABEL_13:
    v35 = (void *)v41;
    v31 = 0;
LABEL_14:

    v34 = 0;
    goto LABEL_15;
  }
  id v46 = 0;
  int v28 = objc_msgSend_CRCreateECDSADerData_responseDer_(self, v26, v27, (uint64_t)&v46);
  id v29 = v46;
  v31 = v29;
  if (v28 || !v29)
  {
    *((unsigned char *)v61 + 24) = 0;
    v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    v65 = @"CRCreateECDSADerData failed";
    v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v65, (uint64_t)&v64, 1);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_(v44, v45, @"com.apple.corerepair", -37, v39);
    goto LABEL_14;
  }
  *((unsigned char *)v61 + 24) = 1;
  objc_msgSend_setObject_forKeyedSubscript_(v11, v30, v49[5], @"deviceNonce");
  v32 = [CRChallengeResponse alloc];
  v34 = objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v32, v33, @"vcrt", (uint64_t)self->identifierBase64, v31, 0, v11);
  v35 = 0;
LABEL_15:
  v7[2](v7, *((unsigned __int8 *)v61 + 24), v35, v34);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

- (void)signVeridianWith:(id)a3 withReply:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = -1;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_21FC2E7E0;
  v39 = sub_21FC2E7F0;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_21FC2E7E0;
  v33 = sub_21FC2E7F0;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_21FC2E7E0;
  uint64_t v27 = sub_21FC2E7F0;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  uint64_t v13 = objc_msgSend_sha256_(self, v8, (uint64_t)v6, v9);
  if (!v13)
  {
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC62F88();
    }
    goto LABEL_10;
  }
  uint64_t v14 = objc_msgSend_sharedManager(MEMORY[0x263F340C8], v10, v11, v12);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_21FC2EC80;
  v22[3] = &unk_26452A570;
  v22[4] = &v41;
  v22[5] = &v35;
  v22[6] = &v29;
  v22[7] = &v23;
  objc_msgSend_signVeridianChallenge_completionHandler_(v14, v15, (uint64_t)v13, (uint64_t)v22);

  v16 = v24[5];
  dispatch_time_t v17 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB80();
    }
    goto LABEL_10;
  }
  uint64_t v18 = handleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v36[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v46 = v19;
    _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "Vcrt Signature is:%@", buf, 0xCu);
  }

  if (*((_DWORD *)v42 + 6))
  {
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB4C();
    }
    goto LABEL_10;
  }
  if (!v36[5])
  {
    v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
LABEL_10:

    uint64_t v20 = 0;
    goto LABEL_11;
  }
  uint64_t v20 = 1;
LABEL_11:
  v7[2](v7, v20, v36[5], v30[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
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