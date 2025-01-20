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
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E985C();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableStoreItem;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableStoreItem *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;
LABEL_7:
  }
  return (BCMutableStoreItem *)v5;
}

- (BCMutableStoreItem)initWithCloudData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCMutableStoreItem;
  id v5 = [(BCMutableCloudData *)&v12 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 storeID];
      objc_super v9 = (NSString *)[v8 copy];
      storeID = v5->_storeID;
      v5->_storeID = v9;
    }
    else
    {
      storeID = sub_1000083A0();
      if (os_log_type_enabled(storeID, OS_LOG_TYPE_ERROR)) {
        sub_1001E96E0();
      }
      v8 = v5;
      id v5 = 0;
    }
  }
  return v5;
}

- (BCMutableStoreItem)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E9890();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableStoreItem;
  id v5 = [(BCMutableCloudData *)&v9 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    self = (BCMutableStoreItem *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;
LABEL_7:
  }
  return (BCMutableStoreItem *)v5;
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
  v8.receiver = self;
  v8.super_class = (Class)BCMutableStoreItem;
  objc_super v3 = [(BCMutableCloudData *)&v8 initWithCoder:a3];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(BCMutableCloudData *)v3 localRecordID];
    storeID = v4->_storeID;
    v4->_storeID = (NSString *)v5;
  }
  return v4;
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