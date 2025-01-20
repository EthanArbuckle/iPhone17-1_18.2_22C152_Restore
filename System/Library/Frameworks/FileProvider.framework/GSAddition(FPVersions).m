@interface GSAddition(FPVersions)
- (id)fp_etag;
- (id)fp_lastEditorDeviceName;
- (id)fp_lastEditorNameComponents;
- (uint64_t)fp_markResolvedWithError:()FPVersions;
- (uint64_t)shouldBeForwardedToFileProvider;
- (void)shouldBeForwardedToFileProvider;
@end

@implementation GSAddition(FPVersions)

- (uint64_t)shouldBeForwardedToFileProvider
{
  if (FPIsCloudDocsWithFPFSEnabled()) {
    return 1;
  }
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"isFPFS"];

  if (v3) {
    return 1;
  }
  if (!CloudDocsLibrary_0())
  {
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[GSAddition(FPVersions) shouldBeForwardedToFileProvider](v5);
    }
  }
  return 0;
}

- (uint64_t)fp_markResolvedWithError:()FPVersions
{
  if ([a1 shouldBeForwardedToFileProvider])
  {
    [a1 markSavedConflictAsResolved:1 error:a3];
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    id v16 = 0;
    v5 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v6 = [a1 storage];
    v7 = [v6 documentURL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__GSAddition_FPVersions__fp_markResolvedWithError___block_invoke;
    v10[3] = &unk_1E5AF29C0;
    v10[4] = &v11;
    [v5 resolveConflictAtURL:v7 completionHandler:v10];

    if (a3) {
      *a3 = (id) v12[5];
    }
    BOOL v8 = v12[5] == 0;

    _Block_object_dispose(&v11, 8);
    return v8;
  }
  else
  {
    return objc_msgSend(a1, "br_markResolvedWithError:", a3);
  }
}

- (id)fp_lastEditorDeviceName
{
  if ([a1 shouldBeForwardedToFileProvider])
  {
    v2 = [a1 userInfo];
    v3 = [v2 objectForKey:fpVersionLastEditorDeviceNameKey];
  }
  else
  {
    v3 = objc_msgSend(a1, "br_lastEditorDeviceName");
  }

  return v3;
}

- (id)fp_lastEditorNameComponents
{
  if ([a1 shouldBeForwardedToFileProvider])
  {
    v2 = [a1 userInfo];
    v3 = [v2 objectForKey:fpVersionLastEditorNameComponentsKey];

    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = (objc_class *)MEMORY[0x1E4F28DC0];
      id v5 = v3;
      v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:0];

      v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = objc_msgSend(a1, "br_lastEditorNameComponents");
  }

  return v7;
}

- (id)fp_etag
{
  v1 = [a1 name];
  v2 = +[FPFileVersion parseEtag:v1];

  return v2;
}

- (void)shouldBeForwardedToFileProvider
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Failed to dlopen CloudDocs Private Framework, process will most likely crash!", v1, 2u);
}

@end