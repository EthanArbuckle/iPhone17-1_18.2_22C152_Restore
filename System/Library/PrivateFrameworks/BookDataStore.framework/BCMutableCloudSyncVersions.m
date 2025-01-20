@interface BCMutableCloudSyncVersions
+ (BOOL)supportsSecureCoding;
- (BCMutableCloudSyncVersions)initWithCloudSyncVersions:(id)a3;
- (BCMutableCloudSyncVersions)initWithCoder:(id)a3;
- (NSPersistentHistoryToken)historyToken;
- (NSString)dataType;
- (id)description;
- (int64_t)cloudVersion;
- (int64_t)historyTokenOffset;
- (int64_t)localVersion;
- (int64_t)syncVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudVersion:(int64_t)a3;
- (void)setDataType:(id)a3;
- (void)setHistoryToken:(id)a3;
- (void)setHistoryTokenOffset:(int64_t)a3;
- (void)setLocalVersion:(int64_t)a3;
- (void)setSyncVersion:(int64_t)a3;
@end

@implementation BCMutableCloudSyncVersions

- (BCMutableCloudSyncVersions)initWithCloudSyncVersions:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)BCMutableCloudSyncVersions;
  v12 = [(BCMutableCloudSyncVersions *)&v69 init];
  if (v12)
  {
    v13 = objc_msgSend_dataType(v4, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v21 = objc_msgSend_copy(v13, v14, v15, v16, v17, v18, v19, v20);
    dataType = v12->_dataType;
    v12->_dataType = (NSString *)v21;

    v12->_cloudVersion = objc_msgSend_cloudVersion(v4, v23, v24, v25, v26, v27, v28, v29);
    v12->_localVersion = objc_msgSend_localVersion(v4, v30, v31, v32, v33, v34, v35, v36);
    v12->_syncVersion = objc_msgSend_syncVersion(v4, v37, v38, v39, v40, v41, v42, v43);
    v51 = objc_msgSend_historyToken(v4, v44, v45, v46, v47, v48, v49, v50);
    uint64_t v59 = objc_msgSend_copy(v51, v52, v53, v54, v55, v56, v57, v58);
    historyToken = v12->_historyToken;
    v12->_historyToken = (NSPersistentHistoryToken *)v59;

    v12->_historyTokenOffset = objc_msgSend_historyTokenOffset(v4, v61, v62, v63, v64, v65, v66, v67);
  }

  return v12;
}

- (id)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_dataType(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_cloudVersion(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_localVersion(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v34 = objc_msgSend_syncVersion(self, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v42 = objc_msgSend_historyToken(self, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v50 = objc_msgSend_historyTokenOffset(self, v43, v44, v45, v46, v47, v48, v49);
  uint64_t v57 = objc_msgSend_stringWithFormat_(v9, v51, @"dataType: %@, cloudVersion: %lld, localVersion: %lld, syncVersion: %lld historyToken:%@ historyTokenOffset=%lld", v52, v53, v54, v55, v56, v10, v18, v26, v34, v42, v50);

  return v57;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v82 = a3;
  uint64_t v11 = objc_msgSend_dataType(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v82, v12, (uint64_t)v11, @"dataType", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_cloudVersion(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v82, v25, v24, @"cloudVersion", v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_localVersion(self, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeInt64_forKey_(v82, v38, v37, @"localVersion", v39, v40, v41, v42);
  uint64_t v50 = objc_msgSend_syncVersion(self, v43, v44, v45, v46, v47, v48, v49);
  objc_msgSend_encodeInt64_forKey_(v82, v51, v50, @"syncVersion", v52, v53, v54, v55);
  uint64_t v63 = objc_msgSend_historyToken(self, v56, v57, v58, v59, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v82, v64, (uint64_t)v63, @"historyToken", v65, v66, v67, v68);

  uint64_t v76 = objc_msgSend_historyTokenOffset(self, v69, v70, v71, v72, v73, v74, v75);
  objc_msgSend_encodeInt64_forKey_(v82, v77, v76, @"historyTokenOffset", v78, v79, v80, v81);
}

- (BCMutableCloudSyncVersions)initWithCoder:(id)a3
{
  id v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)BCMutableCloudSyncVersions;
  uint64_t v5 = [(BCMutableCloudSyncVersions *)&v78 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"dataType", v8, v9, v10, v11);
    objc_msgSend_setDataType_(v5, v13, (uint64_t)v12, v14, v15, v16, v17, v18);

    uint64_t v25 = objc_msgSend_decodeInt64ForKey_(v4, v19, @"cloudVersion", v20, v21, v22, v23, v24);
    objc_msgSend_setCloudVersion_(v5, v26, v25, v27, v28, v29, v30, v31);
    uint64_t v38 = objc_msgSend_decodeInt64ForKey_(v4, v32, @"localVersion", v33, v34, v35, v36, v37);
    objc_msgSend_setLocalVersion_(v5, v39, v38, v40, v41, v42, v43, v44);
    uint64_t v51 = objc_msgSend_decodeInt64ForKey_(v4, v45, @"syncVersion", v46, v47, v48, v49, v50);
    objc_msgSend_setSyncVersion_(v5, v52, v51, v53, v54, v55, v56, v57);
    uint64_t v58 = objc_opt_class();
    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"historyToken", v60, v61, v62, v63);
    objc_msgSend_setHistoryToken_(v5, v65, (uint64_t)v64, v66, v67, v68, v69, v70);

    v5->_historyTokenOffset = objc_msgSend_decodeInt64ForKey_(v4, v71, @"historyTokenOffset", v72, v73, v74, v75, v76);
  }

  return v5;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (void)setDataType:(id)a3
{
}

- (int64_t)cloudVersion
{
  return self->_cloudVersion;
}

- (void)setCloudVersion:(int64_t)a3
{
  self->_cloudVersion = a3;
}

- (int64_t)localVersion
{
  return self->_localVersion;
}

- (void)setLocalVersion:(int64_t)a3
{
  self->_localVersion = a3;
}

- (int64_t)syncVersion
{
  return self->_syncVersion;
}

- (void)setSyncVersion:(int64_t)a3
{
  self->_syncVersion = a3;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
}

- (int64_t)historyTokenOffset
{
  return self->_historyTokenOffset;
}

- (void)setHistoryTokenOffset:(int64_t)a3
{
  self->_historyTokenOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

@end