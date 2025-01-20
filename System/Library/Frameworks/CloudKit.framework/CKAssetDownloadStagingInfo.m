@interface CKAssetDownloadStagingInfo
+ (BOOL)supportsSecureCoding;
- (CKAssetDownloadStagingInfo)initWithCoder:(id)a3;
- (CKAssetDownloadStagingInfo)initWithItemID:(id)a3 trackingUUID:(id)a4 signature:(id)a5;
- (NSData)signature;
- (NSNumber)itemID;
- (NSString)description;
- (NSString)trackingUUID;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKAssetDownloadStagingInfo

- (CKAssetDownloadStagingInfo)initWithItemID:(id)a3 trackingUUID:(id)a4 signature:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKAssetDownloadStagingInfo;
  v14 = [(CKAssetDownloadStagingInfo *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    itemID = v14->_itemID;
    v14->_itemID = (NSNumber *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    trackingUUID = v14->_trackingUUID;
    v14->_trackingUUID = (NSString *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    signature = v14->_signature;
    v14->_signature = (NSData *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_itemID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"itemID");

  uint64_t v13 = objc_msgSend_trackingUUID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"trackingUUID");

  objc_msgSend_signature(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v19, @"signature");
}

- (CKAssetDownloadStagingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKAssetDownloadStagingInfo;
  v5 = [(CKAssetDownloadStagingInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"itemID");
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"trackingUUID");
    trackingUUID = v5->_trackingUUID;
    v5->_trackingUUID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"signature");
    signature = v5->_signature;
    v5->_signature = (NSData *)v16;
  }
  return v5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_itemID(self, v5, v6, v7);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, @"itemID", (uint64_t)v8, 0);

  uint64_t v13 = objc_msgSend_trackingUUID(self, v10, v11, v12);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, @"trackingUUID", (uint64_t)v13, 0);

  objc_msgSend_signature(self, v15, v16, v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, @"signature", (uint64_t)v19, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAssetDownloadStagingInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKAssetDownloadStagingInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSString)trackingUUID
{
  return self->_trackingUUID;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_trackingUUID, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end