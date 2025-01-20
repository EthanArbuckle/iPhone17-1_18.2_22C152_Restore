@interface CKFetchShareMetadataOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)overwriteContainerPCSServiceIfManatee;
- (BOOL)shouldFetchRootRecord;
- (BOOL)skipShareDecryption;
- (CKFetchShareMetadataOperationInfo)initWithCoder:(id)a3;
- (NSArray)rootRecordDesiredKeys;
- (NSArray)shareURLsToFetch;
- (NSDictionary)shareInvitationTokensByShareURL;
- (void)encodeWithCoder:(id)a3;
- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3;
- (void)setRootRecordDesiredKeys:(id)a3;
- (void)setShareInvitationTokensByShareURL:(id)a3;
- (void)setShareURLsToFetch:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
- (void)setSkipShareDecryption:(BOOL)a3;
@end

@implementation CKFetchShareMetadataOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v36.receiver = self;
  v36.super_class = (Class)CKFetchShareMetadataOperationInfo;
  [(CKOperationInfo *)&v36 encodeWithCoder:v4];
  v9 = objc_msgSend_shareURLsToFetch(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"URLsToFetch");

  uint64_t RootRecord = objc_msgSend_shouldFetchRootRecord(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, RootRecord, @"ShouldFetchRootRecord");
  v19 = objc_msgSend_rootRecordDesiredKeys(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"RootRecordDesiredKeys");

  v24 = objc_msgSend_shareInvitationTokensByShareURL(self, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, @"ShareInvitationTokensByShareURL");

  uint64_t v29 = objc_msgSend_overwriteContainerPCSServiceIfManatee(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, @"OverwriteContainerPCSServiceIfManatee");
  uint64_t v34 = objc_msgSend_skipShareDecryption(self, v31, v32, v33);
  objc_msgSend_encodeBool_forKey_(v4, v35, v34, @"SkipShareDecryption");
}

- (CKFetchShareMetadataOperationInfo)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperationInfo;
  v5 = [(CKOperationInfo *)&v41 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v43, 2);
    uint64_t v12 = objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"URLsToFetch");
    shareURLsToFetch = v5->_shareURLsToFetch;
    v5->_shareURLsToFetch = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"RootRecordDesiredKeys");
    rootRecordDesiredKeys = v5->_rootRecordDesiredKeys;
    v5->_rootRecordDesiredKeys = (NSArray *)v23;

    v5->_shouldFetchuint64_t RootRecord = objc_msgSend_decodeBoolForKey_(v4, v25, @"ShouldFetchRootRecord", v26);
    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v42, 3);
    uint64_t v32 = objc_msgSend_setWithArray_(v27, v30, (uint64_t)v29, v31);
    uint64_t v34 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, @"ShareInvitationTokensByShareURL");
    shareInvitationTokensByShareURL = v5->_shareInvitationTokensByShareURL;
    v5->_shareInvitationTokensByShareURL = (NSDictionary *)v34;

    v5->_overwriteContainerPCSServiceIfManatee = objc_msgSend_decodeBoolForKey_(v4, v36, @"OverwriteContainerPCSServiceIfManatee", v37);
    v5->_skipShareDecryption = objc_msgSend_decodeBoolForKey_(v4, v38, @"SkipShareDecryption", v39);
  }

  return v5;
}

- (NSArray)shareURLsToFetch
{
  return self->_shareURLsToFetch;
}

- (void)setShareURLsToFetch:(id)a3
{
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchuint64_t RootRecord = a3;
}

- (NSArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  return self->_shareInvitationTokensByShareURL;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
}

- (BOOL)overwriteContainerPCSServiceIfManatee
{
  return self->_overwriteContainerPCSServiceIfManatee;
}

- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3
{
  self->_overwriteContainerPCSServiceIfManatee = a3;
}

- (BOOL)skipShareDecryption
{
  return self->_skipShareDecryption;
}

- (void)setSkipShareDecryption:(BOOL)a3
{
  self->_skipShareDecryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);

  objc_storeStrong((id *)&self->_shareURLsToFetch, 0);
}

@end