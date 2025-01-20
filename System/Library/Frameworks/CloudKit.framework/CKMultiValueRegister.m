@interface CKMultiValueRegister
+ (id)placeholderIdentifier;
- (BOOL)isConsumedState;
- (BOOL)isEqual:(id)a3;
- (BOOL)merge:(id)a3 error:(id *)a4;
- (CKDistributedTimestampStateVector)vector;
- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4;
- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6;
- (NSArray)contents;
- (NSMutableDictionary)timestampToContents;
- (NSString)description;
- (NSUUID)identifier;
- (id)redactedDescription;
- (id)siteIdentifier;
- (unint64_t)hash;
- (unint64_t)nextClockValue;
- (unint64_t)replaceVectorStateForPresentOrTombstonedTimestamps:(unsigned __int8)a3;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation CKMultiValueRegister

- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4
{
  id v19 = 0;
  v4 = objc_msgSend_initWithIdentifier_vector_contents_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, &v19);
  id v5 = v19;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v16 = objc_msgSend_description(v5, v13, v14, v15);
    objc_msgSend_raise_format_(v9, v17, v10, @"Failed to initialize %@: %@", v12, v16);
  }
  return v7;
}

- (CKMultiValueRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v68.receiver = self;
  v68.super_class = (Class)CKMultiValueRegister;
  v16 = [(CKMultiValueRegister *)&v68 init];
  if (!v16) {
    goto LABEL_13;
  }
  v17 = objc_msgSend_mutableCopy(v11, v13, v14, v15);
  uint64_t v21 = objc_msgSend_copy(v10, v18, v19, v20);
  identifier = v16->_identifier;
  v16->_identifier = (NSUUID *)v21;

  v23 = objc_opt_new();
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = sub_18B00B754;
  v66[3] = &unk_1E5460130;
  id v24 = v23;
  id v67 = v24;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v25, (uint64_t)v66, v26);
  int isEqual = objc_msgSend_isEqual_(v24, v27, (uint64_t)v17, v28);
  objc_storeStrong((id *)&v16->_vector, v17);
  if (isEqual)
  {
    if (v12) {
      uint64_t v33 = objc_msgSend_mutableCopy(v12, v30, v31, v32);
    }
    else {
      uint64_t v33 = objc_msgSend_mutableCopy(MEMORY[0x1E4F1CC08], v30, v31, v32);
    }
    timestampToContents = v16->_timestampToContents;
    v16->_timestampToContents = (NSMutableDictionary *)v33;
    goto LABEL_7;
  }
  uint64_t v35 = objc_opt_new();
  v36 = v16->_timestampToContents;
  v16->_timestampToContents = (NSMutableDictionary *)v35;

  objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(v16, v37, 2, v38);
  if (!objc_msgSend_count(v12, v39, v40, v41)) {
    goto LABEL_12;
  }
  timestampToContents = objc_msgSend_mutableCopy(v24, v42, v43, v44);
  v48 = objc_msgSend_clockVector(v16->_vector, v45, v46, v47);
  objc_msgSend_minusVector_(timestampToContents, v49, (uint64_t)v48, v50);

  if (objc_msgSend_timestampCount(timestampToContents, v51, v52, v53))
  {
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, @"CKErrorDomain", 12, @"Data dictionary includes timestamps that are not present in vector");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  v57 = [CKMultiValueRegister alloc];
  v58 = objc_opt_class();
  v62 = objc_msgSend_placeholderIdentifier(v58, v59, v60, v61);
  v64 = objc_msgSend_initWithIdentifier_vector_contents_error_(v57, v63, (uint64_t)v62, (uint64_t)v24, v12, a6);

  if (!v64 || (objc_msgSend_merge_error_(v16, v65, (uint64_t)v64, (uint64_t)a6) & 1) == 0)
  {

LABEL_19:
    v55 = 0;
    goto LABEL_14;
  }

LABEL_7:
LABEL_12:

LABEL_13:
  v55 = v16;
LABEL_14:

  return v55;
}

- (unint64_t)nextClockValue
{
  id v5 = objc_msgSend_siteIdentifier(self, a2, v2, v3);
  v9 = objc_msgSend_vector(self, v6, v7, v8);
  id v12 = objc_msgSend_clockValuesForSiteIdentifier_(v9, v10, (uint64_t)v5, v11);
  uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);

  if (v16)
  {
    uint64_t v20 = objc_msgSend_vector(self, v17, v18, v19);
    v23 = objc_msgSend_clockValuesForSiteIdentifier_(v20, v21, (uint64_t)v5, v22);
    unint64_t v27 = objc_msgSend_lastIndex(v23, v24, v25, v26) + 1;
  }
  else
  {
    unint64_t v27 = 0;
  }

  return v27;
}

- (id)siteIdentifier
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = 0;
  v13[1] = 0;
  v4 = objc_msgSend_identifier(self, a2, v2, v3);
  objc_msgSend_getUUIDBytes_(v4, v5, (uint64_t)v13, v6);

  uint64_t v8 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v7, (uint64_t)v13, 16);
  v9 = [CKDistributedSiteIdentifier alloc];
  uint64_t v11 = objc_msgSend_initWithIdentifier_modifier_(v9, v10, (uint64_t)v8, 0);

  return v11;
}

- (BOOL)isConsumedState
{
  v4 = objc_msgSend_vector(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_vectorFilteredByAtomState_(v4, v5, 2, v6);
  BOOL v11 = objc_msgSend_timestampCount(v7, v8, v9, v10) != 0;

  return v11;
}

- (unint64_t)replaceVectorStateForPresentOrTombstonedTimestamps:(unsigned __int8)a3
{
  uint64_t v6 = objc_msgSend_vector(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_copy(v6, v7, v8, v9);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B00BAA0;
  v15[3] = &unk_1E5460158;
  unsigned __int8 v16 = a3;
  v15[4] = self;
  v15[5] = &v17;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v10, v11, (uint64_t)v15, v12);
  unint64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (NSArray)contents
{
  v4 = objc_msgSend_timestampToContents(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_allValues(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (void)setContents:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_timestampToContents(self, v5, v6, v7);
  objc_msgSend_removeAllObjects(v8, v9, v10, v11);

  if (v4)
  {
    if (objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(self, v12, 3, v13))
    {
      uint64_t ClockValue = objc_msgSend_nextClockValue(self, v14, v15, v16);
      uint64_t v21 = objc_msgSend_siteIdentifier(self, v18, v19, v20);
      uint64_t v25 = objc_msgSend_vector(self, v22, v23, v24);
      uint64_t v28 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v26, ClockValue, v27);
      objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v25, v29, (uint64_t)v28, 3, v21);
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v60 = v4;
    id obj = v4;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v31)
    {
      uint64_t v35 = v31;
      uint64_t v36 = *(void *)v63;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v63 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * v37);
          uint64_t v39 = objc_msgSend_nextClockValue(self, v32, v33, v34, v60);
          uint64_t v43 = objc_msgSend_siteIdentifier(self, v40, v41, v42);
          uint64_t v44 = [CKDistributedTimestamp alloc];
          uint64_t v46 = objc_msgSend_initWithSiteIdentifierObject_clockValue_(v44, v45, (uint64_t)v43, v39);
          uint64_t v50 = objc_msgSend_timestampToContents(self, v47, v48, v49);
          objc_msgSend_setObject_forKeyedSubscript_(v50, v51, v38, (uint64_t)v46);

          v55 = objc_msgSend_vector(self, v52, v53, v54);
          v58 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v56, v39, v57);
          objc_msgSend_addClockValuesInIndexSet_withAtomState_forSiteIdentifier_(v55, v59, (uint64_t)v58, 1, v43);

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v62, (uint64_t)v66, 16);
      }
      while (v35);
    }

    id v4 = v60;
  }
  else
  {
    objc_msgSend_replaceVectorStateForPresentOrTombstonedTimestamps_(self, v12, 2, v13);
  }
}

- (BOOL)merge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int isConsumedState = objc_msgSend_isConsumedState(v6, v7, v8, v9);
  if (isConsumedState)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKErrorDomain", 12, @"Other register is in consumed state and should not be merged");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend_timestampToContents(self, v10, v11, v12);
    uint64_t v18 = objc_msgSend_timestampToContents(v6, v15, v16, v17);
    objc_msgSend_addEntriesFromDictionary_(v14, v19, (uint64_t)v18, v20);

    uint64_t v24 = objc_msgSend_vector(self, v21, v22, v23);
    uint64_t v28 = objc_msgSend_vector(v6, v25, v26, v27);
    objc_msgSend_unionStateVector_(v24, v29, (uint64_t)v28, v30);

    uint64_t v31 = objc_opt_new();
    uint64_t v35 = objc_msgSend_timestampToContents(self, v32, v33, v34);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_18B00C078;
    v76[3] = &unk_1E5460180;
    v76[4] = self;
    id v77 = v31;
    id v36 = v31;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v35, v37, (uint64_t)v76, v38);

    uint64_t v42 = objc_msgSend_timestampToContents(self, v39, v40, v41);
    objc_msgSend_removeObjectsForKeys_(v42, v43, (uint64_t)v36, v44);

    v45 = objc_opt_new();
    uint64_t v49 = objc_msgSend_timestampToContents(self, v46, v47, v48);
    uint64_t v70 = MEMORY[0x1E4F143A8];
    uint64_t v71 = 3221225472;
    v72 = sub_18B00C0F8;
    v73 = &unk_1E5460180;
    v74 = self;
    id v75 = v45;
    id v50 = v45;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v49, v51, (uint64_t)&v70, v52);

    v56 = objc_msgSend_vector(self, v53, v54, v55, v70, v71, v72, v73, v74);
    id v60 = objc_msgSend_clockVector(v50, v57, v58, v59);
    objc_msgSend_minusVector_(v56, v61, (uint64_t)v60, v62);

    v66 = objc_msgSend_vector(self, v63, v64, v65);
    objc_msgSend_unionStateVector_(v66, v67, (uint64_t)v50, v68);
  }
  return isConsumedState ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (CKMultiValueRegister *)a3;
  if (self == v5)
  {
    char isEqual = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v5, v7, v6, v8))
    {
      uint64_t v9 = v5;
      uint64_t v13 = objc_msgSend_vector(self, v10, v11, v12);
      uint64_t v20 = objc_msgSend_vector(v9, v14, v15, v16);
      if (v13 != v20)
      {
        uint64_t v21 = objc_msgSend_vector(self, v17, v18, v19);
        uint64_t v3 = objc_msgSend_vector(v9, v22, v23, v24);
        if (!objc_msgSend_isEqual_(v21, v25, (uint64_t)v3, v26))
        {
          char isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        uint64_t v44 = v21;
      }
      uint64_t v28 = objc_msgSend_timestampToContents(self, v17, v18, v19);
      uint64_t v35 = objc_msgSend_timestampToContents(v9, v29, v30, v31);
      if (v28 == v35)
      {
        char isEqual = 1;
      }
      else
      {
        id v36 = objc_msgSend_timestampToContents(self, v32, v33, v34);
        uint64_t v40 = objc_msgSend_timestampToContents(v9, v37, v38, v39);
        char isEqual = objc_msgSend_isEqual_(v36, v41, (uint64_t)v40, v42);
      }
      uint64_t v21 = v44;
      if (v13 == v20) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_vector(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_timestampToContents(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMultiValueRegister *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMultiValueRegister *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_vector(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"vector", (uint64_t)v8, 0);

  objc_msgSend_timestampToContents(self, v10, v11, v12);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_allKeys(v18, v13, v14, v15);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, @"timestamps", (uint64_t)v16, 0);
}

+ (id)placeholderIdentifier
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = objc_msgSend_initWithUUIDBytes_(v2, v3, (uint64_t)v7, v4);

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CKDistributedTimestampStateVector)vector
{
  return self->_vector;
}

- (NSMutableDictionary)timestampToContents
{
  return self->_timestampToContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampToContents, 0);
  objc_storeStrong((id *)&self->_vector, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end