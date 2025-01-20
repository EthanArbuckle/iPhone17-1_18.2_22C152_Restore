@interface CLSContextProviderExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)getMainAppContextPathWithCompletion:(id)a3;
- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4;
- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4;
@end

@implementation CLSContextProviderExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1EB5D4978 != -1) {
    dispatch_once(&qword_1EB5D4978, &unk_1F37A1590);
  }
  v2 = (void *)qword_1EB5D4980;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB5D4988 != -1) {
    dispatch_once(&qword_1EB5D4988, &unk_1F37A1850);
  }
  v2 = (void *)qword_1EB5D4990;

  return v2;
}

- (void)getMainAppContextPathWithCompletion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6 = objc_msgSend_shared(CLSDataStore, v4, v5);
  v10 = objc_msgSend_mainAppContext(v6, v7, v8);
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1DC63D844;
    v18[3] = &unk_1E6C96418;
    id v20 = v3;
    id v19 = v10;
    objc_msgSend_saveWithCompletion_(v6, v11, (uint64_t)v18);

    v12 = v20;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v9, @"Failed to create main app context path");
    v22[0] = v14;
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, &v21, 1);
    v12 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"com.apple.ClassKit", 100, v16);

    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v12);
  }
}

- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v10 = objc_msgSend_shared(CLSDataStore, v8, v9);
  v13 = objc_msgSend_mainAppContext(v10, v11, v12);
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_1DC63DCAC;
  v59 = sub_1DC63DCBC;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_1DC63DCAC;
  v53 = sub_1DC63DCBC;
  id v54 = 0;
  if (!objc_msgSend_count(v6, v14, v15))
  {
    v29 = v56;
    id v30 = v13;
    id v20 = v29[5];
    v29[5] = v30;
    goto LABEL_12;
  }
  objc_msgSend_firstObject(v6, v16, v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v31 = objc_msgSend_identifier(v13, v18, v19);
    if (v31)
    {

      id v20 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v23 = objc_msgSend_identifier(v13, v18, v19);
  if (v23)
  {
    v24 = objc_msgSend_identifier(v13, v21, v22);
    int isEqualToString = objc_msgSend_isEqualToString_(v20, v25, (uint64_t)v24);

    if (isEqualToString)
    {
LABEL_9:
      if (objc_msgSend_count(v6, v27, v28) == 1)
      {
        objc_storeStrong(v56 + 5, v13);
      }
      else
      {
        dispatch_block_t v32 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F37A1830);
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = sub_1DC63DCC8;
        v44[3] = &unk_1E6C96440;
        v47 = &v49;
        id v45 = v6;
        v48 = &v55;
        id v33 = v32;
        id v46 = v33;
        objc_msgSend_contextsMatchingIdentifierPath_completion_(v10, v34, (uint64_t)v45, v44);
        dispatch_block_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
LABEL_12:

  uint64_t v36 = (uint64_t)v56[5];
  if (v36)
  {
    objc_msgSend_updateDescendantsOfContext_completion_(self, v35, v36, v7);
  }
  else
  {
    if (!v50[5])
    {
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28568];
      v38 = objc_msgSend_stringWithFormat_(NSString, v35, @"Invalid context path: %@", v6);
      v62[0] = v38;
      v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)v62, &v61, 1);
      uint64_t v42 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v41, @"com.apple.ClassKit", 2, v40);
      v43 = (void *)v50[5];
      v50[5] = v42;
    }
    if (v7) {
      v7[2](v7, v50[5]);
    }
  }
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
}

- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend__principalObject(self, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateDescendantsOfContext_completion_(v11, v10, (uint64_t)v7, v6);
}

@end