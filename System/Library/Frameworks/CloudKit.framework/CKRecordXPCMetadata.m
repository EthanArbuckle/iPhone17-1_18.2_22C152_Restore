@interface CKRecordXPCMetadata
+ (BOOL)supportsSecureCoding;
- (CKRecord)serverRecord;
- (CKRecordXPCMetadata)initWithCoder:(id)a3;
- (NSArray)allPCSKeyIDs;
- (NSData)pcsKeyID;
- (NSData)protectionData;
- (NSData)signingPCSIdentityData;
- (NSData)zoneishKeyID;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)modificationDate;
- (NSString)etag;
- (void)CKAssignToContainerWithID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllPCSKeyIDs:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPcsKeyID:(id)a3;
- (void)setProtectionData:(id)a3;
- (void)setServerRecord:(id)a3;
- (void)setSigningPCSIdentityData:(id)a3;
- (void)setZoneishKeyID:(id)a3;
@end

@implementation CKRecordXPCMetadata

- (void)CKAssignToContainerWithID:(id)a3
{
  id v4 = a3;
  objc_msgSend_serverRecord(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v10, v8, (uint64_t)v4, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v65 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_etag(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_etag);
  objc_msgSend_encodeObject_forKey_(v65, v10, (uint64_t)v8, (uint64_t)v9);

  v14 = objc_msgSend_creationDate(self, v11, v12, v13);
  v15 = NSStringFromSelector(sel_creationDate);
  objc_msgSend_encodeObject_forKey_(v65, v16, (uint64_t)v14, (uint64_t)v15);

  v20 = objc_msgSend_modificationDate(self, v17, v18, v19);
  v21 = NSStringFromSelector(sel_modificationDate);
  objc_msgSend_encodeObject_forKey_(v65, v22, (uint64_t)v20, (uint64_t)v21);

  v26 = objc_msgSend_expirationDate(self, v23, v24, v25);
  v27 = NSStringFromSelector(sel_expirationDate);
  objc_msgSend_encodeObject_forKey_(v65, v28, (uint64_t)v26, (uint64_t)v27);

  v32 = objc_msgSend_serverRecord(self, v29, v30, v31);
  v33 = NSStringFromSelector(sel_serverRecord);
  objc_msgSend_encodeObject_forKey_(v65, v34, (uint64_t)v32, (uint64_t)v33);

  v38 = objc_msgSend_protectionData(self, v35, v36, v37);
  v39 = NSStringFromSelector(sel_protectionData);
  objc_msgSend_encodeObject_forKey_(v65, v40, (uint64_t)v38, (uint64_t)v39);

  v44 = objc_msgSend_signingPCSIdentityData(self, v41, v42, v43);
  v45 = NSStringFromSelector(sel_signingPCSIdentityData);
  objc_msgSend_encodeObject_forKey_(v65, v46, (uint64_t)v44, (uint64_t)v45);

  v50 = objc_msgSend_pcsKeyID(self, v47, v48, v49);
  v51 = NSStringFromSelector(sel_pcsKeyID);
  objc_msgSend_encodeObject_forKey_(v65, v52, (uint64_t)v50, (uint64_t)v51);

  v56 = objc_msgSend_allPCSKeyIDs(self, v53, v54, v55);
  v57 = NSStringFromSelector(sel_allPCSKeyIDs);
  objc_msgSend_encodeObject_forKey_(v65, v58, (uint64_t)v56, (uint64_t)v57);

  v62 = objc_msgSend_zoneishKeyID(self, v59, v60, v61);
  v63 = NSStringFromSelector(sel_zoneishKeyID);
  objc_msgSend_encodeObject_forKey_(v65, v64, (uint64_t)v62, (uint64_t)v63);
}

- (CKRecordXPCMetadata)initWithCoder:(id)a3
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)CKRecordXPCMetadata;
  v5 = [(CKRecordXPCMetadata *)&v63 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_etag);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    etag = v5->_etag;
    v5->_etag = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_creationDate);
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = NSStringFromSelector(sel_modificationDate);
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_expirationDate);
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v22, (uint64_t)v23);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_serverRecord);
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, (uint64_t)v28);
    serverRecord = v5->_serverRecord;
    v5->_serverRecord = (CKRecord *)v30;

    uint64_t v32 = objc_opt_class();
    v33 = NSStringFromSelector(sel_protectionData);
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v35;

    uint64_t v37 = objc_opt_class();
    v38 = NSStringFromSelector(sel_signingPCSIdentityData);
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);
    signingPCSIdentityData = v5->_signingPCSIdentityData;
    v5->_signingPCSIdentityData = (NSData *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v43 = NSStringFromSelector(sel_pcsKeyID);
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v42, (uint64_t)v43);
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v45;

    v47 = (void *)MEMORY[0x1E4F1CAD0];
    v64[0] = objc_opt_class();
    v64[1] = objc_opt_class();
    uint64_t v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v64, 2);
    v52 = objc_msgSend_setWithArray_(v47, v50, (uint64_t)v49, v51);
    v53 = NSStringFromSelector(sel_allPCSKeyIDs);
    uint64_t v55 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v52, (uint64_t)v53);
    allPCSKeyIDs = v5->_allPCSKeyIDs;
    v5->_allPCSKeyIDs = (NSArray *)v55;

    uint64_t v57 = objc_opt_class();
    v58 = NSStringFromSelector(sel_zoneishKeyID);
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v57, (uint64_t)v58);
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v60;
  }

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (void)setServerRecord:(id)a3
{
}

- (NSData)protectionData
{
  return self->_protectionData;
}

- (void)setProtectionData:(id)a3
{
}

- (NSData)signingPCSIdentityData
{
  return self->_signingPCSIdentityData;
}

- (void)setSigningPCSIdentityData:(id)a3
{
}

- (NSData)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void)setPcsKeyID:(id)a3
{
}

- (NSArray)allPCSKeyIDs
{
  return self->_allPCSKeyIDs;
}

- (void)setAllPCSKeyIDs:(id)a3
{
}

- (NSData)zoneishKeyID
{
  return self->_zoneishKeyID;
}

- (void)setZoneishKeyID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_allPCSKeyIDs, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_signingPCSIdentityData, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_etag, 0);
}

@end