@interface BCMutableReadingNowDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableReadingNowDetail)initWithAssetID:(id)a3;
- (BCMutableReadingNowDetail)initWithCloudData:(id)a3;
- (BCMutableReadingNowDetail)initWithCoder:(id)a3;
- (BCMutableReadingNowDetail)initWithRecord:(id)a3;
- (BOOL)isTrackedAsRecent;
- (NSDate)lastEngagedDate;
- (NSString)assetID;
- (NSString)cloudAssetType;
- (NSString)description;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setCloudAssetType:(id)a3;
- (void)setIsTrackedAsRecent:(BOOL)a3;
- (void)setLastEngagedDate:(id)a3;
@end

@implementation BCMutableReadingNowDetail

- (BCMutableReadingNowDetail)initWithAssetID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = BDSCloudKitLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2361FC5F4();
    }

    id v12 = 0;
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)BCMutableReadingNowDetail;
  id v12 = [(BCMutableCloudData *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
    self = (BCMutableReadingNowDetail *)*((void *)v12 + 9);
    *((void *)v12 + 9) = v13;
LABEL_7:
  }
  return (BCMutableReadingNowDetail *)v12;
}

- (BCMutableReadingNowDetail)initWithCloudData:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)BCMutableReadingNowDetail;
  v5 = [(BCMutableCloudData *)&v67 initWithCloudData:v4];
  if (v5)
  {
    uint64_t v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      v15 = objc_msgSend_assetID(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      assetID = v5->_assetID;
      v5->_assetID = (NSString *)v23;

      v5->_isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(v14, v25, v26, v27, v28, v29, v30, v31);
      v39 = objc_msgSend_lastEngagedDate(v14, v32, v33, v34, v35, v36, v37, v38);
      uint64_t v47 = objc_msgSend_copy(v39, v40, v41, v42, v43, v44, v45, v46);
      lastEngagedDate = v5->_lastEngagedDate;
      v5->_lastEngagedDate = (NSDate *)v47;

      v56 = objc_msgSend_cloudAssetType(v14, v49, v50, v51, v52, v53, v54, v55);
      uint64_t v64 = objc_msgSend_copy(v56, v57, v58, v59, v60, v61, v62, v63);
      cloudAssetType = v5->_cloudAssetType;
      v5->_cloudAssetType = (NSString *)v64;
    }
    else
    {
      cloudAssetType = BDSCloudKitLog();
      if (os_log_type_enabled(cloudAssetType, OS_LOG_TYPE_ERROR)) {
        sub_2361FC1EC();
      }
      v56 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BCMutableReadingNowDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v41 = BDSCloudKitLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_2361FC628();
    }
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  v45.receiver = self;
  v45.super_class = (Class)BCMutableReadingNowDetail;
  uint64_t v11 = [(BCMutableCloudData *)&v45 initWithRecord:v4];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    assetID = v11->_assetID;
    v11->_assetID = (NSString *)v12;

    objc_msgSend_objectForKey_(v4, v14, @"isTrackedAsRecent", v15, v16, v17, v18, v19);
    self = (BCMutableReadingNowDetail *)objc_claimAutoreleasedReturnValue();
    v11->_isTrackedAsRecent = objc_msgSend_BOOLValue(self, v20, v21, v22, v23, v24, v25, v26);
    uint64_t v33 = objc_msgSend_objectForKey_(v4, v27, @"lastEngagedDate", v28, v29, v30, v31, v32);
    lastEngagedDate = v11->_lastEngagedDate;
    v11->_lastEngagedDate = (NSDate *)v33;

    objc_opt_class();
    uint64_t v41 = objc_msgSend_objectForKey_(v4, v35, @"cloudAssetType", v36, v37, v38, v39, v40);
    uint64_t v42 = BUDynamicCast();
    cloudAssetType = v11->_cloudAssetType;
    v11->_cloudAssetType = (NSString *)v42;

LABEL_7:
  }

  return v11;
}

- (NSString)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_isTrackedAsRecent(self, v11, v12, v13, v14, v15, v16, v17)) {
    uint64_t v25 = @"YES";
  }
  else {
    uint64_t v25 = @"NO";
  }
  uint64_t v26 = objc_msgSend_lastEngagedDate(self, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v34 = objc_msgSend_cloudAssetType(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v41 = objc_msgSend_stringWithFormat_(v9, v35, @"assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@, cloudAssetType: %@", v36, v37, v38, v39, v40, v10, v25, v26, v34);

  return (NSString *)v41;
}

- (id)recordType
{
  return @"readingNowDetail";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (id)configuredRecordFromAttributes
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v61.receiver = self;
  v61.super_class = (Class)BCMutableReadingNowDetail;
  uint64_t v3 = [(BCMutableCloudData *)&v61 configuredRecordFromAttributes];
  uint64_t v4 = NSNumber;
  uint64_t isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithBool_(v4, v13, isTrackedAsRecent, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v3, v20, (uint64_t)v19, @"isTrackedAsRecent", v21, v22, v23, v24);

  uint64_t v32 = objc_msgSend_lastEngagedDate(self, v25, v26, v27, v28, v29, v30, v31);
  objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v32, @"lastEngagedDate", v34, v35, v36, v37);

  uint64_t v38 = BDSCloudKitLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v46 = objc_msgSend_cloudAssetType(self, v39, v40, v41, v42, v43, v44, v45);
    *(_DWORD *)buf = 138412546;
    uint64_t v63 = v46;
    __int16 v64 = 2112;
    v65 = @"cloudAssetType";
    _os_log_impl(&dword_2360BC000, v38, OS_LOG_TYPE_DEFAULT, "BCReadingNowDetail configuredRecordFromAttributes setting cloudAssetType:%@ for %@", buf, 0x16u);
  }
  uint64_t v54 = objc_msgSend_cloudAssetType(self, v47, v48, v49, v50, v51, v52, v53);
  objc_msgSend_setObject_forKey_(v3, v55, (uint64_t)v54, @"cloudAssetType", v56, v57, v58, v59);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v44.receiver = self;
  v44.super_class = (Class)BCMutableReadingNowDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v44 encodeWithCoder:v4];
  uint64_t isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v5, v6, v7, v8, v9, v10, v11, v44.receiver, v44.super_class);
  objc_msgSend_encodeBool_forKey_(v4, v13, isTrackedAsRecent, @"isTrackedAsRecent", v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_lastEngagedDate(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"lastEngagedDate", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_cloudAssetType(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"cloudAssetType", v40, v41, v42, v43);
}

- (BCMutableReadingNowDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BCMutableReadingNowDetail;
  uint64_t v5 = [(BCMutableCloudData *)&v39 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    assetID = v13->_assetID;
    v13->_assetID = (NSString *)v14;

    v13->_uint64_t isTrackedAsRecent = objc_msgSend_decodeBoolForKey_(v4, v16, @"isTrackedAsRecent", v17, v18, v19, v20, v21);
    uint64_t v22 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"lastEngagedDate", v24, v25, v26, v27);
    lastEngagedDate = v13->_lastEngagedDate;
    v13->_lastEngagedDate = (NSDate *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"cloudAssetType", v32, v33, v34, v35);
    cloudAssetType = v13->_cloudAssetType;
    v13->_cloudAssetType = (NSString *)v36;
  }
  return v13;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (void)setIsTrackedAsRecent:(BOOL)a3
{
  self->_uint64_t isTrackedAsRecent = a3;
}

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (void)setLastEngagedDate:(id)a3
{
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end