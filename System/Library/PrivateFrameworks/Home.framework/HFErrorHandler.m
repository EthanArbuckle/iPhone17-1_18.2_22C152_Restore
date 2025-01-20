@interface HFErrorHandler
+ (id)_descriptionForHFErrorCode:(int64_t)a3;
+ (id)_descriptionForHMErrorCode:(int64_t)a3;
+ (id)_descriptionForHMHomeAddWalletKeyErrorCode:(int64_t)a3;
+ (id)descriptionLocalizationKeyForError:(id)a3;
+ (id)localizedDescriptionForError:(id)a3;
+ (id)sharedHandler;
- (BOOL)_isErrorIndicativeOfApplicationBug:(id)a3 operationType:(id)a4 options:(id)a5;
- (BOOL)_isErrorPermanent:(id)a3 operationType:(id)a4 options:(id)a5;
- (BOOL)canIgnoreError:(id)a3;
- (NSString)presentingAlertOperationType;
- (id)_localizedDescriptionForError:(id)a3 operationType:(id)a4 options:(id)a5;
- (id)_localizedStringOrNilIfNotFoundForKey:(id)a3;
- (id)_localizedTitleForError:(id)a3 operationType:(id)a4 options:(id)a5;
- (void)handleError:(id)a3;
- (void)handleError:(id)a3 operationType:(id)a4 options:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7;
- (void)handleError:(id)a3 retryBlock:(id)a4 cancelBlock:(id)a5;
- (void)logError:(id)a3 operationDescription:(id)a4;
- (void)setPresentingAlertOperationType:(id)a3;
@end

@implementation HFErrorHandler

- (void)logError:(id)a3 operationDescription:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = HFLogForCategory(0);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v8)
      {
        v9 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v5];
        int v13 = 138412802;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v5;
        v10 = "HFErrorHandler: [Log] Operation: %@ encountered error: %@ <%@>";
        v11 = v7;
        uint32_t v12 = 32;
LABEL_9:
        _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, v12);
      }
    }
    else if (v8)
    {
      v9 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v5];
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      v10 = "HFErrorHandler: Encountered error: %@ <%@>";
      v11 = v7;
      uint32_t v12 = 22;
      goto LABEL_9;
    }
  }
}

+ (id)sharedHandler
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HFErrorHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2EFB8 != -1) {
    dispatch_once(&qword_26AB2EFB8, block);
  }
  v2 = (void *)_MergedGlobals_240;
  return v2;
}

uint64_t __31__HFErrorHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = _MergedGlobals_240;
  _MergedGlobals_240 = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (void)handleError:(id)a3
{
}

- (void)handleError:(id)a3 retryBlock:(id)a4 cancelBlock:(id)a5
{
}

- (void)handleError:(id)a3 operationType:(id)a4 options:(id)a5 retryBlock:(id)a6 cancelBlock:(id)a7
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(void))a7;
  if (v12)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      __int16 v17 = [(HFErrorHandler *)self presentingAlertOperationType];
      int v18 = [v17 isEqual:v13];

      if (v18)
      {
        uint64_t v19 = HFLogForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v12];
          *(_DWORD *)buf = 138412802;
          id v97 = v20;
          __int16 v98 = 2112;
          id v99 = v12;
          __int16 v100 = 2112;
          id v101 = v13;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: Suppressing error: %@ <%@> for operation: %@ because an alert for that operation is actively being presented", buf, 0x20u);
        }
      }
      else
      {
        if (!v13)
        {
          v21 = [v12 userInfo];
          id v13 = [v21 objectForKeyedSubscript:@"HFErrorUserInfoOperationKey"];
        }
        v22 = [v12 userInfo];
        v23 = [v22 objectForKeyedSubscript:@"HFErrorUserInfoOptionsKey"];

        if (v23)
        {
          if (v14)
          {
            v24 = (void *)[v14 mutableCopy];
          }
          else
          {
            v24 = [MEMORY[0x263EFF9A0] dictionary];
          }
          v25 = v24;
          [v24 addEntriesFromDictionary:v23];

          id v14 = v25;
        }
        if ([(HFErrorHandler *)self _isErrorIndicativeOfApplicationBug:v12 operationType:v13 options:v14])
        {
          NSLog(&cfstr_ReceivedErrorT.isa, v12, v13);
        }
        BOOL v26 = [(HFErrorHandler *)self canIgnoreError:v12];
        v27 = HFLogForCategory(0);
        v28 = v27;
        if (v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v12];
            *(_DWORD *)buf = 138412802;
            id v97 = v13;
            __int16 v98 = 2112;
            id v99 = v29;
            __int16 v100 = 2112;
            id v101 = v12;
            _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: [Ignore] Operation: %@ encountered error: %@ <%@>", buf, 0x20u);
          }
          if (v16) {
            v16[2](v16);
          }
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v57 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v12];
            *(_DWORD *)buf = 138412802;
            id v97 = v13;
            __int16 v98 = 2112;
            id v99 = v57;
            __int16 v100 = 2112;
            id v101 = v12;
            _os_log_error_impl(&dword_20B986000, v28, OS_LOG_TYPE_ERROR, "HFErrorHandler: Operation: %@ encountered error: %@ <%@>", buf, 0x20u);
          }
          uint64_t v30 = [(HFErrorHandler *)self _localizedTitleForError:v12 operationType:v13 options:v14];
          uint64_t v31 = [(HFErrorHandler *)self _localizedDescriptionForError:v12 operationType:v13 options:v14];
          v69 = v23;
          if (v15) {
            int v32 = ![(HFErrorHandler *)self _isErrorPermanent:v12 operationType:v13 options:v14];
          }
          else {
            int v32 = 0;
          }
          id v33 = [v14 objectForKeyedSubscript:@"HFErrorHandlerOptionPresentingViewControllerForAlert"];
          v70 = (void *)v31;
          v71 = (void *)v30;
          if (!v33)
          {
            int v67 = v32;
            v34 = [MEMORY[0x263F1C408] sharedApplication];
            v35 = [v34 keyWindow];

            v65 = v35;
            id v33 = [v35 rootViewController];
            uint64_t v36 = [v33 presentedViewController];
            v72 = v33;
            if (v36)
            {
              v37 = (void *)v36;
              v38 = v33;
              while (1)
              {
                v39 = [v38 presentedViewController];
                char v40 = [v39 isBeingDismissed];

                if (v40) {
                  break;
                }
                id v33 = [v38 presentedViewController];

                v37 = [v33 presentedViewController];
                v38 = v33;
                if (!v37) {
                  goto LABEL_34;
                }
              }
              id v33 = v38;
            }
LABEL_34:
            if (!v33) {
              NSLog(&cfstr_NoViewControll.isa, v65, v72);
            }

            uint64_t v31 = (uint64_t)v70;
            uint64_t v30 = (uint64_t)v71;
            int v32 = v67;
          }
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_289;
          aBlock[3] = &unk_264092CA0;
          aBlock[4] = self;
          v63 = _Block_copy(aBlock);
          v73 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v30 message:v31 preferredStyle:1];
          if (v32)
          {
            v60 = _HFLocalizedStringWithDefaultValue(@"HFErrorButtonTitleTryAgain", @"HFErrorButtonTitleTryAgain", 1);
            v41 = [v14 objectForKeyedSubscript:@"HFErrorHandlerOptionRetryButtonText"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v43 = [v14 objectForKeyedSubscript:@"HFErrorHandlerOptionRetryButtonText"];

              v60 = (void *)v43;
            }
            v44 = (void *)MEMORY[0x263F1C3F0];
            uint64_t v82 = MEMORY[0x263EF8330];
            uint64_t v83 = 3221225472;
            v84 = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_297;
            v85 = &unk_264092CC8;
            v68 = &v87;
            id v87 = v15;
            v66 = &v88;
            id v88 = v63;
            v58 = v88;
            id v86 = v60;
            id v64 = v86;
            v45 = objc_msgSend(v44, "actionWithTitle:style:handler:");
            [v73 addAction:v45];

            v46 = _HFLocalizedStringWithDefaultValue(@"HFErrorButtonTitleCancel", @"HFErrorButtonTitleCancel", 1);
            v47 = [v14 objectForKeyedSubscript:@"HFErrorHandlerOptionCancelButtonTextKey"];
            objc_opt_class();
            char v48 = objc_opt_isKindOfClass();

            if (v48)
            {
              uint64_t v49 = [v14 objectForKeyedSubscript:@"HFErrorHandlerOptionCancelButtonTextKey"];

              v46 = (void *)v49;
            }
            v50 = (void *)MEMORY[0x263F1C3F0];
            v78[0] = MEMORY[0x263EF8330];
            v78[1] = 3221225472;
            v78[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_302;
            v78[3] = &unk_264092CC8;
            v80 = v16;
            id v81 = v58;
            id v79 = v46;
            id v61 = v58;
            id v51 = v46;
            v52 = [v50 actionWithTitle:v51 style:0 handler:v78];
            v53 = v73;
            [v73 addAction:v52];

            v54 = &v86;
          }
          else
          {
            v59 = _HFLocalizedStringWithDefaultValue(@"HFErrorButtonTitleOK", @"HFErrorButtonTitleOK", 1);
            v62 = (void *)MEMORY[0x263F1C3F0];
            v74[0] = MEMORY[0x263EF8330];
            v74[1] = 3221225472;
            v74[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_306;
            v74[3] = &unk_264092CC8;
            v68 = (id *)&v76;
            v76 = v16;
            v77 = v63;
            v66 = &v77;
            v54 = &v75;
            v75 = v59;
            id v55 = v59;
            id v64 = v63;
            v56 = v62;
            id v61 = v55;
            id v51 = [v56 actionWithTitle:v55 style:0 handler:v74];
            v53 = v73;
            [v73 addAction:v51];
          }

          [(HFErrorHandler *)self setPresentingAlertOperationType:v13];
          [v33 presentViewController:v53 animated:1 completion:0];

          v23 = v69;
        }
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke;
      block[3] = &unk_264092C78;
      block[4] = self;
      id v91 = v12;
      id v13 = v13;
      id v92 = v13;
      id v14 = v14;
      id v93 = v14;
      id v94 = v15;
      v95 = v16;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleError:*(void *)(a1 + 40) operationType:*(void *)(a1 + 48) options:*(void *)(a1 + 56) retryBlock:*(void *)(a1 + 64) cancelBlock:*(void *)(a1 + 72)];
}

void __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_289(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x45uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFErrorHandler: User dismissed error alert by tapping \"%@\"", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setPresentingAlertOperationType:0];
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_297(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x45uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped retry button from alert", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_302(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x45uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from alert", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __75__HFErrorHandler_handleError_operationType_options_retryBlock_cancelBlock___block_invoke_306(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory(0x45uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HFErrorHandler handleError:operationType:options:retryBlock:cancelBlock:]_block_invoke";
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'OK' from alert", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)canIgnoreError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0C710]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    BOOL v7 = (unint64_t)(v6 - 15) >= 0x36;
    unint64_t v8 = 0x24000003800101uLL >> (v6 - 15);
  }
  else
  {
    v9 = [v3 domain];
    int v10 = [v9 isEqualToString:@"HFErrorDomain"];

    if (!v10)
    {
      BOOL v13 = 0;
      goto LABEL_9;
    }
    unint64_t v11 = [v3 code];
    BOOL v7 = v11 >= 0x35;
    unint64_t v8 = 0x10402000000000uLL >> v11;
  }
  BOOL v12 = v8 & 1;
  BOOL v13 = !v7 && v12;
LABEL_9:

  return v13;
}

- (BOOL)_isErrorIndicativeOfApplicationBug:(id)a3 operationType:(id)a4 options:(id)a5
{
  v17[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"HFOperationNamingObject"]) {
    goto LABEL_11;
  }
  unint64_t v8 = [v6 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F0C710]];

  if (!v9)
  {
    BOOL v13 = [v6 domain];
    int v14 = [v13 isEqualToString:@"HFErrorDomain"];

    if (v14)
    {
      unint64_t v15 = [v6 code];
      if (v15 <= 0x33) {
        LOBYTE(v12) = (0xC000200000000uLL >> v15) & 1;
      }
      else {
        LOBYTE(v12) = 0;
      }
      goto LABEL_15;
    }
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_15;
  }
  unint64_t v10 = [v6 code];
  if (v10 <= 0x3E)
  {
    if (((1 << v10) & 0x41003000597800E8) != 0)
    {
LABEL_14:
      LOBYTE(v12) = 1;
      goto LABEL_15;
    }
    if (((1 << v10) & 0x8480000000000) != 0)
    {
      v17[0] = @"HFOperationChangePassword";
      v17[1] = @"HFOperationEditServiceGroup";
      v17[2] = @"HFOperationEditService";
      unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
      int v12 = [v11 containsObject:v7] ^ 1;

      goto LABEL_15;
    }
  }
  LOBYTE(v12) = 0;
  if (v10 - 69 <= 0xB && ((1 << (v10 - 69)) & 0x80F) != 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v12;
}

- (BOOL)_isErrorPermanent:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v5 = a3;
  id v6 = [v5 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x263F0C710]];

  if (v7)
  {
    uint64_t v8 = [v5 code];
    if ((unint64_t)(v8 - 4) <= 0x3F && ((1 << (v8 - 4)) & 0xF8AF402000005C71) != 0) {
      goto LABEL_12;
    }
    BOOL v9 = 1;
    if ((unint64_t)(v8 - 73) <= 0xC)
    {
      uint64_t v10 = 1 << (v8 - 73);
      uint64_t v11 = 7795;
      goto LABEL_11;
    }
  }
  else
  {
    int v12 = [v5 domain];
    int v13 = [v12 isEqualToString:@"HFErrorDomain"];

    if (!v13)
    {
      id v16 = [v5 domain];
      int v17 = [v16 isEqualToString:*MEMORY[0x263F0CF50]];

      if (v17)
      {
        unint64_t v18 = [v5 code];
        if (v18 <= 8) {
          BOOL v9 = (0xD9u >> v18) & 1;
        }
        else {
          BOOL v9 = 1;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
      goto LABEL_13;
    }
    unint64_t v14 = [v5 code];
    if (v14 - 74 <= 0x1C && ((1 << (v14 - 74)) & 0x1F0001AF) != 0) {
      goto LABEL_12;
    }
    BOOL v9 = 1;
    if (v14 <= 0x29)
    {
      uint64_t v10 = 1 << v14;
      uint64_t v11 = 0x28C00000020;
LABEL_11:
      if ((v10 & v11) != 0) {
LABEL_12:
      }
        BOOL v9 = 0;
    }
  }
LABEL_13:

  return v9;
}

- (id)_localizedTitleForError:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"HFErrorUserInfoOptionTitleKey"];
  int v12 = [v9 objectForKeyedSubscript:@"HFErrorHandlerOptionFailedItemName"];

  int v13 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v10];

  if (v11)
  {
    id v14 = v11;
LABEL_3:
    unint64_t v15 = v14;
    goto LABEL_19;
  }
  if (!v12) {
    goto LABEL_17;
  }
  id v16 = [NSString stringWithFormat:@"HFError_%@_%@_withName_title", v8, v13];
  uint64_t v17 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v16];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
  }
  else
  {
    uint64_t v19 = [NSString stringWithFormat:@"HFError_%@_withName_title", v8];

    unint64_t v18 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v19];
    if (!v18)
    {
LABEL_15:

      goto LABEL_17;
    }
    id v16 = v19;
  }
  if (([v18 containsString:@"%@"] & 1) == 0) {
    NSLog(&cfstr_IncorrectlyFor.isa, v18);
  }
  if (![v18 containsString:@"%@"])
  {
    uint64_t v19 = v16;
    goto LABEL_15;
  }
  id v25 = 0;
  unint64_t v15 = [NSString localizedStringWithValidatedFormat:v18, @"%@", &v25, v12 validFormatSpecifiers error];
  id v20 = v25;
  v21 = v20;
  if (v15)
  {

    goto LABEL_19;
  }
  NSLog(&cfstr_CouldnTLocaliz_0.isa, v18, v20);

LABEL_17:
  v22 = [NSString stringWithFormat:@"HFError_%@_%@_title", v8, v13];
  unint64_t v15 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v22];

  if (!v15)
  {
    v23 = [NSString stringWithFormat:@"HFError_%@_title", v8];
    unint64_t v15 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v23];

    if (!v15)
    {
      _HFLocalizedStringWithDefaultValue(@"HFError_HFOperationGeneric_title", @"HFError_HFOperationGeneric_title", 1);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
LABEL_19:

  return v15;
}

+ (id)localizedDescriptionForError:(id)a3
{
  id v3 = a3;
  v4 = +[HFErrorHandler sharedHandler];
  id v5 = [v4 _localizedDescriptionForError:v3 operationType:&stru_26C081158 options:MEMORY[0x263EFFA78]];

  return v5;
}

- (id)_localizedDescriptionForError:(id)a3 operationType:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"HFErrorUserInfoOptionDescriptionKey"];
  int v12 = v11;
  if (v11)
  {
    id v13 = v11;
    goto LABEL_12;
  }
  id v14 = [(id)objc_opt_class() descriptionLocalizationKeyForError:v8];
  unint64_t v15 = [NSString stringWithFormat:@"HFError_%@_%@_description", v9, v14];
  uint64_t v16 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v15];
  if (v16)
  {
    id v13 = (id)v16;
    uint64_t v17 = v15;
LABEL_6:
    unint64_t v18 = [v10 objectForKeyedSubscript:@"HFErrorHandlerOptionFailedItemName"];
    if (v18)
    {
      id v22 = 0;
      uint64_t v19 = [NSString stringWithValidatedFormat:v13, @"%@", &v22, v18 validFormatSpecifiers error];
      id v20 = v22;

      if (!v19) {
        NSLog(&cfstr_CouldnTLocaliz_0.isa, v17, v20);
      }

      id v13 = (id)v19;
    }

    goto LABEL_11;
  }
  uint64_t v17 = [NSString stringWithFormat:@"HFError_%@_description", v14];

  id v13 = [(HFErrorHandler *)self _localizedStringOrNilIfNotFoundForKey:v17];
  if (v13) {
    goto LABEL_6;
  }
LABEL_11:

LABEL_12:
  return v13;
}

- (id)_localizedStringOrNilIfNotFoundForKey:(id)a3
{
  id v3 = a3;
  v4 = _HFLocalizedStringWithDefaultValue(v3, 0, 0);
  if (([v4 isEqualToString:&stru_26C081158] & 1) != 0
    || [v4 isEqualToString:v3])
  {

    v4 = 0;
  }

  return v4;
}

+ (id)descriptionLocalizationKeyForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0C710]];

  if (v6)
  {
    int v7 = NSString;
    id v8 = objc_msgSend(a1, "_descriptionForHMErrorCode:", objc_msgSend(v4, "code"));
    [v7 stringWithFormat:@"HMErrorCode%@", v8];
    unint64_t v15 = LABEL_7:;

    goto LABEL_8;
  }
  id v9 = [v4 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0CF50]];

  if (v10)
  {
    uint64_t v11 = NSString;
    id v8 = objc_msgSend(a1, "_descriptionForHMHomeAddWalletKeyErrorCode:", objc_msgSend(v4, "code"));
    [v11 stringWithFormat:@"HMHomeAddWalletKeyErrorCode%@", v8];
    goto LABEL_7;
  }
  int v12 = [v4 domain];
  int v13 = [v12 isEqualToString:@"HFErrorDomain"];

  if (v13)
  {
    id v14 = NSString;
    id v8 = objc_msgSend(a1, "_descriptionForHFErrorCode:", objc_msgSend(v4, "code"));
    [v14 stringWithFormat:@"HFErrorCode%@", v8];
    goto LABEL_7;
  }
  unint64_t v15 = 0;
LABEL_8:

  return v15;
}

+ (id)_descriptionForHMHomeAddWalletKeyErrorCode:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 < 9) {
    return off_264092CE8[a3];
  }
  int v6 = HFLogForCategory(0x43uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315650;
    id v8 = "+[HFErrorHandler _descriptionForHMHomeAddWalletKeyErrorCode:]";
    __int16 v9 = 2112;
    id v10 = a1;
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s(%@) UNKNOWN HOMEKIT ERROR %ld", (uint8_t *)&v7, 0x20u);
  }

  return 0;
}

+ (id)_descriptionForHMErrorCode:(int64_t)a3
{
  if (a3 <= 2000)
  {
    int v6 = @"AccessDenied";
    switch(a3)
    {
      case -1:
        int v6 = @"UnexpectedError";
        break;
      case 1:
        int v6 = @"AlreadyExists";
        break;
      case 2:
        int v6 = @"NotFound";
        break;
      case 3:
        int v6 = @"InvalidParameter";
        break;
      case 4:
        int v6 = @"AccessoryNotReachable";
        break;
      case 5:
        int v6 = @"ReadOnlyCharacteristic";
        break;
      case 6:
        int v6 = @"WriteOnlyCharacteristic";
        break;
      case 7:
        int v6 = @"NotificationNotSupported";
        break;
      case 8:
        int v6 = @"OperationTimedOut";
        break;
      case 9:
        int v6 = @"AccessoryPoweredOff";
        break;
      case 10:
        goto LABEL_378;
      case 11:
        int v6 = @"ObjectAssociatedToAnotherHome";
        break;
      case 12:
        int v6 = @"ObjectNotAssociatedToAnyHome";
        break;
      case 13:
        int v6 = @"ObjectAlreadyAssociatedToHome";
        break;
      case 14:
        int v6 = @"AccessoryIsBusy";
        break;
      case 15:
        int v6 = @"OperationInProgress";
        break;
      case 16:
        int v6 = @"AccessoryOutOfResources";
        break;
      case 17:
        int v6 = @"InsufficientPrivileges";
        break;
      case 18:
        int v6 = @"AccessoryPairingFailed";
        break;
      case 19:
        int v6 = @"InvalidDataFormatSpecified";
        break;
      case 20:
        int v6 = @"NilParameter";
        break;
      case 21:
        int v6 = @"UnconfiguredParameter";
        break;
      case 22:
        int v6 = @"InvalidClass";
        break;
      case 23:
        int v6 = @"OperationCancelled";
        break;
      case 24:
        int v6 = @"RoomForHomeCannotBeInZone";
        break;
      case 25:
        int v6 = @"NoActionsInActionSet";
        break;
      case 26:
        int v6 = @"NoRegisteredActionSets";
        break;
      case 27:
        int v6 = @"MissingParameter";
        break;
      case 28:
        int v6 = @"FireDateInPast";
        break;
      case 29:
        int v6 = @"RoomForHomeCannotBeUpdated";
        break;
      case 30:
        int v6 = @"ActionInAnotherActionSet";
        break;
      case 31:
        int v6 = @"ObjectWithSimilarNameExistsInHome";
        break;
      case 32:
        int v6 = @"HomeWithSimilarNameExists";
        break;
      case 33:
        int v6 = @"RenameWithSimilarName";
        break;
      case 34:
        int v6 = @"CannotRemoveNonBridgeAccessory";
        break;
      case 35:
        int v6 = @"NameContainsProhibitedCharacters";
        break;
      case 36:
        int v6 = @"NameDoesNotStartWithValidCharacters";
        break;
      case 37:
        int v6 = @"UserIDNotEmailAddress";
        break;
      case 38:
        int v6 = @"UserDeclinedAddingUser";
        break;
      case 39:
        int v6 = @"UserDeclinedRemovingUser";
        break;
      case 40:
        int v6 = @"UserDeclinedInvite";
        break;
      case 41:
        int v6 = @"UserManagementFailed";
        break;
      case 42:
        int v6 = @"RecurrenceTooSmall";
        break;
      case 43:
        int v6 = @"InvalidValueType";
        break;
      case 44:
        int v6 = @"ValueLowerThanMinimum";
        break;
      case 45:
        int v6 = @"ValueHigherThanMaximum";
        break;
      case 46:
        int v6 = @"StringLongerThanMaximum";
        break;
      case 47:
        int v6 = @"HomeAccessNotAuthorized";
        break;
      case 48:
        int v6 = @"OperationNotSupported";
        break;
      case 49:
        int v6 = @"MaximumObjectLimitReached";
        break;
      case 50:
        int v6 = @"AccessorySentInvalidResponse";
        break;
      case 51:
        int v6 = @"StringShorterThanMinimum";
        break;
      case 52:
        int v6 = @"GenericError";
        break;
      case 53:
        int v6 = @"SecurityFailure";
        break;
      case 54:
        int v6 = @"CommunicationFailure";
        break;
      case 55:
        int v6 = @"MessageAuthenticationFailed";
        break;
      case 56:
        int v6 = @"InvalidMessageSize";
        break;
      case 57:
        int v6 = @"AccessoryDiscoveryFailed";
        break;
      case 58:
        int v6 = @"ClientRequestError";
        break;
      case 59:
        int v6 = @"AccessoryResponseError";
        break;
      case 60:
        int v6 = @"NameDoesNotEndWithValidCharacters";
        break;
      case 61:
        int v6 = @"AccessoryIsBlocked";
        break;
      case 62:
        int v6 = @"InvalidAssociatedServiceType";
        break;
      case 63:
        int v6 = @"ActionSetExecutionFailed";
        break;
      case 64:
        int v6 = @"ActionSetExecutionPartialSuccess";
        break;
      case 65:
        int v6 = @"ActionSetExecutionInProgress";
        break;
      case 66:
        int v6 = @"AccessoryOutOfCompliance";
        break;
      case 67:
        int v6 = @"DataResetFailure";
        break;
      case 68:
        int v6 = @"NotificationAlreadyEnabled";
        break;
      case 69:
        int v6 = @"RecurrenceMustBeOnSpecifiedBoundaries";
        break;
      case 70:
        int v6 = @"DateMustBeOnSpecifiedBoundaries";
        break;
      case 71:
        int v6 = @"CannotActivateTriggerTooFarInFuture";
        break;
      case 72:
        int v6 = @"RecurrenceTooLarge";
        break;
      case 73:
        int v6 = @"ReadWritePartialSuccess";
        break;
      case 74:
        int v6 = @"ReadWriteFailure";
        break;
      case 75:
        int v6 = @"NotSignedIntoiCloud";
        break;
      case 76:
        int v6 = @"KeychainSyncNotEnabled";
        break;
      case 77:
        int v6 = @"CloudDataSyncInProgress";
        break;
      case 78:
        int v6 = @"NetworkUnavailable";
        break;
      case 79:
        int v6 = @"AddAccessoryFailed";
        break;
      case 80:
        int v6 = @"MissingEntitlement";
        break;
      case 81:
        int v6 = @"CannotUnblockNonBridgeAccessory";
        break;
      case 82:
        int v6 = @"DeviceLocked";
        break;
      case 83:
        int v6 = @"CannotRemoveBuiltinActionSet";
        break;
      case 84:
        int v6 = @"LocationForHomeDisabled";
        break;
      case 85:
        int v6 = @"NotAuthorizedForLocationServices";
        break;
      case 86:
        int v6 = @"ReferToUserManual";
        break;
      case 87:
        int v6 = @"InvalidOrMissingAuthorizationData";
        break;
      case 88:
        int v6 = @"BridgedAccessoryNotReachable";
        break;
      case 89:
        int v6 = @"NotAuthorizedForMicrophoneAccess";
        break;
      case 90:
        int v6 = @"IncompatibleNetwork";
        break;
      case 91:
        int v6 = @"NoHomeHub";
        break;
      case 92:
        int v6 = @"NoCompatibleHomeHub";
        break;
      case 93:
        int v6 = @"IncompatibleAccessory";
        break;
      case 95:
        int v6 = @"ObjectWithSimilarNameExists";
        break;
      case 96:
        int v6 = @"OwnershipFailure";
        break;
      case 97:
        int v6 = @"MaximumAccessoriesOfTypeInHome";
        break;
      case 98:
        int v6 = @"WiFiCredentialGenerationFailed";
        break;
      case 99:
        int v6 = @"EnterpriseNetworkNotSupported";
        break;
      case 100:
        int v6 = @"TimedOutWaitingForAccessory";
        break;
      case 101:
        int v6 = @"AccessoryCommunicationFailure";
        break;
      case 102:
        int v6 = @"FailedToJoinNetwork";
        break;
      default:
        goto LABEL_377;
    }
    return v6;
  }
  if (a3 > 2399)
  {
    if (a3 <= 2499)
    {
      switch(a3)
      {
        case 2400:
          int v6 = @"AccessorySuspended";
          break;
        case 2401:
          int v6 = @"AccessorySuspendedLocally";
          break;
        case 2404:
          int v6 = @"OperationStarted";
          break;
        default:
          goto LABEL_377;
      }
    }
    else
    {
      switch(a3)
      {
        case 2500:
          int v6 = @"ResetConfig";
          break;
        case 2501:
          int v6 = @"HomeUIServiceTerminated";
          break;
        case 2502:
          int v6 = @"HomeUIServiceBackgrounded";
          break;
        case 2503:
          int v6 = @"NoClients";
          break;
        case 2504:
          int v6 = @"AccessoryBrowserStopped";
          break;
        default:
          if (a3 != 2602) {
            goto LABEL_377;
          }
          int v6 = @"AccessCodeDuplicate";
          break;
      }
    }
  }
  else
  {
    if (a3 <= 2099)
    {
      switch(a3)
      {
        case 2001:
          int v6 = @"OperationCanceledByUser";
          break;
        case 2002:
          int v6 = @"IncorrectSetupCode";
          break;
        case 2003:
          int v6 = @"SecureAccessDenied";
          break;
        case 2004:
          int v6 = @"UnsupportedSetupPayload";
          break;
        case 2005:
          int v6 = @"MediaRemoteError";
          break;
        case 2006:
          int v6 = @"QuotaExceeded";
          break;
        default:
          goto LABEL_377;
      }
      return v6;
    }
    if (a3 > 2200)
    {
      if (a3 == 2201)
      {
        int v6 = @"WeakPassword";
      }
      else
      {
        if (a3 != 2300) {
          goto LABEL_377;
        }
        int v6 = @"VoiceShortcutWithSimilarNameExists";
      }
    }
    else
    {
      if (a3 != 2100)
      {
        if (a3 == 2200)
        {
          int v6 = @"InvalidCharacters";
          return v6;
        }
LABEL_377:
        int v6 = [a1 _descriptionForHMHomeAddWalletKeyErrorCode:v3];
LABEL_378:
        return v6;
      }
      int v6 = @"NoTargetAccessory";
    }
  }
  return v6;
}

+ (id)_descriptionForHFErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x68) {
    return 0;
  }
  else {
    return *(&off_264092D30 + a3 + 1);
  }
}

- (NSString)presentingAlertOperationType
{
  return self->_presentingAlertOperationType;
}

- (void)setPresentingAlertOperationType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end