@interface CKMergeableDelta
+ (BOOL)supportsSecureCoding;
+ (int64_t)suggestedDeltaSizeForContainer:(id)a3;
+ (unint64_t)maxInlineDeltaSize;
- (BOOL)contentSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)protobufSize:(unint64_t *)a3 error:(id *)a4;
- (CKAsset)asset;
- (CKMergeableDelta)init;
- (CKMergeableDelta)initWithCoder:(id)a3;
- (CKMergeableDelta)initWithData:(id)a3 metadata:(id)a4;
- (CKMergeableDelta)initWithFileURL:(id)a3 metadata:(id)a4;
- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4;
- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 asset:(id)a5;
- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 data:(id)a5;
- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 encryptedData:(id)a5;
- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 fileURL:(id)a5;
- (CKMergeableDeltaID)deltaID;
- (CKMergeableDeltaMetadata)metadata;
- (CKMergeableValueID)valueID;
- (NSData)_data;
- (NSData)encryptedData;
- (NSString)description;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataBackedDeltaWithError:(id *)a3;
- (id)dataWithError:(id *)a3;
- (id)redactedDescription;
- (int64_t)encryptMetadataTernary;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateAssetIfNecessaryWithMaxInlineSize:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setEncryptMetadataTernary:(int64_t)a3;
- (void)setEncryptedData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setValueID:(id)a3;
- (void)set_data:(id)a3;
- (void)unpopulateAsset;
@end

@implementation CKMergeableDelta

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKMergeableDelta;
  v11 = [(CKMergeableDelta *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    valueID = v11->_valueID;
    v11->_valueID = (CKMergeableValueID *)v12;

    objc_storeStrong((id *)&v11->_metadata, a4);
    v11->_encryptMetadataTernary = -1;
  }

  return v11;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  char v11 = _CKCheckArgument((uint64_t)"data", v10, 0, 0, 0, &v33);
  id v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v10, v14, v15, v16);
    data = v17->__data;
    v17->__data = (NSData *)v18;
  }
  return v17;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 encryptedData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  char v11 = _CKCheckArgument((uint64_t)"encryptedData", v10, 0, 0, 0, &v33);
  id v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v10, v14, v15, v16);
    encryptedData = v17->_encryptedData;
    v17->_encryptedData = (NSData *)v18;
  }
  return v17;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 asset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v42 = 0;
  char v11 = _CKCheckArgument((uint64_t)"asset", v10, 0, 0, 0, &v42);
  id v12 = v42;
  if ((v11 & 1) == 0)
  {
    v30 = v12;
    v31 = [CKException alloc];
    uint64_t v35 = objc_msgSend_code(v30, v32, v33, v34);
    v39 = objc_msgSend_localizedDescription(v30, v36, v37, v38);
    id v41 = (id)objc_msgSend_initWithCode_format_(v31, v40, v35, @"%@", v39);

    objc_exception_throw(v41);
  }

  uint64_t v14 = objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  uint64_t v15 = (CKMergeableDelta *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 40), a5);
    v19 = objc_msgSend_fileURL(v10, v16, v17, v18);

    if (v19)
    {
      v23 = objc_msgSend_fileURL(v10, v20, v21, v22);
      uint64_t v27 = objc_msgSend_copy(v23, v24, v25, v26);
      fileURL = v15->_fileURL;
      v15->_fileURL = (NSURL *)v27;
    }
  }

  return v15;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 fileURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  char v11 = _CKCheckArgument((uint64_t)"fileURL", v10, 0, 0, 0, &v33);
  id v12 = v33;
  if ((v11 & 1) == 0)
  {
    uint64_t v21 = v12;
    uint64_t v22 = [CKException alloc];
    uint64_t v26 = objc_msgSend_code(v21, v23, v24, v25);
    v30 = objc_msgSend_localizedDescription(v21, v27, v28, v29);
    id v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, @"%@", v30);

    objc_exception_throw(v32);
  }

  uint64_t v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v10, v14, v15, v16);
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;
  }
  return v17;
}

- (CKMergeableDelta)initWithData:(id)a3 metadata:(id)a4
{
  return (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_data_(self, a2, 0, (uint64_t)a4, a3);
}

- (CKMergeableDelta)initWithFileURL:(id)a3 metadata:(id)a4
{
  return (CKMergeableDelta *)MEMORY[0x1F4181798](self, sel_initWithValueID_metadata_fileURL_, 0, a4);
}

- (CKMergeableDelta)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v3, v6, v4, @"%@ is unavailable", v5);

  return 0;
}

- (unint64_t)hash
{
  v5 = objc_msgSend__data(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_metadata(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_valueID(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_asset(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_fileURL(self, v34, v35, v36);
  unint64_t v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CKMergeableDelta *)a3;
  if (self == v4)
  {
    char v52 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_valueID(self, v6, v7, v8);
      v13 = objc_msgSend_valueID(v5, v10, v11, v12);
      int isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

      if (!isEqual) {
        goto LABEL_10;
      }
      uint64_t v20 = objc_msgSend_metadata(self, v17, v18, v19);
      uint64_t v24 = objc_msgSend_metadata(v5, v21, v22, v23);
      int v25 = CKObjectsAreBothNilOrEqual(v20, v24);

      if (!v25) {
        goto LABEL_10;
      }
      uint64_t v29 = objc_msgSend__data(self, v26, v27, v28);
      uint64_t v33 = objc_msgSend__data(v5, v30, v31, v32);
      int v34 = CKObjectsAreBothNilOrEqual(v29, v33);

      if (!v34) {
        goto LABEL_10;
      }
      uint64_t v38 = objc_msgSend_asset(self, v35, v36, v37);
      id v42 = objc_msgSend_asset(v5, v39, v40, v41);
      int v43 = CKObjectsAreBothNilOrEqual(v38, v42);

      if (v43)
      {
        v47 = objc_msgSend_fileURL(self, v44, v45, v46);
        v51 = objc_msgSend_fileURL(v5, v48, v49, v50);
        char v52 = CKObjectsAreBothNilOrEqual(v47, v51);
      }
      else
      {
LABEL_10:
        char v52 = 0;
      }
    }
    else
    {
      char v52 = 0;
    }
  }

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CKMergeableDelta alloc];
  uint64_t v8 = objc_msgSend_valueID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_metadata(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_initWithValueID_metadata_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  uint64_t v18 = objc_msgSend__data(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_copy(v18, v19, v20, v21);
  uint64_t v23 = (void *)v14[4];
  v14[4] = v22;

  uint64_t v27 = objc_msgSend_fileURL(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_copy(v27, v28, v29, v30);
  uint64_t v32 = (void *)v14[1];
  v14[1] = v31;

  uint64_t v36 = objc_msgSend_encryptedData(self, v33, v34, v35);
  uint64_t v40 = objc_msgSend_copy(v36, v37, v38, v39);
  uint64_t v41 = (void *)v14[7];
  v14[7] = v40;

  uint64_t v45 = objc_msgSend_asset(self, v42, v43, v44);
  uint64_t v46 = (void *)v14[5];
  v14[5] = v45;

  v14[6] = objc_msgSend_encryptMetadataTernary(self, v47, v48, v49);
  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableDelta *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableDelta *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v49 = a3;
  uint64_t v7 = objc_msgSend_valueID(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v49, v8, @"valueID", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend__data(self, v9, v10, v11);
  uint64_t v16 = v12;
  if (v12)
  {
    uint64_t v17 = NSNumber;
    uint64_t v18 = objc_msgSend_length(v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18, v20);
    objc_msgSend_addProperty_value_shouldRedact_(v49, v22, @"dataLength", (uint64_t)v21, 0);
  }
  uint64_t v23 = objc_msgSend_encryptedData(self, v13, v14, v15);
  uint64_t v27 = objc_msgSend_fileURL(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_CKSanitizedPath(v27, v28, v29, v30);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v32, @"fileURL", (uint64_t)v31, 0);

  if (v23)
  {
    uint64_t v36 = NSNumber;
    uint64_t v37 = objc_msgSend_length(v23, v33, v34, v35);
    uint64_t v40 = objc_msgSend_numberWithUnsignedInteger_(v36, v38, v37, v39);
    objc_msgSend_addProperty_value_shouldRedact_(v49, v41, @"encryptedDataLength", (uint64_t)v40, 0);
  }
  id v42 = objc_msgSend_metadata(self, v33, v34, v35);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v43, @"metadata", (uint64_t)v42, 0);

  v47 = objc_msgSend_asset(self, v44, v45, v46);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v48, @"asset", (uint64_t)v47, 0);
}

- (NSURL)fileURL
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = v2->_fileURL;
  if (!v6)
  {
    uint64_t v7 = objc_msgSend_asset(v2, v3, v4, v5);
    objc_msgSend_fileURL(v7, v8, v9, v10);
    uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v6;
}

- (void)setFileURL:(id)a3
{
  uint64_t v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  fileURL = obj->_fileURL;
  obj->_fileURL = v4;

  objc_sync_exit(obj);
}

- (id)dataBackedDeltaWithError:(id *)a3
{
  uint64_t v6 = objc_msgSend__data(self, a2, (uint64_t)a3, v3);

  if (v6)
  {
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v10 = objc_msgSend_dataWithError_(self, v7, (uint64_t)a3, v8);
    if (v10)
    {
      uint64_t v11 = [CKMergeableDelta alloc];
      uint64_t v15 = objc_msgSend_valueID(self, v12, v13, v14);
      uint64_t v19 = objc_msgSend_metadata(self, v16, v17, v18);
      uint64_t v9 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_data_(v11, v20, (uint64_t)v15, (uint64_t)v19, v10);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (CKMergeableDeltaID)deltaID
{
  uint64_t v3 = [CKMergeableDeltaID alloc];
  uint64_t v7 = objc_msgSend_metadata(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_identifier(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_valueID(self, v12, v13, v14);
  uint64_t v17 = objc_msgSend_initWithDeltaIdentifier_valueID_(v3, v16, (uint64_t)v11, (uint64_t)v15);

  return (CKMergeableDeltaID *)v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_valueID(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_valueID);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_metadata(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_metadata);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend__data(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel__data);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  uint64_t v26 = objc_msgSend_fileURL(self, v23, v24, v25);
  uint64_t v27 = NSStringFromSelector(sel_fileURL);
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v26, (uint64_t)v27);

  uint64_t v32 = objc_msgSend_encryptMetadataTernary(self, v29, v30, v31);
  uint64_t v33 = NSStringFromSelector(sel_encryptMetadataTernary);
  objc_msgSend_encodeInteger_forKey_(v4, v34, v32, (uint64_t)v33);

  objc_msgSend_asset(self, v35, v36, v37);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = NSStringFromSelector(sel_asset);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v40, (uint64_t)v38);
}

- (CKMergeableDelta)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_valueID);
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = NSStringFromSelector(sel_metadata);
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);

  uint64_t v14 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v12);
  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = NSStringFromSelector(sel__data);
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    data = v14->__data;
    v14->__data = (NSData *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v21 = NSStringFromSelector(sel_fileURL);
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v20, (uint64_t)v21);
    fileURL = v14->_fileURL;
    v14->_fileURL = (NSURL *)v23;

    uint64_t v25 = NSStringFromSelector(sel_encryptMetadataTernary);
    v14->_encryptMetadataTernary = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)v25, v27);

    uint64_t v28 = objc_opt_class();
    uint64_t v29 = NSStringFromSelector(sel_asset);
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v28, (uint64_t)v29);
    asset = v14->_asset;
    v14->_asset = (CKAsset *)v31;
  }
  return v14;
}

- (id)dataWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_fileURL(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_asset(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend__data(self, v11, v12, v13);
  if (v14) {
    goto LABEL_2;
  }
  if (v6)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v20 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = self;
      _os_log_debug_impl(&dword_18AF10000, v20, OS_LOG_TYPE_DEBUG, "Loading data from file for delta %@", buf, 0xCu);
    }
    id v36 = 0;
    uint64_t v18 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], v21, (uint64_t)v6, 0, &v36);
    id v22 = v36;
    goto LABEL_9;
  }
  if (v10)
  {
    uint64_t v24 = objc_msgSend_fileURL(v10, v15, v16, v17);

    if (v24)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v29 = objc_msgSend_fileURL(v10, v25, v26, v27);
      id v35 = 0;
      uint64_t v18 = objc_msgSend_dataWithContentsOfURL_options_error_(v28, v30, (uint64_t)v29, 0, &v35);
      id v19 = v35;

      goto LABEL_10;
    }
    uint64_t v18 = objc_msgSend_assetContent(v10, v25, v26, v27);

    if (v18)
    {
      uint64_t v14 = objc_msgSend_assetContent(v10, v32, v33, v34);
LABEL_2:
      uint64_t v18 = (void *)v14;
      id v19 = 0;
      goto LABEL_10;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v32, @"CKErrorDomain", 12, @"Cannot load data from a delta asset with no content: %@", self);
LABEL_24:
    id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    id v19 = v22;
    goto LABEL_10;
  }
  uint64_t v18 = objc_msgSend_encryptedData(self, v15, v16, v17);

  if (!v18)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, @"CKErrorDomain", 1, @"Unknown error getting data from %@", self);
    goto LABEL_24;
  }
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, @"CKErrorDomain", 12, @"Cannot get unencrypted data from an encrypted delta: %@", self);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = 0;
LABEL_10:
  if (a3) {
    *a3 = v19;
  }

  return v18;
}

- (BOOL)contentSize:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend__data(self, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v11 = objc_msgSend_fileURL(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_asset(self, v12, v13, v14);
  id v19 = v15;
  if (v7)
  {
    unint64_t v20 = objc_msgSend_length(v7, v16, v17, v18);
    goto LABEL_5;
  }
  uint64_t v21 = objc_msgSend_assetContent(v15, v16, v17, v18);

  if (v21)
  {
    uint64_t v25 = objc_msgSend_assetContent(v19, v22, v23, v24);
    unint64_t v20 = objc_msgSend_length(v25, v26, v27, v28);

    goto LABEL_5;
  }
  if (!v11)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v37 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = self;
      _os_log_fault_impl(&dword_18AF10000, v37, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Unable to get content size for delta with no contents %@", buf, 0xCu);
    }
    unint64_t v20 = 0;
LABEL_5:
    id v29 = 0;
    char ResourceValue_forKey_error = 1;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v40 = 0;
  uint64_t v32 = *MEMORY[0x1E4F1C5F8];
  id v39 = 0;
  char ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v11, v22, (uint64_t)&v40, v32, &v39);
  id v33 = v40;
  id v29 = v39;
  if (ResourceValue_forKey_error)
  {
    unint64_t v20 = objc_msgSend_integerValue(v33, v34, v35, v36);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v38 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = self;
      __int16 v43 = 2112;
      id v44 = v29;
      _os_log_error_impl(&dword_18AF10000, v38, OS_LOG_TYPE_ERROR, "Unable to get content size for file-backed delta %@: %@", buf, 0x16u);
    }
    unint64_t v20 = 0;
  }

  if (a4) {
LABEL_6:
  }
    *a4 = v29;
LABEL_7:
  if (a3) {
    *a3 = v20;
  }

  return ResourceValue_forKey_error;
}

- (BOOL)protobufSize:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_asset(self, a2, (uint64_t)a3, (uint64_t)a4);

  if (v7)
  {
    unint64_t v11 = 0;
    id v12 = 0;
    LOBYTE(v13) = 1;
  }
  else
  {
    id v34 = 0;
    unint64_t v35 = 0;
    int v13 = objc_msgSend_contentSize_error_(self, v8, (uint64_t)&v35, (uint64_t)&v34);
    id v12 = v34;
    if (v13)
    {
      unint64_t v11 = v35;
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v14 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v12;
        _os_log_error_impl(&dword_18AF10000, v14, OS_LOG_TYPE_ERROR, "Failed to get content size when calculating delta proto size: %@", buf, 0xCu);
      }
      unint64_t v11 = 0;
    }
  }
  uint64_t v15 = objc_msgSend_valueID(self, v8, v9, v10);
  int isEncrypted = objc_msgSend_isEncrypted(v15, v16, v17, v18);

  unint64_t v23 = v11 + 28;
  if (!isEncrypted) {
    unint64_t v23 = v11;
  }
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
  uint64_t v26 = objc_msgSend_metadata(self, v20, v21, v22);
  unint64_t v30 = objc_msgSend_size(v26, v27, v28, v29);
  unint64_t v31 = v30 + 2;
  if (v30 >= 0x80)
  {
    do
    {
      ++v31;
      unint64_t v32 = v30 >> 14;
      v30 >>= 7;
    }
    while (v32);
  }

  if (a3) {
    *a3 = v24 + v31 + 16;
  }
  if (a4) {
    *a4 = v12;
  }

  return v13;
}

- (void)populateAssetIfNecessaryWithMaxInlineSize:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v33 = 0;
  if (objc_msgSend_contentSize_error_(self, a2, (uint64_t)&v33, 0) && v33 > a3)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v35 = (CKMergeableDelta *)v33;
      __int16 v36 = 2112;
      id v37 = self;
      _os_log_impl(&dword_18AF10000, v5, OS_LOG_TYPE_INFO, "Will use an asset for large mergeable delta with size %ld: %@", buf, 0x16u);
    }
    uint64_t v9 = objc_msgSend__data(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_fileURL(self, v10, v11, v12);
    uint64_t v14 = (void *)v13;
    if (v9)
    {
      uint64_t v15 = [CKAsset alloc];
      id v19 = objc_msgSend_identifier((void *)*MEMORY[0x1E4F44378], v16, v17, v18);
      uint64_t v21 = objc_msgSend_initWithAssetContent_itemTypeHint_(v15, v20, (uint64_t)v9, (uint64_t)v19);
      objc_msgSend_setAsset_(self, v22, (uint64_t)v21, v23);

      objc_msgSend_set_data_(self, v24, 0, v25);
    }
    else if (v13)
    {
      uint64_t v26 = [CKAsset alloc];
      uint64_t v29 = objc_msgSend_initWithFileURL_(v26, v27, (uint64_t)v14, v28);
      objc_msgSend_setAsset_(self, v30, (uint64_t)v29, v31);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      unint64_t v32 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v35 = self;
        _os_log_fault_impl(&dword_18AF10000, v32, OS_LOG_TYPE_FAULT, "Tried to convert a delta to an asset, but there was no data or file URL: %@", buf, 0xCu);
      }
    }
  }
}

- (void)unpopulateAsset
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_asset(self, a2, v2, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_assetContent(v5, v6, v7, v8);

    if (v10)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v14 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412290;
        uint64_t v31 = self;
        _os_log_impl(&dword_18AF10000, v14, OS_LOG_TYPE_INFO, "Converting asset back to data for %@", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v18 = objc_msgSend_assetContent(v9, v15, v16, v17);
      objc_msgSend_set_data_(self, v19, (uint64_t)v18, v20);
    }
    else
    {
      uint64_t v21 = objc_msgSend_fileURL(v9, v11, v12, v13);

      if (!v21)
      {
LABEL_15:
        objc_msgSend_setAsset_(self, v22, 0, v23);
        goto LABEL_16;
      }
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      unint64_t v24 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412290;
        uint64_t v31 = self;
        _os_log_impl(&dword_18AF10000, v24, OS_LOG_TYPE_INFO, "Converting asset back to file URL for %@", (uint8_t *)&v30, 0xCu);
      }
      uint64_t v18 = objc_msgSend_fileURL(v9, v25, v26, v27);
      objc_msgSend_setFileURL_(self, v28, (uint64_t)v18, v29);
    }

    goto LABEL_15;
  }
LABEL_16:
}

+ (int64_t)suggestedDeltaSizeForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/suggested-mergeable-delta-size", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = a1;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_containerID(v4, v7, v8, v9);
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = sub_18AF142FC;
  v47 = sub_18AF13A0C;
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1EB2796E0, v11, (uint64_t)v10, v12);
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)qword_1EB2796E8;
  uint64_t v17 = objc_msgSend_containerID(v4, v14, v15, v16);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v13, v18, (uint64_t)v17, v19);
  objc_msgSend_doubleValue(v20, v21, v22, v23);
  double v25 = v24;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v26, v27, v28);
  unint64_t v33 = (void *)v44[5];
  if (!v33 || v32 - v25 > 86400.0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v34 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AF10000, v34, OS_LOG_TYPE_INFO, "Will fetch suggested delta size from daemon", buf, 2u);
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_18B197174;
    v38[3] = &unk_1E5466008;
    uint64_t v41 = &v43;
    id v39 = v10;
    id v40 = v4;
    objc_msgSend_getSynchronousContainerScopedDaemonProxyWithErrorHandler_daemonProxyHandler_(v40, v35, (uint64_t)&unk_1ED7EF698, (uint64_t)v38);

    unint64_t v33 = (void *)v44[5];
  }
  int64_t v36 = objc_msgSend_integerValue(v33, v29, v30, v31);
  _Block_object_dispose(&v43, 8);

  objc_sync_exit(v6);
  os_activity_scope_leave(&state);

  return v36;
}

+ (unint64_t)maxInlineDeltaSize
{
  id v4 = objc_msgSend_defaultContext(CKLogicalDeviceContext, a2, v2, v3);
  uint64_t v8 = objc_msgSend_connection(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_processScopedDaemonProxy(v8, v9, v10, v11);
  unint64_t v16 = objc_msgSend_maxInlineMergeableDeltaSize(v12, v13, v14, v15);

  return v16;
}

- (CKMergeableDeltaMetadata)metadata
{
  return (CKMergeableDeltaMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
}

- (CKMergeableValueID)valueID
{
  return (CKMergeableValueID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValueID:(id)a3
{
}

- (NSData)_data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_data:(id)a3
{
}

- (CKAsset)asset
{
  return (CKAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAsset:(id)a3
{
}

- (int64_t)encryptMetadataTernary
{
  return self->_encryptMetadataTernary;
}

- (void)setEncryptMetadataTernary:(int64_t)a3
{
  self->_encryptMetadataTernary = a3;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->__data, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end