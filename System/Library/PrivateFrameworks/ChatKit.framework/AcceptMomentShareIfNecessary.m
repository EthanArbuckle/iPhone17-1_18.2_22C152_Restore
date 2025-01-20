@interface AcceptMomentShareIfNecessary
@end

@implementation AcceptMomentShareIfNecessary

void ___AcceptMomentShareIfNecessary_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = IMLogHandleForCategory();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEFAULT, "Did accept moment share: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    ___AcceptMomentShareIfNecessary_block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }
}

void ___AcceptMomentShareIfNecessary_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_18EF18000, a2, a3, "Failed to accept moment share: %@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end