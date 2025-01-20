@interface AAFollowUpControllerHandleSetupAssistantExited
@end

@implementation AAFollowUpControllerHandleSetupAssistantExited

void ___AAFollowUpControllerHandleSetupAssistantExited_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = [a2 userInfo];
    if (v3)
    {
      [*(id *)(a1 + 32) postFollowUpWithIdentifier:AAFollowUpIdentifierVerifyTerms[0] userInfo:v3 completion:&__block_literal_global_385];
    }
    else
    {
      v4 = _AALogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "No follow up userInfo found... nothing to see here!", v5, 2u);
      }
    }
  }
  else
  {
    v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "No follow up found... nothing to see here!", buf, 2u);
    }
  }
}

void ___AAFollowUpControllerHandleSetupAssistantExited_block_invoke_383(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (a2) {
      v6 = @"YES";
    }
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Reposted follow up with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

@end