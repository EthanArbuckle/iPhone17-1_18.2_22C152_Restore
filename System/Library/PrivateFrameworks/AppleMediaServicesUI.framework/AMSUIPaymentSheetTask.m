@interface AMSUIPaymentSheetTask
- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (void)_didDismissPaymentAuthorizationController:(id)a3;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
@end

@implementation AMSUIPaymentSheetTask

- (void)_didDismissPaymentAuthorizationController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = AMSLogKey();
    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      v10 = AMSLogKey();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, a2];
    }
    else
    {
      v10 = NSStringFromSelector(a2);
      [v8 stringWithFormat:@"%@: %@ ", v9, v10];
    v11 = };
    v12 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v14 = v11;
    __int16 v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Payment sheet dismissed, controller: %{public}@", buf, 0x16u);
    if (v7)
    {

      v11 = (void *)a2;
    }
  }
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIPaymentSheetTask;
  [(AMSPaymentSheetTask *)&v3 paymentAuthorizationControllerDidFinish:a3];
}

- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = 0x263F27000uLL;
  v7 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v7)
  {
    v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (uint64_t)self;
    v10 = AMSLogKey();
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      v13 = AMSLogKey();
      uint64_t v9 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v13, v9];
    }
    else
    {
      v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    v14 = };
    *(_DWORD *)buf = 138543362;
    v115 = v14;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      v14 = (void *)v9;
    }

    unint64_t v6 = 0x263F27000uLL;
  }

  __int16 v15 = [(AMSPaymentSheetTask *)self purchaseInfo];
  v16 = [v15 delegate];

  if (!v16)
  {
    v26 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v26)
    {
      v26 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = AMSLogKey();
      v29 = NSString;
      uint64_t v30 = objc_opt_class();
      if (v28)
      {
        v31 = AMSLogKey();
        __int16 v15 = NSStringFromSelector(a2);
        [v29 stringWithFormat:@"%@: [%@] %@ ", v30, v31, v15];
      }
      else
      {
        v31 = NSStringFromSelector(a2);
        [v29 stringWithFormat:@"%@: %@ ", v30, v31];
      v32 = };
      *(_DWORD *)buf = 138543362;
      v115 = v32;
      _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
      if (v28)
      {

        v32 = v15;
      }
    }
    goto LABEL_47;
  }
  if (([v16 conformsToProtocol:&unk_26CCC4FB0] & 1) == 0)
  {
    v26 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v26)
    {
      v26 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v33 = AMSLogKey();
      v34 = NSString;
      uint64_t v35 = objc_opt_class();
      if (v33)
      {
        v36 = AMSLogKey();
        __int16 v15 = NSStringFromSelector(a2);
        [v34 stringWithFormat:@"%@: [%@] %@ ", v35, v36, v15];
      }
      else
      {
        v36 = NSStringFromSelector(a2);
        [v34 stringWithFormat:@"%@: %@ ", v35, v36];
      v37 = };
      v57 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      v115 = v37;
      __int16 v116 = 2114;
      uint64_t v117 = (uint64_t)v57;
      _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate %{public}@ does not conforms to protocol AMSUIPurchaseDelegate, cannot return window.", buf, 0x16u);
      if (v33)
      {

        v37 = v15;
      }
    }
LABEL_47:
    v58 = 0;
    goto LABEL_48;
  }
  id v109 = v5;
  aSelector = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v38 = objc_opt_respondsToSelector();
    uint64_t v39 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    v40 = (void *)v39;
    if ((v38 & 1) == 0)
    {
      if (!v39)
      {
        v40 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v49 = [v40 OSLogObject];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = AMSLogKey();
        v51 = NSString;
        uint64_t v52 = objc_opt_class();
        if (v50)
        {
          uint64_t v53 = AMSLogKey();
          v54 = a2;
          v55 = (void *)v53;
          uint64_t v38 = NSStringFromSelector(v54);
          [v51 stringWithFormat:@"%@: [%@] %@ ", v52, v55, v38];
        }
        else
        {
          v55 = NSStringFromSelector(a2);
          [v51 stringWithFormat:@"%@: %@ ", v52, v55];
        v56 = };
        v84 = NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_completion_);
        *(_DWORD *)buf = 138543618;
        v115 = v56;
        __int16 v116 = 2114;
        uint64_t v117 = (uint64_t)v84;
        _os_log_impl(&dword_21C134000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement %{public}@, cannot return window.", buf, 0x16u);
        if (v50)
        {

          v56 = (void *)v38;
        }

        id v5 = v109;
        a2 = aSelector;
        unint64_t v6 = 0x263F27000;
      }

      goto LABEL_88;
    }
    if (!v39)
    {
      v40 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v41 = [v40 OSLogObject];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = AMSLogKey();
      v43 = NSString;
      uint64_t v44 = objc_opt_class();
      if (v42)
      {
        uint64_t v45 = AMSLogKey();
        v46 = a2;
        v47 = (void *)v45;
        uint64_t v108 = NSStringFromSelector(v46);
        [v43 stringWithFormat:@"%@: [%@] %@ ", v44, v47, v108];
      }
      else
      {
        v47 = NSStringFromSelector(a2);
        [v43 stringWithFormat:@"%@: %@ ", v44, v47];
      v48 = };
      v73 = AMSHashIfNeeded();
      v74 = NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_completion_);
      *(_DWORD *)buf = 138543874;
      v115 = v48;
      __int16 v116 = 2114;
      uint64_t v117 = (uint64_t)v73;
      __int16 v118 = 2114;
      v119 = v74;
      _os_log_impl(&dword_21C134000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@, selector: %{public}@", buf, 0x20u);
      if (v42)
      {

        v48 = (void *)v108;
      }

      id v5 = v109;
      a2 = aSelector;
    }

    id v64 = objc_alloc_init(MEMORY[0x263F27E10]);
    uint64_t v38 = [(AMSPaymentSheetTask *)self purchaseInfo];
    v75 = [(id)v38 purchase];
    v76 = +[AMSUISceneIdentifierRequest sceneIdentifierRequest];
    v77 = [v64 completionHandlerAdapter];
    [v16 purchase:v75 handleSceneIdentifierRequest:v76 completion:v77];

    id v112 = 0;
    v58 = [v64 resultWithError:&v112];
    id v65 = v112;
    unint64_t v6 = 0x263F27000uLL;
    if (!v65) {
      goto LABEL_86;
    }
    v66 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v66)
    {
      v66 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v78 = [v66 OSLogObject];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v79 = AMSLogKey();
      v80 = NSString;
      uint64_t v81 = objc_opt_class();
      uint64_t v82 = v81;
      if (v79)
      {
        uint64_t v108 = AMSLogKey();
        [v80 stringWithFormat:@"%@: [%@] ", v82, v108];
      }
      else
      {
        [v80 stringWithFormat:@"%@: ", v81];
      v83 = };
      uint64_t v38 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      v115 = v83;
      __int16 v116 = 2114;
      uint64_t v117 = v38;
      _os_log_impl(&dword_21C134000, v78, OS_LOG_TYPE_ERROR, "%{public}@Scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v79)
      {

        v83 = (void *)v108;
      }

      id v5 = v109;
      unint64_t v6 = 0x263F27000uLL;
    }

    a2 = aSelector;
LABEL_85:

LABEL_86:
    goto LABEL_87;
  }
  uint64_t v17 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = AMSLogKey();
    v20 = NSString;
    uint64_t v21 = objc_opt_class();
    if (v19)
    {
      uint64_t v22 = AMSLogKey();
      v23 = a2;
      v24 = (void *)v22;
      __int16 v15 = NSStringFromSelector(v23);
      [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v24, v15];
    }
    else
    {
      v24 = NSStringFromSelector(a2);
      [v20 stringWithFormat:@"%@: %@ ", v21, v24];
    v25 = };
    v60 = AMSHashIfNeeded();
    v61 = NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_error_);
    *(_DWORD *)buf = 138543874;
    v115 = v25;
    __int16 v116 = 2114;
    uint64_t v117 = (uint64_t)v60;
    __int16 v118 = 2114;
    v119 = v61;
    _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@, selector: %{public}@", buf, 0x20u);
    if (v19)
    {

      v25 = v15;
    }

    id v5 = v109;
    a2 = aSelector;
  }

  uint64_t v38 = [(AMSPaymentSheetTask *)self purchaseInfo];
  v62 = [(id)v38 purchase];
  v63 = +[AMSUISceneIdentifierRequest sceneIdentifierRequest];
  id v113 = 0;
  v58 = [v16 purchase:v62 handleSceneIdentifierRequest:v63 error:&v113];
  id v64 = v113;

  unint64_t v6 = 0x263F27000uLL;
  if (v64)
  {
    id v65 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v65)
    {
      id v65 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v66 = [v65 OSLogObject];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v67 = AMSLogKey();
      v68 = NSString;
      uint64_t v69 = objc_opt_class();
      uint64_t v70 = v69;
      if (v67)
      {
        uint64_t v38 = AMSLogKey();
        [v68 stringWithFormat:@"%@: [%@] ", v70, v38];
      }
      else
      {
        [v68 stringWithFormat:@"%@: ", v69];
      v71 = };
      v72 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      v115 = v71;
      __int16 v116 = 2114;
      uint64_t v117 = (uint64_t)v72;
      _os_log_impl(&dword_21C134000, v66, OS_LOG_TYPE_ERROR, "%{public}@Sync scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v67)
      {

        v71 = (void *)v38;
      }

      id v5 = v109;
      a2 = aSelector;
      unint64_t v6 = 0x263F27000;
    }
    goto LABEL_85;
  }
LABEL_87:

  if (!v58)
  {
LABEL_88:
    v85 = [*(id *)(v6 + 3256) sharedPurchaseConfig];
    if (!v85)
    {
      v85 = [*(id *)(v6 + 3256) sharedConfig];
    }
    v86 = [v85 OSLogObject];
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
    {
      v87 = AMSLogKey();
      v88 = NSString;
      uint64_t v89 = objc_opt_class();
      if (v87)
      {
        v90 = AMSLogKey();
        uint64_t v38 = NSStringFromSelector(aSelector);
        [v88 stringWithFormat:@"%@: [%@] %@ ", v89, v90, v38];
      }
      else
      {
        v90 = NSStringFromSelector(aSelector);
        [v88 stringWithFormat:@"%@: %@ ", v89, v90];
      v91 = };
      *(_DWORD *)buf = 138543362;
      v115 = v91;
      _os_log_impl(&dword_21C134000, v86, OS_LOG_TYPE_DEBUG, "%{public}@Falling back to superclass", buf, 0xCu);
      if (v87)
      {

        v91 = (void *)v38;
      }

      a2 = aSelector;
      unint64_t v6 = 0x263F27000uLL;
    }

    v111.receiver = self;
    v111.super_class = (Class)AMSUIPaymentSheetTask;
    v58 = [(AMSPaymentSheetTask *)&v111 presentationSceneIdentifierForPaymentAuthorizationController:v5];
    v92 = [*(id *)(v6 + 3256) sharedPurchaseConfig];
    if (!v92)
    {
      v92 = [*(id *)(v6 + 3256) sharedConfig];
    }
    v93 = [v92 OSLogObject];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v94 = AMSLogKey();
      v95 = NSString;
      uint64_t v96 = objc_opt_class();
      if (v94)
      {
        uint64_t v97 = AMSLogKey();
        v98 = a2;
        v99 = (void *)v97;
        uint64_t v38 = NSStringFromSelector(v98);
        [v95 stringWithFormat:@"%@: [%@] %@ ", v96, v99, v38];
      }
      else
      {
        v99 = NSStringFromSelector(a2);
        [v95 stringWithFormat:@"%@: %@ ", v96, v99];
      v100 = };
      v101 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      v115 = v100;
      __int16 v116 = 2114;
      uint64_t v117 = (uint64_t)v101;
      _os_log_impl(&dword_21C134000, v93, OS_LOG_TYPE_DEBUG, "%{public}@Superclass returned scene identifier %{public}@", buf, 0x16u);
      if (v94)
      {

        v100 = (void *)v38;
      }

      id v5 = v109;
      unint64_t v6 = 0x263F27000uLL;
    }
  }
  v26 = [*(id *)(v6 + 3256) sharedPurchaseConfig];
  if (!v26)
  {
    v26 = [*(id *)(v6 + 3256) sharedConfig];
  }
  v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v102 = AMSLogKey();
    v103 = NSString;
    uint64_t v104 = objc_opt_class();
    if (v102)
    {
      v105 = AMSLogKey();
      uint64_t v38 = NSStringFromSelector(aSelector);
      [v103 stringWithFormat:@"%@: [%@] %@ ", v104, v105, v38];
    }
    else
    {
      v105 = NSStringFromSelector(aSelector);
      [v103 stringWithFormat:@"%@: %@ ", v104, v105];
    v106 = };
    v107 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v115 = v106;
    __int16 v116 = 2114;
    uint64_t v117 = (uint64_t)v107;
    _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ returning scene identifier %{public}@", buf, 0x16u);
    if (v102)
    {

      v106 = (void *)v38;
    }
  }
LABEL_48:

  return v58;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = 0x263F27000uLL;
  v8 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v8)
  {
    v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = AMSLogKey();
    v11 = NSString;
    uint64_t v12 = objc_opt_class();
    if (v10)
    {
      v13 = AMSLogKey();
      uint64_t v3 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v13, v3];
    }
    else
    {
      v13 = NSStringFromSelector(a2);
      [v11 stringWithFormat:@"%@: %@ ", v12, v13];
    id v4 = };
    *(_DWORD *)buf = 138543362;
    v68 = v4;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      id v4 = (void *)v3;
    }
  }
  v14 = [(AMSPaymentSheetTask *)self purchaseInfo];
  __int16 v15 = [v14 delegate];

  if (![v15 conformsToProtocol:&unk_26CCC4FB0]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    v24 = (void *)v23;
    if (v15)
    {
      if (!v23)
      {
        v24 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v62 = v6;
        v26 = AMSLogKey();
        v27 = NSString;
        uint64_t v28 = objc_opt_class();
        if (v26)
        {
          v29 = AMSLogKey();
          uint64_t v61 = NSStringFromSelector(a2);
          [v27 stringWithFormat:@"%@: [%@] %@ ", v28, v29, v61];
        }
        else
        {
          v29 = NSStringFromSelector(a2);
          [v27 stringWithFormat:@"%@: %@ ", v28, v29];
        uint64_t v30 = };
        id v4 = NSStringFromSelector(sel_purchase_handleSceneBundleIdentifierRequest_completion_);
        v36 = AMSHashIfNeeded();
        v37 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        v68 = v30;
        __int16 v69 = 2114;
        uint64_t v70 = v36;
        __int16 v71 = 2114;
        v72 = v37;
        _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Delegate does not implement %{public}@. delegate: %{public}@", buf, 0x20u);

        if (v26)
        {

          uint64_t v30 = (void *)v61;
        }

        id v6 = v62;
        unint64_t v7 = 0x263F27000;
      }
    }
    else
    {
      if (!v23)
      {
        v24 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v31 = AMSLogKey();
        v32 = NSString;
        uint64_t v33 = objc_opt_class();
        if (v31)
        {
          v34 = AMSLogKey();
          id v4 = NSStringFromSelector(a2);
          [v32 stringWithFormat:@"%@: [%@] %@ ", v33, v34, v4];
        }
        else
        {
          v34 = NSStringFromSelector(a2);
          [v32 stringWithFormat:@"%@: %@ ", v33, v34];
        uint64_t v35 = };
        *(_DWORD *)buf = 138543362;
        v68 = v35;
        _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
        unint64_t v7 = 0x263F27000uLL;
        if (v31)
        {

          uint64_t v35 = v4;
        }
      }
    }

    goto LABEL_37;
  }
  v16 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v16)
  {
    v16 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = AMSLogKey();
    v19 = NSString;
    uint64_t v20 = objc_opt_class();
    if (v18)
    {
      uint64_t v21 = AMSLogKey();
      id v4 = NSStringFromSelector(a2);
      [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, v4];
    }
    else
    {
      uint64_t v21 = NSStringFromSelector(a2);
      [v19 stringWithFormat:@"%@: %@ ", v20, v21];
    uint64_t v22 = };
    v48 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v68 = v22;
    __int16 v69 = 2114;
    uint64_t v70 = v48;
    _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@", buf, 0x16u);
    if (v18)
    {

      uint64_t v22 = v4;
    }

    unint64_t v7 = 0x263F27000uLL;
  }

  id v49 = objc_alloc_init(MEMORY[0x263F27E10]);
  v50 = [(AMSPaymentSheetTask *)self purchaseInfo];
  id v4 = [v50 purchase];
  v51 = +[AMSUISceneBundleIdentifierRequest bundleIdentifierRequest];
  uint64_t v52 = [v49 completionHandlerAdapter];
  [v15 purchase:v4 handleSceneBundleIdentifierRequest:v51 completion:v52];

  id v66 = 0;
  uint64_t v38 = [v49 resultWithError:&v66];
  id v53 = v66;
  if (v53)
  {
    v54 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v54)
    {
      v54 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v55 = [v54 OSLogObject];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v63 = v6;
      v56 = AMSLogKey();
      v57 = NSString;
      uint64_t v58 = objc_opt_class();
      uint64_t v59 = v58;
      if (v56)
      {
        uint64_t v61 = AMSLogKey();
        [v57 stringWithFormat:@"%@: [%@] ", v59, v61];
      }
      else
      {
        [v57 stringWithFormat:@"%@: ", v58];
      v60 = };
      id v4 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      v68 = v60;
      __int16 v69 = 2114;
      uint64_t v70 = v4;
      _os_log_impl(&dword_21C134000, v55, OS_LOG_TYPE_ERROR, "%{public}@Scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v56)
      {

        v60 = (void *)v61;
      }

      id v6 = v63;
    }

    unint64_t v7 = 0x263F27000;
  }

  if (!v38)
  {
LABEL_37:
    v65.receiver = self;
    v65.super_class = (Class)AMSUIPaymentSheetTask;
    uint64_t v38 = [(AMSPaymentSheetTask *)&v65 presentationSceneBundleIdentifierForPaymentAuthorizationController:v6];
  }
  uint64_t v39 = [*(id *)(v7 + 3256) sharedPurchaseConfig];
  if (!v39)
  {
    uint64_t v39 = [*(id *)(v7 + 3256) sharedConfig];
  }
  v40 = [v39 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v41 = AMSLogKey();
    v42 = NSString;
    uint64_t v43 = objc_opt_class();
    if (v41)
    {
      uint64_t v44 = AMSLogKey();
      id v4 = NSStringFromSelector(a2);
      [v42 stringWithFormat:@"%@: [%@] %@ ", v43, v44, v4];
    }
    else
    {
      uint64_t v44 = NSStringFromSelector(a2);
      [v42 stringWithFormat:@"%@: %@ ", v43, v44];
    uint64_t v45 = };
    v46 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v68 = v45;
    __int16 v69 = 2114;
    uint64_t v70 = v46;
    _os_log_impl(&dword_21C134000, v40, OS_LOG_TYPE_DEBUG, "%{public}@ returning bundle identifier %{public}@", buf, 0x16u);
    if (v41)
    {

      uint64_t v45 = v4;
    }
  }
  return v38;
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0x263F27000uLL;
  unint64_t v7 = objc_msgSend(MEMORY[0x263F27CB8], "sharedPurchaseConfig", a3);
  if (!v7)
  {
    unint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = AMSLogKey();
    v10 = NSString;
    uint64_t v11 = objc_opt_class();
    if (v9)
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v3 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v12, v3];
    }
    else
    {
      uint64_t v12 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: %@ ", v11, v12];
    v13 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v81 = v13;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v9)
    {

      v13 = (void *)v3;
    }
  }
  v14 = [(AMSPaymentSheetTask *)self purchaseInfo];
  __int16 v15 = [v14 delegate];

  if (!v15)
  {
    v29 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v29)
    {
      v29 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = AMSLogKey();
      v32 = NSString;
      uint64_t v33 = objc_opt_class();
      if (v31)
      {
        v34 = AMSLogKey();
        uint64_t v6 = NSStringFromSelector(a2);
        [v32 stringWithFormat:@"%@: [%@] %@ ", v33, v34, v6];
      }
      else
      {
        v34 = NSStringFromSelector(a2);
        [v32 stringWithFormat:@"%@: %@ ", v33, v34];
      uint64_t v35 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v81 = v35;
      _os_log_impl(&dword_21C134000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
      if (v31)
      {

        uint64_t v35 = (void *)v6;
      }
    }
    goto LABEL_49;
  }
  if (([v15 conformsToProtocol:&unk_26CCC4FB0] & 1) == 0)
  {
    v29 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v29)
    {
      v29 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v36 = AMSLogKey();
      v37 = NSString;
      uint64_t v38 = objc_opt_class();
      if (v36)
      {
        uint64_t v39 = AMSLogKey();
        uint64_t v6 = NSStringFromSelector(a2);
        [v37 stringWithFormat:@"%@: [%@] %@ ", v38, v39, v6];
      }
      else
      {
        uint64_t v39 = NSStringFromSelector(a2);
        [v37 stringWithFormat:@"%@: %@ ", v38, v39];
      v40 = };
      v55 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v81 = v40;
      __int16 v82 = 2114;
      v83 = v55;
      _os_log_impl(&dword_21C134000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate %{public}@ does not conforms to protocol AMSUIPurchaseDelegate, cannot return window.", buf, 0x16u);
      if (v36)
      {

        v40 = (void *)v6;
      }
    }
LABEL_49:
    v19 = 0;
    goto LABEL_50;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v20 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
      if (!v20)
      {
        id v20 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        aSelectorb = a2;
        v50 = AMSLogKey();
        v51 = NSString;
        uint64_t v52 = objc_opt_class();
        if (v50)
        {
          id v53 = AMSLogKey();
          uint64_t v72 = NSStringFromSelector(aSelectorb);
          [v51 stringWithFormat:@"%@: [%@] %@ ", v52, v53, v72];
        }
        else
        {
          id v53 = NSStringFromSelector(aSelectorb);
          [v51 stringWithFormat:@"%@: %@ ", v52, v53];
        v54 = };
        uint64_t v58 = NSStringFromSelector(sel_purchase_handleWindowRequest_completion_);
        *(_DWORD *)buf = 138543618;
        uint64_t v81 = v54;
        __int16 v82 = 2114;
        v83 = v58;
        _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement %{public}@, cannot return window.", buf, 0x16u);
        if (v50)
        {

          v54 = (void *)v72;
        }

        v19 = 0;
        a2 = aSelectorb;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_68;
    }
    id v20 = objc_alloc_init(MEMORY[0x263F27E10]);
    v41 = [(AMSPaymentSheetTask *)self purchaseInfo];
    v42 = [v41 purchase];
    uint64_t v43 = +[AMSUIWindowRequest windowRequest];
    uint64_t v44 = [v20 completionHandlerAdapter];
    [v15 purchase:v42 handleWindowRequest:v43 completion:v44];

    id v78 = 0;
    v19 = [v20 resultWithError:&v78];
    uint64_t v21 = v78;
    if (!v21)
    {
LABEL_68:

      goto LABEL_69;
    }
    uint64_t v22 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v22)
    {
      uint64_t v22 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v45 = [v22 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      aSelectora = a2;
      uint64_t v46 = AMSLogKey();
      __int16 v69 = NSString;
      uint64_t v47 = objc_opt_class();
      v74 = (void *)v46;
      if (v46)
      {
        uint64_t v48 = AMSLogKey();
        uint64_t v67 = NSStringFromSelector(aSelectora);
        __int16 v71 = (void *)v48;
        [v69 stringWithFormat:@"%@: [%@] %@ ", v47, v48, v67];
      }
      else
      {
        __int16 v71 = NSStringFromSelector(aSelectora);
        [v69 stringWithFormat:@"%@: %@ ", v47, v71];
      id v49 = };
      uint64_t v59 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v81 = v49;
      __int16 v82 = 2114;
      v83 = v59;
      _os_log_impl(&dword_21C134000, v45, OS_LOG_TYPE_ERROR, "%{public}@Window request failed with error: %{public}@", buf, 0x16u);
      if (v74)
      {

        id v49 = (void *)v67;
      }

      a2 = aSelectora;
    }

LABEL_67:
    goto LABEL_68;
  }
  v16 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v17 = [v16 purchase];
  v18 = +[AMSUIWindowRequest windowRequest];
  id v79 = 0;
  v19 = [v15 purchase:v17 handleWindowRequest:v18 error:&v79];
  id v20 = v79;

  if (v20)
  {
    uint64_t v21 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
    if (!v21)
    {
      uint64_t v21 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      aSelector = a2;
      uint64_t v23 = AMSLogKey();
      v24 = NSString;
      uint64_t v25 = objc_opt_class();
      if (v23)
      {
        AMSLogKey();
        v68 = v24;
        uint64_t v27 = v26 = v23;
        uint64_t v70 = NSStringFromSelector(aSelector);
        uint64_t v73 = (void *)v27;
        uint64_t v66 = v27;
        uint64_t v23 = v26;
        [v68 stringWithFormat:@"%@: [%@] %@ ", v25, v66, v70];
      }
      else
      {
        uint64_t v73 = NSStringFromSelector(aSelector);
        [v24 stringWithFormat:@"%@: %@ ", v25, v73];
      uint64_t v28 = };
      v57 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v81 = v28;
      __int16 v82 = 2114;
      v83 = v57;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@Sync Window request failed with error: %{public}@", buf, 0x16u);
      if (v23)
      {

        uint64_t v28 = (void *)v70;
      }

      a2 = aSelector;
    }
    goto LABEL_67;
  }
LABEL_69:

  v29 = [MEMORY[0x263F27CB8] sharedPurchaseConfig];
  if (!v29)
  {
    v29 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v30 = [v29 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v60 = AMSLogKey();
    uint64_t v61 = NSString;
    uint64_t v62 = objc_opt_class();
    if (v60)
    {
      id v63 = AMSLogKey();
      uint64_t v6 = NSStringFromSelector(a2);
      [v61 stringWithFormat:@"%@: [%@] %@ ", v62, v63, v6];
    }
    else
    {
      id v63 = NSStringFromSelector(a2);
      [v61 stringWithFormat:@"%@: %@ ", v62, v63];
    id v64 = };
    objc_super v65 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    uint64_t v81 = v64;
    __int16 v82 = 2114;
    v83 = v65;
    _os_log_impl(&dword_21C134000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ returning window %{public}@", buf, 0x16u);
    if (v60)
    {

      id v64 = (void *)v6;
    }
  }
LABEL_50:

  return v19;
}

@end