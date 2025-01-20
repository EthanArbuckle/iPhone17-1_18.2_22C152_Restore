@interface CKSQLiteTableEntry
+ (BOOL)_cksql_isTableEntry;
+ (Class)tableClass;
- (BOOL)isEqual:(id)a3;
- (CKSQLiteTableEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKSQLiteTableEntry

+ (BOOL)_cksql_isTableEntry
{
  return 1;
}

+ (Class)tableClass
{
  v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v9, (uint64_t)a2, (uint64_t)a1, @"CKSQLiteTable.m", 419, @"table class not set for %@", v8);

  return 0;
}

- (CKSQLiteTableEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKSQLiteTableEntry;
  v5 = [(CKSQLiteTableEntry *)&v13 init];
  if (v5)
  {
    v6 = objc_opt_class();
    v10 = objc_msgSend_tableClass(v6, v7, v8, v9);
    objc_msgSend_decodeEntry_withCoder_(v10, v11, (uint64_t)v5, (uint64_t)v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_tableClass(v4, v5, v6, v7);
  objc_msgSend_encodeEntry_withCoder_(v8, v9, (uint64_t)self, (uint64_t)v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_tableClass(v4, v5, v6, v7);

  return (id)MEMORY[0x1F4181798](v8, sel_copyOfEntry_, self, v9);
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_tableClass(v3, v4, v5, v6);

  return (id)objc_msgSend_descriptionOfEntry_(v7, v8, (uint64_t)self, v9);
}

- (unint64_t)hash
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_tableClass(v3, v4, v5, v6);

  return MEMORY[0x1F4181798](v7, sel_hashForEntry_, self, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_tableClass(v5, v6, v7, v8);
  LOBYTE(self) = objc_msgSend_entriesHaveEqualProperties_other_includePrimaryKeys_(v9, v10, (uint64_t)self, (uint64_t)v4, 0);

  return (char)self;
}

@end