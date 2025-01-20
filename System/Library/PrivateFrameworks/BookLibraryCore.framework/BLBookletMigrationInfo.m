@interface BLBookletMigrationInfo
+ (BOOL)supportsSecureCoding;
- (BLBookletMigrationInfo)initWithCoder:(id)a3;
- (BLBookletMigrationInfo)initWithStoreID:(int64_t)a3 migrationState:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)migrationState;
- (int64_t)storeID;
- (void)encodeWithCoder:(id)a3;
- (void)setMigrationState:(int64_t)a3;
- (void)setStoreID:(int64_t)a3;
@end

@implementation BLBookletMigrationInfo

- (BLBookletMigrationInfo)initWithStoreID:(int64_t)a3 migrationState:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BLBookletMigrationInfo;
  result = [(BLBookletMigrationInfo *)&v7 init];
  if (result)
  {
    result->_migrationState = a4;
    result->_storeID = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_storeID(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_migrationState(self, v10, v11, v12);
  objc_msgSend_stringWithFormat_(v3, v14, @"<%@:%p storeID=%lld; migrationState=%lld>",
    v15,
    v5,
    self,
    v9,
  v16 = v13);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLBookletMigrationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BLBookletMigrationInfo;
  v5 = [(BLBookletMigrationInfo *)&v21 init];
  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"migrationState");
    uint64_t v9 = BUDynamicCast();
    v5->_migrationState = objc_msgSend_longLongValue(v9, v10, v11, v12);

    objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"storeID");
    v16 = BUDynamicCast();
    v5->_storeID = objc_msgSend_longLongValue(v16, v17, v18, v19);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v9 = objc_msgSend_migrationState(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_numberWithInteger_(v4, v10, v9, v11);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v12, @"migrationState");

  v14 = NSNumber;
  uint64_t v18 = objc_msgSend_storeID(self, v15, v16, v17);
  objc_msgSend_numberWithLongLong_(v14, v19, v18, v20);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)v22, @"storeID");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_opt_new();
  if (v7)
  {
    uint64_t v8 = objc_msgSend_migrationState(self, v4, v5, v6);
    objc_msgSend_setMigrationState_(v7, v9, v8, v10);
    uint64_t v14 = objc_msgSend_storeID(self, v11, v12, v13);
    objc_msgSend_setStoreID_(v7, v15, v14, v16);
  }
  return v7;
}

- (int64_t)migrationState
{
  return self->_migrationState;
}

- (void)setMigrationState:(int64_t)a3
{
  self->_migrationState = a3;
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(int64_t)a3
{
  self->_storeID = a3;
}

@end