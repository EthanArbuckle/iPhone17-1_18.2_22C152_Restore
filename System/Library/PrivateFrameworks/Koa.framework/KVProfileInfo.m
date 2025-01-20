@interface KVProfileInfo
+ (id)capturedWithDatasetCount:(unsigned int)a3 error:(id *)a4;
+ (id)syntheticWithDatasetCount:(unsigned int)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProfileInfo:(id)a3;
- (KVProfileInfo)init;
- (KVProfileInfo)initWithBuffer:(id)a3 error:(id *)a4;
- (KVProfileInfo)initWithDatasetCount:(unsigned int)a3 capturedTime:(id)a4 deviceType:(id)a5 buildVersion:(id)a6 error:(id *)a7;
- (NSData)buffer;
- (NSString)description;
- (id)JSONWithIndent:(unsigned __int8)a3;
- (id)buildVersion;
- (id)capturedTime;
- (id)deviceType;
- (id)initFromDictionary:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unsigned)datasetCount;
@end

@implementation KVProfileInfo

- (void).cxx_destruct
{
}

- (NSData)buffer
{
  return self->_buffer;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_buffer, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToProfileInfo:(id)a3
{
  buffer = self->_buffer;
  v7 = objc_msgSend_buffer(a3, a2, (uint64_t)a3, v3, v4, v5);
  LOBYTE(buffer) = objc_msgSend_isEqual_(buffer, v8, (uint64_t)v7, v9, v10, v11);

  return (char)buffer;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVProfileInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToProfileInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToProfileInfo = objc_msgSend_isEqualToProfileInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToProfileInfo = 0;
  }

  return isEqualToProfileInfo;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_objectForKey_(v6, v7, @"datasetCount", v8, v9, v10);
  uint64_t v17 = objc_msgSend_unsignedIntValue(v11, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_objectForKey_(v6, v18, @"capturedTime", v19, v20, v21);
  v23 = sub_1BC3B7F04(v22);
  v28 = objc_msgSend_objectForKey_(v6, v24, @"deviceType", v25, v26, v27);
  v33 = objc_msgSend_objectForKey_(v6, v29, @"buildVersion", v30, v31, v32);
  v35 = objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(self, v34, v17, (uint64_t)v23, (uint64_t)v28, (uint64_t)v33, a4);

  return v35;
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  uint64_t v5 = sub_1BC3D4D78(a3);
  id v6 = sub_1BC3D4D78(a3 + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v7, v8, @"%@{\n", v9, v10, v11, v5);
  uint64_t v17 = objc_msgSend_capturedTime(self, v12, v13, v14, v15, v16);
  v23 = v17;
  if (v17)
  {
    v24 = objc_msgSend_ISO8601String(v17, v18, v19, v20, v21, v22);
    objc_msgSend_appendFormat_(v7, v25, @"%@\"%@\": \"%@\",\n", v26, v27, v28, v6, @"capturedTime", v24);
  }
  uint64_t v29 = objc_msgSend_deviceType(self, v18, v19, v20, v21, v22);
  v35 = (void *)v29;
  if (v29)
  {
    v36 = sub_1BC3D4E00(v29, v30, v31, v32, v33, v34);
    objc_msgSend_appendFormat_(v7, v37, @"%@\"%@\": %@,\n", v38, v39, v40, v6, @"deviceType", v36);
  }
  uint64_t v41 = objc_msgSend_buildVersion(self, v30, v31, v32, v33, v34);
  v47 = (void *)v41;
  if (v41)
  {
    v48 = sub_1BC3D4E00(v41, v42, v43, v44, v45, v46);
    objc_msgSend_appendFormat_(v7, v49, @"%@\"%@\": %@,\n", v50, v51, v52, v6, @"buildVersion", v48);
  }
  uint64_t v53 = objc_msgSend_datasetCount(self, v42, v43, v44, v45, v46);
  objc_msgSend_appendFormat_(v7, v54, @"%@\"%@\": %u,\n", v55, v56, v57, v6, @"datasetCount", v53);
  objc_msgSend_appendFormat_(v7, v58, @"%@}", v59, v60, v61, v5);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2, v3, v4);
}

- (id)buildVersion
{
  uint64_t v2 = &self->_profileInfo[-*(int *)self->_profileInfo];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    id v4 = [NSString alloc];
    profileInfo = self->_profileInfo;
    uint64_t v7 = *(int *)profileInfo->var0;
    uint64_t v8 = *(unsigned __int16 *)profileInfo[-v7 + 8].var0;
    if (*(_WORD *)profileInfo[-v7 + 8].var0)
    {
      uint64_t v9 = *(unsigned int *)profileInfo[v8].var0;
      uint64_t v10 = &profileInfo[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)profileInfo->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)profileInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)deviceType
{
  uint64_t v2 = &self->_profileInfo[-*(int *)self->_profileInfo];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    id v4 = [NSString alloc];
    profileInfo = self->_profileInfo;
    uint64_t v7 = *(int *)profileInfo->var0;
    uint64_t v8 = *(unsigned __int16 *)profileInfo[-v7 + 6].var0;
    if (*(_WORD *)profileInfo[-v7 + 6].var0)
    {
      uint64_t v9 = *(unsigned int *)profileInfo[v8].var0;
      uint64_t v10 = &profileInfo[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)profileInfo->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)profileInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)capturedTime
{
  profileInfo = self->_profileInfo;
  uint64_t v3 = &profileInfo[-*(int *)profileInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    uint64_t v5 = sub_1BC3B83C8((unsigned int *)profileInfo[v4 + *(unsigned int *)profileInfo[v4].var0].var0);
    id v6 = sub_1BC3B7F04(v5);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unsigned)datasetCount
{
  profileInfo = self->_profileInfo;
  uint64_t v3 = &profileInfo[-*(int *)profileInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(unsigned __int16 *)profileInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (KVProfileInfo)initWithBuffer:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v67.receiver = self;
  v67.super_class = (Class)KVProfileInfo;
  uint64_t v8 = [(KVProfileInfo *)&v67 init];
  uint64_t v9 = v8;
  if (v8)
  {
    p_buffer = (void **)&v8->_buffer;
    objc_storeStrong((id *)&v8->_buffer, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(*p_buffer, v11, v12, v13, v14, v15))
    {
      uint64_t v17 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v11, v16, v13, v14, v15);
      v9->_profileInfo = (const ProfileInfo *)v17 + *v17;
      v23 = (char *)objc_msgSend_bytes(v9->_buffer, v18, v19, v20, v21, v22);
      unint64_t v29 = objc_msgSend_length(*p_buffer, v24, v25, v26, v27, v28);
      v62 = v23;
      unint64_t v63 = v29;
      long long v64 = xmmword_1BC3E47C0;
      uint64_t v65 = 0;
      char v66 = 1;
      if (v29 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      if (v29 >= 5)
      {
        unint64_t v32 = *(unsigned int *)v23;
        if ((int)v32 >= 1 && v29 - 1 >= v32)
        {
          uint64_t v33 = (int *)&v23[v32];
          if (sub_1BC3B88C8((uint64_t *)&v62, (int *)&v23[v32]) && sub_1BC3B8980(v33, &v62, 4u))
          {
            uint64_t v34 = (unsigned __int16 *)((char *)v33 - *v33);
            if (*v34 >= 5u && (uint64_t v35 = v34[2]) != 0) {
              v36 = (unsigned int *)((char *)v33 + v35 + *(unsigned int *)((char *)v33 + v35));
            }
            else {
              v36 = 0;
            }
            if (sub_1BC3B89D8(&v62, v36) && sub_1BC3B8980(v33, &v62, 6u))
            {
              uint64_t v46 = (unsigned __int16 *)((char *)v33 - *v33);
              if (*v46 >= 7u && (uint64_t v47 = v46[3]) != 0) {
                v48 = (unsigned int *)((char *)v33 + v47 + *(unsigned int *)((char *)v33 + v47));
              }
              else {
                v48 = 0;
              }
              if (sub_1BC3B89D8(&v62, v48) && sub_1BC3B8980(v33, &v62, 8u))
              {
                v49 = (unsigned __int16 *)((char *)v33 - *v33);
                if (*v49 >= 9u && (uint64_t v50 = v49[4]) != 0) {
                  uint64_t v51 = (unsigned int *)((char *)v33 + v50 + *(unsigned int *)((char *)v33 + v50));
                }
                else {
                  uint64_t v51 = 0;
                }
                if (sub_1BC3B89D8(&v62, v51))
                {
                  uint64_t v52 = (unsigned __int16 *)((char *)v33 - *v33);
                  if (*v52 < 0xBu) {
                    goto LABEL_35;
                  }
                  uint64_t v53 = v52[5];
                  if (!v53 || v63 >= 3 && v63 - 2 >= (char *)v33 + v53 - v62) {
                    goto LABEL_35;
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v69 = @"ProfileInfo failed verification";
      uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v69, (uint64_t)&v68, 1, v31);
      uint64_t v59 = objc_msgSend_errorWithDomain_code_userInfo_(v55, v57, @"com.apple.koa.profile", 5, (uint64_t)v56, v58);
      uint64_t v60 = v59;
      if (a4 && v59) {
        *a4 = v59;
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      uint64_t v38 = objc_msgSend_stringWithFormat_(NSString, v11, @"Unexpected ProfileInfo buffer: %@", v13, v14, v15, *p_buffer);
      v71[0] = v38;
      uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)v71, (uint64_t)&v70, 1, v40);
      uint64_t v44 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v42, @"com.apple.koa.profile", 5, (uint64_t)v41, v43);
      uint64_t v45 = v44;
      if (a4 && v44) {
        *a4 = v44;
      }
    }
    v54 = 0;
    goto LABEL_41;
  }
LABEL_35:
  v54 = v9;
LABEL_41:

  return v54;
}

- (KVProfileInfo)initWithDatasetCount:(unsigned int)a3 capturedTime:(id)a4 deviceType:(id)a5 buildVersion:(id)a6 error:(id *)a7
{
  unsigned __int16 v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v74 = 0;
  char v75 = 0;
  long long v76 = xmmword_1BC3E47D0;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v79 = 0;
  uint64_t v80 = 1;
  __int16 v81 = 256;
  uint64_t v82 = 0;
  if (objc_msgSend_length(v11, v13, v14, v15, v16, v17))
  {
    id v23 = v11;
    unint64_t v29 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26, v27, v28);
    size_t v30 = strlen(v29);
    unsigned int v31 = sub_1BC3B8D60((uint64_t)&v74, v29, v30);
  }
  else
  {
    unsigned int v31 = 0;
  }
  if (!objc_msgSend_length(v12, v18, v19, v20, v21, v22, a7, self))
  {
    unsigned int v45 = 0;
    if (v10) {
      goto LABEL_6;
    }
LABEL_8:
    unsigned int v54 = 0;
    goto LABEL_9;
  }
  id v37 = v12;
  uint64_t v43 = (const char *)objc_msgSend_UTF8String(v37, v38, v39, v40, v41, v42);
  size_t v44 = strlen(v43);
  unsigned int v45 = sub_1BC3B8D60((uint64_t)&v74, v43, v44);
  if (!v10) {
    goto LABEL_8;
  }
LABEL_6:
  objc_msgSend_ISO8601String(v10, v32, v33, v34, v35, v36);
  id v46 = objc_claimAutoreleasedReturnValue();
  uint64_t v52 = (const char *)objc_msgSend_UTF8String(v46, v47, v48, v49, v50, v51);
  size_t v53 = strlen(v52);
  LODWORD(v52) = sub_1BC3B8D60((uint64_t)&v74, v52, v53);

  unsigned int v54 = v52;
LABEL_9:
  sub_1BC3B8E08((uint64_t)&v74);
  BYTE6(v79) = 1;
  int v55 = v78;
  int v56 = v77;
  int v57 = DWORD2(v77);
  sub_1BC3B8E6C(&v74, 4, v54);
  sub_1BC3B8E6C(&v74, 6, v31);
  sub_1BC3B8E6C(&v74, 8, v45);
  sub_1BC3B8EBC((unint64_t)&v74, 10, v9);
  unsigned int v58 = sub_1BC3B8F6C((uint64_t)&v74, v56 - v55 + v57);
  sub_1BC3B9208((uint64_t)&v74, v58, 0, 0);
  id v59 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v60 = sub_1BC3B930C((uint64_t)&v74);
  long long v64 = objc_msgSend_initWithBytes_length_(v59, v61, v60, (v77 - v78 + DWORD2(v77)), v62, v63);
  uint64_t v68 = (KVProfileInfo *)(id)objc_msgSend_initWithBuffer_error_(v73, v65, (uint64_t)v64, v71, v66, v67);

  sub_1BC3B9370(&v74);
  return v68;
}

- (KVProfileInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)capturedWithDatasetCount:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v12 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v7, v8, v9, v10, v11);
  uint64_t v13 = (void *)MGCopyAnswer();
  uint64_t v14 = (void *)MGCopyAnswer();
  uint64_t v16 = objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(v6, v15, v5, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, a4);

  return v16;
}

+ (id)syntheticWithDatasetCount:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_initWithDatasetCount_capturedTime_deviceType_buildVersion_error_(v6, v7, v5, 0, 0, 0, a4);
  return v8;
}

@end