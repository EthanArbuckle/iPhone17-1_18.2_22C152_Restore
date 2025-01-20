@interface CKDDeviceCapabilityUsageSQLCache
- (CKContainerID)containerID;
- (CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable)lastSentTable;
- (CKDDeviceCapabilityTableGroup)tableGroup;
- (CKDDeviceCapabilityUsageSQLCache)initWithContainer:(id)a3;
- (CKDDeviceCapabilityUsageSQLTable)usageTable;
- (id)lastSentCapabilitiesAndUsage;
- (id)recordWithUnknownShareUsageForRecordID:(id)a3;
- (id)recordWithUnknownShareUsagesWithMaxCount:(unint64_t)a3;
- (id)shareUsageForShareID:(id)a3;
- (id)shareUsagesWithMaxCount:(unint64_t)a3;
- (id)zoneUsageForZoneID:(id)a3;
- (id)zoneUsagesWithMaxCount:(unint64_t)a3;
- (void)deleteAllUsageEntries;
- (void)deleteLastSentCapabilitiesAndUsageEntry;
- (void)deleteRecordWithUnknownShareUsageForRecordID:(id)a3;
- (void)deleteShareUsageForShareID:(id)a3;
- (void)deleteZoneUsageForZoneID:(id)a3;
- (void)setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4;
- (void)setShareUsage:(id)a3 forShareID:(id)a4;
- (void)setZoneUsage:(id)a3 forZoneID:(id)a4;
- (void)updateCapabilitySet:(id)a3 capabilitySetSavedDate:(id)a4;
- (void)updateUsageSavedDate:(id)a3;
@end

@implementation CKDDeviceCapabilityUsageSQLCache

- (CKDDeviceCapabilityUsageSQLCache)initWithContainer:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CKDDeviceCapabilityUsageSQLCache;
  v7 = [(CKDDeviceCapabilityUsageSQLCache *)&v58 init];
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v8 = objc_msgSend_containerID(v4, v5, v6);
  containerID = v7->_containerID;
  v7->_containerID = (CKContainerID *)v8;

  v12 = objc_msgSend_directoryContext(v4, v10, v11);
  v15 = objc_msgSend_daemonDatabaseDirectory(v12, v13, v14);

  v18 = objc_msgSend_containerID(v4, v16, v17);
  v19 = (void *)MEMORY[0x1E4F1A370];
  v22 = objc_msgSend_path(v15, v20, v21);
  v25 = objc_msgSend_deviceContext(v4, v23, v24);
  v28 = objc_msgSend_deviceScopedDatabase(v25, v26, v27);
  id v57 = 0;
  v30 = objc_msgSend_databaseInDirectory_registryDatabase_options_error_(v19, v29, (uint64_t)v22, v28, 0, &v57);
  id v31 = v57;

  if (!v30 || v31)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v52 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v18;
      __int16 v61 = 2112;
      id v62 = v31;
      _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "Failed to create Device Capability Cache for containerID %@, error: %@", buf, 0x16u);
    }
    int v51 = 1;
  }
  else
  {
    v33 = objc_msgSend__groupNameForContainer_(CKDDeviceCapabilityTableGroup, v32, (uint64_t)v4);
    id v56 = 0;
    v35 = objc_msgSend_tableGroupInDatabase_withName_error_(CKDDeviceCapabilityTableGroup, v34, (uint64_t)v30, v33, &v56);
    id v36 = v56;
    id v31 = v36;
    if (!v35 || v36)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v53 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v18;
        __int16 v61 = 2112;
        id v62 = v31;
        _os_log_error_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_ERROR, "Failed to create Device Capability Cache for containerID %@, error: %@", buf, 0x16u);
      }
      int v51 = 1;
    }
    else
    {
      objc_storeStrong((id *)&v7->_tableGroup, v35);
      uint64_t v38 = objc_msgSend_tableWithName_(v35, v37, @"UsageTable");
      usageTable = v7->_usageTable;
      v7->_usageTable = (CKDDeviceCapabilityUsageSQLTable *)v38;

      v42 = objc_msgSend_containerID(v4, v40, v41);
      objc_msgSend_setContainerID_(v7->_usageTable, v43, (uint64_t)v42);

      uint64_t v45 = objc_msgSend_tableWithName_(v35, v44, @"LastSentTable");
      lastSentTable = v7->_lastSentTable;
      v7->_lastSentTable = (CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable *)v45;

      v49 = objc_msgSend_containerID(v4, v47, v48);
      objc_msgSend_setContainerID_(v7->_lastSentTable, v50, (uint64_t)v49);

      int v51 = 0;
    }
  }
  if (v51) {
    v54 = 0;
  }
  else {
LABEL_20:
  }
    v54 = v7;

  return v54;
}

- (void)deleteAllUsageEntries
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  usageTable = self->_usageTable;
  id v5 = 0;
  objc_msgSend_deleteAllEntries_(usageTable, a2, (uint64_t)&v5);
  id v3 = v5;
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_ERROR, "Failed to delete all usage entries in SQL cache. Error: %@", buf, 0xCu);
    }
  }
}

- (id)zoneUsagesWithMaxCount:(unint64_t)a3
{
  return (id)MEMORY[0x1F4181798](self->_usageTable, sel__zoneUsagesForContainerID_maxCount_, self->_containerID);
}

- (id)zoneUsageForZoneID:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend__zoneUsageForZoneID_(self->_usageTable, a2, (uint64_t)a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setZoneUsage:(id)a3 forZoneID:(id)a4
{
  id v11 = a3;
  id v8 = a4;
  if (v11)
  {
    if (v8)
    {
      v9 = objc_msgSend_lastUsed(v11, v6, v7);

      if (v9) {
        objc_msgSend__setZoneUsage_forZoneID_(self->_usageTable, v10, (uint64_t)v11, v8);
      }
    }
  }
}

- (void)deleteZoneUsageForZoneID:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_usageTable, sel__deleteZoneUsageForZoneID_, a3);
  }
}

- (id)shareUsagesWithMaxCount:(unint64_t)a3
{
  return (id)MEMORY[0x1F4181798](self->_usageTable, sel__shareUsagesForContainerID_maxCount_, self->_containerID);
}

- (id)shareUsageForShareID:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend__shareUsageForShareID_(self->_usageTable, a2, (uint64_t)a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setShareUsage:(id)a3 forShareID:(id)a4
{
  id v11 = a3;
  id v8 = a4;
  if (v11)
  {
    if (v8)
    {
      v9 = objc_msgSend_lastUsed(v11, v6, v7);

      if (v9) {
        objc_msgSend__setShareUsage_forShareID_(self->_usageTable, v10, (uint64_t)v11, v8);
      }
    }
  }
}

- (void)deleteShareUsageForShareID:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_usageTable, sel__deleteShareUsageForShareID_, a3);
  }
}

- (id)recordWithUnknownShareUsagesWithMaxCount:(unint64_t)a3
{
  return (id)MEMORY[0x1F4181798](self->_usageTable, sel__recordWithUnknownShareUsagesForContainerID_maxCount_, self->_containerID);
}

- (id)recordWithUnknownShareUsageForRecordID:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend__recordWithUnknownShareUsageForRecordID_(self->_usageTable, a2, (uint64_t)a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4
{
  id v11 = a3;
  id v8 = a4;
  if (v11)
  {
    if (v8)
    {
      v9 = objc_msgSend_lastUsed(v11, v6, v7);

      if (v9) {
        objc_msgSend__setRecordWithUnknownShareUsage_forRecordID_(self->_usageTable, v10, (uint64_t)v11, v8);
      }
    }
  }
}

- (void)deleteRecordWithUnknownShareUsageForRecordID:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_usageTable, sel__deleteRecordWithUnknownShareUsageForRecordID_, a3);
  }
}

- (id)lastSentCapabilitiesAndUsage
{
  return (id)((uint64_t (*)(CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable *, char *))MEMORY[0x1F4181798])(self->_lastSentTable, sel__lastSentCapabilityAndUsage);
}

- (void)updateUsageSavedDate:(id)a3
{
  if (a3) {
    MEMORY[0x1F4181798](self->_lastSentTable, sel__updateUsageSavedDate_, a3);
  }
}

- (void)updateCapabilitySet:(id)a3 capabilitySetSavedDate:(id)a4
{
  if (a4) {
    MEMORY[0x1F4181798](self->_lastSentTable, sel__updateLastSentCapabilities_capabilitySetSavedDate_, a3);
  }
}

- (void)deleteLastSentCapabilitiesAndUsageEntry
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  lastSentTable = self->_lastSentTable;
  id v5 = 0;
  objc_msgSend_deleteAllEntries_(lastSentTable, a2, (uint64_t)&v5);
  id v3 = v5;
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_ERROR, "Failed to delete last sent capabilities and usage entry in LastSentCapabilitiesAndUsageTable. Error: %@", buf, 0xCu);
    }
  }
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKDDeviceCapabilityTableGroup)tableGroup
{
  return self->_tableGroup;
}

- (CKDDeviceCapabilityUsageSQLTable)usageTable
{
  return self->_usageTable;
}

- (CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable)lastSentTable
{
  return self->_lastSentTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSentTable, 0);
  objc_storeStrong((id *)&self->_usageTable, 0);
  objc_storeStrong((id *)&self->_tableGroup, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end