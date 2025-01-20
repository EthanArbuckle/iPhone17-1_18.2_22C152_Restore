@interface LSInvokeMIForShimmedUninstall
@end

@implementation LSInvokeMIForShimmedUninstall

void ___LSInvokeMIForShimmedUninstall_block_invoke(void *a1)
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
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "now processing uninstall of %@ with options %@", buf, 0x16u);
  }

  uint64_t v14 = a1[4];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v6 = (void *)a1[5];
  id v11 = 0;
  uint64_t v7 = ((void (*)(void *, void *, void *, uint64_t, void *))softLinkMobileInstallationUninstallForInstallCoordinationWithError[0])(v5, v6, 0, (uint64_t)&v11, 0);
  uint64_t v8 = (uint64_t)v11;

  if (!(v7 | v8))
  {
    v9 = _LSInstallLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___LSInvokeMIForShimmedUninstall_block_invoke_cold_1();
    }

    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13 = @"unknown error uninstalling via mobileinstallation";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -101, (uint64_t)"_LSInvokeMIForShimmedUninstall_block_invoke", 811, v10);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void ___LSInvokeMIForShimmedUninstall_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "MobileInstallationUninstallForInstallCoordinationWithError returned NO but did not emit an error?", v2, v3, v4, v5, v6);
}

@end