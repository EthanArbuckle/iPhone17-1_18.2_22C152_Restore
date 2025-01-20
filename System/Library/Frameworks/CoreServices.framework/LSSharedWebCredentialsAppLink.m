@interface LSSharedWebCredentialsAppLink
@end

@implementation LSSharedWebCredentialsAppLink

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:*(void *)(a1 + 32) resolvingAgainstBaseURL:1];
  v2 = [v24 host];
  if (v2)
  {
    id v3 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
    v4 = _LSSWCServiceTypeAppLinks();
    uint64_t v5 = [v3 initWithServiceType:v4 applicationIdentifier:0 domain:v2];

    v23 = (void *)v5;
    id v39 = 0;
    v6 = [(id)_LSSWCServiceDetailsClass() serviceDetailsWithServiceSpecifier:v5 error:&v39];
    id v22 = v39;
    if (v6)
    {
      v21 = v6;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2;
      v35[3] = &unk_1E522D0F8;
      id v7 = *(id *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v36 = v7;
      uint64_t v38 = v8;
      id v37 = v9;
      dispatch_block_t block = (dispatch_block_t)MEMORY[0x18530F950](v35);
      if ([v6 count] == 1)
      {
        v10 = [v6 firstObject];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3;
        v31[3] = &unk_1E522D170;
        uint64_t v34 = *(void *)(a1 + 56);
        v32 = block;
        id v33 = *(id *)(a1 + 40);
        [v10 waitForSiteApprovalWithCompletionHandler:v31];

        v11 = v32;
      }
      else
      {
        v11 = dispatch_group_create();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = v6;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v42 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v14);
              }
              v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              dispatch_group_enter(v11);
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4;
              v25[3] = &unk_1E522D198;
              v25[4] = v18;
              v26 = v11;
              [v18 waitForSiteApprovalWithCompletionHandler:v25];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v42 count:16];
          }
          while (v15);
        }

        v19 = [*(id *)(a1 + 56) _dispatchQueue];
        dispatch_group_notify(v11, v19, block);
      }
      v6 = v21;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    v13 = v22;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v40 = *MEMORY[0x1E4F28228];
    v41 = @"aURL";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v13 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[_LSSharedWebCredentialsAppLink afterAppLinksBecomeAvailableForURL:limit:performBlock:]_block_invoke", 315, v23);
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  id v6 = 0;
  v4 = +[LSAppLink appLinksWithURL:v2 limit:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[5] + 16))();
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = [*(id *)(a1 + 48) _dispatchQueue];
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) serviceSpecifier];
      __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1(v8, (uint64_t)v6, v9, v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Error getting updated SWC service details for %@ (ignoring due to batch operation): %@", buf, 0x16u);
}

@end