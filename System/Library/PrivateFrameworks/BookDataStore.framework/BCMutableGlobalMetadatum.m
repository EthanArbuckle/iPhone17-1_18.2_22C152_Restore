@interface BCMutableGlobalMetadatum
- (BCMutableGlobalMetadatum)initWithCloudData:(id)a3;
- (BCMutableGlobalMetadatum)initWithKey:(id)a3;
- (BCMutableGlobalMetadatum)initWithRecord:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)value;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)setValue:(id)a3;
@end

@implementation BCMutableGlobalMetadatum

- (BCMutableGlobalMetadatum)initWithKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361FCC30();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableGlobalMetadatum;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableGlobalMetadatum *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v13;
LABEL_7:
  }
  return (BCMutableGlobalMetadatum *)v12;
}

- (BCMutableGlobalMetadatum)initWithCloudData:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BCMutableGlobalMetadatum;
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
        sub_2361FCAB4();
      }
      v32 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableGlobalMetadatum)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    value = BDSCloudKitLog();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
      sub_2361FCC64();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v30.receiver = self;
  v30.super_class = (Class)BCMutableGlobalMetadatum;
  uint64_t v11 = [(BCMutableCloudData *)&v30 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    key = v11->_key;
    v11->_key = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, @"value", v15, v16, v17, v18, v19);
    self = (BCMutableGlobalMetadatum *)objc_claimAutoreleasedReturnValue();
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
  return @"globalMetadata";
}

- (id)zoneName
{
  return @"GlobalMetadata";
}

- (id)configuredRecordFromAttributes
{
  v18.receiver = self;
  v18.super_class = (Class)BCMutableGlobalMetadatum;
  uint64_t v3 = [(BCMutableCloudData *)&v18 configuredRecordFromAttributes];
  uint64_t v11 = objc_msgSend_value(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v3, v12, (uint64_t)v11, @"value", v13, v14, v15, v16);

  return v3;
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