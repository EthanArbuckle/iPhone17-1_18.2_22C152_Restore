@interface ATBuddyCallback
@end

@implementation ATBuddyCallback

void ___ATBuddyCallback_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ATBuddyCallback_block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = *(void *)(a1 + 32);
  [v2 performBlockAfterFirstUnlock:v3];
}

void ___ATBuddyCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  v2 = [v1 _currentHostType];
  int v3 = [v2 isEqualToString:@"iTunes"];

  v4 = [v1 syncSession];

  v5 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v3;
    __int16 v9 = 1024;
    BOOL v10 = v4 != 0;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "Handling Buddy Finished Notification, hostIsITunes=%{BOOL}u, haveSyncSession=%{BOOL}u", (uint8_t *)v8, 0xEu);
  }

  if (v4) {
    int v6 = v3;
  }
  else {
    int v6 = 0;
  }
  if (v6 == 1)
  {
    v7 = +[ATRestoreManager sharedManager];
    [v7 restoreSessionActiveWithCompletion:&__block_literal_global_494];
  }
}

void ___ATBuddyCallback_block_invoke_491(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    ATDisplaySyncAlert();
  }
}

@end