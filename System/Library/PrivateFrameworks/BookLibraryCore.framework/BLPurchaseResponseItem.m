@interface BLPurchaseResponseItem
+ (BOOL)supportsSecureCoding;
- (BLPurchaseResponseItem)init;
- (BLPurchaseResponseItem)initWithCoder:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isPDF;
- (BOOL)isPurchaseRedownload;
- (NSDictionary)item;
- (NSDictionary)metadata;
- (NSString)downloadID;
- (NSString)purchaseParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsPDF:(BOOL)a3;
- (void)setIsPurchaseRedownload:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPurchaseParameters:(id)a3;
@end

@implementation BLPurchaseResponseItem

- (BLPurchaseResponseItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLPurchaseResponseItem;
  v2 = [(BLPurchaseResponseItem *)&v9 init];
  v3 = v2;
  if (v2)
  {
    item = v2->_item;
    v2->_item = 0;

    metadata = v3->_metadata;
    v3->_metadata = 0;

    downloadID = v3->_downloadID;
    v3->_downloadID = 0;

    purchaseParameters = v3->_purchaseParameters;
    v3->_purchaseParameters = 0;

    *(_WORD *)&v3->_isPurchaseRedownload = 0;
    v3->_isPDF = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLPurchaseResponseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v8 = (BLPurchaseResponseItem *)objc_msgSend_init(self, v5, v6, v7);
  if (v8)
  {
    objc_super v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v17 = objc_msgSend_setWithObjects_(v9, v15, v10, v16, v11, v12, v13, v14, 0);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, @"item");
    item = v8->_item;
    v8->_item = (NSDictionary *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"downloadID");
    downloadID = v8->_downloadID;
    v8->_downloadID = (NSString *)v23;

    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v33 = objc_msgSend_setWithObjects_(v25, v31, v26, v32, v27, v28, v29, v30, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, @"metadata");
    metadata = v8->_metadata;
    v8->_metadata = (NSDictionary *)v35;

    uint64_t v37 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"purchaseParameters");
    purchaseParameters = v8->_purchaseParameters;
    v8->_purchaseParameters = (NSString *)v39;

    v8->_isPurchaseRedownload = objc_msgSend_decodeBoolForKey_(v4, v41, @"isPurchaseRedownload", v42);
    v8->_isAudiobook = objc_msgSend_decodeBoolForKey_(v4, v43, @"isAudiobook", v44);
    v8->_isPDF = objc_msgSend_decodeBoolForKey_(v4, v45, @"isPDF", v46);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v39 = a3;
  uint64_t v7 = objc_msgSend_item(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v39, v8, (uint64_t)v7, @"item");

  uint64_t v12 = objc_msgSend_downloadID(self, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v39, v13, (uint64_t)v12, @"downloadID");

  v17 = objc_msgSend_metadata(self, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v39, v18, (uint64_t)v17, @"metadata");

  v22 = objc_msgSend_purchaseParameters(self, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v39, v23, (uint64_t)v22, @"purchaseParameters");

  uint64_t isPurchaseRedownload = objc_msgSend_isPurchaseRedownload(self, v24, v25, v26);
  objc_msgSend_encodeBool_forKey_(v39, v28, isPurchaseRedownload, @"isPurchaseRedownload");
  uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v29, v30, v31);
  objc_msgSend_encodeBool_forKey_(v39, v33, isAudiobook, @"isAudiobook");
  uint64_t isPDF = objc_msgSend_isPDF(self, v34, v35, v36);
  objc_msgSend_encodeBool_forKey_(v39, v38, isPDF, @"isPDF");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = objc_opt_new();
  if (v7)
  {
    v8 = objc_msgSend_item(self, v4, v5, v6);
    objc_msgSend_setItem_(v7, v9, (uint64_t)v8, v10);

    uint64_t v14 = objc_msgSend_downloadID(self, v11, v12, v13);
    objc_msgSend_setDownloadID_(v7, v15, (uint64_t)v14, v16);

    uint64_t v20 = objc_msgSend_metadata(self, v17, v18, v19);
    objc_msgSend_setMetadata_(v7, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_purchaseParameters(self, v23, v24, v25);
    objc_msgSend_setPurchaseParameters_(v7, v27, (uint64_t)v26, v28);

    uint64_t isPurchaseRedownload = objc_msgSend_isPurchaseRedownload(self, v29, v30, v31);
    objc_msgSend_setIsPurchaseRedownload_(v7, v33, isPurchaseRedownload, v34);
    uint64_t isAudiobook = objc_msgSend_isAudiobook(self, v35, v36, v37);
    objc_msgSend_setIsAudiobook_(v7, v39, isAudiobook, v40);
    uint64_t isPDF = objc_msgSend_isPDF(self, v41, v42, v43);
    objc_msgSend_setIsPDF_(v7, v45, isPDF, v46);
  }
  return v7;
}

- (NSDictionary)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)purchaseParameters
{
  return self->_purchaseParameters;
}

- (void)setPurchaseParameters:(id)a3
{
}

- (BOOL)isPurchaseRedownload
{
  return self->_isPurchaseRedownload;
}

- (void)setIsPurchaseRedownload:(BOOL)a3
{
  self->_uint64_t isPurchaseRedownload = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_uint64_t isAudiobook = a3;
}

- (BOOL)isPDF
{
  return self->_isPDF;
}

- (void)setIsPDF:(BOOL)a3
{
  self->_uint64_t isPDF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end