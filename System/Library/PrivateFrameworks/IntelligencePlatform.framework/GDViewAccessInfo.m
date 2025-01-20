@interface GDViewAccessInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysAvailable;
- (GDViewAccessInfo)initWithCoder:(id)a3;
- (GDViewAccessInfo)initWithTableName:(id)a3 alwaysAvailable:(BOOL)a4;
- (NSString)tableName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDViewAccessInfo

- (void).cxx_destruct
{
}

- (BOOL)alwaysAvailable
{
  return self->_alwaysAvailable;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (GDViewAccessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDViewAccessInfo;
  v5 = [(GDViewAccessInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"tableName", v8);
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v9;

    v5->_alwaysAvailable = objc_msgSend_decodeBoolForKey_(v4, v11, @"alwaysAvailable", v12, v13);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tableName = self->_tableName;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)tableName, @"tableName", v6);
  objc_msgSend_encodeBool_forKey_(v9, v7, self->_alwaysAvailable, @"alwaysAvailable", v8);
}

- (GDViewAccessInfo)initWithTableName:(id)a3 alwaysAvailable:(BOOL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDViewAccessInfo;
  v11 = [(GDViewAccessInfo *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    tableName = v11->_tableName;
    v11->_tableName = (NSString *)v12;

    v11->_alwaysAvailable = a4;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end