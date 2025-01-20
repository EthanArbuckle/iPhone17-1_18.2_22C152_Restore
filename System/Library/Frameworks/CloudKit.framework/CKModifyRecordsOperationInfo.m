@interface CKModifyRecordsOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysFetchPCSFromServer;
- (BOOL)atomic;
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (BOOL)originatingFromDaemon;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)shouldModifyRecordsInDatabase;
- (BOOL)shouldOnlySaveAssetContent;
- (BOOL)shouldReportRecordsInFlight;
- (BOOL)shouldSkipPCSRetryBehavior;
- (CKModifyRecordsOperationInfo)init;
- (CKModifyRecordsOperationInfo)initWithCoder:(id)a3;
- (NSArray)recordIDsToDelete;
- (NSArray)recordsToSave;
- (NSData)clientChangeTokenData;
- (NSDictionary)assetUUIDToExpectedProperties;
- (NSDictionary)conflictLosersToResolveByRecordID;
- (NSDictionary)packageUUIDToExpectedProperties;
- (NSDictionary)pluginFieldsForRecordDeletesByID;
- (NSDictionary)recordIDsToDeleteToEtags;
- (int64_t)savePolicy;
- (void)_commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysFetchPCSFromServer:(BOOL)a3;
- (void)setAssetUUIDToExpectedProperties:(id)a3;
- (void)setAtomic:(BOOL)a3;
- (void)setClientChangeTokenData:(id)a3;
- (void)setConflictLosersToResolveByRecordID:(id)a3;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
- (void)setOriginatingFromDaemon:(BOOL)a3;
- (void)setPackageUUIDToExpectedProperties:(id)a3;
- (void)setPluginFieldsForRecordDeletesByID:(id)a3;
- (void)setRecordIDsToDelete:(id)a3;
- (void)setRecordIDsToDeleteToEtags:(id)a3;
- (void)setRecordsToSave:(id)a3;
- (void)setSavePolicy:(int64_t)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setShouldModifyRecordsInDatabase:(BOOL)a3;
- (void)setShouldOnlySaveAssetContent:(BOOL)a3;
- (void)setShouldReportRecordsInFlight:(BOOL)a3;
- (void)setShouldSkipPCSRetryBehavior:(BOOL)a3;
@end

@implementation CKModifyRecordsOperationInfo

- (CKModifyRecordsOperationInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKModifyRecordsOperationInfo;
  v2 = [(CKOperationInfo *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend__commonInit(v2, v3, v4, v5);
  }
  return v6;
}

- (void)_commonInit
{
  self->_atomic = 1;
  self->_shouldModifyRecordsInDatabase = 1;
  self->_alwaysFetchPCSFromServer = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x18C12ADA0]();
  v86.receiver = self;
  v86.super_class = (Class)CKModifyRecordsOperationInfo;
  [(CKDatabaseOperationInfo *)&v86 encodeWithCoder:v4];
  v9 = objc_msgSend_recordsToSave(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"records");

  v14 = objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"recordIDs");

  v19 = objc_msgSend_clientChangeTokenData(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"clientChangeToken");

  uint64_t v24 = objc_msgSend_savePolicy(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, @"savePolicy");
  uint64_t shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, shouldOnlySaveAssetContent, @"shouldOnlySaveAssetContent");
  v34 = objc_msgSend_recordIDsToDeleteToEtags(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, @"recordIDsToEtags");

  uint64_t v39 = objc_msgSend_atomic(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, v39, @"atomic");
  v44 = objc_msgSend_conflictLosersToResolveByRecordID(self, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"conflictLosersToResolveByRecordID");

  v49 = objc_msgSend_pluginFieldsForRecordDeletesByID(self, v46, v47, v48);
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, @"pluginFieldsForRecordDeletesByID");

  uint64_t shouldReportRecordsInFlight = objc_msgSend_shouldReportRecordsInFlight(self, v51, v52, v53);
  objc_msgSend_encodeBool_forKey_(v4, v55, shouldReportRecordsInFlight, @"shouldReportRecordsInFlight");
  v59 = objc_msgSend_assetUUIDToExpectedProperties(self, v56, v57, v58);
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, @"assetUUIDToExpectedProperties");

  v64 = objc_msgSend_packageUUIDToExpectedProperties(self, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"packageUUIDToExpectedProperties");

  uint64_t v69 = objc_msgSend_originatingFromDaemon(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(v4, v70, v69, @"originatingFromDaemon");
  uint64_t v74 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v71, v72, v73);
  objc_msgSend_encodeBool_forKey_(v4, v75, v74, @"markAsParticipantNeedsNewInvitationToken");
  uint64_t PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(self, v76, v77, v78);
  objc_msgSend_encodeBool_forKey_(v4, v80, PCSFromServer, @"alwaysFetchPCSFromServer");
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v81, v82, v83);
  objc_msgSend_encodeBool_forKey_(v4, v85, shouldCloneFileInAssetCache, @"ShouldCloneFileInAssetCache");
}

- (CKModifyRecordsOperationInfo)initWithCoder:(id)a3
{
  v105[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v103.receiver = self;
  v103.super_class = (Class)CKModifyRecordsOperationInfo;
  uint64_t v5 = [(CKDatabaseOperationInfo *)&v103 initWithCoder:v4];
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend__commonInit(v5, v6, v7, v8);
    context = (void *)MEMORY[0x18C12ADA0](v10);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v16 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, @"records");
    recordsToSave = v9->_recordsToSave;
    v9->_recordsToSave = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v25 = objc_msgSend_setWithObjects_(v20, v23, v21, v24, v22, 0);
    uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v26, (uint64_t)v25, @"recordIDs");
    recordIDsToDelete = v9->_recordIDsToDelete;
    v9->_recordIDsToDelete = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v33 = objc_msgSend_setWithObjects_(v29, v31, v30, v32, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, @"clientChangeToken");
    clientChangeTokenData = v9->_clientChangeTokenData;
    v9->_clientChangeTokenData = (NSData *)v35;

    v9->_savePolicy = objc_msgSend_decodeInt64ForKey_(v4, v37, @"savePolicy", v38);
    v9->_uint64_t shouldOnlySaveAssetContent = objc_msgSend_decodeBoolForKey_(v4, v39, @"shouldOnlySaveAssetContent", v40);
    v41 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v47 = objc_msgSend_setWithObjects_(v41, v45, v42, v46, v43, v44, 0);
    uint64_t v49 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v47, @"recordIDsToEtags");
    recordIDsToDeleteToEtags = v9->_recordIDsToDeleteToEtags;
    v9->_recordIDsToDeleteToEtags = (NSDictionary *)v49;

    v9->_atomic = objc_msgSend_decodeBoolForKey_(v4, v51, @"atomic", v52);
    uint64_t v53 = (void *)MEMORY[0x1E4F1CAD0];
    v105[0] = objc_opt_class();
    v105[1] = objc_opt_class();
    v105[2] = objc_opt_class();
    v105[3] = objc_opt_class();
    v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v54, (uint64_t)v105, 4);
    uint64_t v58 = objc_msgSend_setWithArray_(v53, v56, (uint64_t)v55, v57);
    uint64_t v60 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v58, @"conflictLosersToResolveByRecordID");
    conflictLosersToResolveByRecordID = v9->_conflictLosersToResolveByRecordID;
    v9->_conflictLosersToResolveByRecordID = (NSDictionary *)v60;

    uint64_t v62 = CKAcceptableValueClasses();
    v104[0] = objc_opt_class();
    v104[1] = objc_opt_class();
    v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v63, (uint64_t)v104, 2);
    uint64_t v67 = objc_msgSend_setByAddingObjectsFromArray_(v62, v65, (uint64_t)v64, v66);
    uint64_t v69 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, @"pluginFieldsForRecordDeletesByID");
    pluginFieldsForRecordDeletesByID = v9->_pluginFieldsForRecordDeletesByID;
    v9->_pluginFieldsForRecordDeletesByID = (NSDictionary *)v69;

    v9->_uint64_t shouldReportRecordsInFlight = objc_msgSend_decodeBoolForKey_(v4, v71, @"shouldReportRecordsInFlight", v72);
    uint64_t v73 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v74 = objc_opt_class();
    uint64_t v75 = objc_opt_class();
    uint64_t v76 = objc_opt_class();
    v79 = objc_msgSend_setWithObjects_(v73, v77, v74, v78, v75, v76, 0);
    uint64_t v81 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v80, (uint64_t)v79, @"assetUUIDToExpectedProperties");
    assetUUIDToExpectedProperties = v9->_assetUUIDToExpectedProperties;
    v9->_assetUUIDToExpectedProperties = (NSDictionary *)v81;

    uint64_t v83 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    uint64_t v86 = objc_opt_class();
    v89 = objc_msgSend_setWithObjects_(v83, v87, v84, v88, v85, v86, 0);
    uint64_t v91 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v90, (uint64_t)v89, @"packageUUIDToExpectedProperties");
    packageUUIDToExpectedProperties = v9->_packageUUIDToExpectedProperties;
    v9->_packageUUIDToExpectedProperties = (NSDictionary *)v91;

    v9->_originatingFromDaemon = objc_msgSend_decodeBoolForKey_(v4, v93, @"originatingFromDaemon", v94);
    v9->_markAsParticipantNeedsNewInvitationToken = objc_msgSend_decodeBoolForKey_(v4, v95, @"markAsParticipantNeedsNewInvitationToken", v96);
    v9->_alwaysFetchuint64_t PCSFromServer = objc_msgSend_decodeBoolForKey_(v4, v97, @"alwaysFetchPCSFromServer", v98);
    v9->_uint64_t shouldCloneFileInAssetCache = objc_msgSend_decodeBoolForKey_(v4, v99, @"ShouldCloneFileInAssetCache", v100);
  }

  return v9;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_uint64_t shouldOnlySaveAssetContent = a3;
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_uint64_t shouldReportRecordsInFlight = a3;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
}

- (BOOL)originatingFromDaemon
{
  return self->_originatingFromDaemon;
}

- (void)setOriginatingFromDaemon:(BOOL)a3
{
  self->_originatingFromDaemon = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (BOOL)shouldSkipPCSRetryBehavior
{
  return self->_shouldSkipPCSRetryBehavior;
}

- (void)setShouldSkipPCSRetryBehavior:(BOOL)a3
{
  self->_shouldSkipPCSRetryBehavior = a3;
}

- (BOOL)shouldModifyRecordsInDatabase
{
  return self->_shouldModifyRecordsInDatabase;
}

- (void)setShouldModifyRecordsInDatabase:(BOOL)a3
{
  self->_shouldModifyRecordsInDatabase = a3;
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchuint64_t PCSFromServer = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_uint64_t shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end