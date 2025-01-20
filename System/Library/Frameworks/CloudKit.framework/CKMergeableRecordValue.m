@interface CKMergeableRecordValue
+ (BOOL)supportsSecureCoding;
- (BOOL)addDeltasToSaveFromMergeable:(id)a3 container:(id)a4 error:(id *)a5;
- (BOOL)addDeltasToSaveFromMergeable:(id)a3 error:(id *)a4;
- (BOOL)encryptMetadata;
- (BOOL)hasAssetBackedDeltas;
- (BOOL)inlineReplacementEnabled;
- (BOOL)isValueIDKnownToServer;
- (BOOL)mergeIntoMergeable:(id)a3 error:(id *)a4;
- (BOOL)mergeRecordValue:(id)a3 error:(id *)a4;
- (CKDistributedTimestampStateVector)lastKnownServerTimestampVector;
- (CKMergeableRecordValue)init;
- (CKMergeableRecordValue)initWithCoder:(id)a3;
- (CKMergeableRecordValue)initWithValueID:(id)a3;
- (CKMergeableValueID)valueID;
- (CKMultiValueMergeableDeltaRegister)multiValueRegister;
- (CKMultiValueMergeableDeltaRegisterState)multiValueRegisterState;
- (NSArray)pendingReplacementRequests;
- (NSSet)deltasToSave;
- (NSSet)savedDeltaMetadatas;
- (NSSet)serverDeltaMetadatas;
- (NSSet)unmergedDeltas;
- (NSString)description;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)CKVeryShortDescription;
- (id)deliverableDeltasWithCurrentStateVector:(id)a3 usingDeliveryRequirements:(unint64_t)a4;
- (id)redactedDescription;
- (int64_t)encryptMetadataTernary;
- (unint64_t)enabledFaultErrors;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)addServerDeltaMetadatas:(id)a3;
- (void)addUnmergedDeltas:(id)a3;
- (void)didMergeDeltas:(id)a3;
- (void)didSaveDeltas:(id)a3 replacementRequests:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)mergeLastKnownServerTimestampVector:(id)a3;
- (void)mergeLastKnownServerTimestampVectorFromDeltas:(id)a3;
- (void)sanityCheckDeltas:(id)a3;
- (void)setDeltasToSave:(id)a3;
- (void)setEnabledFaultErrors:(unint64_t)a3;
- (void)setEncryptMetadata:(BOOL)a3;
- (void)setEncryptMetadataTernary:(int64_t)a3;
- (void)setInlineReplacementEnabled:(BOOL)a3;
- (void)setIsValueIDKnownToServer:(BOOL)a3;
- (void)setLastKnownServerTimestampVector:(id)a3;
- (void)setMultiValueRegisterState:(id)a3;
- (void)setPendingReplacementRequests:(id)a3;
- (void)setSavedDeltaMetadatas:(id)a3;
- (void)setServerDeltaMetadatas:(id)a3;
- (void)setUnmergedDeltas:(id)a3;
- (void)setValueID:(id)a3;
@end

@implementation CKMergeableRecordValue

- (CKMergeableRecordValue)initWithValueID:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKMergeableRecordValue;
  v6 = [(CKMergeableRecordValue *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueID, a3);
    uint64_t v11 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v8, v9, v10);
    deltasToSave = v7->_deltasToSave;
    v7->_deltasToSave = (NSSet *)v11;

    uint64_t v16 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v13, v14, v15);
    unmergedDeltas = v7->_unmergedDeltas;
    v7->_unmergedDeltas = (NSSet *)v16;

    v7->_encryptMetadataTernary = -1;
    uint64_t v21 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v18, v19, v20);
    serverDeltaMetadatas = v7->_serverDeltaMetadatas;
    v7->_serverDeltaMetadatas = (NSSet *)v21;

    uint64_t v26 = objc_msgSend_array(MEMORY[0x1E4F1C978], v23, v24, v25);
    pendingReplacementRequests = v7->_pendingReplacementRequests;
    v7->_pendingReplacementRequests = (NSArray *)v26;

    *(_WORD *)&v7->_isValueIDKnownToServer = 256;
  }

  return v7;
}

- (CKMergeableRecordValue)init
{
  return (CKMergeableRecordValue *)objc_msgSend_initWithValueID_(self, a2, 0, v2);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableRecordValue *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableRecordValue *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  id v5 = [CKMergeableRecordValueDescription alloc];
  id v9 = (id)objc_msgSend_initWithMergeableRecordValue_shortDescription_(v5, v6, (uint64_t)self, 0);
  objc_msgSend_CKDescribePropertiesUsing_(v9, v7, (uint64_t)v4, v8);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [CKMergeableRecordValueDescription alloc];
  v7 = objc_msgSend_initWithMergeableRecordValue_shortDescription_(v5, v6, (uint64_t)self, 1);
  uint64_t v11 = v7;
  if (v3) {
    objc_msgSend_redactedDescription(v7, v8, v9, v10);
  }
  else {
  v12 = objc_msgSend_description(v7, v8, v9, v10);
  }

  return v12;
}

- (id)CKVeryShortDescription
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<CKMergeableRecordValue: %p>", v2, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableRecordValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_valueID);
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  uint64_t v8 = (CKMergeableValueID *)objc_claimAutoreleasedReturnValue();
  valueID = self->_valueID;
  self->_valueID = v8;

  v12 = (CKMergeableRecordValue *)objc_msgSend_initWithValueID_(self, v10, (uint64_t)self->_valueID, v11);
  if (v12)
  {
    v13 = NSStringFromSelector(sel_isValueIDKnownToServer);
    v12->_isValueIDKnownToServer = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)v13, v15);

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v22 = NSStringFromSelector(sel_deltasToSave);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);
    uint64_t v25 = v24;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = (NSSet *)objc_opt_new();
    }
    deltasToSave = v12->_deltasToSave;
    v12->_deltasToSave = v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v33 = objc_msgSend_setWithObjects_(v28, v31, v29, v32, v30, 0);
    v34 = NSStringFromSelector(sel_pendingReplacementRequests);
    v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v33, (uint64_t)v34);
    v40 = v36;
    if (v36)
    {
      v41 = v36;
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E4F1C978], v37, v38, v39);
      v41 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    pendingReplacementRequests = v12->_pendingReplacementRequests;
    v12->_pendingReplacementRequests = v41;

    v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    v48 = objc_msgSend_setWithObjects_(v43, v46, v44, v47, v45, 0);
    v49 = NSStringFromSelector(sel_unmergedDeltas);
    v51 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v48, (uint64_t)v49);
    v52 = v51;
    if (v51) {
      v53 = v51;
    }
    else {
      v53 = (NSSet *)objc_opt_new();
    }
    unmergedDeltas = v12->_unmergedDeltas;
    v12->_unmergedDeltas = v53;

    uint64_t v55 = objc_opt_class();
    v56 = NSStringFromSelector(sel_lastKnownServerTimestampVector);
    uint64_t v58 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v55, (uint64_t)v56);
    lastKnownServerTimestampVector = v12->_lastKnownServerTimestampVector;
    v12->_lastKnownServerTimestampVector = (CKDistributedTimestampStateVector *)v58;

    v60 = NSStringFromSelector(sel_encryptMetadataTernary);
    v12->_encryptMetadataTernary = objc_msgSend_decodeIntegerForKey_(v4, v61, (uint64_t)v60, v62);

    v63 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    v68 = objc_msgSend_setWithObjects_(v63, v66, v64, v67, v65, 0);
    v69 = NSStringFromSelector(sel_serverDeltaMetadatas);
    uint64_t v71 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v70, (uint64_t)v68, (uint64_t)v69);
    serverDeltaMetadatas = v12->_serverDeltaMetadatas;
    v12->_serverDeltaMetadatas = (NSSet *)v71;

    uint64_t v73 = objc_opt_class();
    v74 = NSStringFromSelector(sel_multiValueRegisterState);
    uint64_t v76 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v73, (uint64_t)v74);
    multiValueRegisterState = v12->_multiValueRegisterState;
    v12->_multiValueRegisterState = (CKMultiValueMergeableDeltaRegisterState *)v76;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  valueID = self->_valueID;
  uint64_t v5 = NSStringFromSelector(sel_valueID);
  objc_msgSend_encodeObject_forKey_(v31, v6, (uint64_t)valueID, (uint64_t)v5);

  BOOL isValueIDKnownToServer = self->_isValueIDKnownToServer;
  uint64_t v8 = NSStringFromSelector(sel_isValueIDKnownToServer);
  objc_msgSend_encodeBool_forKey_(v31, v9, isValueIDKnownToServer, (uint64_t)v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_3;
  }
  deltasToSave = self->_deltasToSave;
  uint64_t v11 = NSStringFromSelector(sel_deltasToSave);
  objc_msgSend_encodeObject_forKey_(v31, v12, (uint64_t)deltasToSave, (uint64_t)v11);

  pendingReplacementRequests = self->_pendingReplacementRequests;
  uint64_t v14 = NSStringFromSelector(sel_pendingReplacementRequests);
  objc_msgSend_encodeObject_forKey_(v31, v15, (uint64_t)pendingReplacementRequests, (uint64_t)v14);

  if (!byte_1E9124EF0)
  {
LABEL_3:
    unmergedDeltas = self->_unmergedDeltas;
    uint64_t v17 = NSStringFromSelector(sel_unmergedDeltas);
    objc_msgSend_encodeObject_forKey_(v31, v18, (uint64_t)unmergedDeltas, (uint64_t)v17);
  }
  lastKnownServerTimestampVector = self->_lastKnownServerTimestampVector;
  uint64_t v20 = NSStringFromSelector(sel_lastKnownServerTimestampVector);
  objc_msgSend_encodeObject_forKey_(v31, v21, (uint64_t)lastKnownServerTimestampVector, (uint64_t)v20);

  int64_t encryptMetadataTernary = self->_encryptMetadataTernary;
  v23 = NSStringFromSelector(sel_encryptMetadataTernary);
  objc_msgSend_encodeInteger_forKey_(v31, v24, encryptMetadataTernary, (uint64_t)v23);

  serverDeltaMetadatas = self->_serverDeltaMetadatas;
  uint64_t v26 = NSStringFromSelector(sel_serverDeltaMetadatas);
  objc_msgSend_encodeObject_forKey_(v31, v27, (uint64_t)serverDeltaMetadatas, (uint64_t)v26);

  multiValueRegisterState = self->_multiValueRegisterState;
  uint64_t v29 = NSStringFromSelector(sel_multiValueRegisterState);
  objc_msgSend_encodeObject_forKey_(v31, v30, (uint64_t)multiValueRegisterState, (uint64_t)v29);
}

- (CKMultiValueMergeableDeltaRegister)multiValueRegister
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!byte_1E9124EF0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AF10000, v5, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Multi-value register accessed outside the client process", buf, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_multiValueRegisterState(self, a2, v2, v3);
  if (v6)
  {
    v7 = (void *)v6;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v8 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = v8;
      v13 = objc_msgSend_vector(v7, v10, v11, v12);
      uint64_t v17 = objc_msgSend_CKVeryShortDescription(self, v14, v15, v16);
      *(_DWORD *)buf = 138412546;
      v41 = v13;
      __int16 v42 = 2112;
      v43 = v17;
      _os_log_debug_impl(&dword_18AF10000, v9, OS_LOG_TYPE_DEBUG, "Loading multi-value register state with vector %@ for mergeable record value %@", buf, 0x16u);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v18 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v34 = v18;
      uint64_t v38 = objc_msgSend_CKVeryShortDescription(self, v35, v36, v37);
      *(_DWORD *)buf = 138412290;
      v41 = v38;
      _os_log_debug_impl(&dword_18AF10000, v34, OS_LOG_TYPE_DEBUG, "Creating multi-value register state for mergeable record value %@", buf, 0xCu);
    }
    v7 = objc_opt_new();
    objc_msgSend_setMultiValueRegisterState_(self, v19, (uint64_t)v7, v20);
  }
  uint64_t v21 = [CKMultiValueMergeableDeltaRegister alloc];
  id v39 = 0;
  v23 = objc_msgSend_initWithPersistedState_contents_error_(v21, v22, (uint64_t)v7, 0, &v39);
  id v24 = v39;
  v28 = v24;
  if (!v23)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    id v31 = objc_msgSend_description(v24, v25, v26, v27);
    objc_msgSend_raise_format_(v29, v32, v30, @"Failed to initialize CKMultiValueMergeableDeltaRegister: %@", v31);
  }

  return (CKMultiValueMergeableDeltaRegister *)v23;
}

- (BOOL)encryptMetadata
{
  return objc_msgSend_encryptMetadataTernary(self, a2, v2, v3) == 1;
}

- (void)setEncryptMetadata:(BOOL)a3
{
  objc_msgSend_setEncryptMetadataTernary_(self, a2, a3, v3);
}

- (void)setLastKnownServerTimestampVector:(id)a3
{
  if (self->_lastKnownServerTimestampVector != a3)
  {
    uint64_t v5 = (CKDistributedTimestampStateVector *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
    lastKnownServerTimestampVector = self->_lastKnownServerTimestampVector;
    self->_lastKnownServerTimestampVector = v5;
    MEMORY[0x1F41817F8](v5, lastKnownServerTimestampVector);
  }
}

- (BOOL)mergeIntoMergeable:(id)a3 error:(id *)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_1ED8581D0, v8))
  {
    if (!objc_msgSend_conformsToProtocol_(v6, v9, (uint64_t)&unk_1ED858140, v10))
    {
      id v39 = NSStringFromProtocol((Protocol *)&unk_1ED858140);
      v40 = NSStringFromProtocol((Protocol *)&unk_1ED8581D0);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, @"CKErrorDomain", 12, @"Mergeable should conform to either %@ or %@", v39, v40);
      v35 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();

      uint64_t v29 = 0;
      goto LABEL_55;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_debug_impl(&dword_18AF10000, v17, OS_LOG_TYPE_DEBUG, "Merging record value into non-versioned mergeable %@", buf, 0xCu);
    }
    id v18 = v6;
    objc_msgSend_multiValueRegister(self, v19, v20, v21);
    v22 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = objc_msgSend_deltaDeliveryRequirements(v22, v23, v24, v25);
    }
    else {
      uint64_t v26 = -1;
    }
    __int16 v42 = objc_msgSend_stateVector(v22, v23, v24, v25);
    uint64_t v29 = objc_msgSend_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_(self, v43, (uint64_t)v42, v26);

    if (objc_msgSend_count(v29, v44, v45, v46))
    {
      id v79 = 0;
      int v48 = objc_msgSend_mergeDeltas_error_(v22, v47, (uint64_t)v29, (uint64_t)&v79);
      v49 = (CKMergeableRecordValue *)v79;
      if (v48)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v50 = (void *)ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v73 = v50;
          uint64_t v77 = objc_msgSend_count(v29, v74, v75, v76);
          *(_DWORD *)buf = 134218242;
          v82 = (CKMergeableRecordValue *)v77;
          __int16 v83 = 2112;
          v84 = v22;
          _os_log_debug_impl(&dword_18AF10000, v73, OS_LOG_TYPE_DEBUG, "Merged %lu deltas into multi-value register %@", buf, 0x16u);
        }
        v54 = objc_msgSend_contents(v22, v51, v52, v53);
        v78 = v49;
        id v55 = v18;
        char v57 = objc_msgSend_mergeDeltas_error_(v18, v56, (uint64_t)v54, (uint64_t)&v78);
        v35 = v78;

        if (v57)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v58 = ck_log_facility_distributed_sync;
          if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_18AF10000, v58, OS_LOG_TYPE_DEBUG, "Merged multi-value register changes into mergeable", buf, 2u);
          }
          uint64_t v62 = objc_msgSend_persistedState(v22, v59, v60, v61);
          objc_msgSend_setMultiValueRegisterState_(self, v63, (uint64_t)v62, v64);

          goto LABEL_35;
        }
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v18 = v55;
        v70 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v35;
          _os_log_error_impl(&dword_18AF10000, v70, OS_LOG_TYPE_ERROR, "Error merging multi-value register changes into mergeable: %@", buf, 0xCu);
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v69 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v22;
          __int16 v83 = 2112;
          v84 = v49;
          _os_log_error_impl(&dword_18AF10000, v69, OS_LOG_TYPE_ERROR, "Error merging deltas into multi-value register %@: %@", buf, 0x16u);
        }
        v35 = v49;
      }

      goto LABEL_55;
    }
    v35 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v11 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v82 = self;
    _os_log_debug_impl(&dword_18AF10000, v11, OS_LOG_TYPE_DEBUG, "Merging record value into versioned mergeable %@", buf, 0xCu);
  }
  id v12 = v6;
  if (objc_opt_respondsToSelector()) {
    uint64_t v16 = objc_msgSend_deltaDeliveryRequirements(v12, v13, v14, v15);
  }
  else {
    uint64_t v16 = -1;
  }
  uint64_t v27 = objc_msgSend_stateVector(v12, v13, v14, v15);
  uint64_t v29 = objc_msgSend_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_(self, v28, (uint64_t)v27, v16);

  if (!objc_msgSend_count(v29, v30, v31, v32))
  {
    v35 = 0;
LABEL_36:

LABEL_37:
    if (objc_msgSend_count(v29, v36, v37, v38)) {
      objc_msgSend_didMergeDeltas_(self, v65, (uint64_t)v29, v66);
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v67 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_debug_impl(&dword_18AF10000, v67, OS_LOG_TYPE_DEBUG, "Done merging record value %@", buf, 0xCu);
    }
    BOOL v68 = 1;
    if (a4) {
      goto LABEL_60;
    }
    goto LABEL_61;
  }
  id v80 = 0;
  char v34 = objc_msgSend_mergeDeltas_error_(v12, v33, (uint64_t)v29, (uint64_t)&v80);
  v35 = (CKMergeableRecordValue *)v80;

  if (v34) {
    goto LABEL_37;
  }
LABEL_55:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v71 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v82 = self;
    __int16 v83 = 2112;
    v84 = v35;
    _os_log_error_impl(&dword_18AF10000, v71, OS_LOG_TYPE_ERROR, "Error merging record value %@: %@", buf, 0x16u);
  }
  BOOL v68 = 0;
  if (a4) {
LABEL_60:
  }
    *a4 = v35;
LABEL_61:

  return v68;
}

- (BOOL)mergeRecordValue:(id)a3 error:(id *)a4
{
  uint64_t v287 = *MEMORY[0x1E4F143B8];
  id v6 = (CKMergeableRecordValue *)a3;
  if (self != v6)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v7 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v278 = v6;
      __int16 v279 = 2112;
      v280 = self;
      _os_log_debug_impl(&dword_18AF10000, v7, OS_LOG_TYPE_DEBUG, "Merging record value %@ into %@", buf, 0x16u);
    }
    uint64_t v11 = objc_msgSend_valueID(self, v8, v9, v10);
    if (v11)
    {
      uint64_t v15 = (void *)v11;
      uint64_t v16 = objc_msgSend_valueID(self, v12, v13, v14);
      uint64_t v20 = objc_msgSend_valueID(v6, v17, v18, v19);
      char isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);

      if ((isEqual & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v76 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AF10000, v76, OS_LOG_TYPE_ERROR, "Can't merge a mergeable with a different value ID.", buf, 2u);
        }
        id v80 = objc_msgSend_valueID(v6, v77, v78, v79);

        if (v80)
        {
          v84 = objc_msgSend_valueID(self, v81, v82, v83);
          v88 = objc_msgSend_valueID(v6, v85, v86, v87);
          v90 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v89, @"CKErrorDomain", 150, @"Other mergeable value ID doesn't match this value. self=%@ other=%@", v84, v88);

          if (!a4) {
            goto LABEL_89;
          }
        }
        else
        {
          v90 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v81, @"CKErrorDomain", 12, @"Tried to merge value without an ID into a value that has an ID. self=%@ other=%@", self, v6);
          if (!a4) {
            goto LABEL_89;
          }
        }
        goto LABEL_88;
      }
    }
    uint64_t v24 = objc_msgSend_valueID(self, v12, v13, v14);

    if (!v24)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v28 = (void *)ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        v256 = v28;
        objc_msgSend_valueID(v6, v257, v258, v259);
        v260 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v278 = v260;
        _os_log_debug_impl(&dword_18AF10000, v256, OS_LOG_TYPE_DEBUG, "Assigning value ID from other value %@", buf, 0xCu);
      }
      uint64_t v32 = objc_msgSend_valueID(v6, v29, v30, v31);
      objc_msgSend_setValueID_(self, v33, (uint64_t)v32, v34);
    }
    if ((objc_msgSend_isValueIDKnownToServer(self, v25, v26, v27) & 1) == 0
      && objc_msgSend_isValueIDKnownToServer(v6, v35, v36, v37))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v38 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18AF10000, v38, OS_LOG_TYPE_DEBUG, "Setting isValueIDKnownToServer during merge", buf, 2u);
      }
      objc_msgSend_setIsValueIDKnownToServer_(self, v39, 1, v40);
    }
    v41 = objc_msgSend_unmergedDeltas(v6, v35, v36, v37);
    uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);

    if (v45)
    {
      v49 = objc_msgSend_unmergedDeltas(self, v46, v47, v48);
      uint64_t v53 = objc_msgSend_unmergedDeltas(v6, v50, v51, v52);
      v56 = objc_msgSend_setByAddingObjectsFromSet_(v49, v54, (uint64_t)v53, v55);
      objc_msgSend_setUnmergedDeltas_(self, v57, (uint64_t)v56, v58);
    }
    v59 = objc_msgSend_lastKnownServerTimestampVector(v6, v46, v47, v48);

    if (v59)
    {
      v63 = objc_msgSend_lastKnownServerTimestampVector(self, v60, v61, v62);

      if (v63)
      {
        uint64_t v67 = objc_msgSend_lastKnownServerTimestampVector(self, v64, v65, v66);
        uint64_t v71 = objc_msgSend_lastKnownServerTimestampVector(v6, v68, v69, v70);
        objc_msgSend_unionStateVector_(v67, v72, (uint64_t)v71, v73);
      }
      else
      {
        uint64_t v67 = objc_msgSend_lastKnownServerTimestampVector(v6, v64, v65, v66);
        objc_msgSend_setLastKnownServerTimestampVector_(self, v91, (uint64_t)v67, v92);
      }
    }
    v267 = a4;
    v93 = objc_msgSend_serverDeltaMetadatas(v6, v60, v61, v62);
    uint64_t v97 = objc_msgSend_count(v93, v94, v95, v96);

    if (v97)
    {
      v101 = objc_msgSend_serverDeltaMetadatas(self, v98, v99, v100);
      v105 = objc_msgSend_serverDeltaMetadatas(v6, v102, v103, v104);
      v108 = objc_msgSend_setByAddingObjectsFromSet_(v101, v106, (uint64_t)v105, v107);
      objc_msgSend_setServerDeltaMetadatas_(self, v109, (uint64_t)v108, v110);
    }
    v268 = v6;
    v111 = objc_opt_new();
    long long v273 = 0u;
    long long v274 = 0u;
    long long v275 = 0u;
    long long v276 = 0u;
    v115 = objc_msgSend_serverDeltaMetadatas(self, v112, v113, v114);
    uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v273, (uint64_t)v286, 16);
    if (v117)
    {
      uint64_t v121 = v117;
      uint64_t v122 = *(void *)v274;
      do
      {
        for (uint64_t i = 0; i != v121; ++i)
        {
          if (*(void *)v274 != v122) {
            objc_enumerationMutation(v115);
          }
          v124 = objc_msgSend_replacedDeltaIdentifiers(*(void **)(*((void *)&v273 + 1) + 8 * i), v118, v119, v120);
          objc_msgSend_unionSet_(v111, v125, (uint64_t)v124, v126);
        }
        uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v273, (uint64_t)v286, 16);
      }
      while (v121);
    }

    if (objc_msgSend_count(v111, v127, v128, v129))
    {
      v133 = objc_opt_new();
      long long v269 = 0u;
      long long v270 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      v137 = objc_msgSend_serverDeltaMetadatas(self, v134, v135, v136);
      uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v138, (uint64_t)&v269, (uint64_t)v285, 16);
      if (v139)
      {
        uint64_t v143 = v139;
        uint64_t v144 = *(void *)v270;
        do
        {
          for (uint64_t j = 0; j != v143; ++j)
          {
            if (*(void *)v270 != v144) {
              objc_enumerationMutation(v137);
            }
            v146 = *(void **)(*((void *)&v269 + 1) + 8 * j);
            v147 = objc_msgSend_identifier(v146, v140, v141, v142);
            int v150 = objc_msgSend_containsObject_(v111, v148, (uint64_t)v147, v149);

            if (v150) {
              objc_msgSend_addObject_(v133, v140, (uint64_t)v146, v142);
            }
          }
          uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v140, (uint64_t)&v269, (uint64_t)v285, 16);
        }
        while (v143);
      }

      if (objc_msgSend_count(v133, v151, v152, v153))
      {
        v157 = objc_msgSend_serverDeltaMetadatas(self, v154, v155, v156);
        v161 = objc_msgSend_mutableCopy(v157, v158, v159, v160);

        objc_msgSend_minusSet_(v161, v162, (uint64_t)v133, v163);
        v167 = objc_msgSend_copy(v161, v164, v165, v166);
        objc_msgSend_setServerDeltaMetadatas_(self, v168, (uint64_t)v167, v169);
      }
    }
    uint64_t v170 = objc_msgSend_multiValueRegisterState(self, v130, v131, v132);
    id v6 = v268;
    if (v170)
    {
      v174 = (void *)v170;
      uint64_t v175 = objc_msgSend_multiValueRegisterState(v268, v171, v172, v173);
      if (v175)
      {
        v179 = (void *)v175;
        v180 = objc_msgSend_multiValueRegisterState(self, v176, v177, v178);
        v184 = objc_msgSend_identifier(v180, v181, v182, v183);
        v188 = objc_msgSend_multiValueRegisterState(v268, v185, v186, v187);
        v192 = objc_msgSend_identifier(v188, v189, v190, v191);
        char v266 = objc_msgSend_isEqual_(v184, v193, (uint64_t)v192, v194);

        if ((v266 & 1) == 0)
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v195 = (void *)ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
          {
LABEL_87:

            v90 = 0;
            a4 = v267;
            if (!v267)
            {
LABEL_89:
              BOOL v75 = v90 == 0;

              goto LABEL_90;
            }
LABEL_88:
            *a4 = v90;
            goto LABEL_89;
          }
          v196 = v195;
          v197 = (objc_class *)objc_opt_class();
          NSStringFromClass(v197);
          v198 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          v199 = (objc_class *)objc_opt_class();
          NSStringFromClass(v199);
          v200 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          v201 = (objc_class *)objc_opt_class();
          v202 = NSStringFromClass(v201);
          v203 = (objc_class *)objc_opt_class();
          v204 = NSStringFromClass(v203);
          *(_DWORD *)buf = 138413058;
          v278 = v198;
          __int16 v279 = 2112;
          v280 = v200;
          __int16 v281 = 2112;
          v282 = v202;
          __int16 v283 = 2112;
          v284 = v204;
          _os_log_fault_impl(&dword_18AF10000, v196, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Usage of %@ may be causing unbounded metadata growth on upload. When saving mergeable changes to CloudKit, you must set only your locally persisted %@ on a CKRecord. If a %@ is fetched from the server, it must be merged into your locally persisted %@ and not directly used for saving new mergeable changes, unless it's the initial fetch.", buf, 0x2Au);

LABEL_86:
          goto LABEL_87;
        }
      }
      else
      {
      }
    }
    v205 = objc_msgSend_multiValueRegisterState(v268, v171, v172, v173);

    if (!v205) {
      goto LABEL_87;
    }
    uint64_t v209 = objc_msgSend_multiValueRegisterState(self, v206, v207, v208);
    if (v209)
    {
      v196 = v209;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v210 = (void *)ck_log_facility_distributed_sync;
      if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_83;
      }
      v211 = v210;
      objc_msgSend_vector(v196, v212, v213, v214);
      v215 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKVeryShortDescription(self, v216, v217, v218);
      v219 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v278 = v215;
      __int16 v279 = 2112;
      v280 = v219;
      _os_log_debug_impl(&dword_18AF10000, v211, OS_LOG_TYPE_DEBUG, "Loading multi-value register state with vector %@ for mergeable record value %@", buf, 0x16u);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v220 = (void *)ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        v261 = v220;
        objc_msgSend_CKVeryShortDescription(self, v262, v263, v264);
        v265 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v278 = v265;
        _os_log_debug_impl(&dword_18AF10000, v261, OS_LOG_TYPE_DEBUG, "Creating multi-value register state for mergeable record value %@", buf, 0xCu);
      }
      v196 = objc_opt_new();
      objc_msgSend_setMultiValueRegisterState_(self, v221, (uint64_t)v196, v222);
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
LABEL_83:
    v223 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v243 = v223;
      v247 = objc_msgSend_multiValueRegisterState(v268, v244, v245, v246);
      objc_msgSend_vector(v247, v248, v249, v250);
      v251 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(v196, v252, v253, v254);
      v255 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v278 = v251;
      __int16 v279 = 2112;
      v280 = v255;
      _os_log_debug_impl(&dword_18AF10000, v243, OS_LOG_TYPE_DEBUG, "Merging remote multi-value register with vector %@ into local multi-value register with vector %@ during mergeable record value merge", buf, 0x16u);
    }
    v227 = objc_msgSend_multiValueRegisterState(self, v224, v225, v226);
    v231 = objc_msgSend_vector(v227, v228, v229, v230);
    v235 = objc_msgSend_multiValueRegisterState(v268, v232, v233, v234);
    v239 = objc_msgSend_vector(v235, v236, v237, v238);
    objc_msgSend_unionStateVector_(v231, v240, (uint64_t)v239, v241);

    goto LABEL_86;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v74 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v278 = self;
    _os_log_fault_impl(&dword_18AF10000, v74, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Trying to merge CKMergeableRecordValue into itself: %@", buf, 0xCu);
  }
  BOOL v75 = 1;
LABEL_90:

  return v75;
}

- (id)deliverableDeltasWithCurrentStateVector:(id)a3 usingDeliveryRequirements:(unint64_t)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v7, v8, v9);
  uint64_t v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v14 = objc_msgSend_unmergedDeltas(self, v11, v12, v13);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v84, (uint64_t)v96, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v85 != v21) {
          objc_enumerationMutation(v14);
        }
        v23 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_metadata(v23, v17, v18, v19);
        objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v23, (uint64_t)v24);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v84, (uint64_t)v96, 16);
    }
    while (v20);
  }

  uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = NSAllMapTableKeys(v10);
  uint64_t v30 = objc_msgSend_setWithArray_(v26, v28, (uint64_t)v27, v29);
  uint64_t v32 = objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(CKMergeableDeltaMetadata, v31, (uint64_t)v30, (uint64_t)v6, a4);

  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = sub_18B16C7EC;
  v82[3] = &unk_1E54653C8;
  v33 = v10;
  uint64_t v83 = v33;
  uint64_t v36 = objc_msgSend_CKMap_(v32, v34, (uint64_t)v82, v35);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v37 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    log = v37;
    uint64_t v79 = objc_msgSend_count(v36, v52, v53, v54);
    id v80 = objc_msgSend_unmergedDeltas(self, v55, v56, v57);
    uint64_t v61 = objc_msgSend_count(v80, v58, v59, v60);
    uint64_t v65 = objc_msgSend_CKVeryShortDescription(self, v62, v63, v64);
    *(_DWORD *)buf = 134218754;
    uint64_t v89 = v79;
    __int16 v90 = 2048;
    uint64_t v91 = v61;
    __int16 v92 = 2048;
    unint64_t v93 = a4;
    __int16 v94 = 2112;
    uint64_t v95 = v65;
    uint64_t v66 = (void *)v65;
    _os_log_debug_impl(&dword_18AF10000, log, OS_LOG_TYPE_DEBUG, "Found %ld deliverable deltas out of %ld unmerged deltas with delivery requirements %llu from %@", buf, 0x2Au);
  }
  uint64_t v41 = objc_msgSend_count(v32, v38, v39, v40);
  uint64_t v45 = objc_msgSend_unmergedDeltas(self, v42, v43, v44);
  uint64_t v49 = objc_msgSend_count(v45, v46, v47, v48);

  if (v41 != v49)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v50 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v67 = v50;
      BOOL v68 = NSAllMapTableKeys(v33);
      uint64_t v71 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v69, (uint64_t)v68, v70);
      BOOL v75 = objc_msgSend_allObjects(v32, v72, v73, v74);
      uint64_t v78 = objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v76, (uint64_t)v75, v77);
      *(_DWORD *)buf = 138412802;
      uint64_t v89 = (uint64_t)v71;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v78;
      __int16 v92 = 2112;
      unint64_t v93 = (unint64_t)v6;
      _os_log_debug_impl(&dword_18AF10000, v67, OS_LOG_TYPE_DEBUG, "Combined delta directory: %@, combined deliverable deltas: %@, local state vector: %@", buf, 0x20u);
    }
  }

  return v36;
}

- (void)addUnmergedDeltas:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v5;
    int v26 = 134218242;
    uint64_t v27 = objc_msgSend_count(v4, v23, v24, v25);
    __int16 v28 = 2112;
    uint64_t v29 = self;
    _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Adding %ld unmerged deltas to %@", (uint8_t *)&v26, 0x16u);
  }
  uint64_t v9 = objc_msgSend_unmergedDeltas(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_mutableCopy(v9, v10, v11, v12);

  objc_msgSend_addObjectsFromArray_(v13, v14, (uint64_t)v4, v15);
  uint64_t v19 = objc_msgSend_copy(v13, v16, v17, v18);
  objc_msgSend_setUnmergedDeltas_(self, v20, (uint64_t)v19, v21);
}

- (void)didMergeDeltas:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v45 = v5;
    uint64_t v49 = objc_msgSend_count(v4, v46, v47, v48);
    uint64_t v53 = objc_msgSend_CKVeryShortDescription(self, v50, v51, v52);
    *(_DWORD *)buf = 134218242;
    uint64_t v62 = v49;
    __int16 v63 = 2112;
    uint64_t v64 = v53;
    _os_log_debug_impl(&dword_18AF10000, v45, OS_LOG_TYPE_DEBUG, "Did merge %ld deltas into %@", buf, 0x16u);
  }
  objc_msgSend_sanityCheckDeltas_(self, v6, (uint64_t)v4, v7);
  uint64_t v11 = objc_msgSend_unmergedDeltas(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_mutableCopy(v11, v12, v13, v14);

  uint64_t v18 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v16, (uint64_t)v4, v17);
  objc_msgSend_minusSet_(v15, v19, (uint64_t)v18, v20);

  uint64_t v54 = v15;
  uint64_t v24 = objc_msgSend_copy(v15, v21, v22, v23);
  objc_msgSend_setUnmergedDeltas_(self, v25, (uint64_t)v24, v26);

  uint64_t v30 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v27, v28, v29);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v31 = v4;
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v33)
  {
    uint64_t v37 = v33;
    uint64_t v38 = *(void *)v57;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v57 != v38) {
          objc_enumerationMutation(v31);
        }
        uint64_t v41 = objc_msgSend_fileURL(*(void **)(*((void *)&v56 + 1) + 8 * v39), v34, v35, v36);
        if (v41)
        {
          id v55 = 0;
          char v42 = objc_msgSend_removeItemAtURL_error_(v30, v40, (uint64_t)v41, (uint64_t)&v55);
          id v43 = v55;
          if ((v42 & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            uint64_t v44 = ck_log_facility_distributed_sync;
            if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = (uint64_t)v43;
              _os_log_fault_impl(&dword_18AF10000, v44, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Failed to remove mergeable delta file after merging: %@", buf, 0xCu);
            }
          }
        }
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v56, (uint64_t)v60, 16);
    }
    while (v37);
  }
}

- (void)didSaveDeltas:(id)a3 replacementRequests:(id)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)v6, v10);
  uint64_t v13 = objc_msgSend_CKFlatMap_(v7, v11, (uint64_t)&unk_1ED7EF5D8, v12);
  objc_msgSend_addObjectsFromArray_(v8, v14, (uint64_t)v13, v15);

  uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v19 = objc_msgSend_CKMap_(v8, v17, (uint64_t)&unk_1ED7EC0E8, v18);
  uint64_t v22 = objc_msgSend_setWithArray_(v16, v20, (uint64_t)v19, v21);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v23 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v122 = v23;
    uint64_t v126 = objc_msgSend_count(v6, v123, v124, v125);
    uint64_t v130 = objc_msgSend_count(v8, v127, v128, v129);
    *(_DWORD *)buf = 134218240;
    uint64_t v150 = v126;
    __int16 v151 = 2048;
    uint64_t v152 = v130 - objc_msgSend_count(v6, v131, v132, v133);
    _os_log_debug_impl(&dword_18AF10000, v122, OS_LOG_TYPE_DEBUG, "Did save %ld deltas and %ld replacement deltas to server", buf, 0x16u);
  }
  objc_msgSend_sanityCheckDeltas_(self, v24, (uint64_t)v8, v25);
  objc_msgSend_mergeLastKnownServerTimestampVectorFromDeltas_(self, v26, (uint64_t)v8, v27);
  id v31 = objc_msgSend_serverDeltaMetadatas(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_mutableCopy(v31, v32, v33, v34);

  objc_msgSend_unionSet_(v35, v36, (uint64_t)v22, v37);
  if (objc_msgSend_count(v7, v38, v39, v40))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v137 = v22;
    v138 = v8;
    uint64_t v44 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)v7;
      _os_log_debug_impl(&dword_18AF10000, v44, OS_LOG_TYPE_DEBUG, "Will remove server metadatas for replacement requests: %@", buf, 0xCu);
    }
    v134 = v35;
    uint64_t v45 = objc_opt_new();
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v46 = v7;
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v143, (uint64_t)v148, 16);
    if (v48)
    {
      uint64_t v52 = v48;
      uint64_t v53 = *(void *)v144;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v144 != v53) {
            objc_enumerationMutation(v46);
          }
          id v55 = objc_msgSend_deltaIdentifiersToReplace(*(void **)(*((void *)&v143 + 1) + 8 * i), v49, v50, v51);
          objc_msgSend_addObjectsFromArray_(v45, v56, (uint64_t)v55, v57);
        }
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v143, (uint64_t)v148, 16);
      }
      while (v52);
    }
    id v135 = v7;
    id v136 = v6;

    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    uint64_t v62 = objc_msgSend_serverDeltaMetadatas(self, v59, v60, v61);
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v139, (uint64_t)v147, 16);
    if (v64)
    {
      uint64_t v68 = v64;
      uint64_t v69 = *(void *)v140;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v140 != v69) {
            objc_enumerationMutation(v62);
          }
          uint64_t v71 = *(void **)(*((void *)&v139 + 1) + 8 * j);
          v72 = objc_msgSend_identifier(v71, v65, v66, v67);
          int v75 = objc_msgSend_containsObject_(v45, v73, (uint64_t)v72, v74);

          if (v75) {
            objc_msgSend_addObject_(v58, v65, (uint64_t)v71, v67);
          }
        }
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v139, (uint64_t)v147, 16);
      }
      while (v68);
    }

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v7 = v135;
    id v6 = v136;
    uint64_t v35 = v134;
    uint64_t v76 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v150 = (uint64_t)v58;
      _os_log_debug_impl(&dword_18AF10000, v76, OS_LOG_TYPE_DEBUG, "Removing known server metadatas: %@", buf, 0xCu);
    }
    objc_msgSend_minusSet_(v134, v77, (uint64_t)v58, v78);

    uint64_t v22 = v137;
    uint64_t v8 = v138;
  }
  uint64_t v79 = objc_msgSend_copy(v35, v41, v42, v43);
  objc_msgSend_setServerDeltaMetadatas_(self, v80, (uint64_t)v79, v81);

  long long v85 = objc_msgSend_deltasToSave(self, v82, v83, v84);
  uint64_t v89 = objc_msgSend_mutableCopy(v85, v86, v87, v88);

  __int16 v92 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v90, (uint64_t)v6, v91);
  objc_msgSend_minusSet_(v89, v93, (uint64_t)v92, v94);

  v98 = objc_msgSend_copy(v89, v95, v96, v97);
  objc_msgSend_setDeltasToSave_(self, v99, (uint64_t)v98, v100);

  v101 = (void *)MEMORY[0x1E4F1CA80];
  v105 = objc_msgSend_pendingReplacementRequests(self, v102, v103, v104);
  v108 = objc_msgSend_setWithArray_(v101, v106, (uint64_t)v105, v107);

  v111 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v109, (uint64_t)v7, v110);
  objc_msgSend_minusSet_(v108, v112, (uint64_t)v111, v113);

  uint64_t v117 = objc_msgSend_allObjects(v108, v114, v115, v116);
  objc_msgSend_setPendingReplacementRequests_(self, v118, (uint64_t)v117, v119);

  objc_msgSend_setSavedDeltaMetadatas_(self, v120, (uint64_t)v22, v121);
}

- (void)sanityCheckDeltas:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v100, (uint64_t)v104, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v101;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v101 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v100 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_new();
        uint64_t v14 = objc_msgSend_metadata(v9, v11, v12, v13);

        if (v14)
        {
          uint64_t v18 = objc_msgSend_metadata(v9, v15, v16, v17);
          uint64_t v22 = objc_msgSend_vectors(v18, v19, v20, v21);
          uint64_t v26 = objc_msgSend_previous(v22, v23, v24, v25);
          uint64_t v30 = objc_msgSend_allSiteIdentifiers(v26, v27, v28, v29);
          objc_msgSend_unionSet_(v10, v31, (uint64_t)v30, v32);

          uint64_t v36 = objc_msgSend_metadata(v9, v33, v34, v35);
          uint64_t v40 = objc_msgSend_vectors(v36, v37, v38, v39);
          uint64_t v44 = objc_msgSend_contents(v40, v41, v42, v43);
          uint64_t v48 = objc_msgSend_allSiteIdentifiers(v44, v45, v46, v47);
          objc_msgSend_unionSet_(v10, v49, (uint64_t)v48, v50);

          uint64_t v54 = objc_msgSend_metadata(v9, v51, v52, v53);
          id v58 = objc_msgSend_vectors(v54, v55, v56, v57);
          uint64_t v62 = objc_msgSend_removals(v58, v59, v60, v61);
          uint64_t v66 = objc_msgSend_allSiteIdentifiers(v62, v63, v64, v65);
          objc_msgSend_unionSet_(v10, v67, (uint64_t)v66, v68);

          v72 = objc_msgSend_metadata(v9, v69, v70, v71);
          uint64_t v76 = objc_msgSend_vectors(v72, v73, v74, v75);
          id v80 = objc_msgSend_dependencies(v76, v77, v78, v79);
          uint64_t v84 = objc_msgSend_allSiteIdentifiers(v80, v81, v82, v83);
          objc_msgSend_unionSet_(v10, v85, (uint64_t)v84, v86);
        }
        if ((unint64_t)objc_msgSend_count(v10, v15, v16, v17) < 0x12D)
        {
          if ((unint64_t)objc_msgSend_count(v10, v87, v88, v89) < 0x65)
          {
            if ((unint64_t)objc_msgSend_count(v10, v92, v93, v94) < 0x33) {
              goto LABEL_15;
            }
            v97[0] = MEMORY[0x1E4F143A8];
            v97[1] = 3221225472;
            v97[2] = sub_18B16D820;
            v97[3] = &unk_1E5460350;
            v97[4] = self;
            __int16 v90 = v97;
            uint64_t v91 = @"CKMergeableRecordValueSiteIdentifierLowLimitExceededFault";
          }
          else
          {
            v98[0] = MEMORY[0x1E4F143A8];
            v98[1] = 3221225472;
            v98[2] = sub_18B16D714;
            v98[3] = &unk_1E5460350;
            v98[4] = self;
            __int16 v90 = v98;
            uint64_t v91 = @"CKMergeableRecordValueSiteIdentifierMediumLimitExceededFault";
          }
        }
        else
        {
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = sub_18B16D608;
          v99[3] = &unk_1E5460350;
          v99[4] = self;
          __int16 v90 = v99;
          uint64_t v91 = @"CKMergeableRecordValueSiteIdentifierHighLimitExceededFault";
        }
        CKOncePerBoot(v91, v90);
LABEL_15:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v100, (uint64_t)v104, 16);
    }
    while (v6);
  }
}

- (void)addServerDeltaMetadatas:(id)a3
{
  id v4 = a3;
  objc_msgSend_serverDeltaMetadatas(self, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_setByAddingObjectsFromArray_(v13, v8, (uint64_t)v4, v9);

  objc_msgSend_setServerDeltaMetadatas_(self, v11, (uint64_t)v10, v12);
}

- (void)mergeLastKnownServerTimestampVector:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_lastKnownServerTimestampVector(self, v5, v6, v7);

  if (!v8)
  {
    uint64_t v12 = objc_alloc_init(CKDistributedTimestampStateVector);
    objc_msgSend_setLastKnownServerTimestampVector_(self, v13, (uint64_t)v12, v14);
  }
  if (objc_msgSend_timestampCount(v4, v9, v10, v11))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v15 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = v15;
      uint64_t v25 = objc_msgSend_CKShortDescriptionRedact_(self, v23, 0, v24);
      int v26 = 138412546;
      id v27 = v4;
      __int16 v28 = 2112;
      uint64_t v29 = v25;
      _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "Merging last known timestamp %@ into %@", (uint8_t *)&v26, 0x16u);
    }
    uint64_t v19 = objc_msgSend_lastKnownServerTimestampVector(self, v16, v17, v18);
    objc_msgSend_unionStateVector_(v19, v20, (uint64_t)v4, v21);
  }
}

- (void)mergeLastKnownServerTimestampVectorFromDeltas:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v41 = v5;
    *(_DWORD *)buf = 134218242;
    uint64_t v51 = objc_msgSend_count(v4, v42, v43, v44);
    __int16 v52 = 2112;
    uint64_t v53 = self;
    _os_log_debug_impl(&dword_18AF10000, v41, OS_LOG_TYPE_DEBUG, "Merging %lu deltas into %@", buf, 0x16u);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_metadata(v15, v9, v10, v11, (void)v45);
        uint64_t v20 = objc_msgSend_vectors(v16, v17, v18, v19);
        uint64_t v24 = objc_msgSend_contents(v20, v21, v22, v23);
        objc_msgSend_mergeLastKnownServerTimestampVector_(self, v25, (uint64_t)v24, v26);

        uint64_t v30 = objc_msgSend_metadata(v15, v27, v28, v29);
        uint64_t v34 = objc_msgSend_vectors(v30, v31, v32, v33);
        uint64_t v38 = objc_msgSend_removals(v34, v35, v36, v37);
        objc_msgSend_mergeLastKnownServerTimestampVector_(self, v39, (uint64_t)v38, v40);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v12);
  }
}

- (BOOL)addDeltasToSaveFromMergeable:(id)a3 container:(id)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_addDeltasToSaveFromMergeable_error_, a3, a5);
}

- (BOOL)addDeltasToSaveFromMergeable:(id)a3 error:(id *)a4
{
  uint64_t v475 = *MEMORY[0x1E4F143B8];
  uint64_t v457 = 0;
  v458 = &v457;
  uint64_t v459 = 0x3032000000;
  v460 = sub_18AF1424C;
  v461 = sub_18AF139E0;
  id v462 = 0;
  uint64_t v453 = 0;
  v454 = &v453;
  uint64_t v455 = 0x2020000000;
  char v456 = 1;
  id v416 = a3;
  if (objc_msgSend_conformsToProtocol_(v416, v5, (uint64_t)&unk_1ED8581D0, v6))
  {
    uint64_t v10 = v416;
    id v13 = v416;
  }
  else
  {
    objc_msgSend_multiValueRegister(self, v7, v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v416;
  }
  char v14 = objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)&unk_1ED8581D0, v12);
  if (!v13)
  {
    if (a4)
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v36, @"CKErrorDomain", 12, @"Tried to save a %@ without a mergeable: %@", v35, self);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_51:
    BOOL v76 = 0;
    goto LABEL_179;
  }
  char v15 = v14;
  if ((v14 & 1) == 0)
  {
    char v16 = v14;
    id v17 = v13;
    uint64_t v18 = (CKMergeableRecordValue *)v13;
    uint64_t v19 = (id *)(v458 + 5);
    obuint64_t j = (id)v458[5];
    uint64_t v21 = objc_msgSend_mergeableDeltasForMetadata_error_(v416, v20, 0, (uint64_t)&obj);
    objc_storeStrong(v19, obj);
    if (v21)
    {
      if (objc_msgSend_count(v21, v22, v23, v24))
      {
        if ((unint64_t)objc_msgSend_count(v21, v25, v26, v27) < 2)
        {
          long long v450 = 0u;
          long long v451 = 0u;
          long long v448 = 0u;
          long long v449 = 0u;
          uint64_t v29 = v21;
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v41, (uint64_t)&v448, (uint64_t)v474, 16);
          if (v45)
          {
            uint64_t v46 = *(void *)v449;
            while (2)
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v449 != v46) {
                  objc_enumerationMutation(v29);
                }
                long long v48 = objc_msgSend_metadata(*(void **)(*((void *)&v448 + 1) + 8 * i), v42, v43, v44);
                BOOL v49 = v48 == 0;

                if (!v49)
                {
                  uint64_t v40 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, @"CKInternalErrorDomain", 1017, @"Delta for non-versioned mergeable has non-nil metadata");
                  uint64_t v65 = objc_msgSend_CKClientSuitableError(v40, v62, v63, v64);
                  uint64_t v66 = (void *)v458[5];
                  v458[5] = v65;

                  goto LABEL_32;
                }
              }
              uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v42, (uint64_t)&v448, (uint64_t)v474, 16);
              if (v45) {
                continue;
              }
              break;
            }
          }

          *((unsigned char *)v454 + 24) = 1;
          uint64_t v50 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v50);
          }

          uint64_t v51 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v18;
            _os_log_debug_impl(&dword_18AF10000, v51, OS_LOG_TYPE_DEBUG, "Generated mergeable deltas for multi-value register %@", buf, 0xCu);
          }

          objc_msgSend_setContents_(v18, v52, (uint64_t)v29, v53);
          uint64_t v57 = objc_msgSend_persistedState(v18, v54, v55, v56);
          objc_msgSend_setMultiValueRegisterState_(self, v58, (uint64_t)v57, v59);

          uint64_t v60 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v60);
          }

          uint64_t v61 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v18;
            _os_log_debug_impl(&dword_18AF10000, v61, OS_LOG_TYPE_DEBUG, "Populated multi-value register %@", buf, 0xCu);
          }

          goto LABEL_37;
        }
        uint64_t v29 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, @"CKInternalErrorDomain", 1017, @"Non-versioned mergeable returned more than one delta");
        uint64_t v33 = objc_msgSend_CKClientSuitableError(v29, v30, v31, v32);
      }
      else
      {
        uint64_t v29 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v25, @"CKInternalErrorDomain", 1017, @"Non-versioned mergeable did not return any deltas");
        uint64_t v33 = objc_msgSend_CKClientSuitableError(v29, v37, v38, v39);
      }
      uint64_t v40 = (void *)v458[5];
      v458[5] = v33;
LABEL_32:
    }
    *((unsigned char *)v454 + 24) = 0;
    uint64_t v67 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v67);
    }

    uint64_t v29 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v395 = (void *)v458[5];
      *(_DWORD *)buf = 138412546;
      v468 = v18;
      __int16 v469 = 2112;
      id v470 = v395;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Failed to generate mergeable deltas for multi-value register %@: %@", buf, 0x16u);
    }
LABEL_37:

    id v13 = v17;
    char v15 = v16;
  }
  if (*((unsigned char *)v454 + 24))
  {
    uint64_t v68 = ck_log_initialization_block;
    v409 = v13;
    char v417 = v15;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v68);
    }

    uint64_t v69 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v468 = self;
      _os_log_debug_impl(&dword_18AF10000, v69, OS_LOG_TYPE_DEBUG, "Generating deltas for mergeable %@", buf, 0xCu);
    }

    uint64_t v73 = objc_msgSend_lastKnownServerTimestampVector(self, v70, v71, v72);
    uint64_t v74 = v73;
    if (v73)
    {
      id v413 = v73;
    }
    else
    {
      id v413 = (id)objc_opt_new();
    }
    id v80 = objc_msgSend_stateVector(v13, v77, v78, v79);
    v414 = (CKMergeableRecordValue *)objc_msgSend_copy(v80, v81, v82, v83);

    uint64_t v84 = objc_opt_new();
    long long v446 = 0u;
    long long v447 = 0u;
    long long v444 = 0u;
    long long v445 = 0u;
    uint64_t v88 = objc_msgSend_unmergedDeltas(self, v85, v86, v87);
    uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v444, (uint64_t)v473, 16);
    if (v93)
    {
      uint64_t v94 = *(void *)v445;
      do
      {
        for (uint64_t j = 0; j != v93; ++j)
        {
          if (*(void *)v445 != v94) {
            objc_enumerationMutation(v88);
          }
          uint64_t v96 = objc_msgSend_metadata(*(void **)(*((void *)&v444 + 1) + 8 * j), v90, v91, v92);
          long long v100 = objc_msgSend_vectors(v96, v97, v98, v99);
          uint64_t v104 = objc_msgSend_contents(v100, v101, v102, v103);
          objc_msgSend_unionStateVector_(v84, v105, (uint64_t)v104, v106);
        }
        uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v444, (uint64_t)v473, 16);
      }
      while (v93);
    }

    uint64_t v110 = objc_msgSend_clockVector(v414, v107, v108, v109);
    objc_msgSend_minusVector_(v84, v111, (uint64_t)v110, v112);

    uint64_t v116 = objc_msgSend_clockVector(v413, v113, v114, v115);
    v412 = objc_msgSend_mutableCopy((void *)v116, v117, v118, v119);

    v123 = objc_msgSend_clockVector(v84, v120, v121, v122);
    objc_msgSend_minusVector_(v412, v124, (uint64_t)v123, v125);

    uint64_t v129 = objc_msgSend_clockVector(v414, v126, v127, v128);
    LOBYTE(v116) = objc_msgSend_isGreaterThanOrEqualToVector_(v129, v130, (uint64_t)v412, v131);

    if (v116) {
      goto LABEL_66;
    }
    id v135 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v135);
    }

    id v136 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v136, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_valueID(self, v137, v138, v139);
      v397 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      v401 = objc_msgSend_clockVector(v414, v398, v399, v400);
      *(_DWORD *)buf = 138412802;
      v468 = v397;
      __int16 v469 = 2112;
      id v470 = v401;
      __int16 v471 = 2112;
      v472 = v412;
      _os_log_fault_impl(&dword_18AF10000, v136, OS_LOG_TYPE_FAULT, "Mergeable %@ regressed with current vector %@, server vector %@", buf, 0x20u);
    }
    if (objc_msgSend_enabledFaultErrors(self, v140, v141, v142))
    {
      if (!a4)
      {
        BOOL v76 = 0;
LABEL_178:

        id v13 = v409;
        goto LABEL_179;
      }
      v410 = objc_msgSend_valueID(self, v132, v133, v134);
      objc_msgSend_clockVector(v414, v372, v373, v374);
      v411 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      v376 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v375, @"CKInternalErrorDomain", 1017, @"Mergeable %@ regressed with current vector %@, server vector %@", v410, v411, v412);
      objc_msgSend_CKClientSuitableError(v376, v377, v378, v379);
      v408 = v376;
      id v371 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_66:
      if (v417)
      {
        long long v143 = v413;
      }
      else
      {
        uint64_t v144 = objc_opt_new();

        long long v143 = (void *)v144;
      }
      id v413 = v143;
      v410 = objc_msgSend_mutableCopy(v143, v132, v133, v134);
      v148 = objc_msgSend_clockVector(v414, v145, v146, v147);
      objc_msgSend_intersectVector_(v410, v149, (uint64_t)v148, v150);

      __int16 v151 = [CKMergeableDeltaMetadata alloc];
      uint64_t v152 = [CKMergeableDeltaVectors alloc];
      uint64_t v156 = objc_msgSend_mutableCopy(v414, v153, v154, v155);
      v158 = objc_msgSend_initWithPreviousStateVector_currentStateVector_(v152, v157, (uint64_t)v410, (uint64_t)v156);
      v411 = (CKMergeableRecordValue *)objc_msgSend_initWithVectors_(v151, v159, (uint64_t)v158, v160);

      v164 = objc_msgSend_vectors(v411, v161, v162, v163);
      v168 = objc_msgSend_contents(v164, v165, v166, v167);
      if (objc_msgSend_timestampCount(v168, v169, v170, v171))
      {

LABEL_71:
        v408 = objc_opt_new();
        if (!objc_msgSend_inlineReplacementEnabled(self, v175, v176, v177)
          || (objc_msgSend_serverDeltaMetadatas(self, v178, v179, v180),
              v181 = objc_claimAutoreleasedReturnValue(),
              BOOL v185 = objc_msgSend_count(v181, v182, v183, v184) == 0,
              v181,
              v185))
        {
          v418 = 0;
        }
        else
        {
          uint64_t v186 = objc_msgSend_enabledFaultErrors(self, v178, v179, v180);
          uint64_t v190 = objc_msgSend_serverDeltaMetadatas(self, v187, v188, v189);
          v195 = objc_msgSend_mutableCopy(v414, v191, v192, v193);
          v196 = (id *)(v458 + 5);
          if ((v186 & 2) != 0) {
            id v443 = *v196;
          }
          objc_msgSend_replacementDeltaMetadatasForDeltaDirectory_withNextDeltaMetadata_currentStateVector_deltaDirectoryDeliveryRequirements_error_(CKMergeableDeltaMetadata, v194, (uint64_t)v190, (uint64_t)v411, v195, -1, (unint64_t)&v443 & (v186 << 62 >> 63));
          v418 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          if ((v186 & 2) != 0) {
            objc_storeStrong(v196, v443);
          }

          if (v458[5])
          {
            v200 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, v200);
            }

            v201 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_valueID(self, v202, v203, v204);
              v403 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
              v404 = (void *)v458[5];
              *(_DWORD *)buf = 138412546;
              v468 = v403;
              __int16 v469 = 2112;
              id v470 = v404;
              _os_log_error_impl(&dword_18AF10000, v201, OS_LOG_TYPE_ERROR, "Error calculating replacement deltas for %@: %@", buf, 0x16u);
            }
            *((unsigned char *)v454 + 24) = 0;
          }
          v205 = objc_msgSend_replacementDeltaMetadatas(v418, v197, v198, v199);
          BOOL v209 = objc_msgSend_count(v205, v206, v207, v208) == 0;

          if (!v209)
          {
            uint64_t v213 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, v213);
            }

            uint64_t v214 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v468 = v418;
              _os_log_debug_impl(&dword_18AF10000, v214, OS_LOG_TYPE_DEBUG, "Found deltas to replace: %@", buf, 0xCu);
            }

            uint64_t v218 = objc_msgSend_replacementDeltaMetadatas(v418, v215, v216, v217);
            v436[0] = MEMORY[0x1E4F143A8];
            v436[1] = 3221225472;
            v436[2] = sub_18B16F788;
            v436[3] = &unk_1E5465430;
            v437 = v418;
            id v438 = v409;
            v439 = self;
            v441 = &v457;
            v442 = &v453;
            id v440 = v408;
            objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v218, v219, (uint64_t)v436, v220);
          }
          v221 = objc_msgSend_updatedNextDeltaMetadata(v418, v210, v211, v212);

          if (v221)
          {
            uint64_t v222 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, v222);
            }

            v223 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_updatedNextDeltaMetadata(v418, v224, v225, v226);
              v405 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v468 = v405;
              _os_log_debug_impl(&dword_18AF10000, v223, OS_LOG_TYPE_DEBUG, "Will use updated delta metadata: %@", buf, 0xCu);
            }
            uint64_t v230 = objc_msgSend_updatedNextDeltaMetadata(v418, v227, v228, v229);

            v411 = (CKMergeableRecordValue *)v230;
          }
        }
        if (*((unsigned char *)v454 + 24))
        {
          v231 = objc_msgSend_vectors(v411, v178, v179, v180);
          v235 = objc_msgSend_contents(v231, v232, v233, v234);
          BOOL v239 = objc_msgSend_timestampCount(v235, v236, v237, v238) == 0;

          if (v239)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v383 = ck_log_facility_distributed_sync;
            if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v468 = self;
              _os_log_debug_impl(&dword_18AF10000, v383, OS_LOG_TYPE_DEBUG, "No new data to save for mergeable %@", buf, 0xCu);
            }
            goto LABEL_173;
          }
          v240 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v240);
          }

          uint64_t v241 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v411;
            _os_log_debug_impl(&dword_18AF10000, v241, OS_LOG_TYPE_DEBUG, "Will generate deltas for metadata: %@", buf, 0xCu);
          }

          v242 = (id *)(v458 + 5);
          id v435 = (id)v458[5];
          v244 = objc_msgSend_mergeableDeltasForMetadata_error_(v409, v243, (uint64_t)v411, (uint64_t)&v435);
          objc_storeStrong(v242, v435);
          if (v244)
          {
            if (objc_msgSend_count(v244, v245, v246, v247))
            {
              long long v433 = 0u;
              long long v434 = 0u;
              long long v431 = 0u;
              long long v432 = 0u;
              id v407 = v244;
              uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v407, v249, (uint64_t)&v431, (uint64_t)v466, 16);
              if (v253)
              {
                uint64_t v254 = *(void *)v432;
                while (2)
                {
                  for (uint64_t k = 0; k != v253; ++k)
                  {
                    if (*(void *)v432 != v254) {
                      objc_enumerationMutation(v407);
                    }
                    v256 = objc_msgSend_metadata(*(void **)(*((void *)&v431 + 1) + 8 * k), v250, v251, v252);
                    BOOL v257 = v256 == 0;

                    if (v257)
                    {
                      v384 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v250, @"CKInternalErrorDomain", 1017, @"Delta for versioned mergeable has nil metadata");
                      uint64_t v388 = objc_msgSend_CKClientSuitableError(v384, v385, v386, v387);
                      v389 = (void *)v458[5];
                      v458[5] = v388;

                      goto LABEL_169;
                    }
                  }
                  uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v407, v250, (uint64_t)&v431, (uint64_t)v466, 16);
                  if (v253) {
                    continue;
                  }
                  break;
                }
              }

              *((unsigned char *)v454 + 24) = 1;
              v261 = objc_msgSend_removableDeltaMetadatas(v418, v258, v259, v260);
              BOOL v265 = objc_msgSend_count(v261, v262, v263, v264) == 0;

              if (!v265)
              {
                long long v269 = ck_log_initialization_block;
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once(&ck_log_initialization_predicate, v269);
                }

                long long v270 = (id)ck_log_facility_distributed_sync;
                if (os_log_type_enabled(v270, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_18AF10000, v270, OS_LOG_TYPE_DEBUG, "Will fold empty deltas into new delta", buf, 2u);
                }

                long long v429 = 0u;
                long long v430 = 0u;
                long long v427 = 0u;
                long long v428 = 0u;
                id v271 = v407;
                uint64_t v276 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v272, (uint64_t)&v427, (uint64_t)v465, 16);
                if (v276)
                {
                  uint64_t v277 = *(void *)v428;
                  do
                  {
                    for (uint64_t m = 0; m != v276; ++m)
                    {
                      if (*(void *)v428 != v277) {
                        objc_enumerationMutation(v271);
                      }
                      __int16 v279 = *(void **)(*((void *)&v427 + 1) + 8 * m);
                      v280 = objc_msgSend_removableDeltaMetadatas(v418, v273, v274, v275);
                      v284 = objc_msgSend_metadata(v279, v281, v282, v283);
                      objc_msgSend_setReplacedDeltaIdentifiers_(v284, v285, (uint64_t)v280, v286);
                    }
                    uint64_t v276 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v273, (uint64_t)&v427, (uint64_t)v465, 16);
                  }
                  while (v276);
                }

                uint64_t v287 = [CKReplaceDeltasRequest alloc];
                v291 = objc_msgSend_valueID(self, v288, v289, v290);
                v295 = objc_msgSend_removableDeltaMetadatas(v418, v292, v293, v294);
                v299 = objc_msgSend_allObjects(v295, v296, v297, v298);
                v301 = objc_msgSend_initWithValueID_deltaIdentifiersToReplace_replacementDeltas_replacementDeltasContainNewData_(v287, v300, (uint64_t)v291, (uint64_t)v299, v271, 1);

                objc_msgSend_insertObject_atIndex_(v408, v302, (uint64_t)v301, 0);
                id v407 = (id)MEMORY[0x1E4F1CBF0];
              }
              uint64_t v303 = objc_msgSend_maxInlineDeltaSize(CKMergeableDelta, v266, v267, v268);
              v307 = objc_msgSend_mutableCopy(v407, v304, v305, v306);
              long long v425 = 0u;
              long long v426 = 0u;
              long long v423 = 0u;
              long long v424 = 0u;
              id v308 = v408;
              uint64_t v313 = objc_msgSend_countByEnumeratingWithState_objects_count_(v308, v309, (uint64_t)&v423, (uint64_t)v464, 16);
              if (v313)
              {
                uint64_t v314 = *(void *)v424;
                do
                {
                  for (uint64_t n = 0; n != v313; ++n)
                  {
                    if (*(void *)v424 != v314) {
                      objc_enumerationMutation(v308);
                    }
                    v316 = objc_msgSend_replacementDeltas(*(void **)(*((void *)&v423 + 1) + 8 * n), v310, v311, v312);
                    objc_msgSend_addObjectsFromArray_(v307, v317, (uint64_t)v316, v318);
                  }
                  uint64_t v313 = objc_msgSend_countByEnumeratingWithState_objects_count_(v308, v310, (uint64_t)&v423, (uint64_t)v464, 16);
                }
                while (v313);
              }

              long long v421 = 0u;
              long long v422 = 0u;
              long long v419 = 0u;
              long long v420 = 0u;
              id v319 = v307;
              uint64_t v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v320, (uint64_t)&v419, (uint64_t)v463, 16);
              if (v324)
              {
                uint64_t v325 = *(void *)v420;
                do
                {
                  for (iuint64_t i = 0; ii != v324; ++ii)
                  {
                    if (*(void *)v420 != v325) {
                      objc_enumerationMutation(v319);
                    }
                    v327 = *(void **)(*((void *)&v419 + 1) + 8 * ii);
                    v328 = objc_msgSend_valueID(self, v321, v322, v323);
                    objc_msgSend_setValueID_(v327, v329, (uint64_t)v328, v330);

                    uint64_t v334 = objc_msgSend_encryptMetadataTernary(self, v331, v332, v333);
                    objc_msgSend_setEncryptMetadataTernary_(v327, v335, v334, v336);
                    objc_msgSend_populateAssetIfNecessaryWithMaxInlineSize_(v327, v337, v303, v338);
                  }
                  uint64_t v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v321, (uint64_t)&v419, (uint64_t)v463, 16);
                }
                while (v324);
              }

              v341 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v339, (uint64_t)v407, v340);
              objc_msgSend_setDeltasToSave_(self, v342, (uint64_t)v341, v343);

              uint64_t v347 = objc_msgSend_copy(v308, v344, v345, v346);
              v350 = (void *)v347;
              if (v347) {
                objc_msgSend_setPendingReplacementRequests_(self, v348, v347, v349);
              }
              else {
                objc_msgSend_setPendingReplacementRequests_(self, v348, MEMORY[0x1E4F1CBF0], v349);
              }

              v351 = ck_log_initialization_block;
              if (ck_log_initialization_predicate != -1) {
                dispatch_once(&ck_log_initialization_predicate, v351);
              }

              v352 = (id)ck_log_facility_distributed_sync;
              if (os_log_type_enabled(v352, OS_LOG_TYPE_DEBUG))
              {
                v406 = objc_msgSend_deltasToSave(self, v353, v354, v355);
                *(_DWORD *)buf = 138412546;
                v468 = self;
                __int16 v469 = 2112;
                id v470 = v406;
                _os_log_debug_impl(&dword_18AF10000, v352, OS_LOG_TYPE_DEBUG, "Generated deltas for mergeable %@: %@", buf, 0x16u);
              }
              goto LABEL_173;
            }
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v248, @"CKInternalErrorDomain", 1017, @"Mergeable did not return any deltas");
            id v407 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v393 = objc_msgSend_CKClientSuitableError(v407, v390, v391, v392);
            v384 = (void *)v458[5];
            v458[5] = v393;
LABEL_169:
          }
          *((unsigned char *)v454 + 24) = 0;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v380 = ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
          {
LABEL_173:
            if (a4) {
              *a4 = (id) v458[5];
            }
            BOOL v76 = *((unsigned char *)v454 + 24) != 0;

            goto LABEL_176;
          }
          v402 = (CKMergeableRecordValue *)v458[5];
          *(_DWORD *)buf = 138412290;
          v468 = v402;
          v382 = "Error generating deltas: %@";
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v380 = ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR)) {
            goto LABEL_173;
          }
          v381 = (CKMergeableRecordValue *)v458[5];
          *(_DWORD *)buf = 138412290;
          v468 = v381;
          v382 = "Not generating deltas due to previous error: %@";
        }
        _os_log_error_impl(&dword_18AF10000, v380, OS_LOG_TYPE_ERROR, v382, buf, 0xCu);
        goto LABEL_173;
      }
      v356 = objc_msgSend_vectors(v411, v172, v173, v174);
      v360 = objc_msgSend_removals(v356, v357, v358, v359);
      BOOL v364 = objc_msgSend_timestampCount(v360, v361, v362, v363) == 0;

      if (v364) {
        goto LABEL_71;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v365 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v468 = v414;
        __int16 v469 = 2112;
        id v470 = v413;
        _os_log_error_impl(&dword_18AF10000, v365, OS_LOG_TYPE_ERROR, "Mergeable has a new removal without a corresponding change to the version vector, with current vector %@, server vector %@", buf, 0x16u);
      }
      if (!a4)
      {
        BOOL v76 = 0;
LABEL_177:

        goto LABEL_178;
      }
      v367 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v366, @"CKInternalErrorDomain", 1017, @"Mergeable has a new removal without a corresponding change to the version vector, with current vector %@, server vector %@", v414, v413);
      objc_msgSend_CKClientSuitableError(v367, v368, v369, v370);
      v408 = v367;
      id v371 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v76 = 0;
    *a4 = v371;
LABEL_176:

    goto LABEL_177;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v75 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    v396 = (CKMergeableRecordValue *)v458[5];
    *(_DWORD *)buf = 138412290;
    v468 = v396;
    _os_log_error_impl(&dword_18AF10000, v75, OS_LOG_TYPE_ERROR, "Error preparing mergeable for upload: %@", buf, 0xCu);
  }
  if (!a4) {
    goto LABEL_51;
  }
  BOOL v76 = 0;
  *a4 = (id) v458[5];
LABEL_179:

  _Block_object_dispose(&v453, 8);
  _Block_object_dispose(&v457, 8);

  return v76;
}

- (BOOL)hasAssetBackedDeltas
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v5 = objc_msgSend_deltasToSave(self, a2, v2, v3);
  v69[0] = v5;
  uint64_t v9 = objc_msgSend_unmergedDeltas(self, v6, v7, v8);
  v69[1] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v69, 2);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v62, (uint64_t)v70, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v18 = v17;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v58, (uint64_t)v68, 16);
        if (v20)
        {
          uint64_t v24 = v20;
          uint64_t v25 = *(void *)v59;
          while (2)
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v59 != v25) {
                objc_enumerationMutation(v18);
              }
              uint64_t v27 = objc_msgSend_asset(*(void **)(*((void *)&v58 + 1) + 8 * j), v21, v22, v23);

              if (v27)
              {
LABEL_32:

                LOBYTE(v36) = 1;
                goto LABEL_33;
              }
            }
            uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v58, (uint64_t)v68, 16);
            if (v24) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v28, (uint64_t)&v62, (uint64_t)v70, 16);
    }
    while (v14);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v11 = objc_msgSend_pendingReplacementRequests(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v32, (uint64_t)&v54, (uint64_t)v67, 16);
  if (v36)
  {
    uint64_t v37 = *(void *)v55;
    while (2)
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v55 != v37) {
          objc_enumerationMutation(v11);
        }
        uint64_t v39 = *(void **)(*((void *)&v54 + 1) + 8 * k);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        objc_msgSend_replacementDeltas(v39, v33, v34, v35, 0);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v40, (uint64_t)&v50, (uint64_t)v66, 16);
        if (v41)
        {
          uint64_t v45 = v41;
          uint64_t v46 = *(void *)v51;
LABEL_23:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v51 != v46) {
              objc_enumerationMutation(v18);
            }
            long long v48 = objc_msgSend_asset(*(void **)(*((void *)&v50 + 1) + 8 * v47), v42, v43, v44);

            if (v48) {
              goto LABEL_32;
            }
            if (v45 == ++v47)
            {
              uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v42, (uint64_t)&v50, (uint64_t)v66, 16);
              if (v45) {
                goto LABEL_23;
              }
              break;
            }
          }
        }
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v33, (uint64_t)&v54, (uint64_t)v67, 16);
      if (v36) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  return v36;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (void)setValueID:(id)a3
{
}

- (BOOL)isValueIDKnownToServer
{
  return self->_isValueIDKnownToServer;
}

- (void)setIsValueIDKnownToServer:(BOOL)a3
{
  self->_BOOL isValueIDKnownToServer = a3;
}

- (CKDistributedTimestampStateVector)lastKnownServerTimestampVector
{
  return self->_lastKnownServerTimestampVector;
}

- (NSSet)deltasToSave
{
  return self->_deltasToSave;
}

- (void)setDeltasToSave:(id)a3
{
}

- (NSSet)savedDeltaMetadatas
{
  return self->_savedDeltaMetadatas;
}

- (void)setSavedDeltaMetadatas:(id)a3
{
}

- (NSSet)unmergedDeltas
{
  return self->_unmergedDeltas;
}

- (void)setUnmergedDeltas:(id)a3
{
}

- (CKMultiValueMergeableDeltaRegisterState)multiValueRegisterState
{
  return self->_multiValueRegisterState;
}

- (void)setMultiValueRegisterState:(id)a3
{
}

- (int64_t)encryptMetadataTernary
{
  return self->_encryptMetadataTernary;
}

- (void)setEncryptMetadataTernary:(int64_t)a3
{
  self->_int64_t encryptMetadataTernary = a3;
}

- (NSSet)serverDeltaMetadatas
{
  return self->_serverDeltaMetadatas;
}

- (void)setServerDeltaMetadatas:(id)a3
{
}

- (NSArray)pendingReplacementRequests
{
  return self->_pendingReplacementRequests;
}

- (void)setPendingReplacementRequests:(id)a3
{
}

- (BOOL)inlineReplacementEnabled
{
  return self->_inlineReplacementEnabled;
}

- (void)setInlineReplacementEnabled:(BOOL)a3
{
  self->_inlineReplacementEnabled = a3;
}

- (unint64_t)enabledFaultErrors
{
  return self->_enabledFaultErrors;
}

- (void)setEnabledFaultErrors:(unint64_t)a3
{
  self->_enabledFaultErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplacementRequests, 0);
  objc_storeStrong((id *)&self->_serverDeltaMetadatas, 0);
  objc_storeStrong((id *)&self->_multiValueRegisterState, 0);
  objc_storeStrong((id *)&self->_unmergedDeltas, 0);
  objc_storeStrong((id *)&self->_savedDeltaMetadatas, 0);
  objc_storeStrong((id *)&self->_deltasToSave, 0);
  objc_storeStrong((id *)&self->_lastKnownServerTimestampVector, 0);

  objc_storeStrong((id *)&self->_valueID, 0);
}

@end