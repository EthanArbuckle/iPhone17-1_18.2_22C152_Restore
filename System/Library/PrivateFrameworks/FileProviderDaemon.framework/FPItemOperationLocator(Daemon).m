@interface FPItemOperationLocator(Daemon)
- (id)startAccessingLocator;
- (void)annotateWithPersonaSandboxIfNeeded:()Daemon;
@end

@implementation FPItemOperationLocator(Daemon)

- (id)startAccessingLocator
{
  v1 = [a1 asFPItem];
  v2 = [v1 fileURL];

  if (v2 && [v2 startAccessingSecurityScopedResource])
  {
    v3 = (void *)MEMORY[0x1E4F25CB0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__FPItemOperationLocator_Daemon__startAccessingLocator__block_invoke;
    v6[3] = &unk_1E6A73FE8;
    id v7 = v2;
    v4 = [v3 tokenWithBlock:v6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 asFPItem];
  v6 = [v5 fileURL];

  id v7 = [a1 asFPItem];
  v8 = [v7 itemID];
  v9 = [v4 domainFromItemID:v8 reason:0];

  if (v6)
  {
    v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    v11 = [v10 currentPersona];

    id v38 = 0;
    v12 = [v11 userPersonaUniqueString];
    v13 = [v9 nsDomain];
    v14 = [v13 personaIdentifier];
    if (v12 == v14)
    {
    }
    else
    {
      v15 = [v9 nsDomain];
      v16 = [v15 personaIdentifier];
      char v17 = [v12 isEqualToString:v16];

      if ((v17 & 1) == 0 && voucher_process_can_use_arbitrary_personas())
      {
        id v37 = 0;
        v18 = (void *)[v11 copyCurrentPersonaContextWithError:&v37];
        id v19 = v37;
        id v20 = v38;
        id v38 = v18;

        if (v19)
        {
          v21 = fp_current_or_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[FPItemOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:]((uint64_t)v19, v21);
          }
        }
        v22 = [v9 nsDomain];
        v23 = [v22 personaIdentifier];
        v24 = [v11 generateAndRestorePersonaContextWithPersonaUniqueString:v23];

        if (v24)
        {
          v25 = fp_current_or_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v35 = [v9 nsDomain];
            v36 = [v35 personaIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v36;
            __int16 v42 = 2112;
            v43 = v24;
            _os_log_error_impl(&dword_1D744C000, v25, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);
          }
        }
        goto LABEL_19;
      }
    }
    v24 = 0;
LABEL_19:
    uint64_t v32 = *MEMORY[0x1E4F14008];
    *(void *)buf = 0;
    id v33 = v6;
    v34 = objc_msgSend(v33, "fp_issueSandboxExtensionOfClass:report:error:", v32, 0, buf);
    [MEMORY[0x1E4F25D78] assembleURL:v33 sandbox:v34 physicalURL:0 physicalSandbox:0];

    _FPRestorePersona();
    goto LABEL_20;
  }
  v26 = fp_current_or_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[FPItemOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:](a1, v26);
  }

  if (v9)
  {
    v27 = dispatch_group_create();
    dispatch_group_enter(v27);
    v28 = [v9 defaultBackend];
    v29 = [a1 asFPItem];
    v30 = [v29 itemID];
    v31 = +[FPDRequest requestForSelf];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke;
    v39[3] = &unk_1E6A75E58;
    v39[4] = a1;
    v40 = v27;
    v24 = v27;
    [v28 URLForItemID:v30 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v31 completionHandler:v39];

    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
LABEL_20:
  }
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 asFPItem];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Copied item %@ unexpectedly doesn't have a URL, fetching one", (uint8_t *)&v4, 0xCu);
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", (uint8_t *)&v2, 0xCu);
}

@end