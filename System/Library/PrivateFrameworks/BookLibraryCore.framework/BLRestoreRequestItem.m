@interface BLRestoreRequestItem
+ (BOOL)supportsSecureCoding;
+ (id)_assetDictionaryWithDownloadMetadata:(id)a3;
+ (id)_downloadDictionaryWithDownloadMetadata:(id)a3 additionalDownloadPropertiesDictionary:(id)a4;
- (BLRestoreRequestItem)initWithCoder:(id)a3;
- (BLRestoreRequestItem)initWithDownloadDictionary:(id)a3 assetDictionary:(id)a4;
- (BLRestoreRequestItem)initWithDownloadMetadataDictionary:(id)a3 additionalDownloadPropertiesDictionary:(id)a4;
- (NSDictionary)assetDictionary;
- (NSDictionary)downloadDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetDictionary:(id)a3;
- (void)setDownloadDictionary:(id)a3;
@end

@implementation BLRestoreRequestItem

- (BLRestoreRequestItem)initWithDownloadDictionary:(id)a3 assetDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v9 = BLServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "ContentRestore: downloadDictionary cannot be nil. Restore will fail", buf, 2u);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)BLRestoreRequestItem;
  v10 = [(BLRestoreRequestItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_downloadDictionary, a3);
    objc_storeStrong((id *)&v11->_assetDictionary, a4);
  }

  return v11;
}

- (BLRestoreRequestItem)initWithDownloadMetadataDictionary:(id)a3 additionalDownloadPropertiesDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = BLServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "ContentRestore: downloadMetadataDictionary cannot be nil. Restore will fail", v23, 2u);
    }
  }
  v9 = [BLDownloadMetadata alloc];
  v12 = objc_msgSend_initWithDictionary_(v9, v10, (uint64_t)v6, v11);
  objc_super v13 = objc_opt_class();
  v15 = objc_msgSend__downloadDictionaryWithDownloadMetadata_additionalDownloadPropertiesDictionary_(v13, v14, (uint64_t)v12, (uint64_t)v7);
  v16 = objc_opt_class();
  v19 = objc_msgSend__assetDictionaryWithDownloadMetadata_(v16, v17, (uint64_t)v12, v18);
  v21 = (BLRestoreRequestItem *)objc_msgSend_initWithDownloadDictionary_assetDictionary_(self, v20, (uint64_t)v15, (uint64_t)v19);

  return v21;
}

+ (id)_downloadDictionaryWithDownloadMetadata:(id)a3 additionalDownloadPropertiesDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v11 = objc_msgSend_kind(v5, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v12, (uint64_t)v11, @"1");

  objc_super v13 = NSNumber;
  uint64_t v17 = objc_msgSend_collectionIdentifier(v5, v14, v15, v16);
  v20 = objc_msgSend_bl_numberWithItemIdentifier_(v13, v18, v17, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v21, (uint64_t)v20, @"4");

  v22 = NSNumber;
  uint64_t v26 = objc_msgSend_itemIdentifier(v5, v23, v24, v25);
  v29 = objc_msgSend_bl_numberWithItemIdentifier_(v22, v27, v26, v28);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v30, (uint64_t)v29, @"7");

  v33 = objc_msgSend_valueForMetadataKey_(v5, v31, @"s", v32);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v34, (uint64_t)v33, @"T");

  v37 = objc_msgSend_valueForMetadataKey_(v5, v35, @"softwareVersionExternalIdentifier", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v38, (uint64_t)v37, @"R");

  v42 = objc_msgSend_title(v5, v39, v40, v41);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v43, (uint64_t)v42, @"2");

  v46 = objc_msgSend_valueForMetadataKey_(v5, v44, @"com.apple.iTunesStore.downloadInfo", v45);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v49 = objc_msgSend_objectForKeyedSubscript_(v46, v47, @"accountInfo", v48);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v53 = 0;
    v56 = 0;
    goto LABEL_7;
  }
  v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, @"DSPersonID", v51);
  v53 = BLGetNSNumberFromValue(v52);

  v56 = objc_msgSend_objectForKeyedSubscript_(v49, v54, @"AppleID", v55);

  if (v53) {
    objc_msgSend_setObject_forKeyedSubscript_(v7, v57, (uint64_t)v53, @"U");
  }
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v60 = objc_msgSend_valueForMetadataKey_(v5, v58, @"appleId", v59);

    v56 = (void *)v60;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_setObject_forKeyedSubscript_(v7, v61, (uint64_t)v56, @"Z");
  }
  if (v6) {
    objc_msgSend_addEntriesFromDictionary_(v7, v61, (uint64_t)v6, v62);
  }

  return v7;
}

+ (id)_assetDictionaryWithDownloadMetadata:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v8 = objc_msgSend_valueForMetadataKey_(v4, v6, @"asset-info", v7);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"flavor", v10);
    if (v12) {
      objc_msgSend_setObject_forKeyedSubscript_(v5, v11, (uint64_t)v12, @"g");
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLRestoreRequestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BLRestoreRequestItem;
  id v5 = [(BLRestoreRequestItem *)&v29 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_super v13 = objc_msgSend_setWithObjects_(v6, v11, v7, v12, v8, v9, v10, 0);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"downloadDictionary");
    downloadDictionary = v5->_downloadDictionary;
    v5->_downloadDictionary = (NSDictionary *)v15;

    uint64_t v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_setWithObjects_(v17, v22, v18, v23, v19, v20, v21, 0);
    uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v24, @"assetDictionary");
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSDictionary *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  id v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)downloadDictionary, @"downloadDictionary");
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_assetDictionary, @"assetDictionary");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_downloadDictionary(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);
  objc_msgSend_setDownloadDictionary_(v8, v17, (uint64_t)v16, v18);

  v22 = objc_msgSend_assetDictionary(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_copy(v22, v23, v24, v25);
  objc_msgSend_setAssetDictionary_(v8, v27, (uint64_t)v26, v28);

  return v8;
}

- (NSDictionary)downloadDictionary
{
  return self->_downloadDictionary;
}

- (void)setDownloadDictionary:(id)a3
{
}

- (NSDictionary)assetDictionary
{
  return self->_assetDictionary;
}

- (void)setAssetDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDictionary, 0);

  objc_storeStrong((id *)&self->_downloadDictionary, 0);
}

@end