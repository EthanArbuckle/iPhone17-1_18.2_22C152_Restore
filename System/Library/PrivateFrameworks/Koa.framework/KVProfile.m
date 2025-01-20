@interface KVProfile
+ (BOOL)supportsSecureCoding;
+ (id)emptyProfile:(id *)a3;
+ (id)profileWithContentsOfURL:(id)a3 error:(id *)a4;
+ (void)initalize;
- (BOOL)_enumerateSerializedSetsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4;
- (KVProfile)initWithCoder:(id)a3;
- (KVProfile)initWithProfileData:(id)a3 error:(id *)a4;
- (KVProfile)initWithProfileData:(id)a3 provider:(id)a4 error:(id *)a5;
- (id)description;
- (id)profileInfo;
- (id)serializedSets:(id *)a3;
- (id)toSerializedSets:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KVProfile

- (BOOL)_enumerateSerializedSetsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1BC3BC5CC;
  v29 = sub_1BC3BC5DC;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1BC3BC5CC;
  v23 = sub_1BC3BC5DC;
  id v24 = 0;
  v17 = &v25;
  id obj = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1BC3BC5E4;
  v14[3] = &unk_1E62ACF40;
  v16 = &v19;
  id v7 = v6;
  id v15 = v7;
  char v11 = objc_msgSend_enumerateDatasetsWithError_usingBlock_(self, v8, (uint64_t)&obj, (uint64_t)v14, v9, v10);
  objc_storeStrong(&v30, obj);
  if ((v11 & 1) == 0)
  {
    v12 = (void *)v20[5];
    if (!v12) {
      v12 = (void *)v26[5];
    }
    if (a3 && v12) {
      *a3 = v12;
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (id)toSerializedSets:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1BC3BC938;
  v12[3] = &unk_1E62ACEF0;
  id v6 = v5;
  id v13 = v6;
  LODWORD(a3) = objc_msgSend__enumerateSerializedSetsWithError_usingBlock_(self, v7, (uint64_t)a3, (uint64_t)v12, v8, v9);

  if (a3) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)serializedSets:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1BC3BCA34;
  v12[3] = &unk_1E62ACEF0;
  id v6 = v5;
  id v13 = v6;
  LODWORD(a3) = objc_msgSend__enumerateSerializedSetsWithError_usingBlock_(self, v7, (uint64_t)a3, (uint64_t)v12, v8, v9);

  if (a3) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (KVProfile)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"d", v7, v8);

  id v18 = 0;
  id v13 = objc_msgSend_initWithProfileData_error_(self, v10, (uint64_t)v9, (uint64_t)&v18, v11, v12);
  id v14 = v18;
  id v15 = v13;
  if (!v15)
  {
    v16 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[KVProfile initWithCoder:]";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_error_impl(&dword_1BC3B6000, v16, OS_LOG_TYPE_ERROR, "%s Failed to decode profile from data: %@ error: %@", buf, 0x20u);
    }
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  profileReader = self->_profileReader;
  id v4 = a3;
  objc_msgSend_data(profileReader, v5, v6, v7, v8, v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v13, @"d", v11, v12);
}

- (id)description
{
  return (id)objc_msgSend_description(self->_profileReader, a2, v2, v3, v4, v5);
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  profileReader = self->_profileReader;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1BC3C5A88;
  v13[3] = &unk_1E62AD2C0;
  id v14 = v6;
  id v8 = v6;
  LOBYTE(a3) = objc_msgSend_enumerateDatasetsWithError_usingBlock_(profileReader, v9, (uint64_t)a3, (uint64_t)v13, v10, v11);

  return (char)a3;
}

- (id)profileInfo
{
  return (id)((uint64_t (*)(KVProfileReader *, char *))MEMORY[0x1F4181798])(self->_profileReader, sel_profileInfo);
}

- (KVProfile)initWithProfileData:(id)a3 provider:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KVProfile;
  id v13 = [(KVProfile *)&v18 init];
  if (v13
    && (objc_msgSend_profileReaderForData_error_(v9, v10, (uint64_t)v8, (uint64_t)a5, v11, v12),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        profileReader = v13->_profileReader,
        v13->_profileReader = (KVProfileReader *)v14,
        profileReader,
        !v13->_profileReader))
  {
    v16 = 0;
  }
  else
  {
    v16 = v13;
  }

  return v16;
}

- (KVProfile)initWithProfileData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(KVProfileReaderFactory);
  uint64_t v10 = (KVProfile *)objc_msgSend_initWithProfileData_provider_error_(self, v8, (uint64_t)v6, (uint64_t)v7, (uint64_t)a4, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emptyProfile:(id *)a3
{
  id v8 = objc_msgSend_syntheticWithDatasetCount_error_(KVProfileInfo, a2, 0, (uint64_t)a3, v3, v4);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_builderWithProfileInfo_format_error_(KVProfileBuilder, v6, (uint64_t)v8, 1, (uint64_t)a3, v7);
    uint64_t v14 = v9;
    if (v9)
    {
      id v15 = objc_msgSend_buildWithError_(v9, v10, (uint64_t)a3, v11, v12, v13);
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)profileWithContentsOfURL:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v55 = 0;
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v6, v7, v8, v9, v10);
  v17 = objc_msgSend_path(v5, v12, v13, v14, v15, v16);
  char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v11, v18, (uint64_t)v17, (uint64_t)&v55, v19, v20);

  if ((isDirectory & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    objc_msgSend_stringWithFormat_(NSString, v22, @"No profile exists at URL: %@", v23, v24, v25, v5);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    v61[0] = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v61, (uint64_t)&v60, 1, v31);
    goto LABEL_5;
  }
  if (v55)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    objc_msgSend_stringWithFormat_(NSString, v22, @"Expected file but found directory at URL: %@", v23, v24, v25, v5);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v59 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v59, (uint64_t)&v58, 1, v29);
    v32 = LABEL_5:;
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v33, @"com.apple.koa.profile", 2, (uint64_t)v32, v34);
    v35 = (KVProfileReaderFactory *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    v37 = 0;
    if (a4 && v35)
    {
      v36 = v35;
      v37 = 0;
      *a4 = v36;
    }
    goto LABEL_14;
  }
  id v54 = 0;
  v32 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], v22, (uint64_t)v5, 8, (uint64_t)&v54, v25);
  id v27 = v54;
  if (v32)
  {
    id v42 = objc_alloc((Class)objc_opt_class());
    v36 = objc_alloc_init(KVProfileReaderFactory);
    v37 = objc_msgSend_initWithProfileData_provider_error_(v42, v43, (uint64_t)v32, (uint64_t)v36, (uint64_t)a4, v44);
  }
  else
  {
    v45 = (void *)MEMORY[0x1E4F28C58];
    v56[0] = *MEMORY[0x1E4F28568];
    objc_msgSend_stringWithFormat_(NSString, v38, @"Failed to read profile at URL: %@", v39, v40, v41, v5);
    v36 = (KVProfileReaderFactory *)objc_claimAutoreleasedReturnValue();
    v56[1] = *MEMORY[0x1E4F28A50];
    v57[0] = v36;
    v57[1] = v27;
    v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v46, (uint64_t)v57, (uint64_t)v56, 2, v47);
    v51 = objc_msgSend_errorWithDomain_code_userInfo_(v45, v49, @"com.apple.koa.profile", 2, (uint64_t)v48, v50);
    v52 = v51;
    if (a4 && v51) {
      *a4 = v51;
    }

    v32 = 0;
    v37 = 0;
  }
LABEL_14:

  return v37;
}

+ (void)initalize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end