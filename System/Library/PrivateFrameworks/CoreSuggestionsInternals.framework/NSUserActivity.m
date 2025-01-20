@interface NSUserActivity
@end

@implementation NSUserActivity

void __43__NSUserActivity_Suggestions__sg_serialize__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v9)
  {
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Could not create tag from NSUserActivity '%@': %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end