@interface CRComponentDisplayRoswell
+ (id)sharedSingleton;
- (CRComponentDisplayRoswell)init;
- (id)_init;
- (id)identifierBase64;
- (void)challengeComponentWith:(id)a3 withReply:(id)a4;
- (void)setIdentifierBase64:(id)a3;
- (void)signDisplayRoswellWith:(id)a3 withReply:(id)a4;
@end

@implementation CRComponentDisplayRoswell

- (CRComponentDisplayRoswell)init
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
  v19.super_class = (Class)CRComponentDisplayRoswell;
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
    sub_21FC6123C(&v18, v15);
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
  block[2] = sub_21FC51B68;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC13420 != -1) {
    dispatch_once(&qword_26AC13420, block);
  }
  v2 = (void *)qword_26AC13458;
  return v2;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  v62[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v10 = (void (**)(id, void, void *, void *))a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_21FC51FAC;
  v51 = sub_21FC51FBC;
  id v52 = 0;
  if (!v6
    || (objc_msgSend_nonce(v6, v7, v8, v9), (v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_nonce(v6, v11, v12, v13),
        v15 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = objc_msgSend_length(v15, v16, v17, v18) == 0,
        v15,
        v14,
        v19))
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC68C70();
    }

    *((unsigned char *)v54 + 24) = 0;
    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v61 = *MEMORY[0x263F08320];
    v62[0] = @"Invalid Params and Nonce";
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)v62, (uint64_t)&v61, 1);
    uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v39, @"com.apple.corerepair", -39, v38);
    goto LABEL_12;
  }
  v23 = objc_msgSend_nonce(v6, v20, v21, v22);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = sub_21FC51FC4;
  v46[3] = &unk_26452AA10;
  v46[4] = &v53;
  v46[5] = &v47;
  objc_msgSend_signDisplayRoswellWith_withReply_(self, v24, (uint64_t)v23, (uint64_t)v46);

  if (!*((unsigned char *)v54 + 24) || (uint64_t v26 = v48[5]) == 0)
  {
    *((unsigned char *)v54 + 24) = 0;
    v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60 = @"Challenge Roswell failed";
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v60, (uint64_t)&v59, 1);
    uint64_t v40 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v42, @"com.apple.corerepair", -37, v38);
LABEL_12:
    v34 = (void *)v40;
    v30 = 0;
LABEL_13:

    v33 = 0;
    goto LABEL_14;
  }
  id v45 = 0;
  int v27 = objc_msgSend_CRCreateECDSADerData_responseDer_(self, v25, v26, (uint64_t)&v45);
  id v28 = v45;
  v30 = v28;
  if (v27 || !v28)
  {
    *((unsigned char *)v54 + 24) = 0;
    v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F08320];
    v58 = @"CRCreateECDSADerData failed";
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v58, (uint64_t)&v57, 1);
    v34 = objc_msgSend_errorWithDomain_code_userInfo_(v43, v44, @"com.apple.corerepair", -37, v38);
    goto LABEL_13;
  }
  *((unsigned char *)v54 + 24) = 1;
  v31 = [CRChallengeResponse alloc];
  v33 = objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v31, v32, @"tcrt", (uint64_t)self->identifierBase64, v30, 0, 0);
  v34 = 0;
LABEL_14:
  v10[2](v10, *((unsigned __int8 *)v54 + 24), v34, v33);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

- (void)signDisplayRoswellWith:(id)a3 withReply:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = -1;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_21FC51FAC;
  v33 = sub_21FC51FBC;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_21FC51FAC;
  int v27 = sub_21FC51FBC;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  uint64_t v13 = objc_msgSend_sha256_(self, v8, (uint64_t)v6, v9);
  if (!v13)
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC68CA4();
    }
    goto LABEL_10;
  }
  v14 = objc_msgSend_sharedManager(MEMORY[0x263F340C8], v10, v11, v12);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_21FC52374;
  v22[3] = &unk_26452A548;
  v22[4] = &v35;
  v22[5] = &v29;
  v22[6] = &v23;
  objc_msgSend_authenticateTouchControllerWithChallenge_completionHandler_(v14, v15, (uint64_t)v13, (uint64_t)v22);

  v16 = v24[5];
  dispatch_time_t v17 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB80();
    }
    goto LABEL_10;
  }
  uint64_t v18 = handleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v30[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v19;
    _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "Signature is:%@", buf, 0xCu);
  }

  if (*((_DWORD *)v36 + 6))
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB4C();
    }
    goto LABEL_10;
  }
  if (!v30[5])
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
LABEL_10:

    uint64_t v20 = 0;
    goto LABEL_11;
  }
  uint64_t v20 = 1;
LABEL_11:
  v7[2](v7, v20, v30[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
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