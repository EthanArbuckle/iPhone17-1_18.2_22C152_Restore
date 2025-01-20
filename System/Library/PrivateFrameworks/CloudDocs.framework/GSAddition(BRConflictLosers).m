@interface GSAddition(BRConflictLosers)
- (BOOL)_br_markResolvedWithError:()BRConflictLosers;
- (id)br_lastEditorDeviceName;
- (id)br_lastEditorName;
- (id)br_lastEditorNameComponents;
- (uint64_t)br_markResolvedWithError:()BRConflictLosers;
- (void)br_lastEditorDeviceName;
- (void)br_lastEditorName;
- (void)br_lastEditorNameComponents;
@end

@implementation GSAddition(BRConflictLosers)

- (BOOL)_br_markResolvedWithError:()BRConflictLosers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel__br_markResolvedWithError_);
    v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]", 35);
      v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a3) {
          v21 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        v39 = v5;
        LOWORD(v40) = 2112;
        *(void *)((char *)&v40 + 2) = v6;
        _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v5;
    }

    return 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__7;
    *(void *)&long long v40 = __Block_byref_object_dispose__7;
    *((void *)&v40 + 1) = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = [a1 storage];
    v37 = a1;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __58__GSAddition_BRConflictLosers___br_markResolvedWithError___block_invoke;
    v26 = &unk_1E59AEB60;
    v28 = buf;
    v12 = v9;
    v27 = v12;
    [v10 removeAdditions:v11 completionHandler:&v23];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = *(void **)(*(void *)&buf[8] + 40);
    BOOL v8 = v13 == 0;
    if (v13)
    {
      id v14 = v13;
      v15 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]", 49);
      v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)v29 = 136315906;
        v30 = "-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]";
        __int16 v31 = 2080;
        if (!a3) {
          v22 = "(ignored by caller)";
        }
        v32 = v22;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        v36 = v15;
        _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v29, 0x2Au);
      }

      if (a3) {
        *a3 = v14;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F28CA0];
      objc_msgSend(a1, "storage", v23, v24, v25, v26);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v18 = [v14 documentURL];
      v19 = [a1 name];
      objc_msgSend(v17, "__itemAtURL:didResolveConflictVersionWithClientID:name:purposeID:", v18, *MEMORY[0x1E4F63BD0], v19, 0);
    }
    _Block_object_dispose(buf, 8);
  }
  return v8;
}

- (uint64_t)br_markResolvedWithError:()BRConflictLosers
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_resolveConflictWithName_atURL_reply_);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_markResolvedWithError:]", 73);
      v7 = brc_default_log(0);
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[GSAddition(BRConflictLosers) br_markResolvedWithError:]";
        __int16 v26 = 2080;
        if (!a3) {
          v20 = "(ignored by caller)";
        }
        v27 = v20;
        __int16 v28 = 2112;
        id v29 = v5;
        __int16 v30 = 2112;
        __int16 v31 = v6;
        _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3)
    {
      id v5 = v5;
      uint64_t v8 = 0;
      *a3 = v5;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    dispatch_semaphore_t v9 = +[BRDaemonConnection defaultConnection];
    v10 = (void *)[v9 newLegacySyncProxy];

    v11 = [a1 name];
    v12 = [a1 storage];
    v13 = [v12 documentURL];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__GSAddition_BRConflictLosers__br_markResolvedWithError___block_invoke;
    v22[3] = &unk_1E59AD448;
    id v5 = v10;
    id v23 = v5;
    [v5 resolveConflictWithName:v11 atURL:v13 reply:v22];

    id v14 = (id)[v5 result];
    v15 = [v5 error];
    if (v15)
    {
      v16 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_markResolvedWithError:]", 82);
      v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[GSAddition(BRConflictLosers) br_markResolvedWithError:]";
        __int16 v26 = 2080;
        if (!a3) {
          v21 = "(ignored by caller)";
        }
        v27 = v21;
        __int16 v28 = 2112;
        id v29 = v15;
        __int16 v30 = 2112;
        __int16 v31 = v16;
        _os_log_error_impl(&dword_19ED3F000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v15;
    }

    v18 = [v5 error];

    if (v18) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = objc_msgSend(a1, "_br_markResolvedWithError:", a3);
    }
  }
  return v8;
}

- (id)br_lastEditorDeviceName
{
  if (BRIsFPFSEnabled(a1, a2))
  {
    v3 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorDeviceName]", 97);
    v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      -[GSAddition(BRConflictLosers) br_lastEditorDeviceName]();
    }

    id v5 = 0;
  }
  else
  {
    v6 = [a1 userInfo];
    id v5 = [v6 objectForKey:@"BRConflictLosersLastEditorDeviceNameKey"];
  }

  return v5;
}

- (id)br_lastEditorName
{
  if (BRIsFPFSEnabled(a1, a2))
  {
    v3 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorName]", 107);
    v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      -[GSAddition(BRConflictLosers) br_lastEditorName]();
    }

    id v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "br_lastEditorNameComponents");
    id v5 = objc_msgSend(v6, "br_formattedName");
  }

  return v5;
}

- (id)br_lastEditorNameComponents
{
  if (BRIsFPFSEnabled(a1, a2))
  {
    v3 = brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorNameComponents]", 117);
    v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      -[GSAddition(BRConflictLosers) br_lastEditorNameComponents]();
    }

    id v5 = 0;
  }
  else
  {
    v6 = [a1 userInfo];
    v7 = [v6 objectForKey:@"BRConflictLosersLastEditorNameComponentsKey"];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = (objc_class *)MEMORY[0x1E4F28DC0];
      id v9 = v7;
      v10 = (void *)[[v8 alloc] initForReadingFromData:v9 error:0];

      id v5 = [v10 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)br_lastEditorDeviceName
{
  v0 = NSStringFromSelector(sel_br_lastEditorDeviceName);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_19ED3F000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);
}

- (void)br_lastEditorName
{
  v0 = NSStringFromSelector(sel_br_lastEditorName);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_19ED3F000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);
}

- (void)br_lastEditorNameComponents
{
  v0 = NSStringFromSelector(sel_br_lastEditorNameComponents);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_19ED3F000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);
}

@end