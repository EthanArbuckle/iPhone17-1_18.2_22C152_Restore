@interface LSInvokeMIForShimmedInstall
@end

@implementation LSInvokeMIForShimmedInstall

void ___LSInvokeMIForShimmedInstall_block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = _LSInstallLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "now processing install of %@ with options %@", buf, 0x16u);
  }

  v5 = (void *)[objc_alloc((Class)getMIInstallOptionsClass[0]()) initWithLegacyOptionsDictionary:a1[5]];
  v6 = (void *)a1[4];
  id v12 = 0;
  char v7 = ((uint64_t (*)(void *, uint64_t, void *, void *, uint64_t, uint64_t, uint64_t, void *))softLinkMobileInstallationInstallForInstallCoordinationWithError[0])(v6, 1, v5, 0, 0, 0, (uint64_t)&v12, 0);
  id v8 = v12;
  v9 = v8;
  if ((v7 & 1) == 0 && !v8)
  {
    v10 = _LSInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ___LSInvokeMIForShimmedInstall_block_invoke_cold_1();
    }

    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14 = @"unknown error installing via mobileinstallation";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v9 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -101, (uint64_t)"_LSInvokeMIForShimmedInstall_block_invoke", 794, v11);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void ___LSInvokeMIForShimmedInstall_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "MobileInstallationInstallForInstallCoordinationWithError returned NO but did not emit an error?", v2, v3, v4, v5, v6);
}

@end