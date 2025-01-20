@interface BRCDownloadThumbnail
- (BOOL)_stageWithSession:(id)a3 error:(id *)a4;
- (BRCDownloadThumbnail)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5;
- (id)description;
- (int)kind;
@end

@implementation BRCDownloadThumbnail

- (int)kind
{
  return 1;
}

- (BRCDownloadThumbnail)initWithDocument:(id)a3 stageID:(id)a4 etag:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BRCDownloadThumbnail;
  v10 = [(BRCDownload *)&v14 initWithDocument:v8 stageID:a4];
  if (v10)
  {
    v11 = [v8 desiredVersion];

    if (v11) {
      [v8 desiredVersion];
    }
    else {
    v12 = [v8 currentVersion];
    }
    v10->super._totalSize = [v12 thumbnailSize];

    objc_storeStrong((id *)&v10->super._etag, a5);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<dl-thumbnail[%lld] %@_%@>", self->super._throttleID, self->super._itemID, self->super._etag];
}

- (BOOL)_stageWithSession:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = [a3 stageRegistry];
  p_record = &self->super._record;
  id v8 = [(CKRecord *)self->super._record objectForKeyedSubscript:@"thumb1024"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v8 fileURL], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = [v6 createURLForDownloadWithStageID:self->super._stageID name:@"thumbnail"];
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [v8 fileURL];
    char v13 = [v11 moveItemAtURL:v12 toURL:v10 error:a4];
  }
  else
  {
    objc_super v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCDownloadThumbnail _stageWithSession:error:](p_record);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: thumbnail is not a CKAsset: %@", *p_record);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v21 = "-[BRCDownloadThumbnail _stageWithSession:error:]";
        __int16 v22 = 2080;
        if (!a4) {
          v19 = "(ignored by caller)";
        }
        v23 = v19;
        __int16 v24 = 2112;
        id v25 = v10;
        __int16 v26 = 2112;
        v27 = v16;
        _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4)
    {
      id v10 = v10;
      char v13 = 0;
      *a4 = v10;
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (void)_stageWithSession:(void *)a1 error:.cold.1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: thumbnail is not a CKAsset: %@%@", (void)v3, DWORD2(v3));
}

@end