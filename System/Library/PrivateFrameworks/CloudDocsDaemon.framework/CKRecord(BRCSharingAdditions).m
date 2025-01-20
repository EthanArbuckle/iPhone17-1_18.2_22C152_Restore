@interface CKRecord(BRCSharingAdditions)
- (id)brc_sharedRootDisplayName;
- (id)brc_sharedRootExtension;
- (uint64_t)isFolderShare;
- (void)brc_updateWithLogicalName:()BRCSharingAdditions isFolder:;
@end

@implementation CKRecord(BRCSharingAdditions)

- (uint64_t)isFolderShare
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  uint64_t v2 = [v1 isEqual:*MEMORY[0x1E4F593B8]];

  return v2;
}

- (id)brc_sharedRootExtension
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  if ([v2 isEqualToString:*MEMORY[0x1E4F593B8]])
  {
    v3 = 0;
  }
  else
  {
    if (!v2)
    {
      v4 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
      v5 = brc_bread_crumbs();
      v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        v9 = v4;
        __int16 v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] share has no CKShareTypeKey, using extension from CKShareTitleKey (%@)%@", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(v4, "br_pathExtension");
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v2 = v2;
    v3 = v2;
  }

  return v3;
}

- (id)brc_sharedRootDisplayName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
  v3 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];

  if (v3)
  {
    if (v2)
    {
LABEL_3:
      v4 = objc_msgSend(v2, "brc_mangledNameFromURLFragment:", 0);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(v2, "brc_stringByDeletingPathExtension");

    id v2 = (void *)v5;
    if (v5) {
      goto LABEL_3;
    }
  }
  id v2 = [a1 URL];
  v6 = [v2 fragment];
  v4 = objc_msgSend(v6, "brc_mangledNameFromURLFragment:", 1);

LABEL_6:
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = _BRLocalizedStringWithFormat();

    int v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [a1 share];
      v11 = [v10 recordID];
      int v16 = 138412802;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v4;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't find document name for share %@ and can't extract it from URL; using '%@' as default%@",
        (uint8_t *)&v16,
        0x20u);
    }
  }
  uint64_t v12 = objc_msgSend(a1, "brc_sharedRootExtension");
  if (v12)
  {
    id v13 = [v4 stringByAppendingPathExtension:v12];
  }
  else
  {
    id v13 = v4;
  }
  v14 = v13;

  return v14;
}

- (void)brc_updateWithLogicalName:()BRCSharingAdditions isFolder:
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    int v8 = objc_msgSend(v6, "br_displayFilenameWithExtensionHidden:", 0);

    [a1 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    uint64_t v9 = *MEMORY[0x1E4F593B8];
    uint64_t v10 = *MEMORY[0x1E4F19DD0];
    [a1 setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    v11 = objc_msgSend(v6, "br_displayFilenameWithExtensionHidden:", 1);
    [a1 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F19DC8]];

    objc_msgSend(v7, "br_pathExtension");
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [a1 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  }
}

@end