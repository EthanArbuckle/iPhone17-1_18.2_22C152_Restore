@interface CKRecordID
+ (BOOL)isValidRecordName:(id)a3 outError:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringAnonymousUserIDsToRecordID:(id)a3;
- (CKRecordID)init;
- (CKRecordID)initWithCoder:(id)a3;
- (CKRecordID)initWithRecordName:(NSString *)recordName;
- (CKRecordID)initWithRecordName:(NSString *)recordName zoneID:(CKRecordZoneID *)zoneID;
- (CKRecordID)initWithSqliteRepresentation:(id)a3;
- (CKRecordZoneID)zoneID;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSString)description;
- (NSString)recordName;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)ckShortDescription;
- (id)copyWithAnonymousCKUserID:(id)a3;
- (id)redactedDescription;
- (id)sqliteRepresentation;
- (int64_t)compareToRecordID:(id)a3;
- (unint64_t)hash;
- (unint64_t)size;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_nilOutRecordName;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRecordID

- (CKRecordID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v6 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"RecordName");
  uint64_t v9 = objc_opt_class();
  v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, @"ZoneID");
  v13 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(self, v12, (uint64_t)v8, (uint64_t)v11);

  return v13;
}

- (CKRecordID)initWithRecordName:(NSString *)recordName zoneID:(CKRecordZoneID *)zoneID
{
  v7 = recordName;
  v8 = zoneID;
  id v48 = 0;
  char v9 = _CKCheckArgument((uint64_t)"recordName", v7, 0, 1, 0, &v48);
  id v10 = v48;
  if ((v9 & 1) == 0
    || (v10,
        id v47 = 0,
        char v11 = _CKCheckArgument((uint64_t)"zoneID", v8, 0, 1, 0, &v47),
        id v10 = v47,
        (v11 & 1) == 0))
  {
    v34 = v10;
    v35 = [CKException alloc];
    uint64_t v39 = objc_msgSend_code(v34, v36, v37, v38);
    v43 = objc_msgSend_localizedDescription(v34, v40, v41, v42);
    id v45 = (id)objc_msgSend_initWithCode_format_(v35, v44, v39, @"%@", v43);

    objc_exception_throw(v45);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"CKRecordID.m", 44, @"Record identifier should be a string");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16, v17);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, @"CKRecordID.m", 45, @"Zone identifier should be a CKRecordZoneID");
  }
  v46.receiver = self;
  v46.super_class = (Class)CKRecordID;
  v21 = [(CKRecordID *)&v46 init];
  if (v21)
  {
    uint64_t v22 = objc_msgSend_copy(v7, v18, v19, v20);
    v23 = v21->_recordName;
    v21->_recordName = (NSString *)v22;

    uint64_t v27 = objc_msgSend_copy(v8, v24, v25, v26);
    v28 = v21->_zoneID;
    v21->_zoneID = (CKRecordZoneID *)v27;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);
}

- (CKRecordID)init
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = [CKException alloc];
  id v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E4F1C3C8], @"You must call -[%@ initWithRecordName:] or -[%@ initWithRecordName:zoneID:]", v3, v3);
  objc_exception_throw(v6);
}

- (CKRecordID)initWithRecordName:(NSString *)recordName
{
  id v4 = recordName;
  uint64_t v8 = objc_msgSend_defaultRecordZone(CKRecordZone, v5, v6, v7);
  v12 = objc_msgSend_zoneID(v8, v9, v10, v11);
  uint64_t v14 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(self, v13, (uint64_t)v4, (uint64_t)v12);

  return v14;
}

- (id)copyWithAnonymousCKUserID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_zoneID(self, v5, v6, v7);
  v12 = objc_msgSend_anonymousCKUserID(v8, v9, v10, v11);
  int v13 = CKObjectsAreBothNilOrEqual(v12, v4);

  if (v13)
  {
    uint64_t v14 = self;
  }
  else
  {
    id v15 = objc_alloc((Class)objc_opt_class());
    uint64_t v19 = objc_msgSend_recordName(self, v16, v17, v18);
    v23 = objc_msgSend_zoneID(self, v20, v21, v22);
    uint64_t v26 = objc_msgSend_copyWithAnonymousCKUserID_(v23, v24, (uint64_t)v4, v25);
    uint64_t v14 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(v15, v27, (uint64_t)v19, (uint64_t)v26);
  }
  return v14;
}

- (id)sqliteRepresentation
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_recordName(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_zoneID(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_sqliteRepresentation(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v5, v15, @"%@:%@", v16, v6, v14);

  return v17;
}

- (CKRecordID)initWithSqliteRepresentation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_componentsSeparatedByString_(v4, v8, @":", v9);
    if ((unint64_t)objc_msgSend_count(v10, v11, v12, v13) < 2)
    {
      v32 = 0;
    }
    else
    {
      uint64_t v14 = [CKRecordZoneID alloc];
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v10, v15, 0, v16);
      uint64_t v21 = objc_msgSend_length(v17, v18, v19, v20);
      v24 = objc_msgSend_substringFromIndex_(v4, v22, v21 + 1, v23);
      uint64_t v27 = objc_msgSend_initWithSqliteRepresentation_(v14, v25, (uint64_t)v24, v26);

      v30 = objc_msgSend_objectAtIndexedSubscript_(v10, v28, 0, v29);
      self = (CKRecordID *)(id)objc_msgSend_initWithRecordName_zoneID_(self, v31, (uint64_t)v30, (uint64_t)v27);

      v32 = self;
    }
  }
  else
  {
    v32 = 0;
  }

  return v32;
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
  id v4 = a3;
  uint64_t v8 = objc_msgSend_recordName(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"recordName", (uint64_t)v8, 0);

  objc_msgSend_zoneID(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, @"zoneID", (uint64_t)v14, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordID *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordID *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)ckShortDescription
{
  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_recordName(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_zoneID(self, v7, v8, v9);
  id v14 = objc_msgSend_ckShortDescription(v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v5, v15, @"%@:(%@)", v16, v6, v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKRecordID *)a3;
  if (self == v4)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v9 = objc_msgSend_recordName(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_recordName(v5, v10, v11, v12);
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        uint64_t v17 = objc_msgSend_zoneID(self, v14, v15, v16);
        uint64_t v21 = objc_msgSend_zoneID(v5, v18, v19, v20);
        char v22 = CKObjectsAreBothNilOrEqual(v17, v21);
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_recordName(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_zoneID(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqualIgnoringAnonymousUserIDsToRecordID:(id)a3
{
  id v4 = (CKRecordID *)a3;
  if (self == v4)
  {
    char v44 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend_recordName(self, v5, v6, v7);
      uint64_t v12 = objc_msgSend_recordName(v4, v9, v10, v11);
      if (CKObjectsAreBothNilOrEqual(v8, v12))
      {
        uint64_t v16 = objc_msgSend_zoneID(self, v13, v14, v15);
        uint64_t v20 = objc_msgSend_zoneName(v16, v17, v18, v19);
        v24 = objc_msgSend_zoneID(v4, v21, v22, v23);
        v28 = objc_msgSend_zoneName(v24, v25, v26, v27);
        if (CKObjectsAreBothNilOrEqual(v20, v28))
        {
          objc_super v46 = objc_msgSend_zoneID(self, v29, v30, v31);
          v35 = objc_msgSend_ownerName(v46, v32, v33, v34);
          objc_msgSend_zoneID(v4, v36, v37, v38);
          uint64_t v39 = v47 = v16;
          v43 = objc_msgSend_ownerName(v39, v40, v41, v42);
          char v44 = CKObjectsAreBothNilOrEqual(v35, v43);

          uint64_t v16 = v47;
        }
        else
        {
          char v44 = 0;
        }
      }
      else
      {
        char v44 = 0;
      }
    }
    else
    {
      char v44 = 0;
    }
  }

  return v44;
}

- (void)_nilOutRecordName
{
  self->_recordName = 0;
  MEMORY[0x1F41817F8]();
}

- (unint64_t)size
{
  uint64_t v5 = objc_msgSend_recordName(self, a2, v2, v3);
  unint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  unint64_t v10 = v9 + 2;
  if (v9 >= 0x80)
  {
    do
    {
      ++v10;
      unint64_t v11 = v9 >> 14;
      v9 >>= 7;
    }
    while (v11);
  }

  uint64_t v15 = objc_msgSend_zoneID(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_zoneName(v15, v16, v17, v18);
  unint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);
  unint64_t v24 = v23 + 2;
  if (v23 >= 0x80)
  {
    do
    {
      ++v24;
      unint64_t v25 = v23 >> 14;
      v23 >>= 7;
    }
    while (v25);
  }

  return v10 + v24 + 37;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_recordName(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"RecordName");

  uint64_t v13 = objc_msgSend_zoneID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, @"ZoneID");
}

- (int64_t)compareToRecordID:(id)a3
{
  id v4 = (CKRecordID *)a3;
  uint64_t v8 = objc_msgSend_recordName(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_recordName(v4, v9, v10, v11);
  int64_t v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    uint64_t v19 = objc_msgSend_zoneID(self, v16, v17, v18);
    unint64_t v23 = objc_msgSend_zoneID(v4, v20, v21, v22);
    uint64_t v26 = objc_msgSend_compareToRecordZoneID_(v19, v24, (uint64_t)v23, v25);

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

+ (BOOL)isValidRecordName:(id)a3 outError:(id *)a4
{
  return _CKCheckArgument((uint64_t)"recordName", a3, 0, 1, 0, a4);
}

- (NSString)recordName
{
  return self->_recordName;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);

  objc_storeStrong((id *)&self->_recordName, 0);
}

@end