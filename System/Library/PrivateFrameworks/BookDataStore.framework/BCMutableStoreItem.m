@interface BCMutableStoreItem
+ (BOOL)supportsSecureCoding;
- (BCMutableStoreItem)initWithCloudData:(id)a3;
- (BCMutableStoreItem)initWithCoder:(id)a3;
- (BCMutableStoreItem)initWithRecord:(id)a3;
- (BCMutableStoreItem)initWithStoreID:(id)a3;
- (NSString)storeID;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setStoreID:(id)a3;
@end

@implementation BCMutableStoreItem

- (BCMutableStoreItem)initWithStoreID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F8C5C();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableStoreItem;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableStoreItem *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v13;
LABEL_7:
  }
  return (BCMutableStoreItem *)v12;
}

- (BCMutableStoreItem)initWithCloudData:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BCMutableStoreItem;
  v5 = [(BCMutableCloudData *)&v26 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_storeID(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      storeID = v5->_storeID;
      v5->_storeID = (NSString *)v23;
    }
    else
    {
      storeID = BDSCloudKitLog();
      if (os_log_type_enabled(storeID, OS_LOG_TYPE_ERROR)) {
        sub_2361F8AE0();
      }
      v15 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableStoreItem)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v13 = BDSCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2361F8C90();
    }

    id v11 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)BCMutableStoreItem;
  id v11 = [(BCMutableCloudData *)&v15 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    self = (BCMutableStoreItem *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v12;
LABEL_7:
  }
  return (BCMutableStoreItem *)v11;
}

- (id)recordType
{
  return @"storeItem";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  v4.receiver = self;
  v4.super_class = (Class)BCMutableStoreItem;
  v2 = [(BCMutableCloudData *)&v4 configuredRecordFromAttributes];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BCMutableStoreItem;
  [(BCMutableCloudData *)&v3 encodeWithCoder:a3];
}

- (BCMutableStoreItem)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BCMutableStoreItem;
  objc_super v3 = [(BCMutableCloudData *)&v15 initWithCoder:a3];
  id v11 = v3;
  if (v3)
  {
    uint64_t v12 = objc_msgSend_localRecordID(v3, v4, v5, v6, v7, v8, v9, v10);
    storeID = v11->_storeID;
    v11->_storeID = (NSString *)v12;
  }
  return v11;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end