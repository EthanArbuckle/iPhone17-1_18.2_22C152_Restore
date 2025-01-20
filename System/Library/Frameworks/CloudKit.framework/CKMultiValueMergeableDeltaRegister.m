@interface CKMultiValueMergeableDeltaRegister
+ (id)installationIdentifierWithSalt:(id)a3;
- (BOOL)checkElementType:(id)a3 error:(id *)a4;
- (BOOL)mergeDeltas:(id)a3 error:(id *)a4;
- (CKMultiValueMergeableDeltaRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6;
- (CKMultiValueMergeableDeltaRegister)initWithPersistedState:(id)a3 contents:(id)a4 error:(id *)a5;
- (CKMultiValueMergeableDeltaRegisterState)persistedState;
- (NSData)salt;
- (id)installationIdentifier;
- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4;
- (id)siteIdentifier;
- (id)stateVector;
- (unint64_t)deltaDeliveryRequirements;
- (unint64_t)modifierLimitForInstallationIdentifierCheck;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation CKMultiValueMergeableDeltaRegister

- (CKMultiValueMergeableDeltaRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [CKMultiValueMergeableDeltaRegisterState alloc];
  v17 = objc_msgSend_newSalt(CKMultiValueMergeableDeltaRegisterState, v14, v15, v16);
  v19 = objc_msgSend_initWithIdentifier_vector_salt_(v13, v18, (uint64_t)v12, (uint64_t)v11, v17);

  v21 = (CKMultiValueMergeableDeltaRegister *)objc_msgSend_initWithPersistedState_contents_error_(self, v20, (uint64_t)v19, (uint64_t)v10, a6);
  return v21;
}

- (CKMultiValueMergeableDeltaRegister)initWithPersistedState:(id)a3 contents:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_18AF13CDC;
  v42 = sub_18AF138B0;
  id v43 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_18B07C3D4;
  v34[3] = &unk_1E5462AD0;
  v36 = &v44;
  id v10 = self;
  v35 = v10;
  v37 = &v38;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v34, v12);
  if (*((unsigned char *)v45 + 24))
  {
    uint64_t v16 = objc_msgSend_identifier(v8, v13, v14, v15);
    v20 = objc_msgSend_vector(v8, v17, v18, v19);
    v33.receiver = v10;
    v33.super_class = (Class)CKMultiValueMergeableDeltaRegister;
    v21 = [(CKMultiValueRegister *)&v33 initWithIdentifier:v16 vector:v20 contents:v9 error:a5];

    if (v21)
    {
      v25 = objc_msgSend_salt(v8, v22, v23, v24);
      uint64_t v29 = objc_msgSend_copy(v25, v26, v27, v28);
      salt = v21->_salt;
      v21->_salt = (NSData *)v29;
    }
    id v10 = v21;
    v31 = v10;
  }
  else
  {
    v31 = 0;
    if (a5) {
      *a5 = (id) v39[5];
    }
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v31;
}

- (CKMultiValueMergeableDeltaRegisterState)persistedState
{
  v3 = [CKMultiValueMergeableDeltaRegisterState alloc];
  v7 = objc_msgSend_identifier(self, v4, v5, v6);
  id v11 = objc_msgSend_vector(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_salt(self, v12, v13, v14);
  v17 = objc_msgSend_initWithIdentifier_vector_salt_(v3, v16, (uint64_t)v7, (uint64_t)v11, v15);

  return (CKMultiValueMergeableDeltaRegisterState *)v17;
}

+ (id)installationIdentifierWithSalt:(id)a3
{
  SEL v68 = a2;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = 0;
  uint64_t v9 = 4;
  do
  {
    if (v8) {
      goto LABEL_8;
    }
    uint64_t v10 = objc_msgSend_defaultContext(CKLogicalDeviceContext, v4, v5, v6);
    uint64_t v14 = objc_msgSend_connection(v10, v11, v12, v13);
    uint64_t v18 = objc_msgSend_processScopedDaemonProxy(v14, v15, v16, v17);
    id v70 = 0;
    id v8 = objc_msgSend_globalDeviceIdentifierWithError_(v18, v19, (uint64_t)&v70, v20);
    id v21 = v70;

    v25 = objc_msgSend_domain(v21, v22, v23, v24);
    if (!objc_msgSend_isEqual_(v25, v26, @"CKErrorDomain", v27)) {
      goto LABEL_6;
    }
    uint64_t v31 = objc_msgSend_code(v21, v28, v29, v30);

    if (v31 == 8)
    {
      v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v32, v33, v34);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v35, (uint64_t)v68, (uint64_t)a1, @"CKMultiValueMergeableDeltaRegister.m", 85, @"Process is not entitled to call CloudKit SPI");
LABEL_6:
    }
LABEL_8:
    --v9;
  }
  while (v9);
  if (!v8)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v36 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)md = 0;
      _os_log_fault_impl(&dword_18AF10000, v36, OS_LOG_TYPE_FAULT, "Could not fetch global device identifier, possibly due to attempted mergeables use by system user", md, 2u);
    }
    uint64_t v40 = objc_msgSend_placeholderIdentifier(a1, v37, v38, v39, v68);
    id v8 = objc_msgSend_UUIDString(v40, v41, v42, v43);
  }
  uint64_t v44 = objc_msgSend_dataUsingEncoding_(v8, v4, 4, v6, v68);
  if (!objc_msgSend_length(v7, v45, v46, v47))
  {
    v66 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v48, v49, v50);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, v69, (uint64_t)a1, @"CKMultiValueMergeableDeltaRegister.m", 96, @"Unexpected salt length");
  }
  v51 = objc_msgSend_mutableCopy(v7, v48, v49, v50);
  objc_msgSend_appendData_(v51, v52, (uint64_t)v44, v53);
  *(_OWORD *)md = 0u;
  long long v72 = 0u;
  id v54 = v51;
  v58 = (const void *)objc_msgSend_bytes(v54, v55, v56, v57);
  CC_LONG v62 = objc_msgSend_length(v54, v59, v60, v61);
  CC_SHA256(v58, v62, md);
  v64 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v63, (uint64_t)md, 32);

  return v64;
}

- (id)installationIdentifier
{
  v3 = objc_opt_class();
  id v7 = objc_msgSend_salt(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_installationIdentifierWithSalt_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

- (unint64_t)modifierLimitForInstallationIdentifierCheck
{
  return 50;
}

- (id)siteIdentifier
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  v3 = objc_opt_new();
  CC_LONG v62 = self;
  id v7 = objc_msgSend_vector(self, v4, v5, v6);
  id v11 = objc_msgSend_allSiteIdentifiers(v7, v8, v9, v10);

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v12 = v11;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v64, (uint64_t)v73, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v21 = objc_msgSend_identifier(v20, v14, v15, v16);
        uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v3, v22, (uint64_t)v21, v23);

        if (!v24)
        {
          uint64_t v24 = objc_opt_new();
          uint64_t v31 = objc_msgSend_identifier(v20, v28, v29, v30);
          objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v24, (uint64_t)v31);
        }
        uint64_t v33 = objc_msgSend_modifier(v20, v25, v26, v27);
        BOOL v37 = objc_msgSend_length(v33, v34, v35, v36) == 0;

        if (!v37)
        {
          v41 = objc_msgSend_modifier(v20, v38, v39, v40);
          objc_msgSend_addObject_(v24, v42, (uint64_t)v41, v43);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v64, (uint64_t)v73, 16);
    }
    while (v17);
  }

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_18B07CB88;
  v63[3] = &unk_1E5462AF8;
  v63[4] = v62;
  v63[5] = &v68;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v44, (uint64_t)v63, v45);

  v72[0] = 0;
  v72[1] = 0;
  uint64_t v49 = objc_msgSend_identifier(v62, v46, v47, v48);
  objc_msgSend_getUUIDBytes_(v49, v50, (uint64_t)v72, v51);

  uint64_t v56 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v52, (uint64_t)v72, 16);
  if (*((unsigned char *)v69 + 24))
  {
    uint64_t v57 = objc_msgSend_installationIdentifier(v62, v53, v54, v55);
  }
  else
  {
    uint64_t v57 = 0;
  }
  v58 = [CKDistributedSiteIdentifier alloc];
  uint64_t v60 = objc_msgSend_initWithIdentifier_modifier_(v58, v59, (uint64_t)v56, (uint64_t)v57);

  _Block_object_dispose(&v68, 8);

  return v60;
}

- (void)setContents:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B07CF9C;
  v8[3] = &unk_1E5462B20;
  v8[4] = self;
  id v4 = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v8, v6);
  v7.receiver = self;
  v7.super_class = (Class)CKMultiValueMergeableDeltaRegister;
  [(CKMultiValueRegister *)&v7 setContents:v4];
}

- (BOOL)checkElementType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      BOOL v19 = 0;
      goto LABEL_12;
    }
    uint64_t v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v21);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, @"CKErrorDomain", 12, @"%@ element has wrong class (expected %@)", v6, v15);
    goto LABEL_7;
  }
  id v6 = v5;
  uint64_t v10 = objc_msgSend_metadata(v6, v7, v8, v9);

  if (!v10)
  {
    uint64_t v23 = objc_msgSend__data(v6, v11, v12, v13);
    if (v23)
    {
      uint64_t v15 = (void *)v23;
      BOOL v19 = 1;
      goto LABEL_10;
    }
    uint64_t v28 = objc_msgSend_fileURL(v6, v24, v25, v26);

    if (v28)
    {
      BOOL v19 = 1;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_18:
      BOOL v19 = 0;
      goto LABEL_11;
    }
    uint64_t v29 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v29);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, @"CKErrorDomain", 12, @"%@ delta element is malformed (missing payload)", v15);
LABEL_7:
    BOOL v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_18;
  }
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  uint64_t v16 = NSStringFromProtocol((Protocol *)&unk_1ED8581D0);
  uint64_t v17 = NSStringFromProtocol((Protocol *)&unk_1ED858140);
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, @"CKErrorDomain", 12, @"%@ delta element was generated from a %@, not a %@", v15, v16, v17);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v19 = 0;
LABEL_10:

LABEL_11:
LABEL_12:

  return v19;
}

- (id)stateVector
{
  id v4 = objc_msgSend_vector(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)deltaDeliveryRequirements
{
  return 0;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  v83 = self;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v6 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v107, (uint64_t)v112, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v108 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_metadata(v14, v8, v9, v10, v83);
        BOOL v19 = objc_msgSend_vectors(v15, v16, v17, v18);
        uint64_t v23 = objc_msgSend_contents(v19, v20, v21, v22);
        objc_msgSend_unionStateVector_(v5, v24, (uint64_t)v23, v25);

        uint64_t v29 = objc_msgSend_metadata(v14, v26, v27, v28);
        uint64_t v33 = objc_msgSend_vectors(v29, v30, v31, v32);
        BOOL v37 = objc_msgSend_removals(v33, v34, v35, v36);
        objc_msgSend_unionStateVector_(v5, v38, (uint64_t)v37, v39);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v107, (uint64_t)v112, 16);
    }
    while (v11);
  }

  uint64_t v42 = objc_msgSend_vectorFilteredByAtomState_(v5, v40, 1, v41);
  v85 = objc_opt_new();
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v6;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v103, (uint64_t)v111, 16);
  if (v47)
  {
    uint64_t v48 = *(void *)v104;
    while (2)
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v104 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        uint64_t v51 = objc_msgSend_mutableCopy(v42, v44, v45, v46, v83);
        uint64_t v55 = objc_msgSend_metadata(v50, v52, v53, v54);
        v59 = objc_msgSend_vectors(v55, v56, v57, v58);
        v63 = objc_msgSend_contents(v59, v60, v61, v62);
        objc_msgSend_intersectStateVector_(v51, v64, (uint64_t)v63, v65);

        if (objc_msgSend_timestampCount(v51, v66, v67, v68))
        {
          uint64_t v97 = 0;
          v98 = &v97;
          uint64_t v99 = 0x3032000000;
          v100 = sub_18AF13CDC;
          v101 = sub_18AF138B0;
          id v102 = 0;
          uint64_t v93 = 0;
          v94 = &v93;
          uint64_t v95 = 0x2020000000;
          char v96 = 1;
          v92[0] = 0;
          v92[1] = v92;
          v92[2] = 0x2020000000;
          v92[3] = 0;
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = sub_18B07D770;
          v87[3] = &unk_1E5462B48;
          v89 = v92;
          v90 = &v97;
          v87[4] = v50;
          v91 = &v93;
          id v88 = v85;
          objc_msgSend_enumerateAllClockValuesUsingBlock_(v51, v69, (uint64_t)v87, v70);
          int v71 = *((unsigned __int8 *)v94 + 24);
          if (a4 && !*((unsigned char *)v94 + 24)) {
            *a4 = (id) v98[5];
          }

          _Block_object_dispose(v92, 8);
          _Block_object_dispose(&v93, 8);
          _Block_object_dispose(&v97, 8);

          if (!v71)
          {

            char v81 = 0;
            v79 = obj;
            goto LABEL_24;
          }
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v103, (uint64_t)v111, 16);
      if (v47) {
        continue;
      }
      break;
    }
  }

  long long v72 = [CKMultiValueRegister alloc];
  uint64_t v73 = objc_opt_class();
  v77 = objc_msgSend_placeholderIdentifier(v73, v74, v75, v76);
  v79 = objc_msgSend_initWithIdentifier_vector_contents_error_(v72, v78, (uint64_t)v77, (uint64_t)v5, v85, a4);

  if (v79) {
    char v81 = objc_msgSend_merge_error_(v83, v80, (uint64_t)v79, (uint64_t)a4);
  }
  else {
    char v81 = 0;
  }
LABEL_24:

  return v81;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v11 = objc_msgSend_vector(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_mutableCopy(v11, v12, v13, v14);

  BOOL v19 = objc_msgSend_vectors(v7, v16, v17, v18);
  uint64_t v23 = objc_msgSend_contents(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_clockVector(v23, v24, v25, v26);
  objc_msgSend_intersectVector_(v15, v28, (uint64_t)v27, v29);

  uint64_t v32 = objc_msgSend_vectorFilteredByAtomState_(v15, v30, 2, v31);
  uint64_t v36 = objc_msgSend_timestampCount(v32, v33, v34, v35);

  if (v36)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, @"CKErrorDomain", 12, @"Cannot generate a delta from a register in consumed state");
      id v40 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v40 = 0;
    }
  }
  else
  {
    uint64_t v41 = objc_msgSend_vector(self, v37, v38, v39);
    uint64_t v45 = objc_msgSend_mutableCopy(v41, v42, v43, v44);

    uint64_t v49 = objc_msgSend_vectors(v7, v46, v47, v48);
    uint64_t v53 = objc_msgSend_contents(v49, v50, v51, v52);
    uint64_t v57 = objc_msgSend_clockVector(v53, v54, v55, v56);
    objc_msgSend_intersectVector_(v45, v58, v57, v59);

    v63 = objc_msgSend_vectors(v7, v60, v61, v62);
    uint64_t v67 = objc_msgSend_contents(v63, v64, v65, v66);
    LOBYTE(v57) = objc_msgSend_isEqual_(v45, v68, (uint64_t)v67, v69);

    if (v57)
    {
      uint64_t v182 = 0;
      v183 = &v182;
      uint64_t v184 = 0x3032000000;
      v185 = sub_18AF13CDC;
      v186 = sub_18AF138B0;
      id v187 = (id)objc_opt_new();
      uint64_t v76 = objc_msgSend_vectors(v7, v73, v74, v75);
      v80 = objc_msgSend_contents(v76, v77, v78, v79);
      v83 = objc_msgSend_vectorFilteredByAtomState_(v80, v81, 1, v82);

      v87 = objc_msgSend_vectors(v7, v84, v85, v86);
      v91 = objc_msgSend_contents(v87, v88, v89, v90);
      v167 = objc_msgSend_mutableCopy(v91, v92, v93, v94);

      v98 = objc_msgSend_clockVector(v83, v95, v96, v97);
      objc_msgSend_minusVector_(v167, v99, (uint64_t)v98, v100);

      long long v104 = objc_msgSend_vectors(v7, v101, v102, v103);
      long long v108 = objc_msgSend_dependencies(v104, v105, v106, v107);
      v166 = objc_msgSend_mutableCopy(v108, v109, v110, v111);

      uint64_t v176 = 0;
      v177 = &v176;
      uint64_t v178 = 0x3032000000;
      v179 = sub_18AF13CDC;
      v180 = sub_18AF138B0;
      id v181 = 0;
      if (objc_msgSend_timestampCount(v83, v112, v113, v114))
      {
        if ((unint64_t)objc_msgSend_timestampCount(v83, v115, v116, v117) >= 2)
        {
          v121 = objc_msgSend_vectors(v7, v118, v119, v120);
          v125 = objc_msgSend_contents(v121, v122, v123, v124);
          v129 = objc_msgSend_clockVector(v125, v126, v127, v128);
          objc_msgSend_unionVector_(v166, v130, (uint64_t)v129, v131);
        }
        v132 = objc_msgSend_timestampToContents(self, v118, v119, v120);
        v168[0] = MEMORY[0x1E4F143A8];
        v168[1] = 3221225472;
        v168[2] = sub_18B07DF4C;
        v168[3] = &unk_1E5462B70;
        id v133 = v83;
        id v169 = v133;
        v170 = self;
        v174 = &v176;
        v175 = &v182;
        id v171 = v167;
        id v172 = v7;
        id v173 = v166;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v132, v134, (uint64_t)v168, v135);

        uint64_t v139 = objc_msgSend_timestampCount(v133, v136, v137, v138);
        if (v139 != objc_msgSend_count((void *)v183[5], v140, v141, v142) && v183[5])
        {
          v164 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v143, v144, v145);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v165, (uint64_t)a2, (uint64_t)self, @"CKMultiValueMergeableDeltaRegister.m", 365, @"Unexpected number of deltas generated");
        }
        v146 = v169;
      }
      else
      {
        v157 = [CKMergeableDelta alloc];
        v158 = objc_opt_new();
        v146 = objc_msgSend_initWithData_metadata_(v157, v159, (uint64_t)v158, (uint64_t)v7);

        objc_msgSend_addObject_((void *)v183[5], v160, (uint64_t)v146, v161);
      }

      v162 = (void *)v183[5];
      if (a4 && !v162)
      {
        *a4 = (id) v177[5];
        v162 = (void *)v183[5];
      }
      id v40 = v162;
      _Block_object_dispose(&v176, 8);

      _Block_object_dispose(&v182, 8);
    }
    else
    {
      if (a4)
      {
        v147 = objc_msgSend_vectors(v7, v70, v71, v72);
        v151 = objc_msgSend_contents(v147, v148, v149, v150);
        v155 = objc_msgSend_vector(self, v152, v153, v154);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v156, @"CKErrorDomain", 12, @"Metadata contents vector %@ does not match local vector %@", v151, v155);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v40 = 0;
    }
  }

  return v40;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKMultiValueMergeableDeltaRegister;
  [(CKMultiValueRegister *)&v20 CKDescribePropertiesUsing:v4];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v8 = objc_msgSend_timestampToContents(self, v5, v6, v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B07E274;
  v15[3] = &unk_1E5462B98;
  v15[4] = &v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v9, (uint64_t)v15, v10);

  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v11, v17[3], v12);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"size", (uint64_t)v13, 0);

  _Block_object_dispose(&v16, 8);
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
}

@end