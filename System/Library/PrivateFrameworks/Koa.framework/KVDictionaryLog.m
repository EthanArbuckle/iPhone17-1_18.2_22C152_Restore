@interface KVDictionaryLog
+ (void)initialize;
- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)clear:(id *)a3;
- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionaryLog:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (KVDictionaryLog)init;
- (KVDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
- (KVDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8;
- (id)allKeys;
- (id)description;
- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation KVDictionaryLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_logFileURL, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_numberWithInt_(NSNumber, v8, self->_protectionClass, v9, v10, v11);
  uint64_t v18 = objc_msgSend_hash(v12, v13, v14, v15, v16, v17);
  unint64_t v24 = v18 ^ v7 ^ objc_msgSend_hash(self->_log, v19, v20, v21, v22, v23);

  return v24;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  uint64_t v4 = a3;
  if (objc_msgSend_isEqual_(self->_logFileURL, v5, v4[1], v6, v7, v8)
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    char isEqual = objc_msgSend_isEqual_(self->_log, v9, v4[2], v10, v11, v12);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char isEqualToDictionaryLog = objc_msgSend_isEqualToDictionaryLog_(self, v5, (uint64_t)v4, v6, v7, v8);
  }
  else {
    char isEqualToDictionaryLog = 0;
  }

  return isEqualToDictionaryLog;
}

- (BOOL)clear:(id *)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isReadOnly(self, a2, (uint64_t)a3, v3, v4, v5))
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"instance: %@ is read only.", v10, v11, v12, self);
    v56[0] = v14;
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v56, (uint64_t)&v55, 1, v16);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v18, @"com.apple.koa.dictionary.log", 3, (uint64_t)v17, v19);
    id v21 = v20;
    BOOL v22 = 0;
    if (a3 && v20)
    {
      id v21 = v20;
      BOOL v22 = 0;
      *a3 = v21;
    }
    goto LABEL_18;
  }
  uint64_t v17 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10, v11, v12);
  objc_msgSend_path(self->_logFileURL, v23, v24, v25, v26, v27);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21 || !objc_msgSend_fileExistsAtPath_(v17, v28, (uint64_t)v21, v30, v31, v32))
  {
    id v35 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  id v50 = 0;
  char v34 = objc_msgSend_removeItemAtURL_error_(v17, v28, (uint64_t)logFileURL, (uint64_t)&v50, v31, v32);
  id v35 = v50;
  if (v34)
  {
LABEL_17:
    objc_msgSend_removeAllObjects(self->_log, v28, v29, v30, v31, v32);
    BOOL v22 = 1;
    uint64_t v14 = v35;
    goto LABEL_18;
  }
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v41 = objc_msgSend_stringWithFormat_(NSString, v37, @"Failed to remove log file at path: %@", v38, v39, v40, v21);
  objc_msgSend_setObject_forKey_(v36, v42, (uint64_t)v41, *MEMORY[0x1E4F28568], v43, v44);

  if (v35) {
    objc_msgSend_setObject_forKey_(v36, v45, (uint64_t)v35, *MEMORY[0x1E4F28A50], v46, v47);
  }
  uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v45, @"com.apple.koa.dictionary.log", 8, (uint64_t)v36, v47);

  if (a3 && v14) {
    *a3 = v14;
  }
  v48 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[KVDictionaryLog clear:]";
    __int16 v53 = 2112;
    v54 = v14;
    _os_log_error_impl(&dword_1BC3B6000, v48, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend_isReadOnly(self, v7, v8, v9, v10, v11))
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v12, @"instance: %@ is read only.", v13, v14, v15, self);
    v70[0] = v17;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v70, (uint64_t)&v69, 1, v19);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v21, @"com.apple.koa.dictionary.log", 3, (uint64_t)v20, v22);
    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v12, @"Invalid key: %@", v13, v14, v15, 0);
    v68 = v17;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)&v68, (uint64_t)&v67, 1, v40);
    objc_msgSend_errorWithDomain_code_userInfo_(v38, v41, @"com.apple.koa.dictionary.log", 1, (uint64_t)v20, v42);
    uint64_t v43 = LABEL_10:;
    uint64_t v44 = v43;
    if (a4 && v43) {
      *a4 = v43;
    }

    char v31 = 0;
    goto LABEL_26;
  }
  uint64_t v23 = objc_msgSend_objectForKey_(self->_log, v12, (uint64_t)v6, v13, v14, v15);
  if (v23)
  {
    uint64_t v17 = (void *)v23;
    objc_msgSend_removeObjectForKey_(self->_log, v24, (uint64_t)v6, v25, v26, v27);
    logFileURL = self->_logFileURL;
    log = self->_log;
    int protectionClass = self->_protectionClass;
    id v60 = 0;
    char v31 = KVWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v60);
    id v35 = v60;
    if (v31)
    {
      id v36 = qword_1EB5EE458;
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v62 = "-[KVDictionaryLog clearObjectForKey:error:]";
        __int16 v63 = 2112;
        id v64 = v17;
        __int16 v65 = 2112;
        id v66 = v6;
        _os_log_debug_impl(&dword_1BC3B6000, v36, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      v37 = v35;
    }
    else
    {
      objc_msgSend_setObject_forKey_(self->_log, v32, (uint64_t)v17, (uint64_t)v6, v33, v34);
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v51 = objc_msgSend_stringWithFormat_(NSString, v47, @"Failed to write removal for key: %@ reverting to prior object: %@", v48, v49, v50, v6, v17);
      objc_msgSend_setObject_forKey_(v46, v52, (uint64_t)v51, *MEMORY[0x1E4F28568], v53, v54);

      if (v35) {
        objc_msgSend_setObject_forKey_(v46, v55, (uint64_t)v35, *MEMORY[0x1E4F28A50], v56, v57);
      }
      v37 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v55, @"com.apple.koa.dictionary.log", 8, (uint64_t)v46, v57);

      if (a4 && v37) {
        *a4 = v37;
      }
      v58 = qword_1EB5EE458;
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[KVDictionaryLog clearObjectForKey:error:]";
        __int16 v63 = 2112;
        id v64 = v37;
        _os_log_error_impl(&dword_1BC3B6000, v58, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v45 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[KVDictionaryLog clearObjectForKey:error:]";
      __int16 v63 = 2112;
      id v64 = v6;
      _os_log_debug_impl(&dword_1BC3B6000, v45, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    uint64_t v17 = 0;
    char v31 = 1;
  }
LABEL_26:

  return v31;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  v154[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isReadOnly(self, v10, v11, v12, v13, v14))
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v153 = *MEMORY[0x1E4F28568];
    id v21 = objc_msgSend_stringWithFormat_(NSString, v15, @"instance: %@ is read only.", v17, v18, v19, self);
    v154[0] = v21;
    uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v154, (uint64_t)&v153, 1, v23);
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v25, @"com.apple.koa.dictionary.log", 3, (uint64_t)v24, v26);
    goto LABEL_17;
  }
  uint64_t v27 = objc_msgSend_count(v8, v15, v16, v17, v18, v19);
  if (v27 != objc_msgSend_count(v9, v28, v29, v30, v31, v32))
  {
    v88 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v151 = *MEMORY[0x1E4F28568];
    id v21 = objc_msgSend_stringWithFormat_(NSString, v33, @"Unexpected number of objects: %@ for keys: %@", v34, v35, v36, v8, v9);
    v152 = v21;
    uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v89, (uint64_t)&v152, (uint64_t)&v151, 1, v90);
    objc_msgSend_errorWithDomain_code_userInfo_(v88, v91, @"com.apple.koa.dictionary.log", 1, (uint64_t)v24, v92);
    v93 = LABEL_17:;
    v94 = v93;
    if (a5 && v93) {
      *a5 = v93;
    }

    goto LABEL_21;
  }
  v136 = a5;
  id v37 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v43 = objc_msgSend_count(v9, v38, v39, v40, v41, v42);
  id v21 = objc_msgSend_initWithCapacity_(v37, v44, v43, v45, v46, v47);
  uint64_t v53 = objc_msgSend_count(v8, v48, v49, v50, v51, v52);
  if (objc_msgSend_count(v8, v54, v55, v56, v57, v58))
  {
    for (unint64_t i = 0; i < objc_msgSend_count(v8, v83, v84, v85, v86, v87); ++i)
    {
      id v64 = objc_msgSend_objectAtIndex_(v8, v59, i, v60, v61, v62);
      uint64_t v69 = objc_msgSend_objectAtIndex_(v9, v65, i, v66, v67, v68);
      v78 = objc_msgSend_objectForKey_(v21, v70, (uint64_t)v69, v71, v72, v73);
      if (v78
        || (objc_msgSend_objectForKey_(self->_log, v74, (uint64_t)v69, v75, v76, v77),
            (v78 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend_isEqual_(v78, v74, (uint64_t)v64, v75, v76, v77))
        {
          v82 = qword_1EB5EE458;
          if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v143 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
            __int16 v144 = 2112;
            id v145 = v64;
            __int16 v146 = 2112;
            id v147 = v69;
            _os_log_debug_impl(&dword_1BC3B6000, v82, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
          }
          --v53;
          goto LABEL_14;
        }
        objc_msgSend_setObject_forKey_(v21, v79, (uint64_t)v78, (uint64_t)v69, v80, v81);
      }
      objc_msgSend_setObject_forKey_(self->_log, v74, (uint64_t)v64, (uint64_t)v69, v76, v77);
LABEL_14:
    }
  }
  if (!v53)
  {
    BOOL v95 = 1;
    goto LABEL_23;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  int protectionClass = self->_protectionClass;
  id v141 = 0;
  char v100 = KVWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v141);
  id v101 = v141;
  id v102 = v101;
  if (v100)
  {
    v103 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v143 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
      __int16 v144 = 2112;
      id v145 = v8;
      __int16 v146 = 2112;
      id v147 = v9;
      __int16 v148 = 2112;
      v149 = v21;
      _os_log_debug_impl(&dword_1BC3B6000, v103, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    BOOL v95 = 1;
    uint64_t v24 = v102;
    goto LABEL_22;
  }
  v135 = v101;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v104 = v9;
  uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v137, (uint64_t)v150, 16, v106);
  if (v107)
  {
    uint64_t v112 = v107;
    uint64_t v113 = *(void *)v138;
    do
    {
      for (uint64_t j = 0; j != v112; ++j)
      {
        if (*(void *)v138 != v113) {
          objc_enumerationMutation(v104);
        }
        uint64_t v115 = *(void *)(*((void *)&v137 + 1) + 8 * j);
        v120 = objc_msgSend_objectForKey_(v21, v108, v115, v109, v110, v111);
        v121 = self->_log;
        if (v120) {
          objc_msgSend_setObject_forKey_(v121, v116, (uint64_t)v120, v115, v118, v119);
        }
        else {
          objc_msgSend_removeObjectForKey_(v121, v116, v115, v117, v118, v119);
        }
      }
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v108, (uint64_t)&v137, (uint64_t)v150, 16, v111);
    }
    while (v112);
  }

  id v122 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v127 = objc_msgSend_stringWithFormat_(NSString, v123, @"Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@", v124, v125, v126, v8, v104, v21);
  objc_msgSend_setObject_forKey_(v122, v128, (uint64_t)v127, *MEMORY[0x1E4F28568], v129, v130);

  if (v135) {
    objc_msgSend_setObject_forKey_(v122, v131, (uint64_t)v135, *MEMORY[0x1E4F28A50], v132, v133);
  }
  uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v131, @"com.apple.koa.dictionary.log", 8, (uint64_t)v122, v133);

  if (v136 && v24) {
    id *v136 = v24;
  }
  v134 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v143 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
    __int16 v144 = 2112;
    id v145 = v24;
    _os_log_error_impl(&dword_1BC3B6000, v134, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  BOOL v95 = 0;
LABEL_22:

LABEL_23:
  return v95;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v37 = a3;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a4;
    id v10 = a3;
    uint64_t v14 = objc_msgSend_arrayWithObjects_count_(v8, v11, (uint64_t)&v37, 1, v12, v13);
    id v36 = v9;
    uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)&v36, 1, v16, v17);

    char v21 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self, v19, (uint64_t)v14, (uint64_t)v18, (uint64_t)a5, v20);
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v23 = NSString;
    id v24 = a4;
    id v25 = a3;
    uint64_t v14 = objc_msgSend_stringWithFormat_(v23, v26, @"Invalid {object: %@ key: %@}", v27, v28, v29, v25, v24);
    v39[0] = v14;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v39, (uint64_t)&v38, 1, v31);
    uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(v22, v32, @"com.apple.koa.dictionary.log", 1, (uint64_t)v18, v33);

    if (a5 && v34) {
      *a5 = v34;
    }

    char v21 = 0;
  }

  return v21;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = objc_msgSend_objectForKey_(self, v7, (uint64_t)v6, v8, v9, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
LABEL_13:
    uint64_t v34 = v12;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (id)objc_msgSend_mutableCopy(v11, v13, v14, v15, v16, v17);
    goto LABEL_13;
  }
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  uint64_t v19 = NSString;
  uint64_t v20 = (objc_class *)objc_opt_class();
  char v21 = NSStringFromClass(v20);
  uint64_t v26 = objc_msgSend_stringWithFormat_(v19, v22, @"Unexpected object: %@ for key: %@ expected: %@", v23, v24, v25, v11, v6, v21);
  v41[0] = v26;
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v41, (uint64_t)&v40, 1, v28);
  uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v30, @"com.apple.koa.dictionary.log", 4, (uint64_t)v29, v31);

  if (a4 && v32) {
    *a4 = v32;
  }
  uint64_t v33 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "-[KVDictionaryLog mutableDictionaryForKey:error:]";
    __int16 v38 = 2112;
    uint64_t v39 = v32;
    _os_log_error_impl(&dword_1BC3B6000, v33, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  uint64_t v34 = 0;
LABEL_14:

  return v34;
}

- (id)objectForKey:(id)a3
{
  id v6 = objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)a3, v3, v4, v5);
  id v12 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)allKeys
{
  return (id)objc_msgSend_allKeys(self->_log, a2, v2, v3, v4, v5);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_log, a2, v2, v3, v4, v5);
}

- (BOOL)isReadOnly
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)KVDictionaryLog;
  uint64_t v3 = [(KVDictionaryLog *)&v16 description];
  uint64_t v9 = objc_msgSend_path(self->_logFileURL, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_stringByAppendingFormat_(v3, v10, @" logFile: %@", v11, v12, v13, v9);

  return v14;
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  uint64_t v6 = a5;
  BOOL v7 = a4;
  v84[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend_path(self->_logFileURL, a2, a3, a4, (uint64_t)a5, v5);
  logFileURL = self->_logFileURL;
  id v70 = 0;
  KVReadPropertyList((uint64_t)logFileURL, (const char *)!v7, (uint64_t)&v70, v12, v13, v14);
  uint64_t v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v16 = v70;
  log = self->_log;
  self->_log = v15;

  if (!self->_log)
  {
    uint64_t v39 = objc_msgSend_code(v16, v18, v19, v20, v21, v22);
    uint64_t v40 = qword_1EB5EE458;
    if (v39 == 260)
    {
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v74 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
        __int16 v75 = 2112;
        uint64_t v76 = (uint64_t)v10;
        _os_log_debug_impl(&dword_1BC3B6000, v40, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v79 = *MEMORY[0x1E4F28A50];
      id v80 = v16;
      uint64_t v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)&v80, (uint64_t)&v79, 1, v42);
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v45, @"com.apple.koa.dictionary.log", 6, (uint64_t)v44, v46);
      uint64_t v66 = LABEL_26:;

      id v16 = (id)v66;
      if (a3) {
        goto LABEL_14;
      }
LABEL_27:
      char v60 = 0;
      if (v6 && v16)
      {
        id v16 = v16;
        char v60 = 0;
        *uint64_t v6 = v16;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v74 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v10;
      __int16 v77 = 2112;
      id v78 = v16;
      _os_log_error_impl(&dword_1BC3B6000, v40, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v16) {
        goto LABEL_22;
      }
    }
    else if (v16)
    {
LABEL_22:
      uint64_t v71 = *MEMORY[0x1E4F28A50];
      id v72 = v16;
      uint64_t v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v64, (uint64_t)&v72, (uint64_t)&v71, 1, v65);
LABEL_25:
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v64, @"com.apple.koa.dictionary.log", 7, (uint64_t)v44, v65);
      goto LABEL_26;
    }
    uint64_t v44 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v7) {
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    uint64_t v69 = v6;
    uint64_t v68 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F28568];
    uint64_t v23 = NSString;
    uint64_t v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    uint64_t v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    uint64_t v32 = objc_msgSend_stringWithFormat_(v23, v28, @"Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@", v29, v30, v31, v25, v27, self->_log, v10);
    v84[0] = v32;
    uint64_t v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v84, (uint64_t)&v83, 1, v34);
    uint64_t v38 = objc_msgSend_errorWithDomain_code_userInfo_(v68, v36, @"com.apple.koa.dictionary.log", 5, v35, v37);

    id v16 = (id)v35;
  }
  else
  {
    uint64_t v69 = v6;
    uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v81 = *MEMORY[0x1E4F28568];
    uint64_t v48 = NSString;
    uint64_t v49 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v49);
    uint64_t v27 = objc_msgSend_stringWithFormat_(v48, v50, @"Unexpected plist class (%@) of object: %@ at path: %@", v51, v52, v53, v25, self->_log, v10);
    v82 = v27;
    uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v54, (uint64_t)&v82, (uint64_t)&v81, 1, v55);
    uint64_t v38 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v56, @"com.apple.koa.dictionary.log", 5, (uint64_t)v32, v57);
  }

  uint64_t v58 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v75 = 2112;
    uint64_t v76 = v38;
    _os_log_error_impl(&dword_1BC3B6000, v58, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  id v16 = (id)v38;
  uint64_t v6 = v69;
  if (!a3) {
    goto LABEL_27;
  }
LABEL_14:
  if (v7)
  {
    v59 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x1E4F1CC08];

LABEL_16:
    char v60 = 1;
    goto LABEL_30;
  }
  uint64_t v61 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v10;
    _os_log_impl(&dword_1BC3B6000, v61, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  uint64_t v62 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v63 = self->_log;
  self->_log = v62;

  char v60 = KVWritePropertyList((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)v6);
LABEL_30:

  return v60;
}

- (KVDictionaryLog)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (KVDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  v36.receiver = self;
  v36.super_class = (Class)KVDictionaryLog;
  uint64_t v20 = [(KVDictionaryLog *)&v36 init];
  if (!v20) {
    goto LABEL_5;
  }
  if (!v14 || !v15)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    uint64_t v27 = objc_msgSend_stringWithFormat_(NSString, v16, @"Invalid {filename: %@, directory: %@}", v17, v18, v19, v14, v15);
    v38[0] = v27;
    uint64_t v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v38, (uint64_t)&v37, 1, v29);
    uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v31, @"com.apple.koa.dictionary.log", 2, (uint64_t)v30, v32);
    uint64_t v34 = v33;
    if (a8 && v33) {
      *a8 = v33;
    }

    goto LABEL_10;
  }
  uint64_t v21 = objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x1E4F1CB10], v16, (uint64_t)v14, (uint64_t)v15, v18, v19);
  logFileURL = v20->_logFileURL;
  v20->_logFileURL = (NSURL *)v21;

  v20->_int protectionClass = a4;
  if (!objc_msgSend__loadLogOrCreate_readOnly_error_(v20, v23, v9, v10, (uint64_t)a8, v24))
  {
LABEL_10:
    uint64_t v25 = 0;
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v25 = v20;
LABEL_11:

  return v25;
}

- (KVDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return (KVDictionaryLog *)MEMORY[0x1F4181798](self, sel_initWithFilename_protectionClass_directory_readOnly_create_error_, a3, 0xFFFFFFFFLL, a4, a5);
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end