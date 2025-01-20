@interface BCMutableCollectionMember
+ (BOOL)supportsSecureCoding;
- (BCMutableCollectionMember)initWithCloudData:(id)a3;
- (BCMutableCollectionMember)initWithCoder:(id)a3;
- (BCMutableCollectionMember)initWithCollectionMemberID:(id)a3;
- (BCMutableCollectionMember)initWithRecord:(id)a3;
- (NSString)collectionMemberID;
- (NSString)description;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)sortOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionMemberID:(id)a3;
- (void)setSortOrder:(int)a3;
@end

@implementation BCMutableCollectionMember

- (BCMutableCollectionMember)initWithCollectionMemberID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361FC7CC();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableCollectionMember;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableCollectionMember *)*((void *)v12 + 9);
    *((void *)v12 + 9) = v13;
LABEL_7:
  }
  return (BCMutableCollectionMember *)v12;
}

- (BCMutableCollectionMember)initWithCloudData:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BCMutableCollectionMember;
  v5 = [(BCMutableCloudData *)&v34 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_collectionMemberID(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      collectionMemberID = v5->_collectionMemberID;
      v5->_collectionMemberID = (NSString *)v23;

      v5->_sortOrder = objc_msgSend_sortOrder(v14, v25, v26, v27, v28, v29, v30, v31);
      if (v5->_collectionMemberID)
      {
LABEL_9:

        goto LABEL_10;
      }
      v32 = BDSCloudKitLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_2361FC834();
      }
    }
    else
    {
      v32 = BDSCloudKitLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_2361FC800();
      }
    }

    v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BCMutableCollectionMember)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v28 = BDSCloudKitLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_2361FC868();
    }

    uint64_t v11 = 0;
    goto LABEL_11;
  }
  v30.receiver = self;
  v30.super_class = (Class)BCMutableCollectionMember;
  uint64_t v11 = [(BCMutableCloudData *)&v30 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    collectionMemberID = v11->_collectionMemberID;
    v11->_collectionMemberID = (NSString *)v12;

    if (!v11->_collectionMemberID)
    {
      uint64_t v20 = BDSCloudKitLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_2361FC89C();
      }
    }
    objc_msgSend_objectForKey_(v4, v14, @"sortOrder", v15, v16, v17, v18, v19);
    self = (BCMutableCollectionMember *)objc_claimAutoreleasedReturnValue();
    v11->_sortOrder = objc_msgSend_intValue(self, v21, v22, v23, v24, v25, v26, v27);
LABEL_11:
  }
  return v11;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v13 = objc_msgSend_collectionMemberID(self, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_sortOrder(self, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v29 = objc_msgSend_modificationDate(self, v22, v23, v24, v25, v26, v27, v28);
  v36 = objc_msgSend_stringWithFormat_(v3, v30, @"<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@", v31, v32, v33, v34, v35, v5, self, v13, v21, v29);

  return (NSString *)v36;
}

- (id)recordType
{
  return @"collectionMember";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (id)configuredRecordFromAttributes
{
  v26.receiver = self;
  v26.super_class = (Class)BCMutableCollectionMember;
  v3 = [(BCMutableCloudData *)&v26 configuredRecordFromAttributes];
  id v4 = NSNumber;
  uint64_t v12 = objc_msgSend_sortOrder(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithInt_(v4, v13, v12, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v3, v20, (uint64_t)v19, @"sortOrder", v21, v22, v23, v24);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)BCMutableCollectionMember;
  id v4 = a3;
  [(BCMutableCloudData *)&v18 encodeWithCoder:v4];
  uint64_t v12 = objc_msgSend_sortOrder(self, v5, v6, v7, v8, v9, v10, v11, v18.receiver, v18.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v13, v12, @"sortOrder", v14, v15, v16, v17);
}

- (BCMutableCollectionMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BCMutableCollectionMember;
  v5 = [(BCMutableCloudData *)&v23 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    collectionMemberID = v13->_collectionMemberID;
    v13->_collectionMemberID = (NSString *)v14;

    v13->_sortOrder = objc_msgSend_decodeIntForKey_(v4, v16, @"sortOrder", v17, v18, v19, v20, v21);
  }

  return v13;
}

- (NSString)collectionMemberID
{
  return self->_collectionMemberID;
}

- (void)setCollectionMemberID:(id)a3
{
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
}

@end