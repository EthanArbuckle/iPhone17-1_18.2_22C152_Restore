@interface _SFRequestDesktopSiteQuirksSnapshot
- (_SFRequestDesktopSiteQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)allRequestDesktopSiteQuirks;
- (id)requestDesktopSiteSettingForDomain:(id)a3;
- (id)snapshotData;
@end

@implementation _SFRequestDesktopSiteQuirksSnapshot

- (_SFRequestDesktopSiteQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFRequestDesktopSiteQuirksSnapshot;
  v7 = [(_SFRequestDesktopSiteQuirksSnapshot *)&v27 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "safari_dictionaryForKey:", @"RequestDesktopSiteQuirks");
      v11 = v10;
      if (v10)
      {
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2020000000;
        char v26 = 1;
        uint64_t v17 = 0;
        v18 = &v17;
        uint64_t v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__6;
        v21 = __Block_byref_object_dispose__6;
        id v22 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke;
        v16[3] = &unk_1E5C76998;
        v16[4] = &v17;
        v16[5] = &v23;
        [v10 enumerateKeysAndObjectsUsingBlock:v16];
        if (*((unsigned char *)v24 + 24))
        {
          objc_storeStrong((id *)&v7->_requestDesktopSiteQuirks, v11);
          v12 = v7;
        }
        else
        {
          v12 = 0;
          if (a4) {
            *a4 = (id) v18[5];
          }
        }
        _Block_object_dispose(&v17, 8);

        _Block_object_dispose(&v23, 8);
        goto LABEL_16;
      }
      v14 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[_SFRequestDesktopSiteQuirksSnapshot initWithSnapshotData:error:](v14);
        if (a4) {
          goto LABEL_12;
        }
      }
      else if (a4)
      {
LABEL_12:
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
      v12 = 0;
      goto LABEL_16;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_SFRequestDesktopSiteQuirksSnapshot initWithSnapshotData:error:](v13);
      if (a4) {
        goto LABEL_9;
      }
    }
    else if (a4)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)requestDesktopSiteSettingForDomain:(id)a3
{
  return [(NSDictionary *)self->_requestDesktopSiteQuirks objectForKeyedSubscript:a3];
}

- (id)allRequestDesktopSiteQuirks
{
  return self->_requestDesktopSiteQuirks;
}

- (id)snapshotData
{
  v7[2] = *MEMORY[0x1E4F143B8];
  requestDesktopSiteQuirks = self->_requestDesktopSiteQuirks;
  v6[0] = @"RequestDesktopSiteQuirks";
  v6[1] = @"Version";
  v7[0] = requestDesktopSiteQuirks;
  v7[1] = &unk_1EFBDEE00;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to load request desktop site quirks", v1, 2u);
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to find RequestDesktopSiteQuirksKey array in quirks", v1, 2u);
}

@end