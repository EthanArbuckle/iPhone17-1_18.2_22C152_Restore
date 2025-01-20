@interface CKRecord(BRCItemAdditions)
+ (id)desiredKeysWithMask:()BRCItemAdditions;
+ (id)rootAppLibraryRecordForAppLibraryID:()BRCItemAdditions zoneID:;
+ (id)rootDirectoryRecordForZoneID:()BRCItemAdditions;
+ (uint64_t)_validateCKObject:()BRCItemAdditions enhancedDrivePrivacyEnabled:;
- (BOOL)brc_safeToGetURL;
- (id)brc_lastEditorDeviceName;
- (id)brc_lastModifiedUserRecordNameWithCurrentUserRecordName:()BRCItemAdditions personNameComponents:;
- (id)brc_oplockMergeEtag;
- (id)brc_updateDroppedReason;
- (uint64_t)brc_currentUserOwnsLastEditorDeviceWithSessionContext:()BRCItemAdditions;
- (uint64_t)brc_isInterestingRecordForSave;
- (uint64_t)brc_isInterestingRecordForSyncDown;
- (uint64_t)sanitizeShortTokenFields;
- (uint64_t)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:;
- (void)brc_fillWithChildBasehashSalt:()BRCItemAdditions;
- (void)sqliteBind:()BRCItemAdditions index:;
@end

@implementation CKRecord(BRCItemAdditions)

- (uint64_t)brc_isInterestingRecordForSyncDown
{
  v2 = [a1 recordType];
  v3 = [a1 recordID];
  v4 = [v3 recordName];

  v5 = +[BRCUserDefaults defaultsForMangledID:0];
  v6 = [v5 recordsToIgnoreOnSyncDown];

  if ([v6 containsObject:v4]) {
    goto LABEL_2;
  }
  if (![v2 isEqualToString:@"structure"])
  {
    if (![v2 isEqualToString:@"content"])
    {
      uint64_t v9 = [v2 isEqualToString:*MEMORY[0x1E4F19D78]];
      goto LABEL_16;
    }
    v8 = @"documentContent/";
LABEL_14:
    uint64_t v9 = [v4 hasPrefix:v8];
LABEL_16:
    uint64_t v7 = v9;
    goto LABEL_17;
  }
  if (([v4 hasPrefix:@"documentStructure/"] & 1) == 0
    && ([v4 hasPrefix:@"directory/"] & 1) == 0
    && ([v4 hasPrefix:@"alias/"] & 1) == 0
    && ([v4 hasPrefix:@"shareAlias/"] & 1) == 0
    && ([v4 hasPrefix:@"symlink/"] & 1) == 0
    && ([v4 hasPrefix:@"finderBookmark/"] & 1) == 0
    && ([v4 hasPrefix:@"directory/appDocuments_"] & 1) == 0)
  {
    v8 = @"directory/appData_";
    goto LABEL_14;
  }
LABEL_2:
  uint64_t v7 = 1;
LABEL_17:

  return v7;
}

- (uint64_t)brc_isInterestingRecordForSave
{
  if (!objc_msgSend(a1, "brc_isInterestingRecordForSyncDown")) {
    return 0;
  }
  v2 = [a1 recordID];
  if (objc_msgSend(v2, "brc_isAppLibraryRootRecordID"))
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [a1 recordID];
    uint64_t v3 = objc_msgSend(v4, "brc_isZoneRootRecordID") ^ 1;
  }
  return v3;
}

- (id)brc_oplockMergeEtag
{
  v1 = [a1 pluginFields];
  v2 = [v1 objectForKeyedSubscript:@"br_oplockMergeEtag"];

  return v2;
}

- (id)brc_updateDroppedReason
{
  v1 = [a1 pluginFields];
  v2 = [v1 objectForKeyedSubscript:@"br_updateDropped"];

  return v2;
}

- (BOOL)brc_safeToGetURL
{
  v2 = objc_msgSend(a1, "brc_sharedRootDisplayName");

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [a1 containerID];

  if (!v3) {
    return 0;
  }
  v4 = objc_msgSend(a1, "brc_sharedRootExtension");
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [MEMORY[0x1E4F59560] iWorkShareableExtensions];
  uint64_t v7 = [v5 setWithArray:v6];

  if (v4 && [v7 containsObject:v4])
  {
    v8 = [a1 baseToken];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)brc_lastModifiedUserRecordNameWithCurrentUserRecordName:()BRCItemAdditions personNameComponents:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 objectForKeyedSubscript:@"lastEditorName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 dataUsingEncoding:4];
    id v32 = 0;
    BOOL v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v32];
    id v10 = v32;
    objc_opt_class();
    id v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v31 = v10;
    v12 = [v9 objectForKeyedSubscript:@"type"];
    int v13 = [v12 isEqualToString:@"user"];

    if (v13)
    {
      v14 = [v9 objectForKeyedSubscript:@"ckUserId"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v11 = [v9 objectForKeyedSubscript:@"ckUserId"];
        if ([v11 isEqualToString:v6])
        {
          v16 = v11;
          id v11 = (id)*MEMORY[0x1E4F19C08];
        }
        else
        {
          if (!a4) {
            goto LABEL_12;
          }
          v20 = [v9 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          char v21 = objc_opt_isKindOfClass();

          if ((v21 & 1) == 0) {
            goto LABEL_12;
          }
          v16 = [v9 objectForKeyedSubscript:@"name"];
          v22 = [v16 objectForKeyedSubscript:@"last"];
          objc_opt_class();
          char v29 = objc_opt_isKindOfClass();

          if (v29)
          {
            uint64_t v30 = [v16 objectForKeyedSubscript:@"last"];
          }
          else
          {
            uint64_t v30 = 0;
          }
          uint64_t v23 = [v16 objectForKeyedSubscript:@"first"];
          objc_opt_class();
          v24 = (void *)v23;
          LOBYTE(v23) = objc_opt_isKindOfClass();

          if (v23)
          {
            uint64_t v25 = [v16 objectForKeyedSubscript:@"first"];
          }
          else
          {
            uint64_t v25 = 0;
          }
          if (v25 | v30)
          {
            id v26 = objc_alloc_init(MEMORY[0x1E4F28F30]);
            [v26 setFamilyName:v30];
            [v26 setGivenName:v25];
            id v27 = v26;
            *a4 = v27;
          }
        }
      }
      else
      {
        v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v28 = [a1 recordID];
          *(_DWORD *)buf = 138412802;
          v34 = v28;
          __int16 v35 = 2112;
          v36 = v9;
          __int16 v37 = 2112;
          v38 = v16;
          _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid lastEditorDeviceName on %@: %@%@", buf, 0x20u);
        }
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
LABEL_12:
    id v10 = v31;
LABEL_13:

    if (v11) {
      goto LABEL_15;
    }
  }
  v18 = [a1 lastModifiedUserRecordID];
  id v11 = [v18 recordName];

LABEL_15:
  return v11;
}

- (uint64_t)brc_currentUserOwnsLastEditorDeviceWithSessionContext:()BRCItemAdditions
{
  v4 = [a3 cachedCurrentUserRecordName];
  v5 = objc_msgSend(a1, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v4, 0);
  uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C08]];

  return v6;
}

- (id)brc_lastEditorDeviceName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [a1 objectForKeyedSubscript:@"lastEditorName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 dataUsingEncoding:4];
    id v15 = 0;
    v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v15];
    id v5 = v15;
    objc_opt_class();
    uint64_t v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"type"];
    int v8 = [v7 isEqualToString:@"device"];

    if (v8)
    {
      BOOL v9 = [v4 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v6 = [v4 objectForKeyedSubscript:@"name"];
        goto LABEL_10;
      }
      id v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v14 = [a1 recordID];
        *(_DWORD *)buf = 138412802;
        v17 = v14;
        __int16 v18 = 2112;
        v19 = v4;
        __int16 v20 = 2112;
        char v21 = v11;
        _os_log_fault_impl(&dword_1D353B000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid lastEditorDeviceName on %@: %@%@", buf, 0x20u);
      }
    }
    uint64_t v6 = 0;
LABEL_10:

    if (v6) {
      goto LABEL_12;
    }
  }
  uint64_t v6 = [a1 modifiedByDevice];
LABEL_12:

  return v6;
}

- (void)sqliteBind:()BRCItemAdditions index:
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (id)rootDirectoryRecordForZoneID:()BRCItemAdditions
{
  id v3 = a3;
  v4 = [@"directory/" stringByAppendingString:@"root"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v4 zoneID:v3];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"structure" recordID:v5];
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] data];
  int v8 = [v6 encryptedValues];
  [v8 setObject:v7 forKeyedSubscript:@"encryptedBasename"];

  BOOL v9 = [MEMORY[0x1E4F1C9B8] data];
  [v6 setObject:v9 forKeyedSubscript:@"basehash"];

  id v10 = [NSNumber numberWithLong:time(0)];
  [v6 setObject:v10 forKeyedSubscript:@"birthtime"];

  [v6 serializeSystemFields:0];
  return v6;
}

+ (id)rootAppLibraryRecordForAppLibraryID:()BRCItemAdditions zoneID:
{
  id v5 = a3;
  id v6 = a4;
  if (!v5
    || ([v5 isCloudDocsMangledID] & 1) != 0
    || ([v5 isDesktopMangledID] & 1) != 0
    || ([v5 isDocumentsMangledID] & 1) != 0
    || [v5 isShared])
  {
    uint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[CKRecord(BRCItemAdditions) rootAppLibraryRecordForAppLibraryID:zoneID:]();
    }

    BOOL v9 = 0;
  }
  else
  {
    id v11 = [v5 appLibraryOrZoneName];
    v12 = [v11 stringByReplacingOccurrencesOfString:@"." withString:@"~"];
    int v13 = [v12 stringByAppendingString:@"_Data"];

    v14 = [v13 dataUsingEncoding:4];
    id v15 = [v5 appLibraryOrZoneName];
    v24 = [@"directory/appData_" stringByAppendingString:v15];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v24 zoneID:v6];
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"structure" recordID:v16];
    v17 = [@"directory/" stringByAppendingString:@"root"];
    __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v17 zoneID:v6];
    id v19 = objc_alloc(MEMORY[0x1E4F1A348]);
    __int16 v20 = (void *)[v19 initWithRecordID:v18 action:*MEMORY[0x1E4F19D98]];
    char v21 = [v9 encryptedValues];
    [v21 setObject:v14 forKeyedSubscript:@"encryptedBasename"];

    uint64_t v22 = objc_msgSend(v13, "brc_SHA256");
    [v9 setObject:v22 forKeyedSubscript:@"basehash"];

    uint64_t v23 = [NSNumber numberWithLong:time(0)];
    [v9 setObject:v23 forKeyedSubscript:@"birthtime"];

    [v9 setObject:v20 forKeyedSubscript:@"parent"];
    [v9 serializeSystemFields:0];
  }
  return v9;
}

+ (id)desiredKeysWithMask:()BRCItemAdditions
{
  v26[25] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  v4 = (void *)desiredKeysWithMask__cache;
  id v5 = [NSNumber numberWithUnsignedShort:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  if (v6) {
    goto LABEL_16;
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    v26[0] = @"encryptedBasename";
    v26[1] = @"bounceNo";
    v26[2] = @"extension";
    v26[3] = @"parent";
    v26[4] = @"target";
    v26[5] = @"exactBirthtime";
    v26[6] = @"birthtime";
    v26[7] = @"lastOpenTime";
    v26[8] = @"favoriteRank";
    v26[9] = @"hiddenExt";
    v26[10] = @"executable";
    v26[11] = @"writable";
    v26[12] = @"exactMtime";
    v26[13] = @"mtime";
    v26[14] = @"finderTags";
    v26[15] = @"restorePath";
    v26[16] = @"restoreParent";
    v26[17] = @"targetPath";
    v26[18] = @"ftags";
    v26[19] = @"exactSize";
    v26[20] = @"size";
    v26[21] = @"shareReference";
    uint64_t v7 = *MEMORY[0x1E4F19DD0];
    v26[22] = @"countMetrics";
    v26[23] = v7;
    v26[24] = *MEMORY[0x1E4F19DC8];
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:25];
    [v6 addObjectsFromArray:v8];
  }
  if ((a3 & 0xC) != 0)
  {
    v25[0] = @"fileContent";
    v25[1] = @"bookmarkContent";
    v25[2] = @"pkgSignature";
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
    [v6 addObjectsFromArray:v9];
  }
  if ((a3 & 4) != 0)
  {
    v24[0] = @"pkgContent";
    v24[1] = @"pkgManifest";
    v24[2] = @"pkgXattrs";
    __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    [v6 addObjectsFromArray:v18];

    if ((a3 & 8) == 0)
    {
LABEL_8:
      if ((a3 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_8;
  }
  v23[0] = @"ignorePkgExtension";
  v23[1] = @"lastEditorName";
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v6 addObjectsFromArray:v19];

  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  v22[0] = @"thumb1024";
  v22[1] = @"thumbQLMetadata";
  __int16 v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v6 addObjectsFromArray:v20];

  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    [v6 addObject:@"basehash"];
    if ((a3 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_22:
  [v6 addObject:@"xattr"];
  [v6 addObject:@"xattrSignature"];
  if ((a3 & 0x40) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((a3 & 0x80) != 0)
  {
LABEL_12:
    uint64_t v10 = *MEMORY[0x1E4F19DF8];
    v21[0] = *MEMORY[0x1E4F19E00];
    v21[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v6 addObjectsFromArray:v11];
  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  v12 = (void *)desiredKeysWithMask__cache;
  if (!desiredKeysWithMask__cache)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = (void *)desiredKeysWithMask__cache;
    desiredKeysWithMask__cache = (uint64_t)v13;

    v12 = (void *)desiredKeysWithMask__cache;
  }
  id v15 = [NSNumber numberWithUnsignedShort:a3];
  [v12 setObject:v6 forKeyedSubscript:v15];

  os_unfair_lock_unlock((os_unfair_lock_t)&desiredKeysWithMask__lock);
LABEL_16:
  id v16 = v6;

  return v16;
}

- (uint64_t)sanitizeShortTokenFields
{
  [a1 setBaseToken:0];
  [a1 setRoutingKey:0];
  return [a1 setMutableEncryptedPublicSharingKeyData:0];
}

+ (uint64_t)_validateCKObject:()BRCItemAdditions enhancedDrivePrivacyEnabled:
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v6 = [v5 assetTransferOptions];
      uint64_t v7 = [v6 useMMCSEncryptionV2];
      int v8 = [v7 BOOLValue];

      BOOL v9 = +[BRCUserDefaults defaultsForMangledID:0];
      LODWORD(v7) = [v9 supportsEnhancedDrivePrivacy];

      uint64_t v10 = (v8 | ~a4) & (v7 | v8 ^ 1);
    }
    else
    {
      id v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[CKRecord(BRCItemAdditions) _validateCKObject:enhancedDrivePrivacyEnabled:]();
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (uint64_t)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:
{
  v76[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F594E8]);
  uint64_t v7 = [a1 recordID];
  int v8 = [v7 zoneID];
  uint64_t v9 = [v6 initWithRecordZoneID:v8];

  v54 = (void *)v9;
  uint64_t v10 = [v5 clientZoneByMangledID:v9];
  uint64_t v11 = [v10 enhancedDrivePrivacyEnabled];

  v76[0] = @"xattr";
  v76[1] = @"pkgManifest";
  v76[2] = @"fileContent";
  v76[3] = @"bookmarkContent";
  v76[4] = @"thumb1024";
  v76[5] = @"pkgContent";
  v76[6] = @"pkgXattrs";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:7];
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v62;
    *(void *)&long long v14 = 138412546;
    long long v51 = v14;
    id v52 = v5;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v62 != v16) {
        objc_enumerationMutation(obj);
      }
      __int16 v18 = *(void **)(*((void *)&v61 + 1) + 8 * v17);
      id v19 = (void *)MEMORY[0x1E4F1A2D8];
      __int16 v20 = objc_msgSend(a1, "objectForKeyedSubscript:", v18, v51);
      LOBYTE(v19) = [v19 _validateCKObject:v20 enhancedDrivePrivacyEnabled:v11];

      if ((v19 & 1) == 0) {
        break;
      }
      if (v11)
      {
        if (([v18 isEqualToString:@"xattr"] & 1) == 0)
        {
          char v21 = [a1 objectForKeyedSubscript:v18];

          if (v21)
          {
            [v18 isEqualToString:@"pkgContent"];
            uint64_t v22 = [a1 objectForKeyedSubscript:v18];
            uint64_t v23 = [v22 boundaryKey];

            if (([v55 containsObject:v23] & 1) == 0)
            {
              if ([v55 count])
              {
                brc_bread_crumbs();
                v24 = (char *)objc_claimAutoreleasedReturnValue();
                uint64_t v25 = brc_default_log();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = v51;
                  v68 = v18;
                  __int16 v69 = 2112;
                  v70 = v24;
                  _os_log_fault_impl(&dword_1D353B000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has different boundary key then other assets in the record!%@", buf, 0x16u);
                }

                id v5 = v52;
              }
              else
              {
                [v55 addObject:v23];
              }
            }
          }
        }
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
    v34 = brc_bread_crumbs();
    __int16 v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = "";
      __int16 v37 = " not";
      if (!v11) {
        __int16 v37 = "";
      }
      *(_DWORD *)buf = 138413058;
      v68 = v18;
      __int16 v69 = 2080;
      v70 = v37;
      if (!v11) {
        v36 = "n't";
      }
      __int16 v71 = 2080;
      v72 = v36;
      __int16 v73 = 2112;
      v74 = v34;
      _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is%s in mmcsV2 when it should%s be%@", buf, 0x2Au);
    }

    if (a4)
    {
      v38 = (void *)MEMORY[0x1E4F28C58];
      id v32 = [a1 objectForKeyedSubscript:v18];
      objc_msgSend(v38, "brc_errorInvalidParameter:value:", v18, v32);
      uint64_t v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = obj;
      goto LABEL_53;
    }
    uint64_t v33 = 0;
    id v26 = obj;
    goto LABEL_35;
  }
LABEL_19:

  v66[0] = @"mtime";
  v66[1] = @"birthtime";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  if (v11)
  {
    id v27 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v28 = [v27 timestampRoundingAmount];

    if (v28 > 0x3B)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v32 = v26;
      uint64_t v41 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v58;
        while (2)
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v58 != v43) {
              objc_enumerationMutation(v32);
            }
            v45 = [a1 objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * i)];
            if ([v45 unsignedLongLongValue] % (unint64_t)v28)
            {
              v46 = brc_bread_crumbs();
              v47 = brc_default_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
                -[CKRecord(BRCItemAdditions) validateEnhancedDrivePrivacyFieldsWithSession:error:]();
              }

              if (a4)
              {
                v48 = (void *)MEMORY[0x1E4F28C58];
                v49 = [NSNumber numberWithUnsignedInt:v28];
                objc_msgSend(v48, "brc_errorInvalidParameter:value:", @"rounding amount", v49);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v33 = 0;
              goto LABEL_52;
            }
          }
          uint64_t v42 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
          uint64_t v33 = 1;
          if (v42) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v33 = 1;
      }
LABEL_52:
      id v26 = v32;
      goto LABEL_53;
    }
    char v29 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[CKRecord(BRCItemAdditions) validateEnhancedDrivePrivacyFieldsWithSession:error:]();
    }

    if (a4)
    {
      id v31 = (void *)MEMORY[0x1E4F28C58];
      id v32 = [NSNumber numberWithUnsignedInt:v28];
      objc_msgSend(v31, "brc_errorInvalidParameter:value:", @"rounding amount", v32);
      uint64_t v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
      uint64_t v39 = v54;
      v40 = v55;

      goto LABEL_54;
    }
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 1;
  }
LABEL_35:
  uint64_t v39 = v54;
  v40 = v55;
LABEL_54:

  return v33;
}

- (void)brc_fillWithChildBasehashSalt:()BRCItemAdditions
{
  id v13 = a3;
  v4 = +[BRCUserDefaults defaultsForMangledID:0];
  int v5 = [v4 supportsEnhancedDrivePrivacy];

  if (v13 && v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateBogusKey");
    int v7 = [v13 isEqualToData:v6];

    if (v7)
    {
      int v8 = [a1 pluginFields];
      if (v8)
      {
        uint64_t v9 = [a1 pluginFields];
        uint64_t v10 = (void *)[v9 mutableCopy];
      }
      else
      {
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }

      [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"br_bougusSaltingKey"];
      [a1 setPluginFields:v10];
    }
    uint64_t v11 = [a1 encryptedValues];
    [v11 setObject:v13 forKeyedSubscript:@"childBasehashSalt"];

    v12 = objc_msgSend(v13, "brc_truncatedSHA256");
    [a1 setObject:v12 forKeyedSubscript:@"childBasehashSaltValidationKey"];
  }
}

+ (void)rootAppLibraryRecordForAppLibraryID:()BRCItemAdditions zoneID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: rootAppLibraryRecordForAppLibraryID: should not be called with a bogus app library id %@%@");
}

+ (void)_validateCKObject:()BRCItemAdditions enhancedDrivePrivacyEnabled:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: CKObject of unexpected type - %@%@");
}

- (void)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Rounding amount should be at least 1 minute%@", v2, v3, v4, v5, v6);
}

- (void)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: %@ is not rounded the correct amount%@");
}

@end