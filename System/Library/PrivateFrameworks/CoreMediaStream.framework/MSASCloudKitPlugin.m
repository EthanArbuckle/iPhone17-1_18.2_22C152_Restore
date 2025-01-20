@interface MSASCloudKitPlugin
+ (id)_decryptedObjectForRecord:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
+ (id)fetchMigrationCtag;
+ (void)_fetchRecordWithRecordID:(id)a3 zoneName:(id)a4 fieldName:(id)a5 ownerUserID:(id)a6 isOwned:(BOOL)a7 completionHandler:(id)a8;
+ (void)fetchClientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 fieldName:(id)a5 ownerUserID:(id)a6 isOwned:(BOOL)a7 completionHandler:(id)a8;
@end

@implementation MSASCloudKitPlugin

+ (id)_decryptedObjectForRecord:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 encryptedValues];
  v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10
    && ([v7 objectForKeyedSubscript:v8], (v10 = objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v10;
    v10 = v11;
LABEL_5:
    v12 = v11;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
    {
      id v11 = [v10 base64EncodedStringWithOptions:0];
      goto LABEL_5;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = [v7 recordType];
    v15 = [v7 recordID];
    v16 = [v15 recordName];
    int v18 = 138543874;
    v19 = v14;
    __int16 v20 = 2114;
    v21 = v16;
    __int16 v22 = 2114;
    id v23 = (id)objc_opt_class();
    id v17 = v23;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected object instead of encrypted data for %{public}@.%{public}@: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

+ (void)_fetchRecordWithRecordID:(id)a3 zoneName:(id)a4 fieldName:(id)a5 ownerUserID:(id)a6 isOwned:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v31 = a5;
  id v15 = a6;
  v16 = (void (**)(id, uint64_t, uint64_t))a8;
  v29 = v15;
  v30 = v14;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v14 ownerName:v15];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2001;
  v47 = __Block_byref_object_dispose__2002;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2001;
  v41 = __Block_byref_object_dispose__2002;
  id v42 = 0;
  if (v17)
  {
    int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v13 zoneID:v17];
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.icloud-photos.fdb" environment:1];
    id v19 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    [v19 setApplicationBundleIdentifierOverrideForContainerAccess:@"com.apple.photos.cloud"];
    [v19 setApplicationBundleIdentifierOverrideForNetworkAttribution:@"com.apple.photos.cloud"];
    [v19 setApplicationBundleIdentifierOverrideForPushTopicGeneration:@"com.apple.sharedstreams"];
    __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v28 options:v19];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1A208]);
    [v21 setContainer:v20];
    id v22 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    v52[0] = v18;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    uint64_t v24 = (void *)[v22 initWithRecordIDs:v23];

    [v24 setConfiguration:v21];
    id v51 = v31;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [v24 setDesiredKeys:v25];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __104__MSASCloudKitPlugin__fetchRecordWithRecordID_zoneName_fieldName_ownerUserID_isOwned_completionHandler___block_invoke;
    v32[3] = &unk_1E6C3BCB0;
    v35 = &v37;
    v36 = &v43;
    id v26 = v18;
    id v33 = v26;
    id v34 = v13;
    [v24 setFetchRecordsCompletionBlock:v32];
    if (v9) {
      [v20 privateCloudDatabase];
    }
    else {
    v27 = [v20 sharedCloudDatabase];
    }
    [v27 addOperation:v24];
    [v24 waitUntilFinished];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v30;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid zoneID for zoneName: %@", buf, 0xCu);
  }
  v16[2](v16, v44[5], v38[5]);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __104__MSASCloudKitPlugin__fetchRecordWithRecordID_zoneName_fieldName_ownerUserID_isOwned_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    int v14 = 138412290;
    id v15 = v6;
    v12 = MEMORY[0x1E4F14500];
    id v13 = "Failed to fetch userRecord: %@";
LABEL_10:
    _os_log_error_impl(&dword_1DC434000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_3;
  }
  uint64_t v7 = [v5 objectForKey:a1[4]];
  uint64_t v8 = *(void *)(a1[7] + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = *(void **)(*(void *)(a1[7] + 8) + 40);
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    id v11 = (void *)a1[5];
    int v14 = 138412290;
    id v15 = v11;
    v12 = MEMORY[0x1E4F14500];
    id v13 = "No valid userRecord for recordID: %@";
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Fetched userRecord: %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_3:
}

+ (id)fetchMigrationCtag
{
  if (_os_feature_enabled_impl())
  {
    v3 = +[MSProtocolUtilities currentOwnerCKUserID];
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    BOOL v9 = __Block_byref_object_copy__2001;
    v10 = __Block_byref_object_dispose__2002;
    id v11 = 0;
    objc_msgSend(a1, "_fetchRecordWithRecordID:zoneName:fieldName:ownerUserID:isOwned:completionHandler:", @"DBRMetadata", @"SharedAlbumsInfo");
    id v4 = (id)v7[5];

    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __40__MSASCloudKitPlugin_fetchMigrationCtag__block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[6];
  uint64_t v4 = a1[4];
  id v5 = a2;
  uint64_t v6 = [v3 _decryptedObjectForRecord:v5 forKey:v4 validateClass:objc_opt_class()];

  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (void)fetchClientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 fieldName:(id)a5 ownerUserID:(id)a6 isOwned:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __108__MSASCloudKitPlugin_fetchClientOrgKeyForRecordID_zoneName_fieldName_ownerUserID_isOwned_completionHandler___block_invoke;
  v21[3] = &unk_1E6C3BC60;
  id v23 = v18;
  id v24 = a1;
  id v22 = v16;
  id v19 = v18;
  id v20 = v16;
  [a1 _fetchRecordWithRecordID:v14 zoneName:v15 fieldName:v20 ownerUserID:v17 isOwned:v9 completionHandler:v21];
}

void __108__MSASCloudKitPlugin_fetchClientOrgKeyForRecordID_zoneName_fieldName_ownerUserID_isOwned_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v5 _decryptedObjectForRecord:v8 forKey:v6 validateClass:objc_opt_class()];

  (*(void (**)(void))(a1[5] + 16))();
}

@end