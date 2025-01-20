@interface CKEncryptedReference
- (CKEncryptedReference)initWithReference:(id)a3;
- (CKReference)reference;
- (id)_pReferenceFromReference:(id)a3;
- (id)_recordIDFromPRecordIdentifier:(id)a3;
- (id)_referenceFromPReference:(id)a3;
- (id)value;
@end

@implementation CKEncryptedReference

- (CKEncryptedReference)initWithReference:(id)a3
{
  id v4 = a3;
  id v32 = 0;
  char v5 = _CKCheckArgument((uint64_t)"reference", v4, 0, 0, 0, &v32);
  id v6 = v32;
  if ((v5 & 1) == 0)
  {
    v19 = v6;
    v20 = [CKException alloc];
    uint64_t v24 = objc_msgSend_code(v19, v21, v22, v23);
    v28 = objc_msgSend_localizedDescription(v19, v25, v26, v27);
    id v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, @"%@", v28);

    objc_exception_throw(v30);
  }

  v7 = objc_opt_new();
  v10 = objc_msgSend__pReferenceFromReference_(self, v8, (uint64_t)v4, v9);
  objc_msgSend_setReferenceValue_(v7, v11, (uint64_t)v10, v12);

  v16 = objc_msgSend_data(v7, v13, v14, v15);
  v31.receiver = self;
  v31.super_class = (Class)CKEncryptedReference;
  v17 = [(CKEncryptedData *)&v31 initWithData:v16];

  return v17;
}

- (CKReference)reference
{
  char v5 = objc_msgSend_data(self, a2, v2, v3);
  if (v5)
  {
    id v6 = [CKDPRecordFieldValueEncryptedValue alloc];
    uint64_t v9 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v5, v8);
    v13 = objc_msgSend_referenceValue(v9, v10, v11, v12);
    v16 = objc_msgSend__referenceFromPReference_(self, v14, (uint64_t)v13, v15);
  }
  else
  {
    v16 = 0;
  }

  return (CKReference *)v16;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedReference *, char *))MEMORY[0x1F4181798])(self, sel_reference);
}

- (id)_pReferenceFromReference:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v8 = objc_msgSend_recordID(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_zoneID(v8, v9, v10, v11);

  v13 = objc_opt_new();
  v17 = objc_msgSend_zoneName(v12, v14, v15, v16);
  v21 = objc_msgSend_CKDPIdentifier_Zone(v17, v18, v19, v20);
  objc_msgSend_setValue_(v13, v22, (uint64_t)v21, v23);

  uint64_t v27 = objc_msgSend_ownerName(v12, v24, v25, v26);
  objc_super v31 = objc_msgSend_CKDPIdentifier_User(v27, v28, v29, v30);
  objc_msgSend_setOwnerIdentifier_(v13, v32, (uint64_t)v31, v33);

  v34 = objc_opt_new();
  v38 = objc_msgSend_recordID(v3, v35, v36, v37);
  v42 = objc_msgSend_recordName(v38, v39, v40, v41);
  v46 = objc_msgSend_CKDPIdentifier_Record(v42, v43, v44, v45);
  objc_msgSend_setValue_(v34, v47, (uint64_t)v46, v48);

  objc_msgSend_setZoneIdentifier_(v34, v49, (uint64_t)v13, v50);
  objc_msgSend_setRecordIdentifier_(v4, v51, (uint64_t)v34, v52);
  uint64_t v56 = objc_msgSend_referenceAction(v3, v53, v54, v55);

  uint64_t v59 = objc_msgSend_ckdpReferenceTypeForCKReferenceAction_(CKReference, v57, v56, v58);
  objc_msgSend_setType_(v4, v60, v59, v61);

  return v4;
}

- (id)_referenceFromPReference:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordIdentifier(v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend__recordIDFromPRecordIdentifier_(self, v9, (uint64_t)v8, v10);
  if (v14)
  {
    if (objc_msgSend_hasType(v4, v11, v12, v13))
    {
      uint64_t v18 = objc_msgSend_type(v4, v15, v16, v17);
      uint64_t v21 = objc_msgSend_ckReferenceActionForCKDPRecordReferenceType_(CKReference, v19, v18, v20);
    }
    else
    {
      uint64_t v21 = 0;
    }
    uint64_t v24 = [CKReference alloc];
    uint64_t v23 = objc_msgSend_initWithRecordID_action_(v24, v25, (uint64_t)v14, v21);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v22 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412290;
      id v28 = v4;
      _os_log_error_impl(&dword_18AF10000, v22, OS_LOG_TYPE_ERROR, "Invalid record identifier from server %@", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_recordIDFromPRecordIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_zoneIdentifier(v3, v4, v5, v6);
  uint64_t v8 = [CKRecordZoneID alloc];
  uint64_t v12 = objc_msgSend_value(v7, v9, v10, v11);
  uint64_t v16 = objc_msgSend_name(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_ownerIdentifier(v7, v17, v18, v19);
  uint64_t v24 = objc_msgSend_name(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_initWithZoneName_ownerName_(v8, v25, (uint64_t)v16, (uint64_t)v24);

  int v27 = [CKRecordID alloc];
  objc_super v31 = objc_msgSend_value(v3, v28, v29, v30);

  v35 = objc_msgSend_name(v31, v32, v33, v34);
  uint64_t v37 = objc_msgSend_initWithRecordName_zoneID_(v27, v36, (uint64_t)v35, (uint64_t)v26);

  return v37;
}

@end