@interface BCMutableCollectionDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableCollectionDetail)initWithCloudData:(id)a3;
- (BCMutableCollectionDetail)initWithCoder:(id)a3;
- (BCMutableCollectionDetail)initWithCollectionID:(id)a3;
- (BCMutableCollectionDetail)initWithRecord:(id)a3;
- (BOOL)hidden;
- (NSString)collectionDescription;
- (NSString)collectionID;
- (NSString)description;
- (NSString)name;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)sortMode;
- (int)sortOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSortMode:(int)a3;
- (void)setSortOrder:(int)a3;
@end

@implementation BCMutableCollectionDetail

- (BCMutableCollectionDetail)initWithCollectionID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F80B8();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableCollectionDetail;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableCollectionDetail *)*((void *)v12 + 10);
    *((void *)v12 + 10) = v13;
LABEL_7:
  }
  return (BCMutableCollectionDetail *)v12;
}

- (BCMutableCollectionDetail)initWithCloudData:(id)a3
{
  id v5 = a3;
  v89.receiver = self;
  v89.super_class = (Class)BCMutableCollectionDetail;
  uint64_t v6 = [(BCMutableCloudData *)&v89 initWithCloudData:v5];
  if (v6)
  {
    uint64_t v7 = BUProtocolCast();
    v15 = v7;
    if (v7)
    {
      objc_super v16 = objc_msgSend_collectionID(v7, v8, v9, v10, v11, v12, v13, v14);
      uint64_t v24 = objc_msgSend_copy(v16, v17, v18, v19, v20, v21, v22, v23);
      collectionID = v6->_collectionID;
      v6->_collectionID = (NSString *)v24;

      v40 = objc_msgSend_name(v15, v26, v27, v28, v29, v30, v31, v32);
      if (v40)
      {
        v3 = objc_msgSend_name(v15, v33, v34, v35, v36, v37, v38, v39);
        v48 = (__CFString *)objc_msgSend_copy(v3, v41, v42, v43, v44, v45, v46, v47);
      }
      else
      {
        v48 = &stru_26E976C40;
      }
      objc_storeStrong((id *)&v6->_name, v48);
      if (v40)
      {
      }
      v57 = objc_msgSend_collectionDescription(v15, v50, v51, v52, v53, v54, v55, v56);
      uint64_t v65 = objc_msgSend_copy(v57, v58, v59, v60, v61, v62, v63, v64);
      collectionDescription = v6->_collectionDescription;
      v6->_collectionDescription = (NSString *)v65;

      v6->_hidden = objc_msgSend_hidden(v15, v67, v68, v69, v70, v71, v72, v73);
      v6->_sortOrder = objc_msgSend_sortOrder(v15, v74, v75, v76, v77, v78, v79, v80);
      v6->_sortMode = objc_msgSend_sortMode(v15, v81, v82, v83, v84, v85, v86, v87);
    }
    else
    {
      v49 = BDSCloudKitLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_2361F80EC();
      }

      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (BCMutableCollectionDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v49 = BDSCloudKitLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_2361F8120();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v72.receiver = self;
  v72.super_class = (Class)BCMutableCollectionDetail;
  uint64_t v11 = [(BCMutableCloudData *)&v72 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    collectionID = v11->_collectionID;
    v11->_collectionID = (NSString *)v12;

    uint64_t v20 = objc_msgSend_objectForKey_(v4, v14, @"name", v15, v16, v17, v18, v19);
    name = v11->_name;
    v11->_name = (NSString *)v20;

    uint64_t v28 = objc_msgSend_objectForKey_(v4, v22, @"collectionDescription", v23, v24, v25, v26, v27);
    collectionDescription = v11->_collectionDescription;
    v11->_collectionDescription = (NSString *)v28;

    objc_msgSend_objectForKey_(v4, v30, @"hidden", v31, v32, v33, v34, v35);
    self = (BCMutableCollectionDetail *)objc_claimAutoreleasedReturnValue();
    v11->_hidden = objc_msgSend_BOOLValue(self, v36, v37, v38, v39, v40, v41, v42);
    v49 = objc_msgSend_objectForKey_(v4, v43, @"sortOrder", v44, v45, v46, v47, v48);
    v11->_sortOrder = objc_msgSend_intValue(v49, v50, v51, v52, v53, v54, v55, v56);
    uint64_t v63 = objc_msgSend_objectForKey_(v4, v57, @"sortMode", v58, v59, v60, v61, v62);
    v11->_sortMode = objc_msgSend_intValue(v63, v64, v65, v66, v67, v68, v69, v70);

LABEL_7:
  }

  return v11;
}

- (NSString)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_collectionID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_name(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_collectionDescription(self, v19, v20, v21, v22, v23, v24, v25);
  if (objc_msgSend_hidden(self, v27, v28, v29, v30, v31, v32, v33)) {
    uint64_t v41 = @"YES";
  }
  else {
    uint64_t v41 = @"NO";
  }
  uint64_t v42 = objc_msgSend_sortOrder(self, v34, v35, v36, v37, v38, v39, v40);
  uint64_t v50 = objc_msgSend_sortMode(self, v43, v44, v45, v46, v47, v48, v49);
  v57 = objc_msgSend_stringWithFormat_(v9, v51, @"collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode:%d", v52, v53, v54, v55, v56, v10, v18, v26, v41, v42, v50);

  return (NSString *)v57;
}

- (id)recordType
{
  return @"collectionDetail";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (id)configuredRecordFromAttributes
{
  v109.receiver = self;
  v109.super_class = (Class)BCMutableCollectionDetail;
  uint64_t v10 = [(BCMutableCloudData *)&v109 configuredRecordFromAttributes];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_name(self, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v12, (uint64_t)v11, @"name", v13, v14, v15, v16);

    uint64_t v24 = objc_msgSend_collectionDescription(self, v17, v18, v19, v20, v21, v22, v23);
    objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v24, @"collectionDescription", v26, v27, v28, v29);

    uint64_t v30 = NSNumber;
    uint64_t v38 = objc_msgSend_hidden(self, v31, v32, v33, v34, v35, v36, v37);
    uint64_t v45 = objc_msgSend_numberWithBool_(v30, v39, v38, v40, v41, v42, v43, v44);
    objc_msgSend_setObject_forKey_(v10, v46, (uint64_t)v45, @"hidden", v47, v48, v49, v50);

    uint64_t v51 = NSNumber;
    uint64_t v59 = objc_msgSend_sortOrder(self, v52, v53, v54, v55, v56, v57, v58);
    uint64_t v66 = objc_msgSend_numberWithInt_(v51, v60, v59, v61, v62, v63, v64, v65);
    objc_msgSend_setObject_forKey_(v10, v67, (uint64_t)v66, @"sortOrder", v68, v69, v70, v71);

    objc_super v72 = NSNumber;
    uint64_t v80 = objc_msgSend_sortMode(self, v73, v74, v75, v76, v77, v78, v79);
    objc_msgSend_numberWithInt_(v72, v81, v80, v82, v83, v84, v85, v86);
    uint64_t v87 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v88, (uint64_t)v87, @"sortMode", v89, v90, v91, v92);
  }
  else
  {
    v93 = objc_msgSend_privacyDelegate(self, v3, v4, v5, v6, v7, v8, v9);
    int v101 = objc_msgSend_establishedSalt(v93, v94, v95, v96, v97, v98, v99, v100);

    if (!v101) {
      goto LABEL_7;
    }
    BDSCloudKitLog();
    uint64_t v87 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v87, OS_LOG_TYPE_ERROR)) {
      sub_2361F8154(self, v87, v102, v103, v104, v105, v106, v107);
    }
  }

LABEL_7:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v70.receiver = self;
  v70.super_class = (Class)BCMutableCollectionDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v70 encodeWithCoder:v4];
  uint64_t v12 = objc_msgSend_name(self, v5, v6, v7, v8, v9, v10, v11, v70.receiver, v70.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"name", v14, v15, v16, v17);

  uint64_t v25 = objc_msgSend_collectionDescription(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"collectionDescription", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_hidden(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeBool_forKey_(v4, v39, v38, @"hidden", v40, v41, v42, v43);
  uint64_t v51 = objc_msgSend_sortOrder(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeInt_forKey_(v4, v52, v51, @"sortOrder", v53, v54, v55, v56);
  uint64_t v64 = objc_msgSend_sortMode(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeInt_forKey_(v4, v65, v64, @"sortMode", v66, v67, v68, v69);
}

- (BCMutableCollectionDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BCMutableCollectionDetail;
  uint64_t v5 = [(BCMutableCloudData *)&v51 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    collectionID = v13->_collectionID;
    v13->_collectionID = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"name", v18, v19, v20, v21);
    name = v13->_name;
    v13->_name = (NSString *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"collectionDescription", v26, v27, v28, v29);
    collectionDescription = v13->_collectionDescription;
    v13->_collectionDescription = (NSString *)v30;

    v13->_hidden = objc_msgSend_decodeBoolForKey_(v4, v32, @"hidden", v33, v34, v35, v36, v37);
    v13->_sortOrder = objc_msgSend_decodeIntForKey_(v4, v38, @"sortOrder", v39, v40, v41, v42, v43);
    v13->_sortMode = objc_msgSend_decodeIntForKey_(v4, v44, @"sortMode", v45, v46, v47, v48, v49);
  }

  return v13;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (int)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(int)a3
{
  self->_sortMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end