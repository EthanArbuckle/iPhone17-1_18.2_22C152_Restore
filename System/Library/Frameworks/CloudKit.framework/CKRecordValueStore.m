@interface CKRecordValueStore
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4;
- (BOOL)containsValuePassingTest:(id)a3;
- (BOOL)isEncrypted;
- (CKRecordValueStore)initWithCoder:(id)a3;
- (CKRecordValueStore)initWithRecord:(id)a3;
- (NSMutableDictionary)originalValues;
- (NSMutableDictionary)values;
- (NSMutableSet)changedKeysSet;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)allKeys;
- (id)allRawValues;
- (id)changedKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)rawValueForKey:(id)a3;
- (id)recordID;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4;
- (void)enumerateKeysAndValuesUsingBlock:(id)a3;
- (void)resetChangedKeys;
- (void)setChangedKeysSet:(id)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setObjectNoValidate:(id)a3 forKey:(id)a4;
- (void)setOriginalValues:(id)a3;
- (void)setRawValue:(id)a3 forKey:(id)a4;
- (void)setValues:(id)a3;
@end

@implementation CKRecordValueStore

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 1);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

- (CKRecordValueStore)initWithRecord:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKRecordValueStore;
  v5 = [(CKRecordValueStore *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_record, v4);
    uint64_t v7 = objc_opt_new();
    values = v6->_values;
    v6->_values = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    originalValues = v6->_originalValues;
    v6->_originalValues = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    changedKeysSet = v6->_changedKeysSet;
    v6->_changedKeysSet = (NSMutableSet *)v11;

    v6->_trackChanges = 1;
  }

  return v6;
}

- (NSMutableDictionary)values
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_values;
  objc_sync_exit(v2);

  return v3;
}

- (void)setValues:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1ED7EFC18, v6);
  uint64_t v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);
  values = v4->_values;
  v4->_values = (NSMutableDictionary *)v11;

  objc_sync_exit(v4);
}

- (NSMutableDictionary)originalValues
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_originalValues;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOriginalValues:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1ED7EFC38, v6);
  uint64_t v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);
  originalValues = v4->_originalValues;
  v4->_originalValues = (NSMutableDictionary *)v11;

  objc_sync_exit(v4);
}

- (NSMutableSet)changedKeysSet
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_changedKeysSet;
  objc_sync_exit(v2);

  return v3;
}

- (void)setChangedKeysSet:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_CKDeepCopy(v14, v5, v6, v7);
  uint64_t v12 = objc_msgSend_mutableCopy(v8, v9, v10, v11);
  changedKeysSet = v4->_changedKeysSet;
  v4->_changedKeysSet = (NSMutableSet *)v12;

  objc_sync_exit(v4);
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)recordID
{
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_record);
    objc_msgSend_recordID(WeakRetained, v5, v6, v7);
  }
  else
  {
    id WeakRetained = 0;
    objc_msgSend_recordID(0, a2, v2, v3);
  v8 = };

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_values(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);

  objc_sync_exit(v5);

  return v12;
}

- (id)rawValueForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_values(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11);

  objc_sync_exit(v5);

  return v12;
}

- (void)setRawValue:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = sub_18B0A3DB0(v14);
  uint64_t v12 = objc_msgSend_values(v7, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, (uint64_t)v6);

  objc_sync_exit(v7);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v193 = a3;
  id v7 = v6;
  uint64_t v8 = v7;
  if (self)
  {
    uint64_t v195 = 0;
    *(void *)buf = 0;
    id v194 = 0;
    uint64_t v9 = CKProcessIndexedArrayKey(v7, &v194, (uint64_t *)buf, &v195);
    id v10 = v194;
    if (v9)
    {
      v119 = [CKException alloc];
      uint64_t v120 = *MEMORY[0x1E4F1C3C8];
      objc_msgSend_localizedDescription(v9, v121, v122, v123);
    }
    else
    {
      uint64_t v11 = v10;
      id v12 = v8;
      if (v10)
      {
        if ((*(void *)buf & 0x8000000000000000) != 0 && (*(void *)buf != -1 || v195))
        {
          v184 = [CKException alloc];
          uint64_t v185 = *MEMORY[0x1E4F1C3C8];
          v188 = objc_msgSend_stringWithFormat_(NSString, v186, @"Negative indexed list keys (%@) can only be appends", v187, v8);
          id v172 = (id)objc_msgSend_initWithName_format_(v184, v189, v185, @"%@", v188);

LABEL_70:
          objc_exception_throw(v172);
        }
        id v12 = v10;
      }
      id v13 = sub_18B0A5A28();
      int v16 = objc_msgSend_containsObject_(v13, v14, (uint64_t)v12, v15);

      if (v16)
      {
        v119 = [CKException alloc];
        uint64_t v120 = *MEMORY[0x1E4F1C3C8];
        uint64_t v126 = objc_msgSend_stringWithFormat_(NSString, v124, @"\"%@\" is a reserved key name", v125, v12);
LABEL_61:
        v132 = (void *)v126;
        v133 = objc_msgSend_initWithName_format_(v119, v127, v120, @"%@", v126);
        goto LABEL_69;
      }
      uint64_t v17 = CKValidateKeyName(v12);
      if (!v17)
      {

        id v18 = v8;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_record);
        objc_msgSend_valueStore(WeakRetained, v20, v21, v22);
        v26 = (CKRecordValueStore *)objc_claimAutoreleasedReturnValue();
        if (v26 == self) {
          objc_msgSend_encryptedValueStore(WeakRetained, v23, v24, v25);
        }
        else {
        v27 = objc_msgSend_valueStore(WeakRetained, v23, v24, v25);
        }

        v31 = objc_msgSend_allKeys(v27, v28, v29, v30);
        int v34 = objc_msgSend_containsObject_(v31, v32, (uint64_t)v18, v33);

        if (v34)
        {
          v134 = [CKException alloc];
          v136 = objc_msgSend_initWithName_format_(v134, v135, *MEMORY[0x1E4F1C3C8], @"You cannot set the same key %@ on both CKRecord and -[CKRecord encryptedValues]", v18);
          goto LABEL_80;
        }

        id v35 = v193;
        id v36 = v18;
        v40 = objc_msgSend_recordID(self, v37, v38, v39);
        int isEncrypted = objc_msgSend_isEncrypted(self, v41, v42, v43);
        if (v35 && (CKValueCanBeSetOnRecord(v35) & 1) == 0)
        {
          v158 = [CKException alloc];
          uint64_t v159 = *MEMORY[0x1E4F1C3C8];
          v160 = (objc_class *)objc_opt_class();
          v161 = NSStringFromClass(v160);
          v162 = (objc_class *)objc_opt_class();
          v163 = NSStringFromClass(v162);
          id v165 = (id)objc_msgSend_initWithName_format_(v158, v164, v159, @"Objects of class %@ cannot be set on %@", v161, v163);

          objc_exception_throw(v165);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v137 = [CKException alloc];
          uint64_t v138 = *MEMORY[0x1E4F1C3C8];
          uint64_t v192 = objc_opt_class();
          v136 = objc_msgSend_initWithName_format_(v137, v139, v138, @"Use %@ for storing record IDs on records", v192);
          goto LABEL_80;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v140 = [CKException alloc];
          v136 = objc_msgSend_initWithName_format_(v140, v141, *MEMORY[0x1E4F1C3C8], @"Use -[CKRecord encryptedValues] for storing encrypted values on records");
          goto LABEL_80;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_24;
        }
        id v45 = v35;
        objc_msgSend_coordinate(v45, v46, v47, v48);
        if (v52 < -90.0 || (objc_msgSend_coordinate(v45, v49, v50, v51), v56 > 90.0))
        {
          v142 = [CKException alloc];
          uint64_t v143 = *MEMORY[0x1E4F1C3C8];
          v144 = (objc_class *)objc_opt_class();
          v132 = NSStringFromClass(v144);
          objc_msgSend_coordinate(v45, v145, v146, v147);
          v133 = objc_msgSend_initWithName_format_(v142, v148, v143, @"Invalid latitude value in %@: %f", v132, v149);
        }
        else
        {
          objc_msgSend_coordinate(v45, v53, v54, v55);
          if (v60 >= -180.0)
          {
            objc_msgSend_coordinate(v45, v57, v58, v59);
            if (v61 <= 180.0)
            {

LABEL_24:
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                CKValidateRecordArrayValue(v35);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_30:
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v75 = v35;
                  if (*(unsigned char *)objc_msgSend_objCType(v75, v76, v77, v78) == 81
                    && objc_msgSend_unsignedLongLongValue(v75, v79, v80, v81) < 0)
                  {
                    if (ck_log_initialization_predicate != -1) {
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    }
                    v82 = ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_18AF10000, v82, OS_LOG_TYPE_ERROR, "Attempting to set an unsigned long long value with the high order bit set.  This is not supported by CloudKit", buf, 2u);
                    }
                    if (byte_1E9124EF0
                      && CKCurrentProcessLinkCheck5dbf91c3fd1d871f0bcfe60afeb451e3e708d350())
                    {
                      v190 = [CKException alloc];
                      v136 = objc_msgSend_initWithName_format_(v190, v191, *MEMORY[0x1E4F1C3C8], @"CloudKit does not support unsigned long long values with the high order bit set.");
                      goto LABEL_80;
                    }
                    if (ck_log_initialization_predicate != -1) {
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    }
                    v83 = ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_18AF10000, v83, OS_LOG_TYPE_ERROR, "Allowing this for backwards compatibility; you will receive this as a signed long long when read"
                        "ing this value from the server",
                        buf,
                        2u);
                    }
                  }
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_52:

                  goto LABEL_53;
                }
                id v84 = v35;
                v88 = objc_msgSend_valueID(v84, v85, v86, v87);
                v92 = v88;
                if (!v88)
                {
LABEL_51:

                  goto LABEL_52;
                }
                v93 = objc_msgSend_recordID(v88, v89, v90, v91);

                if (v93)
                {
                  v97 = objc_msgSend_recordID(v92, v94, v95, v96);
                  char isEqual = objc_msgSend_isEqual_(v97, v98, (uint64_t)v40, v99);

                  if (isEqual)
                  {
                    v104 = objc_msgSend_key(v92, v101, v102, v103);

                    if (v104)
                    {
                      v108 = objc_msgSend_key(v92, v105, v106, v107);
                      char v111 = objc_msgSend_isEqual_(v108, v109, (uint64_t)v36, v110);

                      if (v111)
                      {
                        if (isEncrypted == objc_msgSend_isEncrypted(v92, v112, v113, v114)) {
                          goto LABEL_51;
                        }
                        v181 = [CKException alloc];
                        uint64_t v183 = *MEMORY[0x1E4F1C3C8];
                        if (isEncrypted) {
                          v136 = objc_msgSend_initWithName_format_(v181, v182, v183, @"Trying to set unencrypted mergeable value on an encrypted field '%@': %@", v36, v84);
                        }
                        else {
                          v136 = objc_msgSend_initWithName_format_(v181, v182, v183, @"Trying to set encrypted mergeable value on an unencrypted field '%@': %@", v36, v84);
                        }
                      }
                      else
                      {
                        v179 = [CKException alloc];
                        v136 = objc_msgSend_initWithName_format_(v179, v180, *MEMORY[0x1E4F1C3C8], @"Mergeable value ID has the wrong key, expected '%@': %@", v36, v92);
                      }
                    }
                    else
                    {
                      v177 = [CKException alloc];
                      v136 = objc_msgSend_initWithName_format_(v177, v178, *MEMORY[0x1E4F1C3C8], @"Mergeable value ID has no key, expected '%@': %@", v36, v92);
                    }
                  }
                  else
                  {
                    v175 = [CKException alloc];
                    v136 = objc_msgSend_initWithName_format_(v175, v176, *MEMORY[0x1E4F1C3C8], @"Mergeable value for key '%@' has the wrong record ID. valueID=%@ self=%@", v36, v92, v40);
                  }
                }
                else
                {
                  v173 = [CKException alloc];
                  v136 = objc_msgSend_initWithName_format_(v173, v174, *MEMORY[0x1E4F1C3C8], @"Mergeable value ID for key '%@' has no record ID: %@", v36, v92);
                }
LABEL_80:
                objc_exception_throw(v136);
              }
              id v62 = v35;
              uint64_t v66 = objc_msgSend_recordID(v62, v63, v64, v65);
              if (!v66
                || (v70 = (void *)v66,
                    objc_msgSend_recordID(v62, v67, v68, v69),
                    v71 = objc_claimAutoreleasedReturnValue(),
                    char v74 = objc_msgSend_isEqual_(v71, v72, (uint64_t)v40, v73),
                    v71,
                    v70,
                    (v74 & 1) != 0))
              {

                goto LABEL_30;
              }
              v166 = [CKException alloc];
              uint64_t v167 = *MEMORY[0x1E4F1C3C8];
              v132 = objc_msgSend_recordID(v62, v168, v169, v170);
              v133 = objc_msgSend_initWithName_format_(v166, v171, v167, @"You cannot set the same asset on multiple records. Asset %@ is already associated with record %@", v62, v132);
              goto LABEL_69;
            }
          }
          v150 = [CKException alloc];
          uint64_t v151 = *MEMORY[0x1E4F1C3C8];
          v152 = (objc_class *)objc_opt_class();
          v132 = NSStringFromClass(v152);
          objc_msgSend_coordinate(v45, v153, v154, v155);
          v133 = objc_msgSend_initWithName_format_(v150, v156, v151, @"Invalid longitude value in %@: %f", v132, v157);
        }
LABEL_69:
        id v172 = v133;

        goto LABEL_70;
      }
      v128 = (void *)v17;
      v119 = [CKException alloc];
      uint64_t v120 = *MEMORY[0x1E4F1C3C8];
      objc_msgSend_localizedDescription(v128, v129, v130, v131);
    uint64_t v126 = };
    goto LABEL_61;
  }

  id v116 = v8;
  id v117 = v193;
  id v118 = v116;
LABEL_53:

  objc_msgSend__setObject_forKey_(self, v115, (uint64_t)v193, (uint64_t)v8);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a4) {
    objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, (uint64_t)a4);
  }
}

- (void)setObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  sub_18B0A4DFC(v7, v41, v6);
  uint64_t v11 = objc_msgSend_values(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_originalValues(v7, v12, v13, v14);
  id v18 = v15;
  if (v7)
  {
    int trackChanges = v7->_trackChanges;
    if (v6 && v7->_trackChanges)
    {
      v20 = objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v6, v17);

      if (!v20)
      {
        v23 = objc_msgSend_objectForKeyedSubscript_(v11, v21, (uint64_t)v6, v22);

        if (v23) {
          objc_msgSend_objectForKeyedSubscript_(v11, v24, (uint64_t)v6, v26);
        }
        else {
        v27 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v24, v25, v26);
        }
        objc_msgSend_setObject_forKeyedSubscript_(v18, v28, (uint64_t)v27, (uint64_t)v6);
      }
      int trackChanges = 1;
    }
  }
  else
  {
    int trackChanges = 0;
  }
  uint64_t v29 = sub_18B0A3DB0(v41);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v30, (uint64_t)v29, (uint64_t)v6);

  if (trackChanges)
  {
    int v34 = objc_msgSend_changedKeysSet(v7, v31, v32, v33);
    uint64_t v38 = objc_msgSend_copy(v6, v35, v36, v37);
    objc_msgSend_addObject_(v34, v39, (uint64_t)v38, v40);
  }
  objc_sync_exit(v7);
}

- (void)setNilValueForKey:(id)a3
{
  id v30 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_values(v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_originalValues(v4, v9, v10, v11);
  if (v4 && v4->_trackChanges)
  {
    int v16 = objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v30, v13);
    if (v16)
    {
      uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v12, (uint64_t)v30, v13);

      if (!v17)
      {
        id v18 = objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v30, v13);
        objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v18, (uint64_t)v30);
      }
    }
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
  }
  objc_msgSend_removeObjectForKey_(v8, v12, (uint64_t)v30, v13);
  if (v15)
  {
    v23 = objc_msgSend_changedKeysSet(v4, v20, v21, v22);
    v27 = objc_msgSend_copy(v30, v24, v25, v26);
    objc_msgSend_addObject_(v23, v28, (uint64_t)v27, v29);
  }
  objc_sync_exit(v4);
}

- (id)allKeys
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_values(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_allKeys(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return v10;
}

- (id)allRawValues
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_values(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_allValues(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return v10;
}

- (id)changedKeys
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_changedKeysSet(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_allObjects(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return v10;
}

- (void)resetChangedKeys
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v5 = objc_msgSend_changedKeysSet(obj, v2, v3, v4);
  objc_msgSend_removeAllObjects(v5, v6, v7, v8);

  id v12 = objc_msgSend_originalValues(obj, v9, v10, v11);
  objc_msgSend_removeAllObjects(v12, v13, v14, v15);

  objc_sync_exit(obj);
}

- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  char v6 = a4;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (uint64_t (**)(id, uint64_t, void))a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v55 = v10;
  if (v6) {
    objc_msgSend_changedKeys(v10, v11, v12, v13);
  }
  else {
    objc_msgSend_allKeys(v10, v11, v12, v13);
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v73, (uint64_t)v80, 16);
  if (!v16)
  {
    BOOL v53 = 0;
    goto LABEL_61;
  }
  uint64_t v60 = *(void *)v74;
  id v56 = v8;
  id v58 = v14;
  do
  {
    uint64_t v59 = v16;
    for (uint64_t i = 0; i != v59; ++i)
    {
      if (*(void *)v74 != v60) {
        objc_enumerationMutation(v14);
      }
      uint64_t v21 = *(void *)(*((void *)&v73 + 1) + 8 * i);
      uint64_t v22 = objc_msgSend_values(v10, v17, v18, v19);
      uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, v21, v24);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = v26;
      if (v27)
      {
        id v31 = v27;
        uint64_t v32 = objc_msgSend_firstObject(v27, v28, v29, v30);
        if (v32)
        {
          id v57 = v32;
          if (v8)
          {
            uint64_t v33 = objc_opt_class();
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v34 = v8;
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v65, (uint64_t)v78, 16);
            if (v38)
            {
              uint64_t v39 = *(void *)v66;
              while (2)
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v66 != v39) {
                    objc_enumerationMutation(v34);
                  }
                  if (objc_msgSend_isSubclassOfClass_(v33, v36, *(void *)(*((void *)&v65 + 1) + 8 * j), v37))
                  {

                    uint64_t v10 = v55;
                    id v8 = v56;
                    id v14 = v58;
                    goto LABEL_35;
                  }
                }
                uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v65, (uint64_t)v78, 16);
                if (v38) {
                  continue;
                }
                break;
              }
              uint64_t v10 = v55;
            }
LABEL_44:
            id v8 = v56;
            id v14 = v58;
          }
          else
          {
LABEL_35:
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v34 = v31;
            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v48, (uint64_t)&v61, (uint64_t)v77, 16);
            if (v49)
            {
              uint64_t v50 = *(void *)v62;
              while (2)
              {
                for (uint64_t k = 0; k != v49; ++k)
                {
                  if (*(void *)v62 != v50) {
                    objc_enumerationMutation(v34);
                  }
                  if (v9[2](v9, v21, *(void *)(*((void *)&v61 + 1) + 8 * k)))
                  {

                    id v8 = v56;
                    id v14 = v58;

                    goto LABEL_59;
                  }
                }
                uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v52, (uint64_t)&v61, (uint64_t)v77, 16);
                if (v49) {
                  continue;
                }
                break;
              }
              id v31 = v34;
              goto LABEL_44;
            }
            id v31 = v34;
          }

          uint64_t v32 = v57;
        }

LABEL_51:
        goto LABEL_52;
      }
      if (v8)
      {
        id v41 = objc_opt_class();
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v31 = v8;
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v42, (uint64_t)&v69, (uint64_t)v79, 16);
        if (v45)
        {
          uint64_t v46 = *(void *)v70;
          while (2)
          {
            for (uint64_t m = 0; m != v45; ++m)
            {
              if (*(void *)v70 != v46) {
                objc_enumerationMutation(v31);
              }
              if (objc_msgSend_isSubclassOfClass_(v41, v43, *(void *)(*((void *)&v69 + 1) + 8 * m), v44))
              {

                uint64_t v10 = v55;
                id v8 = v56;
                id v14 = v58;
                goto LABEL_46;
              }
            }
            uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v43, (uint64_t)&v69, (uint64_t)v79, 16);
            if (v45) {
              continue;
            }
            break;
          }
          uint64_t v10 = v55;
          id v8 = v56;
        }
        else
        {
          uint64_t v10 = v55;
        }
        id v14 = v58;
        goto LABEL_51;
      }
LABEL_46:
      if (((uint64_t (**)(id, uint64_t, void *))v9)[2](v9, v21, v25))
      {
LABEL_59:

        BOOL v53 = 1;
        goto LABEL_61;
      }
LABEL_52:
    }
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v73, (uint64_t)v80, 16);
    BOOL v53 = 0;
  }
  while (v16);
LABEL_61:

  objc_sync_exit(v10);
  return v53;
}

- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, (uint64_t)a3, 0, a4);
}

- (BOOL)containsValuePassingTest:(id)a3
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, 0, 0, a3);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B0A59D4;
  v11[3] = &unk_1E5463828;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend_containsValueOfClasses_options_passingTest_(self, v10, (uint64_t)a3, a4, v11);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)&v3->_record);
  }
  else {
    id WeakRetained = 0;
  }
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_initWithRecord_(v5, v6, (uint64_t)WeakRetained, v7);
  id v12 = objc_msgSend_values(v3, v9, v10, v11);
  objc_msgSend_setValues_((void *)v8, v13, (uint64_t)v12, v14);

  uint64_t v18 = objc_msgSend_originalValues(v3, v15, v16, v17);
  objc_msgSend_setOriginalValues_((void *)v8, v19, (uint64_t)v18, v20);

  uint64_t v24 = objc_msgSend_changedKeysSet(v3, v21, v22, v23);
  v28 = objc_msgSend_CKDeepCopy(v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_mutableCopy(v28, v29, v30, v31);
  uint64_t v33 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v32;

  if (v3) {
    BOOL trackChanges = v3->_trackChanges;
  }
  else {
    BOOL trackChanges = 0;
  }
  *(unsigned char *)(v8 + 8) = trackChanges;

  objc_sync_exit(v3);
  return (id)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  uint64_t v4 = (void *)MEMORY[0x18C12ADA0]();
  id v5 = self;
  objc_sync_enter(v5);
  id v9 = objc_msgSend_values(v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v21, v10, (uint64_t)v9, @"RecordValues");

  uint64_t v14 = objc_msgSend_originalValues(v5, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v21, v15, (uint64_t)v14, @"OriginalValues");

  uint64_t v19 = objc_msgSend_changedKeysSet(v5, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v21, v20, (uint64_t)v19, @"ChangedKeys");

  objc_sync_exit(v5);
}

- (CKRecordValueStore)initWithCoder:(id)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CKRecordValueStore;
  id v5 = [(CKRecordValueStore *)&v49 init];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = CKAcceptableValueClasses();
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    id v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v51, 2);
    uint64_t v12 = objc_msgSend_setByAddingObjectsFromArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"RecordValues");
    uint64_t v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);
    values = v5->_values;
    v5->_values = (NSMutableDictionary *)v18;

    uint64_t v20 = CKAcceptableValueClasses();
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v50[2] = objc_opt_class();
    uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v50, 3);
    uint64_t v25 = objc_msgSend_setByAddingObjectsFromArray_(v20, v23, (uint64_t)v22, v24);
    uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v26, (uint64_t)v25, @"OriginalValues");
    uint64_t v31 = objc_msgSend_mutableCopy(v27, v28, v29, v30);
    originalValues = v5->_originalValues;
    v5->_originalValues = (NSMutableDictionary *)v31;

    uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v38 = objc_msgSend_setWithObjects_(v33, v36, v34, v37, v35, 0);
    uint64_t v40 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, @"ChangedKeys");
    changedKeysSet = v5->_changedKeysSet;
    v5->_changedKeysSet = (NSMutableSet *)v40;

    if (!v5->_values)
    {
      uint64_t v42 = objc_opt_new();
      uint64_t v43 = v5->_values;
      v5->_values = (NSMutableDictionary *)v42;
    }
    if (!v5->_originalValues)
    {
      uint64_t v44 = objc_opt_new();
      uint64_t v45 = v5->_originalValues;
      v5->_originalValues = (NSMutableDictionary *)v44;
    }
    if (!v5->_changedKeysSet)
    {
      uint64_t v46 = objc_opt_new();
      uint64_t v47 = v5->_changedKeysSet;
      v5->_changedKeysSet = (NSMutableSet *)v46;
    }
    v5->_BOOL trackChanges = 1;
  }

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = self;
  objc_sync_enter(v8);
  long long v63 = v8;
  long long v67 = objc_msgSend_values(v8, v9, v10, v11);
  if (v5)
  {
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v67, v12, v7, v6, 1);
    id v68 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v15 = objc_msgSend_allKeys(v67, v12, v13, v14);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v75, (uint64_t)v80, 16);
  if (!v17)
  {

    goto LABEL_30;
  }
  id v68 = 0;
  obuint64_t j = v15;
  uint64_t v65 = *(void *)v76;
  do
  {
    uint64_t v66 = v17;
    for (uint64_t i = 0; i != v66; ++i)
    {
      if (*(void *)v76 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v69 = *(void *)(*((void *)&v75 + 1) + 8 * i);
      long long v70 = objc_msgSend_objectForKeyedSubscript_(v67, v18, v69, v19);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v68) {
          id v68 = (id)objc_msgSend_mutableCopy(v67, v21, v22, v23);
        }
        uint64_t v24 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v70, v21, v7, v6, 0);
        v28 = objc_msgSend_CKPropertiesStyleString(v24, v25, v26, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v68, v29, (uint64_t)v28, v69);

LABEL_12:
        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = objc_msgSend_firstObject(v70, v30, v31, v32);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          if (!v68) {
            id v68 = (id)objc_msgSend_mutableCopy(v67, v35, v36, v37);
          }
          id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v42 = objc_msgSend_count(v70, v39, v40, v41);
          uint64_t v24 = objc_msgSend_initWithCapacity_(v38, v43, v42, v44);
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v45 = v70;
          uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v71, (uint64_t)v79, 16);
          if (v48)
          {
            uint64_t v49 = *(void *)v72;
            do
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v72 != v49) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v51 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(*(void **)(*((void *)&v71 + 1) + 8 * j), v47, v7, v6, 0);
                uint64_t v55 = objc_msgSend_CKPropertiesStyleString(v51, v52, v53, v54);
                objc_msgSend_addObject_(v24, v56, (uint64_t)v55, v57);
              }
              uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v71, (uint64_t)v79, 16);
            }
            while (v48);
          }

          objc_msgSend_setObject_forKeyedSubscript_(v68, v58, (uint64_t)v24, v69);
          goto LABEL_12;
        }
      }
LABEL_25:
    }
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v75, (uint64_t)v80, 16);
  }
  while (v17);

  if (!v68) {
LABEL_30:
  }
    id v68 = (id)objc_msgSend_copy(v67, v59, v60, v61);
LABEL_31:

  objc_sync_exit(v63);

  return v68;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_changedKeysSet, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end