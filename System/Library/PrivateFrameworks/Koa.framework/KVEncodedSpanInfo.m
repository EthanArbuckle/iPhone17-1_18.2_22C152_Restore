@interface KVEncodedSpanInfo
+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4;
- (BOOL)isAliasMatch;
- (BOOL)isApproximateMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanInfo:(id)a3;
- (BOOL)isPartialMatch;
- (KVEncodedSpanInfo)initWithBuffer:(id)a3 verify:(BOOL)a4 value:(id)a5 error:(id *)a6;
- (KVEncodedSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14;
- (_NSRange)spanRange;
- (float)matchScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodedString;
- (id)getAliasTypesArray;
- (id)value;
- (unint64_t)hash;
- (unsigned)aliasMatchOptions;
- (unsigned)editDistance;
- (unsigned)matchedAliasCount;
- (unsigned)matchedStopWordCount;
- (unsigned)matchedTokenCount;
- (unsigned)maxAliasCount;
- (unsigned)maxStopWordCount;
- (unsigned)maxTokenCount;
@end

@implementation KVEncodedSpanInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)getAliasTypesArray
{
  v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v13 = *(int *)encodedSpanInfo->var0;
  v14 = &encodedSpanInfo[-v13];
  if (*(unsigned __int16 *)encodedSpanInfo[-v13].var0 >= 0x19u)
  {
    uint64_t v15 = -v13;
    uint64_t v16 = *(unsigned __int16 *)v14[24].var0;
    if (v16 && (*(_WORD *)encodedSpanInfo[v16].var0 & 1) != 0)
    {
      v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, 1, v8, v9, v10);
      objc_msgSend_addObject_(v11, v18, (uint64_t)v17, v19, v20, v21);

      encodedSpanInfo = self->_encodedSpanInfo;
      uint64_t v22 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v22].var0 < 0x19u) {
        goto LABEL_17;
      }
      uint64_t v15 = -v22;
    }
    if (*(_WORD *)encodedSpanInfo[v15 + 24].var0
      && (*(_WORD *)encodedSpanInfo[*(unsigned __int16 *)encodedSpanInfo[v15 + 24].var0].var0 & 2) != 0)
    {
      v23 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, 2, v8, v9, v10);
      objc_msgSend_addObject_(v11, v24, (uint64_t)v23, v25, v26, v27);

      encodedSpanInfo = self->_encodedSpanInfo;
      uint64_t v28 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v28].var0 < 0x19u) {
        goto LABEL_17;
      }
      uint64_t v15 = -v28;
    }
    if (*(_WORD *)encodedSpanInfo[v15 + 24].var0
      && (*(_WORD *)encodedSpanInfo[*(unsigned __int16 *)encodedSpanInfo[v15 + 24].var0].var0 & 4) != 0)
    {
      v29 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, 4, v8, v9, v10);
      objc_msgSend_addObject_(v11, v30, (uint64_t)v29, v31, v32, v33);

      encodedSpanInfo = self->_encodedSpanInfo;
      uint64_t v34 = *(int *)encodedSpanInfo->var0;
      if (*(unsigned __int16 *)encodedSpanInfo[-v34].var0 < 0x19u) {
        goto LABEL_17;
      }
      uint64_t v15 = -v34;
    }
    uint64_t v35 = *(unsigned __int16 *)encodedSpanInfo[v15 + 24].var0;
    if (v35 && (*(_WORD *)encodedSpanInfo[v35].var0 & 8) != 0)
    {
      v36 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, 8, v8, v9, v10);
      objc_msgSend_addObject_(v11, v37, (uint64_t)v36, v38, v39, v40);
    }
  }
LABEL_17:
  return v11;
}

- (unsigned)aliasMatchOptions
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x19u && (uint64_t v4 = *(unsigned __int16 *)v3[24].var0) != 0) {
    return *(_WORD *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)isAliasMatch
{
  return objc_msgSend_matchedAliasCount(self, a2, v2, v3, v4, v5) != 0;
}

- (BOOL)isApproximateMatch
{
  return objc_msgSend_editDistance(self, a2, v2, v3, v4, v5) != 0;
}

- (BOOL)isPartialMatch
{
  int v7 = objc_msgSend_matchedTokenCount(self, a2, v2, v3, v4, v5);
  return v7 != objc_msgSend_maxTokenCount(self, v8, v9, v10, v11, v12);
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_value, a2, v2, v3, v4, v5);
  return objc_msgSend_hash(self->_buffer, v8, v9, v10, v11, v12) ^ v7;
}

- (id)description
{
  value = self->_value;
  if (value)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"value: \"%@\" ", v3, v4, v5, value);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_1F15F1CC8;
  }
  v69 = NSString;
  uint64_t v9 = (void *)MEMORY[0x1E4F29238];
  uint64_t v10 = objc_msgSend_spanRange(self, a2, v2, v3, v4, v5);
  v14 = objc_msgSend_valueWithRange_(v9, v11, v10, (uint64_t)v11, v12, v13);
  uint64_t v20 = objc_msgSend_matchedTokenCount(self, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_maxTokenCount(self, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_matchedStopWordCount(self, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_maxStopWordCount(self, v33, v34, v35, v36, v37);
  uint64_t v44 = objc_msgSend_matchedAliasCount(self, v39, v40, v41, v42, v43);
  uint64_t v50 = objc_msgSend_maxAliasCount(self, v45, v46, v47, v48, v49);
  uint64_t v56 = objc_msgSend_editDistance(self, v51, v52, v53, v54, v55);
  objc_msgSend_matchScore(self, v57, v58, v59, v60, v61);
  v67 = objc_msgSend_stringWithFormat_(v69, v63, @"%@%@ tokens matched: (%u/%u) stop words: (%u/%u) alias: (%u/%u) edit distance: %u match score: %f", v64, v65, v66, v8, v14, v20, v26, v32, v38, v44, v50, v56, v62);

  return v67;
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  uint64_t v5 = (uint64_t *)a3;
  uint64_t v11 = v5;
  uint64_t v12 = 16;
  value = self->_value;
  v14 = value;
  if (!value)
  {
    uint64_t v3 = objc_msgSend_value(v5, v6, v7, v8, v9, v10);
    if (!v3)
    {
      int v19 = 0;
LABEL_8:
      char isEqual = objc_msgSend_isEqual_(self->_buffer, v6, v11[3], v8, v9, v10);
      if (!v19) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    v14 = self->_value;
  }
  uint64_t v12 = objc_msgSend_value(v11, v6, v7, v8, v9, v10);
  if (objc_msgSend_isEqual_(v14, v15, v12, v16, v17, v18))
  {
    int v19 = 1;
    goto LABEL_8;
  }
  char isEqual = 0;
LABEL_9:

LABEL_10:
  if (!value) {

  }
  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVEncodedSpanInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_value, v11, (uint64_t)a3, v12, v13, v14);
  uint64_t v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_buffer, v17, (uint64_t)a3, v18, v19, v20);
  uint64_t v22 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v21;

  uint64_t v28 = (unsigned int *)objc_msgSend_bytes(*(void **)(v10 + 24), v23, v24, v25, v26, v27);
  *(void *)(v10 + 32) = (char *)v28 + *v28;
  return (id)v10;
}

- (unsigned)editDistance
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)matchedAliasCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)maxAliasCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)matchedStopWordCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)maxStopWordCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)matchedTokenCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (unsigned)maxTokenCount
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(unsigned __int16 *)encodedSpanInfo[v4].var0;
  }
  else {
    return 0;
  }
}

- (float)matchScore
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 9u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[8].var0;
    if (v5) {
      return *(float *)encodedSpanInfo[v5].var0;
    }
  }
  return result;
}

- (id)value
{
  return self->_value;
}

- (_NSRange)spanRange
{
  encodedSpanInfo = self->_encodedSpanInfo;
  uint64_t v3 = &encodedSpanInfo[-*(int *)encodedSpanInfo->var0];
  unsigned int v4 = *(unsigned __int16 *)v3->var0;
  if (v4 < 5)
  {
    LODWORD(v5) = 0;
LABEL_8:
    NSUInteger v7 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
  if (*(_WORD *)v3[4].var0) {
    LODWORD(v5) = *(unsigned __int16 *)encodedSpanInfo[v5].var0;
  }
  if (v4 < 7) {
    goto LABEL_8;
  }
  uint64_t v6 = *(unsigned __int16 *)v3[6].var0;
  if (!v6) {
    goto LABEL_8;
  }
  NSUInteger v7 = *(unsigned __int16 *)encodedSpanInfo[v6].var0;
LABEL_9:
  NSUInteger v8 = v5;
  result.length = v7;
  result.location = v8;
  return result;
}

- (id)encodedString
{
  return (id)((uint64_t (*)(NSData *, char *, void))MEMORY[0x1F4181798])(self->_buffer, sel_base64EncodedStringWithOptions_, 0);
}

- (KVEncodedSpanInfo)initWithBuffer:(id)a3 verify:(BOOL)a4 value:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v92[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  v88.receiver = self;
  v88.super_class = (Class)KVEncodedSpanInfo;
  uint64_t v13 = [(KVSpanInfo *)&v88 initWithSpanInfo:0];
  uint64_t v14 = v13;
  if (v13)
  {
    p_buffer = (void **)&v13->_buffer;
    objc_storeStrong((id *)&v13->_buffer, a3);
    objc_storeStrong((id *)&v14->_value, a5);
    if (objc_msgSend_length(*p_buffer, v16, v17, v18, v19, v20))
    {
      uint64_t v26 = (unsigned int *)objc_msgSend_bytes(*p_buffer, v21, v22, v23, v24, v25);
      v14->_encodedSpanInfo = (const SpanInfo *)v26 + *v26;
      if (!v8) {
        goto LABEL_53;
      }
      uint64_t v32 = (char *)objc_msgSend_bytes(*p_buffer, v27, v28, v29, v30, v31);
      unint64_t v38 = objc_msgSend_length(*p_buffer, v33, v34, v35, v36, v37);
      v83 = v32;
      unint64_t v84 = v38;
      long long v85 = xmmword_1BC3E47C0;
      uint64_t v86 = 0;
      char v87 = 1;
      if (v38 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      if (v38 >= 5)
      {
        unint64_t v44 = *(unsigned int *)v32;
        if ((int)v44 >= 1 && v38 - 1 >= v44)
        {
          v45 = (int *)&v32[v44];
          if (sub_1BC3B88C8((uint64_t *)&v83, v45))
          {
            uint64_t v46 = (unsigned __int16 *)((char *)v45 - *v45);
            unsigned int v47 = *v46;
            if (v47 < 5) {
              goto LABEL_53;
            }
            if (!v46[2] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[2] - v83)
            {
              if (v47 < 7) {
                goto LABEL_53;
              }
              if (!v46[3] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[3] - v83)
              {
                if (v47 < 9) {
                  goto LABEL_53;
                }
                if (!v46[4] || v84 >= 5 && v84 - 4 >= (char *)v45 + v46[4] - v83)
                {
                  if (v47 < 0xB) {
                    goto LABEL_53;
                  }
                  if (!v46[5] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[5] - v83)
                  {
                    if (v47 < 0xD) {
                      goto LABEL_53;
                    }
                    if (!v46[6] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[6] - v83)
                    {
                      if (v47 < 0xF) {
                        goto LABEL_53;
                      }
                      if (!v46[7] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[7] - v83)
                      {
                        if (v47 < 0x11) {
                          goto LABEL_53;
                        }
                        if (!v46[8] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[8] - v83)
                        {
                          if (v47 < 0x13) {
                            goto LABEL_53;
                          }
                          if (!v46[9] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[9] - v83)
                          {
                            if (v47 < 0x15) {
                              goto LABEL_53;
                            }
                            if (!v46[10] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[10] - v83)
                            {
                              if (v47 < 0x17) {
                                goto LABEL_53;
                              }
                              if (!v46[11] || v84 >= 3 && v84 - 2 >= (char *)v45 + v46[11] - v83)
                              {
                                if (v47 < 0x19) {
                                  goto LABEL_53;
                                }
                                uint64_t v48 = v46[12];
                                if (!v48 || v84 >= 3 && v84 - 2 >= (char *)v45 + v48 - v83) {
                                  goto LABEL_53;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v66 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v89 = *MEMORY[0x1E4F28568];
      v67 = NSString;
      v68 = *p_buffer;
      v69 = objc_msgSend_encodedString(v14, v39, v40, v41, v42, v43);
      v74 = objc_msgSend_stringWithFormat_(v67, v70, @"Failed to verify spanInfo buffer: %@ (encoded string: %@)", v71, v72, v73, v68, v69);
      v90 = v74;
      v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v75, (uint64_t)&v90, (uint64_t)&v89, 1, v76);
      v80 = objc_msgSend_errorWithDomain_code_userInfo_(v66, v78, @"com.apple.koa.KVSpanInfo", -1, (uint64_t)v77, v79);
      v81 = v80;
      if (a6 && v80) {
        *a6 = v80;
      }
    }
    else
    {
      uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v91 = *MEMORY[0x1E4F28568];
      v51 = NSString;
      uint64_t v52 = *p_buffer;
      uint64_t v53 = objc_msgSend_encodedString(v14, v21, v22, v23, v24, v25);
      uint64_t v58 = objc_msgSend_stringWithFormat_(v51, v54, @"Invalid spanInfo buffer: %@ (encoded string: %@)", v55, v56, v57, v52, v53);
      v92[0] = v58;
      uint64_t v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v59, (uint64_t)v92, (uint64_t)&v91, 1, v60);
      uint64_t v64 = objc_msgSend_errorWithDomain_code_userInfo_(v50, v62, @"com.apple.koa.KVSpanInfo", -1, (uint64_t)v61, v63);
      uint64_t v65 = v64;
      if (a6 && v64) {
        *a6 = v64;
      }
    }
    uint64_t v49 = 0;
    goto LABEL_63;
  }
LABEL_53:
  uint64_t v49 = v14;
LABEL_63:

  return v49;
}

- (KVEncodedSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14
{
  unsigned __int16 v14 = a9;
  unsigned __int16 v15 = a8;
  unsigned __int16 v16 = a7;
  unsigned __int16 v19 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  if (!objc_msgSend_length(v21, v22, v23, v24, v25, v26))
  {
    uint64_t v40 = qword_1EB5EE458;
    if (!os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      uint64_t v39 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[KVEncodedSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:ma"
                         "xStopWordCount:matchedStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    uint64_t v41 = "%s Cannot initialize span info with empty value";
    uint64_t v42 = v40;
    uint32_t v43 = 12;
LABEL_15:
    _os_log_error_impl(&dword_1BC3B6000, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);
    goto LABEL_12;
  }
  if (!a5)
  {
    uint64_t v44 = qword_1EB5EE458;
    if (!os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[KVEncodedSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:ma"
                         "xStopWordCount:matchedStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    __int16 v49 = 2112;
    *(void *)uint64_t v50 = v21;
    uint64_t v41 = "%s Cannot initialize span info with zero length. value: %@";
    uint64_t v42 = v44;
    uint32_t v43 = 22;
    goto LABEL_15;
  }
  *(void *)buf = 0;
  buf[8] = 0;
  *(_OWORD *)&v50[2] = xmmword_1BC3E47D0;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v53 = 0;
  uint64_t v54 = 1;
  __int16 v55 = 256;
  uint64_t v56 = 0;
  sub_1BC3B8E08((uint64_t)buf);
  BYTE6(v53) = 1;
  int v27 = v51;
  int v46 = DWORD2(v51);
  int v47 = v52;
  sub_1BC3B8EBC((unint64_t)buf, 4, v19);
  sub_1BC3B8EBC((unint64_t)buf, 6, (unsigned __int16)a5);
  if (a6 != 0.0 || (_BYTE)v55)
  {
    sub_1BC3B98FC((uint64_t)buf, 4uLL);
    sub_1BC3B9660((uint64_t *)buf, 4uLL);
    uint64_t v28 = v52;
    *(float *)(v52 - 4) = a6;
    v28 -= 4;
    *(void *)&long long v52 = v28;
    long long v29 = v51;
    sub_1BC3B9660((uint64_t *)buf, 8uLL);
    **((void **)&v52 + 1) = (v29 - v28 + DWORD2(v29)) | 0x800000000;
    *((void *)&v52 + 1) += 8;
    LODWORD(v53) = v53 + 1;
    __int16 v30 = WORD2(v53);
    if (WORD2(v53) <= 8u) {
      __int16 v30 = 8;
    }
    WORD2(v53) = v30;
  }
  sub_1BC3B8EBC((unint64_t)buf, 10, v16);
  sub_1BC3B8EBC((unint64_t)buf, 12, v15);
  sub_1BC3B8EBC((unint64_t)buf, 14, v14);
  sub_1BC3B8EBC((unint64_t)buf, 16, (unsigned __int16)a10);
  sub_1BC3B8EBC((unint64_t)buf, 18, (unsigned __int16)a11);
  sub_1BC3B8EBC((unint64_t)buf, 20, (unsigned __int16)a12);
  sub_1BC3B8EBC((unint64_t)buf, 22, (unsigned __int16)a13);
  sub_1BC3B8EBC((unint64_t)buf, 24, a14);
  unsigned int v31 = sub_1BC3B8F6C((uint64_t)buf, v27 - v47 + v46);
  sub_1BC3B9208((uint64_t)buf, v31, 0, 0);
  id v32 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v33 = sub_1BC3B930C((uint64_t)buf);
  uint64_t v37 = objc_msgSend_initWithBytes_length_(v32, v34, v33, (v51 - v52 + DWORD2(v51)), v35, v36);
  self = (KVEncodedSpanInfo *)(id)objc_msgSend_initWithBuffer_verify_value_error_(self, v38, (uint64_t)v37, 0, (uint64_t)v21, 0);

  sub_1BC3B9370(buf);
  uint64_t v39 = self;
LABEL_13:

  return v39;
}

+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v10 = objc_msgSend_initWithBase64EncodedString_options_(v6, v7, (uint64_t)v5, 0, v8, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [KVEncodedSpanInfo alloc];
  uint64_t v13 = objc_msgSend_initWithBuffer_verify_value_error_(v11, v12, (uint64_t)v10, 1, 0, (uint64_t)a4);

  return v13;
}

@end