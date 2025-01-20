@interface CKRecordZoneID
+ (BOOL)supportsSecureCoding;
+ (id)cachedRecordZoneIDWithName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6;
+ (void)initialize;
- (BOOL)hasSameOwnerAs:(id)a3;
- (BOOL)isDefaultRecordZoneID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemRecordZoneID;
- (CKRecordZoneID)init;
- (CKRecordZoneID)initWithCoder:(id)a3;
- (CKRecordZoneID)initWithSqliteRepresentation:(id)a3;
- (CKRecordZoneID)initWithZoneName:(NSString *)zoneName ownerName:(NSString *)ownerName;
- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5;
- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6;
- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 databaseScope:(int64_t)a5;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSString)anonymousCKUserID;
- (NSString)description;
- (NSString)ownerName;
- (NSString)zoneName;
- (id)_initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6;
- (id)ckShortDescription;
- (id)copyWithAnonymousCKUserID:(id)a3;
- (id)redactedDescription;
- (id)sqliteRepresentation;
- (int64_t)compareToRecordZoneID:(id)a3;
- (int64_t)databaseScope;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRecordZoneID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousCKUserID, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);

  objc_storeStrong((id *)&self->_zoneName, 0);
}

- (CKRecordZoneID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v6 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ZoneName");
  uint64_t v9 = objc_opt_class();
  v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"ownerName");
  uint64_t v12 = objc_opt_class();
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"anonymousCKUserID");
  uint64_t v17 = objc_msgSend_decodeIntegerForKey_(v4, v15, @"databaseScopeKey", v16);
  v19 = (CKRecordZoneID *)objc_msgSend__initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(self, v18, (uint64_t)v8, (uint64_t)v11, v14, v17);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKRecordZoneID *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (objc_msgSend_databaseScope(self, v6, v7, v8) && objc_msgSend_databaseScope(v5, v9, v10, v11))
      {
        uint64_t v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
        BOOL v16 = v12 == objc_msgSend_databaseScope(v5, v13, v14, v15);
      }
      else
      {
        BOOL v16 = 1;
      }
      v18 = objc_msgSend_zoneName(self, v9, v10, v11);
      v22 = objc_msgSend_zoneName(v5, v19, v20, v21);
      if (CKObjectsAreBothNilOrEqual(v18, v22))
      {
        v26 = objc_msgSend_ownerName(self, v23, v24, v25);
        v30 = objc_msgSend_ownerName(v5, v27, v28, v29);
        if (CKObjectsAreBothNilOrEqual(v26, v30))
        {
          v34 = objc_msgSend_anonymousCKUserID(self, v31, v32, v33);
          v38 = objc_msgSend_anonymousCKUserID(v5, v35, v36, v37);
          BOOL v17 = CKObjectsAreBothNilOrEqual(v34, v38) & v16;
        }
        else
        {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (CKRecordZoneID)initWithZoneName:(NSString *)zoneName ownerName:(NSString *)ownerName
{
  uint64_t v6 = zoneName;
  uint64_t v7 = ownerName;
  id v28 = 0;
  char v8 = _CKCheckArgument((uint64_t)"zoneName", v6, 0, 1, 0, &v28);
  id v9 = v28;
  if ((v8 & 1) == 0
    || (v9,
        id v27 = 0,
        char v10 = _CKCheckArgument((uint64_t)"ownerName", v7, 0, 1, 0, &v27),
        id v9 = v27,
        (v10 & 1) == 0))
  {
    uint64_t v15 = v9;
    BOOL v16 = [CKException alloc];
    uint64_t v20 = objc_msgSend_code(v15, v17, v18, v19);
    uint64_t v24 = objc_msgSend_localizedDescription(v15, v21, v22, v23);
    id v26 = (id)objc_msgSend_initWithCode_format_(v16, v25, v20, @"%@", v24);

    objc_exception_throw(v26);
  }

  uint64_t v11 = objc_opt_class();
  objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v11, v12, (uint64_t)v6, (uint64_t)v7, 0, 0);
  v13 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cachedRecordZoneIDWithName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  id v42 = 0;
  char v13 = _CKCheckArgument((uint64_t)"zoneName", v10, 0, 1, 0, &v42);
  id v14 = v42;
  uint64_t v15 = v14;
  if ((v13 & 1) == 0
    || (v14,
        id v41 = 0,
        char v16 = _CKCheckArgument((uint64_t)"ownerName", v11, 0, 1, 0, &v41),
        id v17 = v41,
        uint64_t v15 = v17,
        (v16 & 1) == 0))
  {
    v30 = [CKException alloc];
    uint64_t v34 = objc_msgSend_code(v15, v31, v32, v33);
    v38 = objc_msgSend_localizedDescription(v15, v35, v36, v37);
    id v40 = (id)objc_msgSend_initWithCode_format_(v30, v39, v34, @"%@", v38);

    objc_exception_throw(v40);
  }

  if (qword_1EB279A90 != -1) {
    dispatch_once(&qword_1EB279A90, &unk_1ED7EEE38);
  }
  uint64_t v20 = &stru_1ED7F5C98;
  if (v12) {
    uint64_t v20 = v12;
  }
  uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v18, @"%@%@%@%ld", v19, v10, v11, v20, a6);
  id v22 = (id)qword_1EB279A88;
  objc_sync_enter(v22);
  uint64_t v25 = objc_msgSend_objectForKey_((void *)qword_1EB279A88, v23, (uint64_t)v21, v24);
  if (!v25)
  {
    id v26 = objc_alloc((Class)a1);
    uint64_t v25 = objc_msgSend__initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(v26, v27, (uint64_t)v10, (uint64_t)v11, v12, a6);
    objc_msgSend_setObject_forKey_((void *)qword_1EB279A88, v28, (uint64_t)v25, (uint64_t)v21);
  }
  objc_sync_exit(v22);

  return v25;
}

- (id)_initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CKRecordZoneID;
  char v16 = [(CKRecordZoneID *)&v30 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v10, v13, v14, v15);
    zoneName = v16->_zoneName;
    v16->_zoneName = (NSString *)v17;

    uint64_t v22 = objc_msgSend_copy(v11, v19, v20, v21);
    ownerName = v16->_ownerName;
    v16->_ownerName = (NSString *)v22;

    uint64_t v27 = objc_msgSend_copy(v12, v24, v25, v26);
    anonymousCKUserID = v16->_anonymousCKUserID;
    v16->_anonymousCKUserID = (NSString *)v27;

    v16->_databaseScope = a6;
  }

  return v16;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_zoneName(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  char v13 = objc_msgSend_ownerName(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_anonymousCKUserID(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (id)sqliteRepresentation
{
  v5 = objc_msgSend_anonymousCKUserID(self, a2, v2, v3);
  uint64_t v6 = NSString;
  id v10 = objc_msgSend_zoneName(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_ownerName(self, v11, v12, v13);
  uint64_t v17 = (void *)v14;
  if (v5) {
    objc_msgSend_stringWithFormat_(v6, v15, @"%@:%@%@%@", v16, v10, v14, @":", v5);
  }
  else {
  uint64_t v18 = objc_msgSend_stringWithFormat_(v6, v15, @"%@:%@%@%@", v16, v10, v14, &stru_1ED7F5C98, &stru_1ED7F5C98);
  }

  return v18;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (NSString)anonymousCKUserID
{
  return self->_anonymousCKUserID;
}

- (id)ckShortDescription
{
  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKRecordZoneID)init
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = [CKException alloc];
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithZoneName:ownerName:]", v3);
  objc_exception_throw(v6);
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_opt_class();
  objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v13, v14, (uint64_t)v12, (uint64_t)v11, v10, a6);
  uint64_t v15 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 databaseScope:(int64_t)a5
{
  return (CKRecordZoneID *)MEMORY[0x1F4181798](self, sel_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_, a3, a4);
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5
{
  return (CKRecordZoneID *)MEMORY[0x1F4181798](self, sel_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_, a3, a4);
}

- (id)copyWithAnonymousCKUserID:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_zoneName(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_ownerName(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_databaseScope(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v5, v18, (uint64_t)v9, (uint64_t)v13, v4, v17);

  return v19;
}

- (CKRecordZoneID)initWithSqliteRepresentation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    id v10 = objc_msgSend_componentsSeparatedByString_(v4, v8, @":", v9);
    if ((unint64_t)objc_msgSend_count(v10, v11, v12, v13) < 3)
    {
      if ((unint64_t)objc_msgSend_count(v10, v14, v15, v16) < 2)
      {
        unint64_t v25 = 0;
        goto LABEL_9;
      }
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v10, v26, 1, v27);
      uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v10, v28, 0, v29);
      self = (CKRecordZoneID *)(id)objc_msgSend_initWithZoneName_ownerName_(self, v30, (uint64_t)v20, (uint64_t)v17);
    }
    else
    {
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v10, v14, 0, v16);
      uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v10, v18, 1, v19);
      uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v10, v21, 2, v22);
      self = (CKRecordZoneID *)(id)objc_msgSend_initWithZoneName_ownerName_anonymousCKUserID_(self, v24, (uint64_t)v17, (uint64_t)v20, v23);
    }
    unint64_t v25 = self;
LABEL_9:

    goto LABEL_10;
  }
  unint64_t v25 = 0;
LABEL_10:

  return v25;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_sqliteRepresentation(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"sqliteRepresentation");

  uint64_t v12 = objc_msgSend_properties(v3, v9, v10, v11);

  return (CKRoughlyEquivalentProperties *)v12;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v30 = a3;
  uint64_t v7 = objc_msgSend_zoneName(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v30, v8, @"zoneName", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend_ownerName(self, v9, v10, v11);
  objc_msgSend_addProperty_value_shouldRedact_(v30, v13, @"ownerName", (uint64_t)v12, 0);

  uint64_t v20 = objc_msgSend_anonymousCKUserID(self, v14, v15, v16);
  if (v20) {
    objc_msgSend_addProperty_value_shouldRedact_(v30, v17, @"anonymousCKUserID", (uint64_t)v20, 0);
  }
  if (objc_msgSend_databaseScope(self, v17, v18, v19))
  {
    uint64_t v24 = NSNumber;
    uint64_t v25 = objc_msgSend_databaseScope(self, v21, v22, v23);
    id v28 = objc_msgSend_numberWithInteger_(v24, v26, v25, v27);
    objc_msgSend_addProperty_value_shouldRedact_(v30, v29, @"databaseScope", (uint64_t)v28, 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZoneID *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordZoneID *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_zoneName(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, @"ZoneName");

  uint64_t v13 = objc_msgSend_ownerName(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, @"ownerName");

  uint64_t v18 = objc_msgSend_anonymousCKUserID(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, @"anonymousCKUserID");

  uint64_t v23 = objc_msgSend_databaseScope(self, v20, v21, v22);
  objc_msgSend_encodeInteger_forKey_(v25, v24, v23, @"databaseScopeKey");
}

- (int64_t)compareToRecordZoneID:(id)a3
{
  id v4 = (CKRecordZoneID *)a3;
  uint64_t v8 = objc_msgSend_zoneName(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_zoneName(v4, v9, v10, v11);
  int64_t v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    uint64_t v19 = objc_msgSend_ownerName(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_ownerName(v4, v20, v21, v22);
    uint64_t v26 = objc_msgSend_compare_(v19, v24, (uint64_t)v23, v25);

    uint64_t v27 = -1;
    if (self >= v4) {
      uint64_t v27 = self > v4;
    }
    if (v26) {
      int64_t v15 = v26;
    }
    else {
      int64_t v15 = v27;
    }
  }

  return v15;
}

- (BOOL)isDefaultRecordZoneID
{
  id v4 = objc_msgSend_zoneName(self, a2, v2, v3);
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, @"_defaultZone", v6);

  return isEqualToString;
}

- (BOOL)isSystemRecordZoneID
{
  id v4 = objc_msgSend_zoneName(self, a2, v2, v3);
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, @"_systemZone", v6);

  return isEqualToString;
}

- (BOOL)hasSameOwnerAs:(id)a3
{
  if (self->_databaseScope == *((void *)a3 + 4)) {
    return objc_msgSend_isEqualToString_(self->_ownerName, a2, *((void *)a3 + 2), v3);
  }
  else {
    return 0;
  }
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);
}

@end