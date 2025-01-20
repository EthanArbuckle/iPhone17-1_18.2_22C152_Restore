@interface CKDApplicationID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKDApplicationID)init;
- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3;
- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3 applicationBundleIdentifierOverrideForContainerAccess:(id)a4 applicationBundleIdentifierOverrideForNetworkAttribution:(id)a5 applicationBundleIdentifierOverrideForPushTopicGeneration:(id)a6 applicationBundleIdentifierOverrideForTCC:(id)a7;
- (CKDApplicationID)initWithCoder:(id)a3;
- (CKDApplicationID)initWithSqliteRepresentation:(id)a3;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration;
- (NSString)applicationBundleIdentifierOverrideForTCC;
- (NSString)description;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)sqliteRepresentation;
- (unint64_t)hash;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDApplicationID

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v9, (uint64_t)v10, a4);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDApplicationID *)a3;
  if (self == v4)
  {
    char v40 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v7 = objc_msgSend_applicationBundleIdentifier(self, v5, v6);
    id v10 = objc_msgSend_applicationBundleIdentifier(v4, v8, v9);
    int isEqualToString = objc_msgSend_isEqualToString_(v7, v11, (uint64_t)v10);

    if (!isEqualToString) {
      goto LABEL_8;
    }
    v15 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v13, v14);
    v18 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v16, v17);
    int v19 = CKObjectsAreBothNilOrEqual();

    if (!v19) {
      goto LABEL_8;
    }
    v22 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v20, v21);
    v25 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v23, v24);
    int v26 = CKObjectsAreBothNilOrEqual();

    if (!v26) {
      goto LABEL_8;
    }
    v29 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v27, v28);
    v32 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v4, v30, v31);
    int v33 = CKObjectsAreBothNilOrEqual();

    if (v33)
    {
      v36 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v34, v35);
      v39 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v4, v37, v38);
      char v40 = CKObjectsAreBothNilOrEqual();
    }
    else
    {
LABEL_8:
      char v40 = 0;
    }
  }

  return v40;
}

- (id)sqliteRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  v7 = objc_msgSend_applicationBundleIdentifier(self, v5, v6);
  uint64_t v8 = NSStringFromSelector(sel_applicationBundleIdentifier);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, (uint64_t)v7, v8);

  v12 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v10, v11);

  if (v12)
  {
    v15 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v13, v14);
    v16 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v17, (uint64_t)v15, v16);
  }
  v18 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v13, v14);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v19, v20);
    v22 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v23, (uint64_t)v21, v22);
  }
  uint64_t v24 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v19, v20);

  if (v24)
  {
    v27 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v25, v26);
    uint64_t v28 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v29, (uint64_t)v27, v28);
  }
  v30 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v25, v26);

  if (v30)
  {
    int v33 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v31, v32);
    v34 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v33, v34);
  }
  id v43 = 0;
  v36 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v31, (uint64_t)v4, 0, &v43);
  id v37 = v43;
  if (v37)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v38 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v37;
      _os_log_error_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_ERROR, "Error converting CKDApplicationID to JSON: %@", buf, 0xCu);
    }
  }
  id v39 = [NSString alloc];
  v41 = objc_msgSend_initWithData_encoding_(v39, v40, (uint64_t)v36, 4);

  return v41;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_applicationBundleIdentifier(self, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v10, (uint64_t)v9, @"applicationBundleID");

  v13 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v11, v12);

  if (v13)
  {
    v16 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, @"containerAccess");
  }
  v18 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v14, v15);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v22, (uint64_t)v21, @"networkAttribution");
  }
  v23 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v19, v20);

  if (v23)
  {
    uint64_t v26 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v24, v25);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v27, (uint64_t)v26, @"pushTopic");
  }
  uint64_t v28 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v24, v25);

  if (v28)
  {
    uint64_t v31 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v29, v30);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, @"TCC");
  }
  return v6;
}

- (NSString)applicationBundleIdentifierOverrideForTCC
{
  return self->_applicationBundleIdentifierOverrideForTCC;
}

- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration
{
  return self->_applicationBundleIdentifierOverrideForPushTopicGeneration;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDApplicationID *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDApplicationID)init
{
  id v2 = objc_alloc(MEMORY[0x1E4F1A018]);
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"-[%@ init] is unavailable", v5);

  objc_exception_throw(v7);
}

- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3
{
  return (CKDApplicationID *)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(self, a2, (uint64_t)a3, 0, 0, 0, 0);
}

- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3 applicationBundleIdentifierOverrideForContainerAccess:(id)a4 applicationBundleIdentifierOverrideForNetworkAttribution:(id)a5 applicationBundleIdentifierOverrideForPushTopicGeneration:(id)a6 applicationBundleIdentifierOverrideForTCC:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v52 = 0;
  char v17 = _CKCheckArgument();
  id v18 = 0;
  if ((v17 & 1) == 0)
  {
    v41 = v18;
    id v42 = objc_alloc(MEMORY[0x1E4F1A018]);
    uint64_t v45 = objc_msgSend_code(v41, v43, v44);
    v48 = objc_msgSend_localizedDescription(v41, v46, v47);
    id v50 = (id)objc_msgSend_initWithCode_format_(v42, v49, v45, @"%@", v48);

    objc_exception_throw(v50);
  }

  v51.receiver = self;
  v51.super_class = (Class)CKDApplicationID;
  uint64_t v21 = [(CKDApplicationID *)&v51 init];
  if (v21)
  {
    uint64_t v22 = objc_msgSend_copy(v12, v19, v20);
    applicationBundleIdentifier = v21->_applicationBundleIdentifier;
    v21->_applicationBundleIdentifier = (NSString *)v22;

    uint64_t v26 = objc_msgSend_copy(v13, v24, v25);
    applicationBundleIdentifierOverrideForContainerAccess = v21->_applicationBundleIdentifierOverrideForContainerAccess;
    v21->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v26;

    uint64_t v30 = objc_msgSend_copy(v14, v28, v29);
    applicationBundleIdentifierOverrideForNetworkAttribution = v21->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v21->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v30;

    uint64_t v34 = objc_msgSend_copy(v15, v32, v33);
    applicationBundleIdentifierOverrideForPushTopicGeneration = v21->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v21->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v34;

    uint64_t v38 = objc_msgSend_copy(v16, v36, v37);
    applicationBundleIdentifierOverrideForTCC = v21->_applicationBundleIdentifierOverrideForTCC;
    v21->_applicationBundleIdentifierOverrideForTCC = (NSString *)v38;
  }
  return v21;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_applicationBundleIdentifier(self, a2, v2);
  unint64_t v7 = objc_msgSend_hash(v4, v5, v6);

  id v10 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v8, v9);

  if (v10)
  {
    id v13 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v11, v12);
    v7 ^= objc_msgSend_hash(v13, v14, v15);
  }
  id v16 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v11, v12);

  if (v16)
  {
    int v19 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v17, v18);
    v7 ^= objc_msgSend_hash(v19, v20, v21);
  }
  uint64_t v22 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v17, v18);

  if (v22)
  {
    uint64_t v25 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v23, v24);
    v7 ^= objc_msgSend_hash(v25, v26, v27);
  }
  uint64_t v28 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v23, v24);

  if (v28)
  {
    uint64_t v31 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v29, v30);
    v7 ^= objc_msgSend_hash(v31, v32, v33);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDApplicationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDApplicationID;
  v5 = [(CKDApplicationID *)&v32 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = NSStringFromSelector(sel_applicationBundleIdentifier);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    char v17 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, v17);
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, v22);
    applicationBundleIdentifierOverrideForPushTopicGeneration = v5->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v5->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v26, v27);
    applicationBundleIdentifierOverrideForTCC = v5->_applicationBundleIdentifierOverrideForTCC;
    v5->_applicationBundleIdentifierOverrideForTCC = (NSString *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v35 = a3;
  uint64_t v6 = objc_msgSend_applicationBundleIdentifier(self, v4, v5);
  unint64_t v7 = NSStringFromSelector(sel_applicationBundleIdentifier);
  objc_msgSend_encodeObject_forKey_(v35, v8, (uint64_t)v6, v7);

  uint64_t v11 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v9, v10);

  if (v11)
  {
    uint64_t v14 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v12, v13);
    uint64_t v15 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    objc_msgSend_encodeObject_forKey_(v35, v16, (uint64_t)v14, v15);
  }
  char v17 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v12, v13);

  if (v17)
  {
    uint64_t v20 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v18, v19);
    uint64_t v21 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    objc_msgSend_encodeObject_forKey_(v35, v22, (uint64_t)v20, v21);
  }
  v23 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v18, v19);

  if (v23)
  {
    uint64_t v26 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v24, v25);
    uint64_t v27 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    objc_msgSend_encodeObject_forKey_(v35, v28, (uint64_t)v26, v27);
  }
  uint64_t v29 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v24, v25);

  if (v29)
  {
    objc_super v32 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v30, v31);
    uint64_t v33 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    objc_msgSend_encodeObject_forKey_(v35, v34, (uint64_t)v32, v33);
  }
}

- (CKDApplicationID)initWithSqliteRepresentation:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    uint64_t v8 = objc_msgSend_dataUsingEncoding_(v4, v7, 4);
    id v31 = 0;
    uint64_t v10 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v9, (uint64_t)v8, 0, &v31);
    id v11 = v31;
    if (v11 || !v10)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v28 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v11;
        _os_log_error_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKDApplicationID: %@", buf, 0xCu);
      }
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v12 = NSStringFromSelector(sel_applicationBundleIdentifier);
      uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v10, v13, (uint64_t)v12);

      uint64_t v14 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v10, v15, (uint64_t)v14);

      char v17 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v10, v18, (uint64_t)v17);

      uint64_t v20 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
      uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v10, v21, (uint64_t)v20);

      v23 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
      uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)v23);

      self = (CKDApplicationID *)(id)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(self, v26, (uint64_t)v30, v16, v19, v22, v25);
      uint64_t v27 = self;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForTCC, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForPushTopicGeneration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end