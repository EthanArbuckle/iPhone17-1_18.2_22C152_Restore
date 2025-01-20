@interface SAIntentGroupLaunchAppWithUserActivity
@end

@implementation SAIntentGroupLaunchAppWithUserActivity

void __141__SAIntentGroupLaunchAppWithUserActivity_INSExtensionService__ins_launchAppWithConnection_userActivityIdentifier_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 domain];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v9 = (void *)getFBSOpenApplicationErrorDomainSymbolLoc_ptr_272;
    uint64_t v20 = getFBSOpenApplicationErrorDomainSymbolLoc_ptr_272;
    if (!getFBSOpenApplicationErrorDomainSymbolLoc_ptr_272)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_273;
      v16[3] = &unk_26427E0C0;
      v16[4] = &v17;
      __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_273((uint64_t)v16);
      v9 = (void *)v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v9)
    {
      dlerror();
      v15 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v15);
    }
    if ([v8 isEqualToString:*v9])
    {
      uint64_t v10 = [v7 code];

      if (v10 == 7) {
        uint64_t v11 = 1310;
      }
      else {
        uint64_t v11 = 1308;
      }
    }
    else
    {

      uint64_t v11 = 1308;
    }
    v13 = *(void **)(a1 + 32);
    v14 = INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 40), 722470896);
    objc_msgSend(v13, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v14, v11, v7);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v5, 0);
    }
  }
}

@end