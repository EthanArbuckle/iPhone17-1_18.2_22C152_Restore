@interface CKDDeserializeRecordModificationsOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4;
- (CKDDeserializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKDProtocolTranslator)translator;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)serializedModifications;
- (id)activityCreate;
- (id)deserializeCompletionBlock;
- (void)_deserialize;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_postflightRecords;
- (void)_setupTranslator;
- (void)main;
- (void)setDeserializeCompletionBlock:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSerializedModifications:(id)a3;
- (void)setTranslator:(id)a3;
@end

@implementation CKDDeserializeRecordModificationsOperation

- (CKDDeserializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  v9 = [(CKDDatabaseOperation *)&v13 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_serializedModifications(v6, v7, v8);
    serializedModifications = v9->_serializedModifications;
    v9->_serializedModifications = (NSData *)v10;
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/deserialize-record-modifications", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__setupTranslator(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__deserialize(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__postflightRecords(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_super v13 = objc_msgSend_error(self, v11, v12);
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDDeserializeRecordModificationsOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F1AF8[a3 - 2];
  }
  return v3;
}

- (void)main
{
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  if (![(CKDOperation *)&v23 validateAgainstLiveContainer:v6 error:a4]) {
    goto LABEL_9;
  }
  v9 = objc_msgSend_entitlements(v6, v7, v8);
  char hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v9, v10, v11);

  if ((hasAllowRealTimeOperationsEntitlement & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    objc_super v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v20 = v13;
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "Operation %{public}@ is not allowed to run without an entitlement", buf, 0xCu);

      if (!a4) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v15 = *MEMORY[0x1E4F19C40];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    objc_msgSend_errorWithDomain_code_format_(v14, v18, v15, 8, @"Operation %@ is not allowed to run without an entitlement", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    LOBYTE(a4) = 0;
    goto LABEL_10;
  }
  LOBYTE(a4) = 1;
LABEL_10:

  return (char)a4;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_deserializeCompletionBlock(self, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_deserializeCompletionBlock(self, v8, v9);
    objc_super v13 = (void (**)(void, void, void, void))v10;
    if (v4)
    {
      (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0, 0, v4);
    }
    else
    {
      v14 = objc_msgSend_recordsToSave(self, v11, v12);
      v17 = objc_msgSend_recordIDsToDelete(self, v15, v16);
      ((void (**)(void, void *, void *, void))v13)[2](v13, v14, v17, 0);
    }
    objc_msgSend_setDeserializeCompletionBlock_(self, v18, 0);
  }
  v19.receiver = self;
  v19.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  [(CKDOperation *)&v19 _finishOnCallbackQueueWithError:v4];
}

- (void)_setupTranslator
{
  id v4 = objc_msgSend_container(self, a2, v2);
  uint64_t v7 = objc_msgSend_databaseScope(self, v5, v6);
  uint64_t v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
  dispatch_group_enter(v10);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D7E630;
  v13[3] = &unk_1E64F1AB0;
  v13[4] = self;
  id v14 = v4;
  uint64_t v15 = v7;
  id v11 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v11, v12, (uint64_t)self, v13);
}

- (void)_deserialize
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  v3 = [CKDPRealTimeMessage alloc];
  uint64_t v6 = objc_msgSend_serializedModifications(self, v4, v5);
  uint64_t v8 = objc_msgSend_initWithData_(v3, v7, (uint64_t)v6);

  uint64_t v9 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v10 = (NSObject **)MEMORY[0x1E4F1A500];
  if (!v8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    v154 = *v10;
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v154, OS_LOG_TYPE_ERROR, "CKDDeserializeRecordModificationsOperation is unable to deserialize its messages", buf, 2u);
    }
    id v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v155, *MEMORY[0x1E4F19C40], 1000, @"CKDDeserializeRecordModificationsOperation is unable to deserialize its messages");
    objc_msgSend_setError_(self, v156, (uint64_t)v14);
    goto LABEL_96;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v9);
  }
  id v11 = *v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v161 = v11;
    v164 = objc_msgSend_saveRecords(v8, v162, v163);
    *(_DWORD *)buf = 134217984;
    uint64_t v221 = objc_msgSend_count(v164, v165, v166);
    _os_log_debug_impl(&dword_1C4CFF000, v161, OS_LOG_TYPE_DEBUG, "Unpackaging SaveRecords of %lu records", buf, 0xCu);
  }
  id v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13);
  v196 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  objc_msgSend_saveRecords(v8, v17, v18);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v214, v225, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v215;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v215 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v214 + 1) + 8 * i);
        v27 = objc_msgSend_translator(self, v21, v22);
        v30 = objc_msgSend_record(v26, v28, v29);
        id v213 = 0;
        v32 = objc_msgSend_recordFromPRecord_error_(v27, v31, (uint64_t)v30, &v213);
        id v33 = v213;

        if (v33)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v152 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v221 = (uint64_t)v33;
            _os_log_error_impl(&dword_1C4CFF000, v152, OS_LOG_TYPE_ERROR, "Error transforming record: %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v153, (uint64_t)v33);

          goto LABEL_95;
        }
        objc_msgSend_addObject_(v14, v34, (uint64_t)v32);
        v37 = objc_msgSend_recordID(v32, v35, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v196, v38, (uint64_t)v32, v37);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v214, v225, 16);
    }
    while (v23);
  }

  v39 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v40 = (os_log_t *)MEMORY[0x1E4F1A500];
  v41 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v169 = v41;
    v172 = objc_msgSend_associatedMergeableDeltas(v8, v170, v171);
    uint64_t v175 = objc_msgSend_count(v172, v173, v174);
    *(_DWORD *)buf = 134217984;
    uint64_t v221 = v175;
    _os_log_debug_impl(&dword_1C4CFF000, v169, OS_LOG_TYPE_DEBUG, "Unpackaging AssociatedMergeableDeltas with %lu deltas", buf, 0xCu);

    v39 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  }
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  objc_msgSend_associatedMergeableDeltas(v8, v42, v43);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  v189 = v14;
  uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v209, v224, 16);
  if (!v190) {
    goto LABEL_51;
  }
  uint64_t v191 = *(void *)v210;
  *(void *)&long long v47 = 138412546;
  long long v185 = v47;
  v186 = v8;
  while (2)
  {
    uint64_t v48 = 0;
    do
    {
      if (*(void *)v210 != v191) {
        objc_enumerationMutation(obj);
      }
      uint64_t v193 = v48;
      v49 = *(void **)(*((void *)&v209 + 1) + 8 * v48);
      v50 = objc_msgSend_translator(self, v45, v46, v185);
      v53 = objc_msgSend_recordIdentifier(v49, v51, v52);
      id v208 = 0;
      v55 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v50, v54, (uint64_t)v53, &v208);
      id v56 = v208;

      if (v56)
      {
        if (*v39 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v167 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v221 = (uint64_t)v56;
          _os_log_error_impl(&dword_1C4CFF000, v167, OS_LOG_TYPE_ERROR, "Error transforming CKRecordID, %@", buf, 0xCu);
        }
        objc_msgSend_setError_(self, v168, (uint64_t)v56);
        goto LABEL_94;
      }
      v59 = objc_msgSend_fieldIdentifier(v49, v57, v58);
      v62 = objc_msgSend_name(v59, v60, v61);

      v194 = objc_msgSend_objectForKeyedSubscript_(v196, v63, (uint64_t)v55);
      if (v194)
      {
        v192 = v62;
        v66 = objc_msgSend_mergeableDeltas(v49, v64, v65);
        v69 = objc_msgSend_firstObject(v66, v67, v68);
        int hasData = objc_msgSend_hasData(v69, v70, v71);

        if (hasData)
        {
          v62 = v192;
          v77 = objc_msgSend_objectForKeyedSubscript_(v194, v73, (uint64_t)v192);
          if (!v77) {
            goto LABEL_44;
          }
        }
        else
        {
          v80 = objc_msgSend_mergeableDeltas(v49, v73, v74);
          v83 = objc_msgSend_firstObject(v80, v81, v82);
          int hasEncryptedData = objc_msgSend_hasEncryptedData(v83, v84, v85);

          v62 = v192;
          if (!hasEncryptedData
            || (objc_msgSend_encryptedValues(v194, v87, v88),
                v89 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend_objectForKeyedSubscript_(v89, v90, (uint64_t)v192),
                uint64_t v91 = objc_claimAutoreleasedReturnValue(),
                v89,
                (v77 = (void *)v91) == 0))
          {
LABEL_44:
            if (*v39 != -1) {
              dispatch_once(v39, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v78 = v193;
            v126 = *v40;
            if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v185;
              uint64_t v221 = (uint64_t)v62;
              __int16 v222 = 2112;
              v223 = v55;
              _os_log_error_impl(&dword_1C4CFF000, v126, OS_LOG_TYPE_ERROR, "AssociatedMergeableDelta present for missing field '%@' in record %@", buf, 0x16u);
            }

            goto LABEL_49;
          }
        }
        v92 = objc_msgSend_translator(self, v75, v76);
        v95 = objc_msgSend_identifier(v49, v93, v94);
        v188 = v55;
        v98 = objc_msgSend_recordName(v55, v96, v97);
        v187 = v77;
        objc_msgSend_valueID(v77, v99, v100);
        v102 = v101 = v62;
        uint64_t isEncrypted = objc_msgSend_isEncrypted(v102, v103, v104);
        id v207 = 0;
        v107 = objc_msgSend_mergeableValueIDFromPMergeableValueIdentifier_recordName_fieldName_encrypted_error_(v92, v106, (uint64_t)v95, v98, v101, isEncrypted, &v207);
        id v56 = v207;

        if (v56)
        {
          if (*v39 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v8 = v186;
          v176 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v221 = (uint64_t)v56;
            _os_log_error_impl(&dword_1C4CFF000, v176, OS_LOG_TYPE_ERROR, "Error transforming CKMergeableValueID, %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v177, (uint64_t)v56);

          v55 = v188;
LABEL_94:

          goto LABEL_95;
        }
        id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v203 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        v111 = objc_msgSend_mergeableDeltas(v49, v109, v110);
        uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v203, v219, 16);
        if (v113)
        {
          uint64_t v116 = v113;
          uint64_t v117 = *(void *)v204;
          while (2)
          {
            for (uint64_t j = 0; j != v116; ++j)
            {
              if (*(void *)v204 != v117) {
                objc_enumerationMutation(v111);
              }
              uint64_t v119 = *(void *)(*((void *)&v203 + 1) + 8 * j);
              v120 = objc_msgSend_translator(self, v114, v115);
              id v202 = 0;
              v122 = objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v120, v121, v119, v107, &v202);
              id v123 = v202;

              if (v123)
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                id v14 = v189;
                v157 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v221 = (uint64_t)v107;
                  _os_log_error_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_ERROR, "Error transforming CKMergeableDelta with ID %@", buf, 0xCu);
                }
                objc_msgSend_setError_(self, v158, (uint64_t)v123);

                uint64_t v8 = v186;
                goto LABEL_95;
              }
              objc_msgSend_addObject_(v108, v124, (uint64_t)v122);
            }
            uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v203, v219, 16);
            if (v116) {
              continue;
            }
            break;
          }
        }

        objc_msgSend_addUnmergedDeltas_(v187, v125, (uint64_t)v108);
        uint64_t v8 = v186;
        v55 = v188;
        id v14 = v189;
        v40 = (os_log_t *)MEMORY[0x1E4F1A500];
        v39 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
        v62 = v192;
        uint64_t v78 = v193;
      }
      else
      {
        if (*v39 != -1) {
          dispatch_once(v39, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v78 = v193;
        v79 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v221 = (uint64_t)v55;
          _os_log_error_impl(&dword_1C4CFF000, v79, OS_LOG_TYPE_ERROR, "AssociatedMergeableDelta present for missing record %@", buf, 0xCu);
        }
      }
LABEL_49:

      uint64_t v48 = v78 + 1;
    }
    while (v48 != v190);
    uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v209, v224, 16);
    if (v190) {
      continue;
    }
    break;
  }
LABEL_51:

  objc_msgSend_setRecordsToSave_(self, v127, (uint64_t)v14);
  if (*v39 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v128 = *v40;
  if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
  {
    v178 = v128;
    v181 = objc_msgSend_deleteRecordids(v8, v179, v180);
    uint64_t v184 = objc_msgSend_count(v181, v182, v183);
    *(_DWORD *)buf = 134217984;
    uint64_t v221 = v184;
    _os_log_debug_impl(&dword_1C4CFF000, v178, OS_LOG_TYPE_DEBUG, "Unpackaging DeleteRecordIDs of %lu recordIDs", buf, 0xCu);
  }
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v129, v130);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  v131 = v8;
  v134 = objc_msgSend_deleteRecordids(v8, v132, v133);
  uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v198, v218, 16);
  if (v136)
  {
    uint64_t v139 = v136;
    uint64_t v140 = *(void *)v199;
    while (2)
    {
      for (uint64_t k = 0; k != v139; ++k)
      {
        if (*(void *)v199 != v140) {
          objc_enumerationMutation(v134);
        }
        v142 = *(void **)(*((void *)&v198 + 1) + 8 * k);
        v143 = objc_msgSend_translator(self, v137, v138);
        v146 = objc_msgSend_recordIdentifier(v142, v144, v145);
        id v197 = 0;
        v148 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v143, v147, (uint64_t)v146, &v197);
        id v149 = v197;

        if (v149)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v8 = v131;
          v159 = *MEMORY[0x1E4F1A500];
          id v14 = v189;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v221 = (uint64_t)v149;
            _os_log_error_impl(&dword_1C4CFF000, v159, OS_LOG_TYPE_ERROR, "Error transforming recordID: %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v160, (uint64_t)v149);

          goto LABEL_95;
        }
        objc_msgSend_addObject_(obj, v150, (uint64_t)v148);
      }
      uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v198, v218, 16);
      if (v139) {
        continue;
      }
      break;
    }
  }

  objc_msgSend_setRecordIDsToDelete_(self, v151, (uint64_t)obj);
  uint64_t v8 = v131;
  id v14 = v189;
LABEL_95:

LABEL_96:
}

- (void)_postflightRecords
{
  id v4 = objc_msgSend_recordsToSave(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_stateTransitionGroup(self, v8, v9);
    dispatch_group_enter(v10);

    id v11 = objc_opt_new();
    objc_msgSend_setShouldFetchAssetContent_(v11, v12, 0);
    objc_msgSend_setShouldFetchMergeableValues_(v11, v13, 0);
    uint64_t v14 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1C4D7F780;
    v16[3] = &unk_1E64F0210;
    v16[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v15, v14, v11, v16);
  }
}

- (id)deserializeCompletionBlock
{
  return self->_deserializeCompletionBlock;
}

- (void)setDeserializeCompletionBlock:(id)a3
{
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
}

- (CKDProtocolTranslator)translator
{
  return (CKDProtocolTranslator *)objc_getProperty(self, a2, 472, 1);
}

- (void)setTranslator:(id)a3
{
}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong(&self->_deserializeCompletionBlock, 0);
}

@end