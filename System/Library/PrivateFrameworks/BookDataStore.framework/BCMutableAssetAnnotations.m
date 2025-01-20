@interface BCMutableAssetAnnotations
- (BCMutableAssetAnnotations)initWithAssetID:(id)a3;
- (BCMutableAssetAnnotations)initWithCloudData:(id)a3;
- (BCMutableAssetAnnotations)initWithRecord:(id)a3;
- (NSData)bookAnnotations;
- (NSString)assetID;
- (NSString)assetVersion;
- (NSString)debugDescription;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)setAssetVersion:(id)a3;
- (void)setBookAnnotations:(id)a3;
@end

@implementation BCMutableAssetAnnotations

- (BCMutableAssetAnnotations)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361F9950();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableAssetAnnotations;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableAssetAnnotations *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v13;
LABEL_7:
  }
  return (BCMutableAssetAnnotations *)v12;
}

- (BCMutableAssetAnnotations)initWithCloudData:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BCMutableAssetAnnotations;
  v5 = [(BCMutableCloudData *)&v59 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_assetID(v6, v7, v8, v9, v10, v11, v12, v13);
      v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);

      if (objc_msgSend_length(v23, v24, v25, v26, v27, v28, v29, v30))
      {
        objc_storeStrong((id *)&v5->_assetID, v23);
        v38 = objc_msgSend_assetVersion(v14, v31, v32, v33, v34, v35, v36, v37);
        uint64_t v46 = objc_msgSend_copy(v38, v39, v40, v41, v42, v43, v44, v45);
        assetVersion = v5->_assetVersion;
        v5->_assetVersion = (NSString *)v46;

        uint64_t v55 = objc_msgSend_bookAnnotations(v14, v48, v49, v50, v51, v52, v53, v54);
        p_super = &v5->_bookAnnotations->super;
        v5->_bookAnnotations = (NSData *)v55;
LABEL_12:

        goto LABEL_13;
      }
      v57 = BDSCloudKitLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_2361F99B8();
      }

      p_super = &v5->super.super;
    }
    else
    {
      p_super = BDSCloudKitLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_2361F9984();
      }
      v23 = v5;
    }
    v5 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (BCMutableAssetAnnotations)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v34 = BDSCloudKitLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_2361F99EC();
    }
    goto LABEL_11;
  }
  v54.receiver = self;
  v54.super_class = (Class)BCMutableAssetAnnotations;
  uint64_t v11 = [(BCMutableCloudData *)&v54 initWithRecord:v4];
  if (v11)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    self = (BCMutableAssetAnnotations *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(self, v12, v13, v14, v15, v16, v17, v18))
    {
      objc_storeStrong((id *)&v11->_assetID, self);
      uint64_t v25 = objc_msgSend_objectForKey_(v4, v19, @"assetVersion", v20, v21, v22, v23, v24);
      assetVersion = v11->_assetVersion;
      v11->_assetVersion = (NSString *)v25;

      objc_opt_class();
      uint64_t v33 = objc_msgSend_objectForKey_(v4, v27, @"assetAnnotations", v28, v29, v30, v31, v32);
      uint64_t v34 = BUDynamicCast();

      v48 = objc_msgSend_fileURL(v34, v35, v36, v37, v38, v39, v40, v41);
      if (v48)
      {
        uint64_t v49 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x263EFF8F8], v42, (uint64_t)v48, v43, v44, v45, v46, v47);
        p_super = &v11->_bookAnnotations->super;
        v11->_bookAnnotations = (NSData *)v49;
      }
      else
      {
        p_super = BDSCloudKitLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          sub_2361F9A54((uint64_t *)&v11->_assetID, p_super, v52);
        }
      }

      goto LABEL_15;
    }
    uint64_t v51 = BDSCloudKitLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_2361F9A20();
    }

    uint64_t v34 = &v11->super.super;
LABEL_11:
    uint64_t v11 = 0;
LABEL_15:
  }
  return v11;
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_assetVersion(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_bookAnnotations(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v33 = objc_msgSend_stringWithFormat_(v9, v27, @"assetID: %@, assetVersion: %@, annotations: %@", v28, v29, v30, v31, v32, v10, v18, v26);

  return (NSString *)v33;
}

- (id)recordType
{
  return @"assetAnnotations";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  v82.receiver = self;
  v82.super_class = (Class)BCMutableAssetAnnotations;
  uint64_t v3 = [(BCMutableCloudData *)&v82 configuredRecordFromAttributes];
  uint64_t v11 = objc_msgSend_assetVersion(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v3, v12, (uint64_t)v11, @"assetVersion", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_sharedManager(BCCloudAssetManager, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v32 = objc_msgSend_assetAnnotationManager(v24, v25, v26, v27, v28, v29, v30, v31);
  uint64_t v40 = objc_msgSend_assetID(self, v33, v34, v35, v36, v37, v38, v39);
  uint64_t v47 = objc_msgSend_fileURLForCachingCKAssetWithAssetID_(v32, v41, (uint64_t)v40, v42, v43, v44, v45, v46);

  if (v47
    && (objc_msgSend_bookAnnotations(self, v48, v49, v50, v51, v52, v53, v54),
        uint64_t v55 = objc_claimAutoreleasedReturnValue(),
        int v61 = objc_msgSend_writeToURL_atomically_(v55, v56, (uint64_t)v47, 1, v57, v58, v59, v60),
        v55,
        v61))
  {
    id v62 = objc_alloc(MEMORY[0x263EFD5E0]);
    v69 = objc_msgSend_initWithFileURL_(v62, v63, (uint64_t)v47, v64, v65, v66, v67, v68);
    objc_msgSend_setObject_forKey_(v3, v70, (uint64_t)v69, @"assetAnnotations", v71, v72, v73, v74);
  }
  else
  {
    v75 = BDSCloudKitLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      sub_2361F9AC8();
    }

    objc_msgSend_setObject_forKey_(v3, v76, 0, @"assetAnnotations", v77, v78, v79, v80);
  }

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSData)bookAnnotations
{
  return self->_bookAnnotations;
}

- (void)setBookAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookAnnotations, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end