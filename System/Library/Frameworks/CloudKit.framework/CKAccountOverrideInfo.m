@interface CKAccountOverrideInfo
+ (BOOL)supportsSecureCoding;
+ (id)anonymousAccount;
+ (id)liveAccount;
- (BOOL)isEqual:(id)a3;
- (CKAccountOverrideInfo)initWithAccountID:(id)a3;
- (CKAccountOverrideInfo)initWithAltDSID:(id)a3;
- (CKAccountOverrideInfo)initWithCoder:(id)a3;
- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4;
- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountPropertyOverrides:(id)a7 overridesByDataclass:(id)a8;
- (CKAccountOverrideInfo)initWithSqliteRepresentation:(id)a3;
- (NSDictionary)accountPropertyOverrides;
- (NSDictionary)overridesByDataclass;
- (NSString)accountID;
- (NSString)altDSID;
- (NSString)description;
- (NSString)email;
- (NSString)password;
- (NSString)recoveryKey;
- (NSString)secondEmail;
- (NSString)uniqueID;
- (id)CKPropertiesDescription;
- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5;
- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountID:(id)a7 altDSID:(id)a8 accountPropertyOverrides:(id)a9 overridesByDataclass:(id)a10;
- (id)copyWithAccountPropertyOverrides:(id)a3 overridesByDataclass:(id)a4;
- (id)sqliteRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
@end

@implementation CKAccountOverrideInfo

- (CKAccountOverrideInfo)initWithAccountID:(id)a3
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, 0, 0, 0, 0, a3, 0, 0, 0);
}

- (CKAccountOverrideInfo)initWithAltDSID:(id)a3
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, 0, 0, 0, 0, 0, a3, 0, 0);
}

- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5
{
  return (id)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0, 0);
}

- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountPropertyOverrides:(id)a7 overridesByDataclass:(id)a8
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0, 0);
}

- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountID:(id)a7 altDSID:(id)a8 accountPropertyOverrides:(id)a9 overridesByDataclass:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v66.receiver = self;
  v66.super_class = (Class)CKAccountOverrideInfo;
  v27 = [(CKAccountOverrideInfo *)&v66 init];
  if (v27)
  {
    uint64_t v28 = objc_msgSend_copy(v16, v24, v25, v26);
    email = v27->_email;
    v27->_email = (NSString *)v28;

    uint64_t v33 = objc_msgSend_copy(v17, v30, v31, v32);
    password = v27->_password;
    v27->_password = (NSString *)v33;

    uint64_t v38 = objc_msgSend_copy(v18, v35, v36, v37);
    recoveryKey = v27->_recoveryKey;
    v27->_recoveryKey = (NSString *)v38;

    uint64_t v43 = objc_msgSend_copy(v19, v40, v41, v42);
    secondEmail = v27->_secondEmail;
    v27->_secondEmail = (NSString *)v43;

    uint64_t v48 = objc_msgSend_copy(v20, v45, v46, v47);
    accountID = v27->_accountID;
    v27->_accountID = (NSString *)v48;

    uint64_t v53 = objc_msgSend_copy(v21, v50, v51, v52);
    altDSID = v27->_altDSID;
    v27->_altDSID = (NSString *)v53;

    uint64_t v58 = objc_msgSend_CKDeepCopy(v22, v55, v56, v57);
    accountPropertyOverrides = v27->_accountPropertyOverrides;
    v27->_accountPropertyOverrides = (NSDictionary *)v58;

    uint64_t v63 = objc_msgSend_CKDeepCopy(v23, v60, v61, v62);
    overridesByDataclass = v27->_overridesByDataclass;
    v27->_overridesByDataclass = (NSDictionary *)v63;
  }
  return v27;
}

+ (id)anonymousAccount
{
  if (qword_1EB279BD8 != -1) {
    dispatch_once(&qword_1EB279BD8, &unk_1ED7EF0D8);
  }
  v2 = (void *)qword_1EB279BE0;

  return v2;
}

+ (id)liveAccount
{
  if (qword_1EB279BE8 != -1) {
    dispatch_once(&qword_1EB279BE8, &unk_1ED7EFD38);
  }
  v2 = (void *)qword_1EB279BF0;

  return v2;
}

- (id)CKPropertiesDescription
{
  v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 4, v2);
  v8 = objc_msgSend_accountID(self, v5, v6, v7);

  if (v8)
  {
    v12 = NSString;
    v13 = objc_msgSend_accountID(self, v9, v10, v11);
    id v16 = objc_msgSend_stringWithFormat_(v12, v14, @"accountID=%@", v15, v13);
    objc_msgSend_addObject_(v4, v17, (uint64_t)v16, v18);
  }
  id v19 = objc_msgSend_altDSID(self, v9, v10, v11);

  if (v19)
  {
    id v23 = NSString;
    v24 = objc_msgSend_altDSID(self, v20, v21, v22);
    v27 = objc_msgSend_stringWithFormat_(v23, v25, @"altDSID=%@", v26, v24);
    objc_msgSend_addObject_(v4, v28, (uint64_t)v27, v29);
  }
  v30 = objc_msgSend_email(self, v20, v21, v22);

  if (v30)
  {
    v34 = NSString;
    v35 = objc_msgSend_email(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_stringWithFormat_(v34, v36, @"email=%@", v37, v35);
    objc_msgSend_addObject_(v4, v39, (uint64_t)v38, v40);
  }
  uint64_t v41 = objc_msgSend_secondEmail(self, v31, v32, v33);

  if (v41)
  {
    v45 = NSString;
    uint64_t v46 = objc_msgSend_secondEmail(self, v42, v43, v44);
    v49 = objc_msgSend_stringWithFormat_(v45, v47, @"secondEmail=%@", v48, v46);
    objc_msgSend_addObject_(v4, v50, (uint64_t)v49, v51);
  }
  uint64_t v52 = objc_msgSend_accountPropertyOverrides(self, v42, v43, v44);
  uint64_t v56 = objc_msgSend_count(v52, v53, v54, v55);

  if (v56)
  {
    v60 = NSString;
    uint64_t v61 = objc_msgSend_accountPropertyOverrides(self, v57, v58, v59);
    v64 = objc_msgSend_stringWithFormat_(v60, v62, @"customProps=%@", v63, v61);
    objc_msgSend_addObject_(v4, v65, (uint64_t)v64, v66);
  }
  v67 = objc_msgSend_overridesByDataclass(self, v57, v58, v59);
  uint64_t v71 = objc_msgSend_count(v67, v68, v69, v70);

  if (v71)
  {
    v75 = NSString;
    v76 = objc_msgSend_overridesByDataclass(self, v72, v73, v74);
    v79 = objc_msgSend_stringWithFormat_(v75, v77, @"customPropsByDataclass=%@", v78, v76);
    objc_msgSend_addObject_(v4, v80, (uint64_t)v79, v81);
  }
  v82 = objc_msgSend_componentsJoinedByString_(v4, v72, @", ", v74);

  return v82;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAccountOverrideInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSString)uniqueID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)self, 0, 0);
  memset(v19, 0, sizeof(v19));
  v4 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v3, (uint64_t)v19, 32, 0);
  id v5 = v2;
  v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, v8);
  CC_LONG v13 = objc_msgSend_length(v5, v10, v11, v12);
  CC_SHA256(v9, v13, (unsigned __int8 *)v19);
  id v17 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v4, v14, v15, v16);

  return (NSString *)v17;
}

- (id)copyWithAccountPropertyOverrides:(id)a3 overridesByDataclass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v43 = objc_alloc((Class)objc_opt_class());
  uint64_t v11 = objc_msgSend_email(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_password(self, v12, v13, v14);
  id v19 = objc_msgSend_recoveryKey(self, v16, v17, v18);
  id v23 = objc_msgSend_secondEmail(self, v20, v21, v22);
  v27 = objc_msgSend_accountID(self, v24, v25, v26);
  v34 = objc_msgSend_altDSID(self, v28, v29, v30);
  v35 = v6;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    objc_msgSend_overridesByDataclass(self, v31, v32, v33);
    id v42 = v7;
    uint64_t v38 = (uint64_t)v15;
    uint64_t v40 = v39 = (uint64_t)v11;
    uint64_t v36 = objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(v43, v41, v39, v38, v19, v23, v27, v34, v35, v40);

    uint64_t v11 = (void *)v39;
    uint64_t v15 = (void *)v38;
    id v7 = v42;
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v35 = objc_msgSend_accountPropertyOverrides(self, v31, v32, v33);
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v36 = objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(v43, v31, (uint64_t)v11, (uint64_t)v15, v19, v23, v27, v34, v35, v7);
  if (!v6) {
LABEL_4:
  }

LABEL_5:
  return v36;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKAccountOverrideInfo *)a3;
  if (self == v4)
  {
    char v77 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v9 = objc_msgSend_accountID(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_accountID(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14) {
        goto LABEL_13;
      }
      uint64_t v18 = objc_msgSend_altDSID(self, v15, v16, v17);
      uint64_t v22 = objc_msgSend_altDSID(v5, v19, v20, v21);
      int v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23) {
        goto LABEL_13;
      }
      v27 = objc_msgSend_email(self, v24, v25, v26);
      uint64_t v31 = objc_msgSend_email(v5, v28, v29, v30);
      int v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32) {
        goto LABEL_13;
      }
      uint64_t v36 = objc_msgSend_secondEmail(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_secondEmail(v5, v37, v38, v39);
      int v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41) {
        goto LABEL_13;
      }
      v45 = objc_msgSend_password(self, v42, v43, v44);
      v49 = objc_msgSend_password(v5, v46, v47, v48);
      int v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50) {
        goto LABEL_13;
      }
      uint64_t v54 = objc_msgSend_recoveryKey(self, v51, v52, v53);
      uint64_t v58 = objc_msgSend_recoveryKey(v5, v55, v56, v57);
      int v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59) {
        goto LABEL_13;
      }
      uint64_t v63 = objc_msgSend_accountPropertyOverrides(self, v60, v61, v62);
      v67 = objc_msgSend_accountPropertyOverrides(v5, v64, v65, v66);
      int v68 = CKObjectsAreBothNilOrEqual(v63, v67);

      if (v68)
      {
        v72 = objc_msgSend_overridesByDataclass(self, v69, v70, v71);
        v76 = objc_msgSend_overridesByDataclass(v5, v73, v74, v75);
        char v77 = CKObjectsAreBothNilOrEqual(v72, v76);
      }
      else
      {
LABEL_13:
        char v77 = 0;
      }
    }
    else
    {
      char v77 = 0;
    }
  }

  return v77;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_email(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_secondEmail(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_password(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_recoveryKey(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_accountID(self, v34, v35, v36);
  uint64_t v41 = objc_msgSend_hash(v37, v38, v39, v40);
  v45 = objc_msgSend_altDSID(self, v42, v43, v44);
  uint64_t v49 = v41 ^ objc_msgSend_hash(v45, v46, v47, v48);
  uint64_t v53 = objc_msgSend_accountPropertyOverrides(self, v50, v51, v52);
  uint64_t v57 = v33 ^ v49 ^ objc_msgSend_hash(v53, v54, v55, v56);
  uint64_t v61 = objc_msgSend_overridesByDataclass(self, v58, v59, v60);
  unint64_t v65 = v57 ^ objc_msgSend_hash(v61, v62, v63, v64);

  return v65;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v45 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_accountID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v45, v9, (uint64_t)v8, @"AccountID");

  uint64_t v13 = objc_msgSend_altDSID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v45, v14, (uint64_t)v13, @"AltDSID");

  uint64_t v18 = objc_msgSend_email(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v45, v19, (uint64_t)v18, @"Email");

  uint64_t v23 = objc_msgSend_secondEmail(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v45, v24, (uint64_t)v23, @"SecondEmail");

  uint64_t v28 = objc_msgSend_password(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v45, v29, (uint64_t)v28, @"Password");

  uint64_t v33 = objc_msgSend_recoveryKey(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v45, v34, (uint64_t)v33, @"RecoveryKey");

  uint64_t v38 = objc_msgSend_accountPropertyOverrides(self, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v45, v39, (uint64_t)v38, @"AccountPropertyOverrides");

  uint64_t v43 = objc_msgSend_overridesByDataclass(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v45, v44, (uint64_t)v43, @"OverridesByDataclass");
}

- (CKAccountOverrideInfo)initWithCoder:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CKAccountOverrideInfo;
  id v5 = [(CKAccountOverrideInfo *)&v50 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"AccountID");
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"AltDSID");
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"Email");
    email = v5->_email;
    v5->_email = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"SecondEmail");
    secondEmail = v5->_secondEmail;
    v5->_secondEmail = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"Password");
    password = v5->_password;
    v5->_password = (NSString *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"RecoveryKey");
    recoveryKey = v5->_recoveryKey;
    v5->_recoveryKey = (NSString *)v29;

    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v52, 2);
    uint64_t v36 = objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33, v35);
    uint64_t v38 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, @"AccountPropertyOverrides");
    accountPropertyOverrides = v5->_accountPropertyOverrides;
    v5->_accountPropertyOverrides = (NSDictionary *)v38;

    uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    uint64_t v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v51, 2);
    id v45 = objc_msgSend_setWithArray_(v40, v43, (uint64_t)v42, v44);
    uint64_t v47 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"OverridesByDataclass");
    overridesByDataclass = v5->_overridesByDataclass;
    v5->_overridesByDataclass = (NSDictionary *)v47;
  }

  return v5;
}

- (id)sqliteRepresentation
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_accountID(self, v4, v5, v6);
  uint64_t v8 = NSStringFromSelector(sel_accountID);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v7, (uint64_t)v8);

  uint64_t v13 = objc_msgSend_altDSID(self, v10, v11, v12);
  int v14 = NSStringFromSelector(sel_altDSID);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v13, (uint64_t)v14);

  uint64_t v19 = objc_msgSend_email(self, v16, v17, v18);
  uint64_t v20 = NSStringFromSelector(sel_email);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v19, (uint64_t)v20);

  uint64_t v25 = objc_msgSend_secondEmail(self, v22, v23, v24);
  uint64_t v26 = NSStringFromSelector(sel_secondEmail);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v25, (uint64_t)v26);

  uint64_t v31 = objc_msgSend_password(self, v28, v29, v30);
  uint64_t v32 = NSStringFromSelector(sel_password);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v31, (uint64_t)v32);

  uint64_t v37 = objc_msgSend_recoveryKey(self, v34, v35, v36);
  uint64_t v38 = NSStringFromSelector(sel_recoveryKey);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v39, (uint64_t)v37, (uint64_t)v38);

  uint64_t v43 = objc_msgSend_accountPropertyOverrides(self, v40, v41, v42);
  uint64_t v44 = NSStringFromSelector(sel_accountPropertyOverrides);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v43, (uint64_t)v44);

  uint64_t v49 = objc_msgSend_overridesByDataclass(self, v46, v47, v48);
  objc_super v50 = NSStringFromSelector(sel_overridesByDataclass);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v51, (uint64_t)v49, (uint64_t)v50);

  id v60 = 0;
  uint64_t v53 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v52, (uint64_t)v3, 0, &v60);
  id v54 = v60;
  if (v54)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v55 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v54;
      _os_log_error_impl(&dword_18AF10000, v55, OS_LOG_TYPE_ERROR, "Error converting CKAccountOverrideInfo to JSON: %@", buf, 0xCu);
    }
  }
  id v56 = [NSString alloc];
  uint64_t v58 = objc_msgSend_initWithData_encoding_(v56, v57, (uint64_t)v53, 4);

  return v58;
}

- (CKAccountOverrideInfo)initWithSqliteRepresentation:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    id v59 = 0;
    uint64_t v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v11, (uint64_t)v10, 0, &v59);
    id v13 = v59;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v56 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v13;
        _os_log_error_impl(&dword_18AF10000, v56, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKAccountOverrideInfo: %@", buf, 0xCu);
      }
      uint64_t v55 = 0;
    }
    else
    {
      v58.receiver = self;
      v58.super_class = (Class)CKAccountOverrideInfo;
      int v14 = [(CKAccountOverrideInfo *)&v58 init];
      if (v14)
      {
        uint64_t v15 = NSStringFromSelector(sel_accountID);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        accountID = v14->_accountID;
        v14->_accountID = (NSString *)v18;

        uint64_t v20 = NSStringFromSelector(sel_altDSID);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v12, v21, (uint64_t)v20, v22);
        altDSID = v14->_altDSID;
        v14->_altDSID = (NSString *)v23;

        uint64_t v25 = NSStringFromSelector(sel_email);
        uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v12, v26, (uint64_t)v25, v27);
        email = v14->_email;
        v14->_email = (NSString *)v28;

        uint64_t v30 = NSStringFromSelector(sel_secondEmail);
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v12, v31, (uint64_t)v30, v32);
        secondEmail = v14->_secondEmail;
        v14->_secondEmail = (NSString *)v33;

        uint64_t v35 = NSStringFromSelector(sel_password);
        uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v12, v36, (uint64_t)v35, v37);
        password = v14->_password;
        v14->_password = (NSString *)v38;

        uint64_t v40 = NSStringFromSelector(sel_recoveryKey);
        uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v12, v41, (uint64_t)v40, v42);
        recoveryKey = v14->_recoveryKey;
        v14->_recoveryKey = (NSString *)v43;

        id v45 = NSStringFromSelector(sel_accountPropertyOverrides);
        uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)v45, v47);
        accountPropertyOverrides = v14->_accountPropertyOverrides;
        v14->_accountPropertyOverrides = (NSDictionary *)v48;

        objc_super v50 = NSStringFromSelector(sel_overridesByDataclass);
        uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v12, v51, (uint64_t)v50, v52);
        overridesByDataclass = v14->_overridesByDataclass;
        v14->_overridesByDataclass = (NSDictionary *)v53;
      }
      self = v14;
      uint64_t v55 = self;
    }
  }
  else
  {
    uint64_t v55 = 0;
  }

  return v55;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (NSString)secondEmail
{
  return self->_secondEmail;
}

- (NSDictionary)accountPropertyOverrides
{
  return self->_accountPropertyOverrides;
}

- (NSDictionary)overridesByDataclass
{
  return self->_overridesByDataclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridesByDataclass, 0);
  objc_storeStrong((id *)&self->_accountPropertyOverrides, 0);
  objc_storeStrong((id *)&self->_secondEmail, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end