@interface BCMutableSecureUserDatum
+ (BOOL)supportsSecureCoding;
- (BCMutableSecureUserDatum)initWithCloudData:(id)a3;
- (BCMutableSecureUserDatum)initWithCoder:(id)a3;
- (BCMutableSecureUserDatum)initWithKey:(id)a3;
- (BCMutableSecureUserDatum)initWithRecord:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)value;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BCMutableSecureUserDatum

- (BCMutableSecureUserDatum)initWithKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361FB258();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableSecureUserDatum;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableSecureUserDatum *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v13;
LABEL_7:
  }
  return (BCMutableSecureUserDatum *)v12;
}

- (BCMutableSecureUserDatum)initWithCloudData:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BCMutableSecureUserDatum;
  v5 = [(BCMutableCloudData *)&v43 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_key(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      key = v5->_key;
      v5->_key = (NSString *)v23;

      v32 = objc_msgSend_value(v14, v25, v26, v27, v28, v29, v30, v31);
      uint64_t v40 = objc_msgSend_copy(v32, v33, v34, v35, v36, v37, v38, v39);
      value = v5->_value;
      v5->_value = (NSString *)v40;
    }
    else
    {
      value = BDSCloudKitLog();
      if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
        sub_2361FB0DC();
      }
      v32 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableSecureUserDatum)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    value = BDSCloudKitLog();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
      sub_2361FB28C();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v30.receiver = self;
  v30.super_class = (Class)BCMutableSecureUserDatum;
  uint64_t v11 = [(BCMutableCloudData *)&v30 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    key = v11->_key;
    v11->_key = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, @"value", v15, v16, v17, v18, v19);
    self = (BCMutableSecureUserDatum *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = objc_msgSend_copy(self, v20, v21, v22, v23, v24, v25, v26);
    value = v11->_value;
    v11->_value = (NSString *)v27;
LABEL_7:
  }
  return v11;
}

- (NSString)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_key(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_value(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_stringWithFormat_(v9, v19, @"key: %@, value: %@", v20, v21, v22, v23, v24, v10, v18);

  return (NSString *)v25;
}

- (id)recordType
{
  return @"SecureUserData";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (id)configuredRecordFromAttributes
{
  v18.receiver = self;
  v18.super_class = (Class)BCMutableSecureUserDatum;
  uint64_t v3 = [(BCMutableCloudData *)&v18 configuredRecordFromAttributes];
  uint64_t v11 = objc_msgSend_value(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v3, v12, (uint64_t)v11, @"value", v13, v14, v15, v16);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)BCMutableSecureUserDatum;
  id v4 = a3;
  [(BCMutableCloudData *)&v18 encodeWithCoder:v4];
  uint64_t v12 = objc_msgSend_value(self, v5, v6, v7, v8, v9, v10, v11, v18.receiver, v18.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"value", v14, v15, v16, v17);
}

- (BCMutableSecureUserDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BCMutableSecureUserDatum;
  uint64_t v5 = [(BCMutableCloudData *)&v25 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    key = v13->_key;
    v13->_key = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"value", v18, v19, v20, v21);
    value = v13->_value;
    v13->_value = (NSString *)v22;
  }
  return v13;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end