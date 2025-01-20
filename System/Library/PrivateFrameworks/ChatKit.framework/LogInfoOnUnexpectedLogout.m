@interface LogInfoOnUnexpectedLogout
@end

@implementation LogInfoOnUnexpectedLogout

void ___LogInfoOnUnexpectedLogout_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, " ==> Found account: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end