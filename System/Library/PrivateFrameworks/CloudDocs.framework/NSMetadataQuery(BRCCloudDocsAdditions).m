@interface NSMetadataQuery(BRCCloudDocsAdditions)
- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions;
- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions searchScopes:;
- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions;
- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions searchScopes:;
- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions;
- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions searchScopes:;
@end

@implementation NSMetadataQuery(BRCCloudDocsAdditions)

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions searchScopes:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 isFileURL])
  {
    v23 = brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:]", 86);
    v24 = brc_default_log(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:]();
    }

    v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    v32 = @"url";
    v27 = v6;
    if (!v6)
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
    }
    v33 = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v29 = [v25 exceptionWithName:v26 reason:@"invalid url" userInfo:v28];

    if (!v6) {
    objc_exception_throw(v29);
    }
  }
  id v8 = v6;
  if (BRIsFPFSEnabled(v8, v9))
  {
    v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = *MEMORY[0x1E4F286E0];
    v12 = [v8 path];
    v13 = [v10 predicateWithFormat:@"%K.URLByDeletingLastPathComponent.path = %@", v11, v12];
  }
  else
  {
    id v31 = 0;
    uint64_t v14 = *MEMORY[0x1E4F1CDD0];
    id v30 = 0;
    char v15 = [v8 getResourceValue:&v31 forKey:v14 error:&v30];
    id v16 = v31;
    id v17 = v30;
    if (v15)
    {
      v18 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v19 = *MEMORY[0x1E4F286E0];
      v20 = [v8 path];
      v13 = [v18 predicateWithFormat:@"%K = %@ OR %K.URLByDeletingLastPathComponent.path = %@", @"BRMetadataItemParentFileIDKey", v16, v19, v20];
    }
    else
    {
      v20 = brc_bread_crumbs((uint64_t)"predicateForChildrenOfURL", 41);
      v21 = brc_default_log(0);
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v35 = v8;
        __int16 v36 = 2112;
        id v37 = v17;
        __int16 v38 = 2112;
        v39 = v20;
        _os_log_error_impl(&dword_19ED3F000, v21, (os_log_type_t)0x90u, "[ERROR] can't create predicate for %@: %@%@", buf, 0x20u);
      }

      v13 = 0;
    }
  }
  [a1 setPredicate:v13];

  v22 = (void *)[v7 copy];
  [a1 setSearchScopes:v22];
}

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28638];
  uint64_t v8 = *MEMORY[0x1E4F28640];
  uint64_t v9 = v4;
  uint64_t v10 = *MEMORY[0x1E4F28610];
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v8 count:3];
  objc_msgSend(a1, "br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:", v6, v7, v8, v9, v10, v11);
}

- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions searchScopes:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 isFileURL];
  if (v8)
  {
    uint64_t v9 = [v6 path];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      id v11 = v6;
      if (BRIsFPFSEnabled(v11, v12))
      {
        v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v14 = *MEMORY[0x1E4F286E0];
        char v15 = [v11 path];
        id v16 = [v13 predicateWithFormat:@"%K.path = %@", v14, v15];

LABEL_20:
        [a1 setPredicate:v16];

        id v31 = (void *)[v7 copy];
        [a1 setSearchScopes:v31];

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(v11, "br_addPhysicalProperty");
      v23 = objc_msgSend(v11, "br_physicalURL");
      id v34 = 0;
      v24 = +[BRFileObjectID fileObjectIDForURL:v23 allocateDocID:1 error:&v34];
      id v25 = v34;

      if (v24)
      {
        uint64_t v26 = (void *)MEMORY[0x1E4F28F60];
        id v27 = v25;
        uint64_t v28 = *MEMORY[0x1E4F286E0];
        [v11 path];
        uint64_t v33 = v28;
        id v29 = v25 = v27;
        id v16 = [v26 predicateWithFormat:@"%K = %@ OR %K.path = %@", @"BRMetadataItemFileObjectIdentifierKey", v24, v33, v29];
      }
      else
      {
        if (objc_msgSend(v25, "br_isCocoaErrorCode:", 260))
        {
          id v16 = 0;
LABEL_19:

          goto LABEL_20;
        }
        id v29 = brc_bread_crumbs((uint64_t)"predicateForURL", 66);
        id v30 = brc_default_log(0);
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v38 = v11;
          __int16 v39 = 2112;
          id v40 = v25;
          __int16 v41 = 2112;
          v42 = v29;
          _os_log_error_impl(&dword_19ED3F000, v30, (os_log_type_t)0x90u, "[ERROR] can't get create predicate for %@: %@%@", buf, 0x20u);
        }

        id v16 = 0;
      }

      goto LABEL_19;
    }
  }
  else
  {
    id v17 = brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringItemAtURL:searchScopes:]", 105);
    v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:]();
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    id v35 = @"url";
    uint64_t v10 = v6;
    if (!v6)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    }
    __int16 v36 = v10;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v22 = [v19 exceptionWithName:v20 reason:@"invalid url" userInfo:v21];
    [v22 raise];

    if (!v6) {
      goto LABEL_21;
    }
  }
  uint64_t v8 = 0;
LABEL_22:

  return v8;
}

- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28638];
  uint64_t v10 = *MEMORY[0x1E4F28640];
  uint64_t v11 = v4;
  uint64_t v12 = *MEMORY[0x1E4F28610];
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v10 count:3];
  uint64_t v8 = objc_msgSend(a1, "br_setupForMonitoringItemAtURL:searchScopes:", v6, v7, v10, v11, v12, v13);

  return v8;
}

- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions searchScopes:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 isFileURL];
  if (v8)
  {
    uint64_t v9 = [v6 path];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      id v11 = v6;
      if (BRIsFPFSEnabled(v11, v12))
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v14 = *MEMORY[0x1E4F286E0];
        char v15 = [v11 path];
        id v16 = [v13 predicateWithFormat:@"%K.URLByDeletingLastPathComponent.path = %@", v14, v15];
      }
      else
      {
        id v38 = 0;
        uint64_t v23 = *MEMORY[0x1E4F1CDD0];
        id v37 = 0;
        char v24 = [v11 getResourceValue:&v38 forKey:v23 error:&v37];
        id v25 = v38;
        id v26 = v37;
        id v27 = v26;
        if (v24)
        {
          __int16 v36 = (void *)MEMORY[0x1E4F28F60];
          id v28 = v25;
          id v29 = v26;
          uint64_t v30 = *MEMORY[0x1E4F286E0];
          id v31 = [v11 path];
          uint64_t v35 = v30;
          id v27 = v29;
          id v25 = v28;
          id v16 = [v36 predicateWithFormat:@"%K = %@ OR %K.URLByDeletingLastPathComponent.path = %@", @"BRMetadataItemParentFileIDKey", v28, v35, v31];
        }
        else
        {
          id v31 = brc_bread_crumbs((uint64_t)"predicateForChildrenOfURL", 41);
          v32 = brc_default_log(0);
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            id v42 = v11;
            __int16 v43 = 2112;
            v44 = v27;
            __int16 v45 = 2112;
            v46 = v31;
            _os_log_error_impl(&dword_19ED3F000, v32, (os_log_type_t)0x90u, "[ERROR] can't create predicate for %@: %@%@", buf, 0x20u);
          }

          id v16 = 0;
        }
      }
      [a1 setPredicate:v16];

      uint64_t v33 = (void *)[v7 copy];
      [a1 setSearchScopes:v33];

LABEL_18:
      goto LABEL_19;
    }
  }
  else
  {
    id v17 = brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfItemAtURL:searchScopes:]", 135);
    v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:]();
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    __int16 v39 = @"url";
    uint64_t v10 = v6;
    if (!v6)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    }
    id v40 = v10;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v22 = [v19 exceptionWithName:v20 reason:@"invalid url" userInfo:v21];
    [v22 raise];

    if (!v6) {
      goto LABEL_18;
    }
  }
  uint64_t v8 = 0;
LABEL_19:

  return v8;
}

- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28638];
  uint64_t v10 = *MEMORY[0x1E4F28640];
  uint64_t v11 = v4;
  uint64_t v12 = *MEMORY[0x1E4F28610];
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:&v10 count:3];
  uint64_t v8 = objc_msgSend(a1, "br_setupForMonitoringChildrenOfItemAtURL:searchScopes:", v6, v7, v10, v11, v12, v13);

  return v8;
}

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions searchScopes:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: invalid url %@%@");
}

@end