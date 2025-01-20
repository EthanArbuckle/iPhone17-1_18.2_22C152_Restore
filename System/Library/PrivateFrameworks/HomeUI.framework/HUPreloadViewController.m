@interface HUPreloadViewController
@end

@implementation HUPreloadViewController

id ___HUPreloadViewController_block_invoke_56(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  [*(id *)(a1 + 32) _endDelayingPresentation];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return v5;
}

uint64_t ___HUPreloadViewController_block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "na_timeoutError");
    [v2 finishWithError:v3];
  }
  return 0;
}

id ___HUPreloadViewController_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) description];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = NSString;
    v6 = [*(id *)(a1 + 32) description];
    v7 = [*(id *)(a1 + 32) topViewController];
    v8 = [v7 description];
    uint64_t v9 = [v5 stringWithFormat:@"%@ (%@)", v6, v8];

    v4 = (void *)v9;
  }
  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Preload for view controller: %@ failed with error: %@", buf, 0x16u);
  }

  v11 = [MEMORY[0x1E4F7A0D8] futureWithError:v3];

  return v11;
}

@end