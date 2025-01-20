@interface SAIntentGroupLaunchAppWithIntent
@end

@implementation SAIntentGroupLaunchAppWithIntent

void __112__SAIntentGroupLaunchAppWithIntent_INSExtensionService__ins_launchAppWithConnection_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v20 = v5;
    id v8 = v6;
    uint64_t v9 = *MEMORY[0x263F08608];
    do
    {
      v10 = [v8 domain];
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      v11 = (void *)getFBSOpenApplicationErrorDomainSymbolLoc_ptr;
      uint64_t v25 = getFBSOpenApplicationErrorDomainSymbolLoc_ptr;
      if (!getFBSOpenApplicationErrorDomainSymbolLoc_ptr)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke;
        v21[3] = &unk_26427E0C0;
        v21[4] = &v22;
        __getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke((uint64_t)v21);
        v11 = (void *)v23[3];
      }
      _Block_object_dispose(&v22, 8);
      if (!v11)
      {
        dlerror();
        v19 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v22, 8);
        _Unwind_Resume(v19);
      }
      if ([v10 isEqualToString:*v11])
      {
        uint64_t v12 = [v8 code];

        if (v12 == 7)
        {

          uint64_t v16 = 1310;
          goto LABEL_14;
        }
      }
      else
      {
      }
      v13 = [v8 userInfo];
      uint64_t v14 = [v13 objectForKeyedSubscript:v9];

      id v8 = (id)v14;
    }
    while (v14);
    uint64_t v16 = 1305;
LABEL_14:
    v17 = *(void **)(a1 + 32);
    v18 = INSExtensionServiceTraceCompletionHandlerWithCode(*(void **)(a1 + 40), 722470896);
    objc_msgSend(v17, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v18, v16, 0);

    id v5 = v20;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, id, void))(v15 + 16))(v15, v5, 0);
    }
  }
}

@end