@interface NSURL(FPConflictWinner)
- (BOOL)shouldBeForwardedToFileProvider;
- (id)fp_addTestConflictLoserFromItemAtURL:()FPConflictWinner lastEditorDeviceName:lastEditorUserName:error:;
- (id)fp_lastEditorDeviceName;
- (id)fp_lastEditorNameComponents;
@end

@implementation NSURL(FPConflictWinner)

- (BOOL)shouldBeForwardedToFileProvider
{
  v1 = objc_msgSend(a1, "fp_fpfsRootURL");
  v2 = [v1 path];

  if (!v2 && !CloudDocsLibrary_0())
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[GSAddition(FPVersions) shouldBeForwardedToFileProvider](v3);
    }
  }
  return v2 != 0;
}

- (id)fp_lastEditorDeviceName
{
  if ([a1 shouldBeForwardedToFileProvider])
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__20;
    v10 = __Block_byref_object_dispose__20;
    id v11 = 0;
    v2 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__NSURL_FPConflictWinner__fp_lastEditorDeviceName__block_invoke;
    v5[3] = &unk_1E5AF4BB0;
    v5[4] = &v6;
    [v2 itemForURL:a1 completionHandler:v5];

    id v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    objc_msgSend(a1, "br_lastEditorDeviceName");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)fp_lastEditorNameComponents
{
  if ([a1 shouldBeForwardedToFileProvider])
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__20;
    v10 = __Block_byref_object_dispose__20;
    id v11 = 0;
    v2 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__NSURL_FPConflictWinner__fp_lastEditorNameComponents__block_invoke;
    v5[3] = &unk_1E5AF4BB0;
    v5[4] = &v6;
    [v2 itemForURL:a1 completionHandler:v5];

    id v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    objc_msgSend(a1, "br_lastEditorNameComponents");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)fp_addTestConflictLoserFromItemAtURL:()FPConflictWinner lastEditorDeviceName:lastEditorUserName:error:
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v33 = a4;
  id v34 = a5;
  CloudDocsLibrary_0();
  v10 = [MEMORY[0x1E4F63BE8] manager];
  id v11 = [v10 permanentStorageForItemAtURL:a1 allocateIfNone:1 error:a6];

  id v12 = objc_alloc(MEMORY[0x1E4F28F30]);
  v13 = [NSFileProviderItemVersion alloc];
  v14 = [MEMORY[0x1E4F1C9B8] data];
  v15 = [MEMORY[0x1E4F1C9B8] data];
  v35 = [(NSFileProviderItemVersion *)v13 initWithContentVersion:v14 metadataVersion:v15];

  v16 = [MEMORY[0x1E4F1C9C8] now];
  v17 = [FPConflictLoser alloc];
  v18 = [v36 lastPathComponent];
  v32 = [(FPFileVersion *)v17 initWithVersion:v35 displayName:v18 originalURL:v36 physicalURL:0 identifier:0 modificationDate:v16 lastEditorNameComponents:v12 size:0];

  uint64_t v19 = MEMORY[0x1E4F1CC38];
  v56 = v16;
  v57[0] = @"isFPFS";
  v57[1] = @"NSDocumentInfo";
  v58[0] = MEMORY[0x1E4F1CC38];
  v55 = @"modificationDate";
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v58[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

  v53[0] = *MEMORY[0x1E4F63B88];
  v22 = [v36 lastPathComponent];
  uint64_t v23 = *MEMORY[0x1E4F63B80];
  v54[0] = v22;
  v54[1] = v19;
  uint64_t v24 = *MEMORY[0x1E4F63BB0];
  v53[1] = v23;
  v53[2] = v24;
  v53[3] = *MEMORY[0x1E4F63B90];
  uint64_t v25 = *MEMORY[0x1E4F63BD0];
  v54[2] = v21;
  v54[3] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];

  v27 = dispatch_group_create();
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__20;
  v51 = __Block_byref_object_dispose__20;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__20;
  v45 = __Block_byref_object_dispose__20;
  id v46 = 0;
  v28 = [v11 prepareAdditionCreationWithItemAtURL:v36 byMoving:1 creationInfo:v26 error:a6];
  dispatch_group_enter(v27);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __110__NSURL_FPConflictWinner__fp_addTestConflictLoserFromItemAtURL_lastEditorDeviceName_lastEditorUserName_error___block_invoke;
  v37[3] = &unk_1E5AF4BD8;
  v39 = &v41;
  v40 = &v47;
  v29 = v27;
  v38 = v29;
  [v11 createAdditionStagedAtURL:v28 creationInfo:v26 completionHandler:v37];
  dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  if (a6) {
    *a6 = (id) v42[5];
  }
  id v30 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

@end