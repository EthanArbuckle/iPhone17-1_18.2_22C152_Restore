@interface UIPasteboard
@end

@implementation UIPasteboard

void __95__UIPasteboard_SafariServicesExtras__safari_bestStringForPastingIntoURLFieldCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB2810]];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB2808]];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) string];
    }
    id v6 = v9;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__UIPasteboard_SafariServicesExtras__safari_bestStringForPastingIntoURLFieldCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5C73300;
  id v10 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v10;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __95__UIPasteboard_SafariServicesExtras__safari_bestStringForPastingIntoURLFieldCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end