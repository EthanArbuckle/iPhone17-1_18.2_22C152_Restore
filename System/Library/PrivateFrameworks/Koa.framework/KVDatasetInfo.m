@interface KVDatasetInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDatasetInfo:(id)a3;
- (KVDatasetInfo)init;
- (KVDatasetInfo)initWithBuffer:(id)a3 error:(id *)a4;
- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 lastModifiedTime:(id)a7 capturedTime:(id)a8 itemCount:(unsigned int)a9 error:(id *)a10;
- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 itemCount:(unsigned int)a5 error:(id *)a6;
- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 itemCount:(unsigned int)a6 error:(id *)a7;
- (KVDatasetInfo)initWithSizePrefixedBuffer:(id)a3 error:(id *)a4;
- (NSData)buffer;
- (NSString)description;
- (id)JSONWithIndent:(unsigned __int8)a3;
- (id)capturedTime;
- (id)deviceId;
- (id)initFromDictionary:(id)a3 error:(id *)a4;
- (id)lastModifiedTime;
- (id)originAppId;
- (id)userId;
- (int64_t)itemType;
- (unint64_t)hash;
- (unsigned)itemCount;
@end

@implementation KVDatasetInfo

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

- (BOOL)isEqualToDatasetInfo:(id)a3
{
  buffer = self->_buffer;
  v7 = objc_msgSend_buffer(a3, a2, (uint64_t)a3, v3, v4, v5);
  LOBYTE(buffer) = objc_msgSend_isEqual_(buffer, v8, (uint64_t)v7, v9, v10, v11);

  return (char)buffer;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVDatasetInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToDatasetInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToDatasetInfo = objc_msgSend_isEqualToDatasetInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToDatasetInfo = 0;
  }

  return isEqualToDatasetInfo;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v52 = objc_msgSend_objectForKey_(v4, v5, @"itemType", v6, v7, v8);
  uint64_t v9 = KVItemTypeFromName(v52);
  v51 = objc_msgSend_objectForKey_(v4, v10, @"originAppId", v11, v12, v13);
  v50 = objc_msgSend_objectForKey_(v4, v14, @"deviceId", v15, v16, v17);
  v49 = objc_msgSend_objectForKey_(v4, v18, @"userId", v19, v20, v21);
  v26 = objc_msgSend_objectForKey_(v4, v22, @"lastModifiedTime", v23, v24, v25);
  v27 = sub_1BC3B7F04(v26);
  v32 = objc_msgSend_objectForKey_(v4, v28, @"capturedTime", v29, v30, v31);
  v33 = sub_1BC3B7F04(v32);
  v38 = objc_msgSend_objectForKey_(v4, v34, @"itemCount", v35, v36, v37);
  int v47 = objc_msgSend_unsignedIntValue(v38, v39, v40, v41, v42, v43);
  ModifiedTime_capturedTime_itemCount_error = objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, v44, v9, (uint64_t)v51, (uint64_t)v50, (uint64_t)v49, v27, v33, v47, a4);

  return ModifiedTime_capturedTime_itemCount_error;
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  uint64_t v5 = sub_1BC3D4D78(a3);
  uint64_t v6 = sub_1BC3D4D78(a3 + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v7, v8, @"%@{\n", v9, v10, v11, v5);
  unsigned __int16 v17 = objc_msgSend_itemType(self, v12, v13, v14, v15, v16);
  if (v17 - 1 >= 0x1A) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v17;
  }
  v22 = objc_msgSend_stringWithCString_encoding_(NSString, v18, (uint64_t)off_1E62AD038[v21], 4, v19, v20);
  objc_msgSend_appendFormat_(v7, v23, @"%@\"%@\": \"%@\",\n", v24, v25, v26, v6, @"itemType", v22);

  v32 = objc_msgSend_originAppId(self, v27, v28, v29, v30, v31);
  objc_msgSend_appendFormat_(v7, v33, @"%@\"%@\": \"%@\",\n", v34, v35, v36, v6, @"originAppId", v32);

  uint64_t v42 = objc_msgSend_deviceId(self, v37, v38, v39, v40, v41);
  v48 = (void *)v42;
  if (v42)
  {
    v49 = sub_1BC3D4E00(v42, v43, v44, v45, v46, v47);
    objc_msgSend_appendFormat_(v7, v50, @"%@\"%@\": %@,\n", v51, v52, v53, v6, @"deviceId", v49);
  }
  uint64_t v54 = objc_msgSend_userId(self, v43, v44, v45, v46, v47);
  v60 = (void *)v54;
  if (v54)
  {
    v61 = sub_1BC3D4E00(v54, v55, v56, v57, v58, v59);
    objc_msgSend_appendFormat_(v7, v62, @"%@\"%@\": %@,\n", v63, v64, v65, v6, @"userId", v61);
  }
  v66 = objc_msgSend_lastModifiedTime(self, v55, v56, v57, v58, v59);
  v72 = v66;
  if (v66)
  {
    v73 = objc_msgSend_ISO8601String(v66, v67, v68, v69, v70, v71);
    objc_msgSend_appendFormat_(v7, v74, @"%@\"%@\": \"%@\",\n", v75, v76, v77, v6, @"lastModifiedTime", v73);
  }
  v78 = objc_msgSend_capturedTime(self, v67, v68, v69, v70, v71);
  v84 = v78;
  if (v78)
  {
    v85 = objc_msgSend_ISO8601String(v78, v79, v80, v81, v82, v83);
    objc_msgSend_appendFormat_(v7, v86, @"%@\"%@\": \"%@\",\n", v87, v88, v89, v6, @"capturedTime", v85);
  }
  uint64_t v90 = objc_msgSend_itemCount(self, v79, v80, v81, v82, v83);
  objc_msgSend_appendFormat_(v7, v91, @"%@\"%@\": %u,\n", v92, v93, v94, v6, @"itemCount", v90);
  objc_msgSend_appendFormat_(v7, v95, @"%@}", v96, v97, v98, v5);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2, v3, v4);
}

- (unsigned)itemCount
{
  datasetInfo = self->_datasetInfo;
  uint64_t v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
    return *(_DWORD *)datasetInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (id)capturedTime
{
  datasetInfo = self->_datasetInfo;
  uint64_t v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0)
  {
    uint64_t v5 = sub_1BC3B83C8((unsigned int *)datasetInfo[v4 + *(unsigned int *)datasetInfo[v4].var0].var0);
    uint64_t v6 = sub_1BC3B7F04(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)lastModifiedTime
{
  datasetInfo = self->_datasetInfo;
  uint64_t v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0)
  {
    uint64_t v5 = sub_1BC3B83C8((unsigned int *)datasetInfo[v4 + *(unsigned int *)datasetInfo[v4].var0].var0);
    uint64_t v6 = sub_1BC3B7F04(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)userId
{
  uint64_t v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0)
  {
    id v4 = [NSString alloc];
    datasetInfo = self->_datasetInfo;
    uint64_t v7 = *(int *)datasetInfo->var0;
    uint64_t v8 = *(unsigned __int16 *)datasetInfo[-v7 + 10].var0;
    if (*(_WORD *)datasetInfo[-v7 + 10].var0)
    {
      uint64_t v9 = *(unsigned int *)datasetInfo[v8].var0;
      uint64_t v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)datasetInfo->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)deviceId
{
  uint64_t v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    id v4 = [NSString alloc];
    datasetInfo = self->_datasetInfo;
    uint64_t v7 = *(int *)datasetInfo->var0;
    uint64_t v8 = *(unsigned __int16 *)datasetInfo[-v7 + 8].var0;
    if (*(_WORD *)datasetInfo[-v7 + 8].var0)
    {
      uint64_t v9 = *(unsigned int *)datasetInfo[v8].var0;
      uint64_t v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)datasetInfo->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)originAppId
{
  uint64_t v2 = &self->_datasetInfo[-*(int *)self->_datasetInfo];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    id v4 = [NSString alloc];
    datasetInfo = self->_datasetInfo;
    uint64_t v7 = *(int *)datasetInfo->var0;
    uint64_t v8 = *(unsigned __int16 *)datasetInfo[-v7 + 6].var0;
    if (*(_WORD *)datasetInfo[-v7 + 6].var0)
    {
      uint64_t v9 = *(unsigned int *)datasetInfo[v8].var0;
      uint64_t v10 = &datasetInfo[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)datasetInfo->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)datasetInfo[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (int64_t)itemType
{
  datasetInfo = self->_datasetInfo;
  uint64_t v3 = &datasetInfo[-*(int *)datasetInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(unsigned __int16 *)datasetInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (KVDatasetInfo)initWithBuffer:(id)a3 error:(id *)a4
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v72.receiver = self;
  v72.super_class = (Class)KVDatasetInfo;
  uint64_t v8 = [(KVDatasetInfo *)&v72 init];
  uint64_t v9 = v8;
  if (v8)
  {
    p_buffer = (void **)&v8->_buffer;
    objc_storeStrong((id *)&v8->_buffer, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(*p_buffer, v11, v12, v13, v14, v15))
    {
      unsigned __int16 v17 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v11, v16, v13, v14, v15);
      v9->_datasetInfo = (const DatasetInfo *)v17 + *v17;
      uint64_t v23 = objc_msgSend_bytes(v9->_buffer, v18, v19, v20, v21, v22);
      unint64_t v29 = objc_msgSend_length(*p_buffer, v24, v25, v26, v27, v28);
      uint64_t v67 = v23;
      unint64_t v68 = v29;
      long long v69 = xmmword_1BC3E47C0;
      uint64_t v70 = 0;
      char v71 = 1;
      if (v29 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      datasetInfo = (int *)v9->_datasetInfo;
      if (!datasetInfo) {
        goto LABEL_50;
      }
      if (sub_1BC3B88C8(&v67, (int *)v9->_datasetInfo))
      {
        v33 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
        unsigned int v34 = *v33;
        if ((v34 < 5 || !v33[2] || v68 >= 3 && v68 - 2 >= (unint64_t)datasetInfo + v33[2] - v67)
          && sub_1BC3B8980(datasetInfo, &v67, 6u))
        {
          uint64_t v35 = v34 >= 7 && v33[3]
              ? (unsigned int *)((char *)datasetInfo + v33[3] + *(unsigned int *)((char *)datasetInfo + v33[3]))
              : 0;
          if (sub_1BC3B89D8(&v67, v35) && sub_1BC3B8980(datasetInfo, &v67, 8u))
          {
            uint64_t v45 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
            if (*v45 >= 9u && (uint64_t v46 = v45[4]) != 0) {
              uint64_t v47 = (unsigned int *)((char *)datasetInfo + v46 + *(unsigned int *)((char *)datasetInfo + v46));
            }
            else {
              uint64_t v47 = 0;
            }
            if (sub_1BC3B89D8(&v67, v47) && sub_1BC3B8980(datasetInfo, &v67, 0xAu))
            {
              v48 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
              if (*v48 >= 0xBu && (uint64_t v49 = v48[5]) != 0) {
                v50 = (unsigned int *)((char *)datasetInfo + v49 + *(unsigned int *)((char *)datasetInfo + v49));
              }
              else {
                v50 = 0;
              }
              if (sub_1BC3B89D8(&v67, v50) && sub_1BC3B8980(datasetInfo, &v67, 0xCu))
              {
                uint64_t v51 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                if (*v51 >= 0xDu && (uint64_t v52 = v51[6]) != 0) {
                  uint64_t v53 = (unsigned int *)((char *)datasetInfo + v52 + *(unsigned int *)((char *)datasetInfo + v52));
                }
                else {
                  uint64_t v53 = 0;
                }
                if (sub_1BC3B89D8(&v67, v53) && sub_1BC3B8980(datasetInfo, &v67, 0xEu))
                {
                  uint64_t v54 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                  if (*v54 >= 0xFu && (uint64_t v55 = v54[7]) != 0) {
                    uint64_t v56 = (unsigned int *)((char *)datasetInfo + v55 + *(unsigned int *)((char *)datasetInfo + v55));
                  }
                  else {
                    uint64_t v56 = 0;
                  }
                  if (sub_1BC3B89D8(&v67, v56))
                  {
                    uint64_t v57 = (unsigned __int16 *)((char *)datasetInfo - *datasetInfo);
                    if (*v57 < 0x11u) {
                      goto LABEL_50;
                    }
                    uint64_t v58 = v57[8];
                    if (!v58 || v68 >= 5 && v68 - 4 >= (unint64_t)datasetInfo + v58 - v67) {
                      goto LABEL_50;
                    }
                  }
                }
              }
            }
          }
        }
      }
      v60 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v74 = @"DatasetInfo failed verification";
      v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)&v74, (uint64_t)&v73, 1, v32);
      uint64_t v64 = objc_msgSend_errorWithDomain_code_userInfo_(v60, v62, @"com.apple.koa.profile", 6, (uint64_t)v61, v63);
      uint64_t v65 = v64;
      if (a4 && v64) {
        *a4 = v64;
      }
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      uint64_t v37 = objc_msgSend_stringWithFormat_(NSString, v11, @"Unexpected DatasetInfo buffer: %@", v13, v14, v15, *p_buffer);
      v76[0] = v37;
      uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v76, (uint64_t)&v75, 1, v39);
      uint64_t v43 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v41, @"com.apple.koa.profile", 6, (uint64_t)v40, v42);
      uint64_t v44 = v43;
      if (a4 && v43) {
        *a4 = v43;
      }
    }
    uint64_t v59 = 0;
    goto LABEL_56;
  }
LABEL_50:
  uint64_t v59 = v9;
LABEL_56:

  return v59;
}

- (KVDatasetInfo)initWithSizePrefixedBuffer:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend_length(v6, v7, v8, v9, v10, v11))
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9B8];
    id v17 = v6;
    uint64_t v23 = objc_msgSend_bytes(v17, v18, v19, v20, v21, v22);
    id v24 = v17;
    uint64_t v30 = (unsigned int *)objc_msgSend_bytes(v24, v25, v26, v27, v28, v29);
    v33 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v16, v31, v23 + 4, *v30, 0, v32);
    self = (KVDatasetInfo *)(id)objc_msgSend_initWithBuffer_error_(self, v34, (uint64_t)v33, (uint64_t)a4, v35, v36);

    uint64_t v37 = self;
  }
  else
  {
    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = objc_msgSend_stringWithFormat_(NSString, v12, @"Invalid size prefixed buffer: %@", v13, v14, v15, v6, *MEMORY[0x1E4F28568]);
    v49[0] = v39;
    uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v49, (uint64_t)&v48, 1, v41);
    uint64_t v45 = objc_msgSend_errorWithDomain_code_userInfo_(v38, v43, @"com.apple.koa.profile", 6, (uint64_t)v42, v44);
    uint64_t v46 = v45;
    if (a4 && v45) {
      *a4 = v45;
    }

    uint64_t v37 = 0;
  }

  return v37;
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 lastModifiedTime:(id)a7 capturedTime:(id)a8 itemCount:(unsigned int)a9 error:(id *)a10
{
  unsigned __int16 v14 = a3;
  id v15 = a4;
  id v102 = a5;
  id v101 = a6;
  id v100 = a7;
  id v16 = a8;
  uint64_t v103 = 0;
  char v104 = 0;
  long long v105 = xmmword_1BC3E47D0;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v108 = 0;
  uint64_t v109 = 1;
  __int16 v110 = 256;
  uint64_t v111 = 0;
  uint64_t v98 = v15;
  if (objc_msgSend_length(v15, v17, v18, v19, v20, v21))
  {
    id v27 = v15;
    v33 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31, v32);
    size_t v34 = strlen(v33);
    unsigned int v35 = sub_1BC3B8D60((uint64_t)&v103, v33, v34);
  }
  else
  {
    unsigned int v35 = 0;
  }
  if (objc_msgSend_length(v102, v22, v23, v24, v25, v26))
  {
    id v41 = v102;
    uint64_t v47 = (const char *)objc_msgSend_UTF8String(v41, v42, v43, v44, v45, v46);
    size_t v48 = strlen(v47);
    unsigned int v49 = sub_1BC3B8D60((uint64_t)&v103, v47, v48);
  }
  else
  {
    unsigned int v49 = 0;
  }
  if (objc_msgSend_length(v101, v36, v37, v38, v39, v40))
  {
    id v55 = v101;
    v61 = (const char *)objc_msgSend_UTF8String(v55, v56, v57, v58, v59, v60);
    size_t v62 = strlen(v61);
    unsigned int v63 = sub_1BC3B8D60((uint64_t)&v103, v61, v62);
  }
  else
  {
    unsigned int v63 = 0;
  }
  if (!v100)
  {
    unsigned int v72 = 0;
    if (v16) {
      goto LABEL_12;
    }
LABEL_14:
    unsigned __int16 v73 = v14;
    unsigned int v82 = 0;
    goto LABEL_15;
  }
  objc_msgSend_ISO8601String(v100, v50, v51, v52, v53, v54);
  id v64 = objc_claimAutoreleasedReturnValue();
  uint64_t v70 = (const char *)objc_msgSend_UTF8String(v64, v65, v66, v67, v68, v69);
  size_t v71 = strlen(v70);
  LODWORD(v70) = sub_1BC3B8D60((uint64_t)&v103, v70, v71);

  unsigned int v72 = v70;
  if (!v16) {
    goto LABEL_14;
  }
LABEL_12:
  unsigned __int16 v73 = v14;
  objc_msgSend_ISO8601String(v16, v50, v51, v52, v53, v54);
  id v74 = objc_claimAutoreleasedReturnValue();
  uint64_t v80 = (const char *)objc_msgSend_UTF8String(v74, v75, v76, v77, v78, v79);
  size_t v81 = strlen(v80);
  LODWORD(v80) = sub_1BC3B8D60((uint64_t)&v103, v80, v81);

  unsigned int v82 = v80;
LABEL_15:
  sub_1BC3B8E08((uint64_t)&v103);
  BYTE6(v108) = 1;
  int v83 = v107;
  int v84 = v106;
  int v85 = DWORD2(v106);
  sub_1BC3B8EBC((unint64_t)&v103, 4, v73);
  sub_1BC3B8E6C(&v103, 6, v35);
  sub_1BC3B8E6C(&v103, 8, v49);
  sub_1BC3B8E6C(&v103, 10, v63);
  sub_1BC3B8E6C(&v103, 12, v72);
  sub_1BC3B8E6C(&v103, 14, v82);
  sub_1BC3B9980((unint64_t)&v103, 16, a9);
  unsigned int v86 = sub_1BC3B8F6C((uint64_t)&v103, v84 - v83 + v85);
  sub_1BC3B9208((uint64_t)&v103, v86, 0, 0);
  id v87 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v88 = sub_1BC3B930C((uint64_t)&v103);
  uint64_t v92 = objc_msgSend_initWithBytes_length_(v87, v89, v88, (v106 - v107 + DWORD2(v106)), v90, v91);
  uint64_t v96 = (KVDatasetInfo *)(id)objc_msgSend_initWithBuffer_error_(self, v93, (uint64_t)v92, (uint64_t)a10, v94, v95);

  sub_1BC3B9370(&v103);
  return v96;
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 itemCount:(unsigned int)a6 error:(id *)a7
{
  return (KVDatasetInfo *)objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, a2, a3, (uint64_t)a4, 0, (uint64_t)a5, 0, 0, a6, a7);
}

- (KVDatasetInfo)initWithItemType:(int64_t)a3 originAppId:(id)a4 itemCount:(unsigned int)a5 error:(id *)a6
{
  return (KVDatasetInfo *)objc_msgSend_initWithItemType_originAppId_deviceId_userId_lastModifiedTime_capturedTime_itemCount_error_(self, a2, a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6);
}

- (KVDatasetInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end