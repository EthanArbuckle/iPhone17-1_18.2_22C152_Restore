@interface AMSCardEnrollmentEligibilityTask
- (AMSBagProtocol)bag;
- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3;
- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3 countryCode:(id)a4;
- (AMSCardEnrollmentEligibilityTask)initWithCountryCode:(id)a3;
- (NSString)countryCode;
- (id)_checkForCombinediTunesAccount;
- (id)_checkThatSilentEnrollmentIsEnabled;
- (id)_createEligibilityRequestWithBag:(id)a3 iTunesAccount:(id)a4 iCloudAccount:(id)a5 cardType:(unint64_t)a6;
- (id)_mediaType;
- (id)_performSilentEnrollmentCheckWithRequest:(id)a3;
- (id)performCanWriteBillingInfoQueryWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (unint64_t)_cardTypeForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)canWriteBillingInfoWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5;
- (void)setBag:(id)a3;
@end

@implementation AMSCardEnrollmentEligibilityTask

- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

- (AMSCardEnrollmentEligibilityTask)initWithCountryCode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  id v5 = [(AMSTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;
  }
  return v5;
}

- (AMSCardEnrollmentEligibilityTask)initWithBag:(id)a3 countryCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCardEnrollmentEligibilityTask;
  objc_super v9 = [(AMSTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a3);
    uint64_t v11 = [v8 copy];
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v11;
  }
  return v10;
}

- (void)canWriteBillingInfoWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(AMSCardEnrollmentEligibilityTask *)self performCanWriteBillingInfoQueryWithPassTypeIdentifier:a3 serialNumber:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__AMSCardEnrollmentEligibilityTask_canWriteBillingInfoWithPassTypeIdentifier_serialNumber_completion___block_invoke;
  v11[3] = &unk_1E55A0338;
  id v12 = v8;
  id v10 = v8;
  [v9 addFinishBlock:v11];
}

void __102__AMSCardEnrollmentEligibilityTask_canWriteBillingInfoWithPassTypeIdentifier_serialNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [v8 BOOLValue];
  }
  else {
    uint64_t v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v5);
}

- (id)performCanWriteBillingInfoQueryWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = off_1E559C000;
  objc_super v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    objc_super v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = AMSLogKey();
    id v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      AMSLogKey();
      id v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
      [v12 stringWithFormat:@"%@: [%@] ", v14, v8];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    v15 = };
    v16 = AMSHashIfNeeded(v6);
    v17 = AMSHashIfNeeded(v7);
    *(_DWORD *)buf = 138543874;
    v37 = v15;
    __int16 v38 = 2114;
    v39 = v16;
    __int16 v40 = 2114;
    v41 = v17;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Performing can write billing info with passTypeIdentifier: %{public}@, serialNumber: %{public}@", buf, 0x20u);
    if (v11)
    {

      v15 = v8;
    }
  }
  v18 = [(AMSCardEnrollmentEligibilityTask *)self bag];

  if (v18) {
    goto LABEL_13;
  }
  v19 = [(id)objc_opt_class() bagSubProfile];
  v20 = [(id)objc_opt_class() bagSubProfileVersion];
  v21 = +[AMSBag bagForProfile:v19 profileVersion:v20];
  [(AMSCardEnrollmentEligibilityTask *)self setBag:v21];

  v22 = [(AMSCardEnrollmentEligibilityTask *)self bag];

  if (v22)
  {

LABEL_13:
    v19 = [(AMSCardEnrollmentEligibilityTask *)self _checkThatSilentEnrollmentIsEnabled];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke;
    v33[3] = &unk_1E55A0C00;
    v33[4] = self;
    id v34 = v6;
    id v35 = v7;
    v23 = [v19 thenWithPromiseBlock:v33];

    goto LABEL_14;
  }
  v25 = +[AMSLogConfig sharedConfig];
  if (!v25)
  {
    v25 = +[AMSLogConfig sharedConfig];
  }
  v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = AMSLogKey();
    v28 = NSString;
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = v29;
    if (v27)
    {
      AMSLogKey();
      self = (AMSCardEnrollmentEligibilityTask *)objc_claimAutoreleasedReturnValue();
      [v28 stringWithFormat:@"%@: [%@] ", v30, self];
    }
    else
    {
      [v28 stringWithFormat:@"%@: ", v29];
    v31 = };
    *(_DWORD *)buf = 138543362;
    v37 = v31;
    _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to load bag", buf, 0xCu);
    if (v27)
    {

      v31 = self;
    }
  }
  v32 = AMSError(0, @"Unable to Create Bag", @"We were unable to create a bag.", 0);
  v23 = +[AMSPromise promiseWithError:v32];

LABEL_14:
  return v23;
}

id __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _checkForCombinediTunesAccount];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_2;
  v6[3] = &unk_1E55A0BD8;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v4 = [v2 thenWithBlock:v6];

  return v4;
}

id __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 first];
  id v5 = [v3 second];

  uint64_t v6 = [*(id *)(a1 + 32) _cardTypeForPassTypeIdentifier:*(void *)(a1 + 40) serialNumber:*(void *)(a1 + 48)];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 bag];
  objc_super v9 = [v7 _createEligibilityRequestWithBag:v8 iTunesAccount:v4 iCloudAccount:v5 cardType:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_3;
  v12[3] = &unk_1E559E998;
  v12[4] = *(void *)(a1 + 32);
  id v10 = [v9 thenWithBlock:v12];

  return v10;
}

uint64_t __103__AMSCardEnrollmentEligibilityTask_performCanWriteBillingInfoQueryWithPassTypeIdentifier_serialNumber___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performSilentEnrollmentCheckWithRequest:a2];
}

- (unint64_t)_cardTypeForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v77 = v7;
  if (!v6 || !v7)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v9 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = AMSLogKey();
      v20 = NSString;
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = v21;
      if (v19)
      {
        v23 = AMSLogKey();
        v24 = [v20 stringWithFormat:@"%@: [%@] ", v22, v23];
      }
      else
      {
        v24 = [v20 stringWithFormat:@"%@: ", v21];
        v23 = v24;
      }
      uint64_t v30 = AMSHashIfNeeded(v6);
      id v4 = AMSHashIfNeeded(v77);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2114;
      v83 = v4;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@Indeterminate passTypeIdentifier: %{public}@, serialNumer: %{public}@", buf, 0x20u);
      if (v19) {
    }
      }
    goto LABEL_66;
  }
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2050000000;
  id v8 = (void *)_MergedGlobals_1_4;
  uint64_t v81 = _MergedGlobals_1_4;
  if (!_MergedGlobals_1_4)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPassLibraryClass_block_invoke;
    v83 = &unk_1E559EC70;
    v84 = &v78;
    __getPKPassLibraryClass_block_invoke((uint64_t)buf);
    id v8 = (void *)v79[3];
  }
  id v4 = v8;
  _Block_object_dispose(&v78, 8);
  id v9 = objc_alloc_init((Class)v4);
  if (!v9)
  {
    BOOL v25 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v26 = +[AMSLogConfig sharedConfig];
    v18 = v26;
    if (v25)
    {
      if (!v26)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v18 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        uint64_t v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not instantiate PKPassLibrary", buf, 0xCu);
      }
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v4 = +[AMSLogConfig sharedConfig];
      [v18 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v4 userInfo:0];
    }
    else
    {
      if (!v26)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      id v4 = [v18 OSLogObject];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v32;
        _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_FAULT, "%{public}@Could not instantiate PKPassLibrary", buf, 0xCu);
      }
    }
    id v9 = 0;
    goto LABEL_66;
  }
  id v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = AMSLogKey();
    uint64_t v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v14;
    if (v12)
    {
      v16 = AMSLogKey();
      v17 = [v13 stringWithFormat:@"%@: [%@] ", v15, v16];
    }
    else
    {
      v17 = [v13 stringWithFormat:@"%@: ", v14];
      v16 = v17;
    }
    v33 = AMSHashIfNeeded(v6);
    id v4 = AMSHashIfNeeded(v77);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2114;
    v83 = v4;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to determine card type for passTypeIdentifier: %{public}@, serialNumber: %{public}@", buf, 0x20u);
    if (v12) {
  }
    }
  v18 = [v9 passWithPassTypeIdentifier:v6 serialNumber:v77];
  if (v18)
  {
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    id v34 = (void *)qword_1EB38D098;
    uint64_t v81 = qword_1EB38D098;
    if (!qword_1EB38D098)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPKPaymentPassClass_block_invoke;
      v83 = &unk_1E559EC70;
      v84 = &v78;
      __getPKPaymentPassClass_block_invoke((uint64_t)buf);
      id v34 = (void *)v79[3];
    }
    id v4 = v34;
    _Block_object_dispose(&v78, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v18;
      id v4 = [v18 paymentApplications];
      int v35 = [v4 ams_anyWithTest:&__block_literal_global_25];

      if (v35)
      {
        v36 = +[AMSLogConfig sharedConfig];
        if (!v36)
        {
          v36 = +[AMSLogConfig sharedConfig];
        }
        v37 = [v36 OSLogObject];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = AMSLogKey();
          uint64_t v39 = v38 == 0;
          __int16 v40 = NSString;
          uint64_t v41 = objc_opt_class();
          id v4 = v41;
          if (v38)
          {
            uint64_t v39 = AMSLogKey();
            [v40 stringWithFormat:@"%@: [%@] ", v4, v39];
          }
          else
          {
            [v40 stringWithFormat:@"%@: ", v41];
          uint64_t v42 = };
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Found barcode network identifier", buf, 0xCu);
          if (v38)
          {

            uint64_t v42 = (void *)v39;
          }
        }
      }
      if ([v18 hasAssociatedPeerPaymentAccount])
      {
        unint64_t v57 = 2;
      }
      else
      {
        id v4 = [v18 associatedAccountServiceAccountIdentifier];

        if (v4) {
          char v68 = 1;
        }
        else {
          char v68 = v35;
        }
        if (v4) {
          unint64_t v57 = 3;
        }
        else {
          unint64_t v57 = 4;
        }
        if ((v68 & 1) == 0)
        {
          v69 = +[AMSLogConfig sharedConfig];
          if (!v69)
          {
            v69 = +[AMSLogConfig sharedConfig];
          }
          v70 = [v69 OSLogObject];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v71 = AMSLogKey();
            v72 = NSString;
            uint64_t v73 = objc_opt_class();
            uint64_t v74 = v73;
            if (v71)
            {
              id v4 = AMSLogKey();
              [v72 stringWithFormat:@"%@: [%@] ", v74, v4];
            }
            else
            {
              [v72 stringWithFormat:@"%@: ", v73];
            v75 = };
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v75;
            _os_log_impl(&dword_18D554000, v70, OS_LOG_TYPE_ERROR, "%{public}@Card is unknown type of PKPaymentPass", buf, 0xCu);
            if (v71)
            {

              v75 = v4;
            }
          }
          unint64_t v57 = 0;
        }
      }

      goto LABEL_67;
    }
    v50 = +[AMSLogConfig sharedConfig];
    if (!v50)
    {
      v50 = +[AMSLogConfig sharedConfig];
    }
    v51 = [v50 OSLogObject];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v76 = AMSLogKey();
      v52 = NSString;
      uint64_t v53 = objc_opt_class();
      uint64_t v54 = v53;
      if (v76)
      {
        v55 = AMSLogKey();
        v56 = [v52 stringWithFormat:@"%@: [%@] ", v54, v55];
      }
      else
      {
        v56 = [v52 stringWithFormat:@"%@: ", v53];
        v55 = v56;
      }
      v58 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v58);
      v59 = AMSHashIfNeeded(v4);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v59;
      _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@Pass is not a PKPaymentPass: %{public}@", buf, 0x16u);

      if (v76) {
    }
      }

LABEL_66:
    unint64_t v57 = 0;
    goto LABEL_67;
  }
  v43 = +[AMSLogConfig sharedConfig];
  if (!v43)
  {
    v43 = +[AMSLogConfig sharedConfig];
  }
  v44 = [v43 OSLogObject];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    v45 = AMSLogKey();
    v46 = NSString;
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = v47;
    if (v45)
    {
      id v4 = AMSLogKey();
      [v46 stringWithFormat:@"%@: [%@] ", v48, v4];
    }
    else
    {
      [v46 stringWithFormat:@"%@: ", v47];
    v49 = };
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v49;
    _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@No card found", buf, 0xCu);
    if (v45)
    {

      v49 = v4;
    }
  }
  v18 = 0;
  unint64_t v57 = 1;
LABEL_67:

  v60 = +[AMSLogConfig sharedConfig];
  if (!v60)
  {
    v60 = +[AMSLogConfig sharedConfig];
  }
  v61 = [v60 OSLogObject];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = AMSLogKey();
    v63 = NSString;
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = v64;
    if (v62)
    {
      id v4 = AMSLogKey();
      [v63 stringWithFormat:@"%@: [%@] ", v65, v4];
    }
    else
    {
      [v63 stringWithFormat:@"%@: ", v64];
    v66 = };
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v66;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v57;
    _os_log_impl(&dword_18D554000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Found card type: %lu", buf, 0x16u);
    if (v62)
    {

      v66 = v4;
    }
  }
  return v57;
}

BOOL __80__AMSCardEnrollmentEligibilityTask__cardTypeForPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1, void *a2)
{
  return [a2 paymentNetworkIdentifier] == 123;
}

- (id)_checkForCombinediTunesAccount
{
  id v3 = (void *)MEMORY[0x1E4F179C8];
  id v4 = [(AMSCardEnrollmentEligibilityTask *)self _mediaType];
  id v5 = objc_msgSend(v3, "ams_sharedAccountStoreForMediaType:", v4);

  id v6 = [(AMSCardEnrollmentEligibilityTask *)self _mediaType];
  id v7 = objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__AMSCardEnrollmentEligibilityTask__checkForCombinediTunesAccount__block_invoke;
  v11[3] = &unk_1E559F9B0;
  void v11[4] = self;
  id v12 = v5;
  id v8 = v5;
  id v9 = [v7 continueWithBlock:v11];

  return v9;
}

id __66__AMSCardEnrollmentEligibilityTask__checkForCombinediTunesAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ams_fetchActiveiCloudAccount");
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__AMSCardEnrollmentEligibilityTask__checkForCombinediTunesAccount__block_invoke_54;
    v17[3] = &unk_1E559F9B0;
    v17[4] = *(void *)(a1 + 32);
    id v18 = v5;
    id v8 = [v7 continueWithBlock:v17];
  }
  else
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = AMSLogKey();
      id v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        a1 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, a1];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      uint64_t v15 = };
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@Can write billing info failed for no active iTunes account", buf, 0xCu);
      if (v11)
      {

        uint64_t v15 = (void *)a1;
      }
    }
    id v7 = AMSError(103, @"Silent Enrollment Error", @"No active iTunes account", v6);
    id v8 = +[AMSPromise promiseWithError:v7];
  }

  return v8;
}

id __66__AMSCardEnrollmentEligibilityTask__checkForCombinediTunesAccount__block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "ams_DSID");
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = objc_msgSend(v5, "ams_DSID");
      if (v9)
      {
        id v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "ams_DSID");
        id v12 = objc_msgSend(v5, "ams_DSID");
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
          uint64_t v14 = [[AMSPair alloc] initWithFirst:*(void *)(a1 + 40) second:v5];
          uint64_t v15 = +[AMSPromise promiseWithResult:v14];

          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    v23 = +[AMSLogConfig sharedConfig];
    if (!v23)
    {
      v23 = +[AMSLogConfig sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = AMSLogKey();
      uint64_t v26 = NSString;
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = v27;
      if (v25)
      {
        a1 = AMSLogKey();
        [v26 stringWithFormat:@"%@: [%@] ", v28, a1];
      }
      else
      {
        [v26 stringWithFormat:@"%@: ", v27];
      uint64_t v29 = };
      *(_DWORD *)buf = 138543362;
      v33 = v29;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@Can write billing info failed for no combined account", buf, 0xCu);
      if (v25)
      {

        uint64_t v29 = (void *)a1;
      }
    }
    uint64_t v30 = AMSError(105, @"Silent Enrollment Error", @"Split Account", 0);
  }
  else
  {
    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = AMSLogKey();
      v19 = NSString;
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = v20;
      if (v18)
      {
        a1 = AMSLogKey();
        [v19 stringWithFormat:@"%@: [%@] ", v21, a1];
      }
      else
      {
        [v19 stringWithFormat:@"%@: ", v20];
      uint64_t v22 = };
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@Can write billing info failed for no active iCloud account", buf, 0xCu);
      if (v18)
      {

        uint64_t v22 = (void *)a1;
      }
    }
    uint64_t v30 = AMSError(103, @"Silent Enrollment Error", @"No active iCloud account", v6);
  }
  uint64_t v15 = +[AMSPromise promiseWithError:v30];

LABEL_28:
  return v15;
}

- (id)_checkThatSilentEnrollmentIsEnabled
{
  id v3 = [(AMSCardEnrollmentEligibilityTask *)self bag];
  id v4 = [v3 BOOLForKey:@"use-silent-enrollment"];
  id v5 = [v4 valuePromise];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__AMSCardEnrollmentEligibilityTask__checkThatSilentEnrollmentIsEnabled__block_invoke;
  v8[3] = &unk_1E55A0C48;
  v8[4] = self;
  id v6 = [v5 continueWithBinaryPromiseBlock:v8];

  return v6;
}

id __71__AMSCardEnrollmentEligibilityTask__checkThatSilentEnrollmentIsEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v5 BOOLValue])
  {
    uint64_t v7 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = AMSLogKey();
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        a1 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, a1];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      uint64_t v14 = };
      *(_DWORD *)buf = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Can write billing info failed for feature not enabled", buf, 0xCu);
      if (v10)
      {

        uint64_t v14 = (void *)a1;
      }
    }
    uint64_t v15 = AMSError(5, @"Silent Enrollment Error", @"Feature Not Enabled", v6);
    uint64_t v7 = +[AMSBinaryPromise promiseWithError:v15];
  }
  return v7;
}

- (id)_createEligibilityRequestWithBag:(id)a3 iTunesAccount:(id)a4 iCloudAccount:(id)a5 cardType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 URLForKey:@"applePaySilentEnrollEligible" account:v11];
  uint64_t v14 = [v13 valuePromise];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke;
  v20[3] = &unk_1E55A0CC0;
  id v21 = v10;
  id v22 = v11;
  id v24 = v12;
  unint64_t v25 = a6;
  v23 = self;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = [v14 thenWithBlock:v20];

  return v18;
}

id __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 32)];
  [(AMSURLRequestEncoder *)v5 setAccount:*(void *)(a1 + 40)];
  [(AMSURLRequestEncoder *)v5 setDialogOptions:1];
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6 == 4)
  {
    uint64_t v29 = @"cardType";
    uint64_t v30 = @"APPLE_PAY_AQUAMAN";
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = &v30;
    uint64_t v9 = &v29;
    goto LABEL_5;
  }
  if (v6 == 3)
  {
    v31 = @"cardType";
    v32[0] = @"APPLE_PAY_BROADWAY";
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (__CFString **)v32;
    uint64_t v9 = &v31;
LABEL_5:
    id v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
    goto LABEL_16;
  }
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = AMSLogKey();
    uint64_t v14 = NSString;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = v15;
    if (v13)
    {
      uint64_t v2 = AMSLogKey();
      [v14 stringWithFormat:@"%@: [%@] ", v16, v2];
    }
    else
    {
      [v14 stringWithFormat:@"%@: ", v15];
    id v17 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v17;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_INFO, "%{public}@Can write billing info skipping URL decoration", buf, 0xCu);
    if (v13)
    {

      id v17 = (void *)v2;
    }
  }
  id v10 = 0;
LABEL_16:
  id v18 = [(AMSURLRequestEncoder *)v5 requestWithMethod:2 URL:v4 parameters:v10];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_70;
  v23[3] = &unk_1E55A0C98;
  id v24 = *(id *)(a1 + 56);
  int8x16_t v22 = *(int8x16_t *)(a1 + 40);
  id v19 = (id)v22.i64[0];
  int8x16_t v25 = vextq_s8(v22, v22, 8uLL);
  id v26 = *(id *)(a1 + 32);
  uint64_t v20 = [v18 thenWithBlock:v23];

  return v20;
}

id __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_msgSend(v4, "ams_addSilentEnrollmentHeadersForAccount:", *(void *)(a1 + 32));
  id v5 = [v4 valueForHTTPHeaderField:@"X-Apple-Store-Front"];
  if (v5)
  {
    uint64_t v6 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = AMSLogKey();
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v2 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v2];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      *(_DWORD *)buf = 138543362;
      id v24 = v13;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Can write billing info will attach storefront header manually", buf, 0xCu);
      if (v9)
      {

        uint64_t v13 = (void *)v2;
      }
    }
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 40) _mediaType];
    uint64_t v16 = +[AMSURLRequestDecoration addStoreFrontHeaderToRequest:v4 forAccount:v14 mediaType:v15 bag:*(void *)(a1 + 56)];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_72;
    v22[3] = &unk_1E55A0C70;
    v22[4] = *(void *)(a1 + 40);
    uint64_t v6 = [v16 catchWithBlock:v22];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_74;
  v20[3] = &unk_1E559EA38;
  id v21 = v4;
  id v17 = v4;
  id v18 = [v6 thenWithPromiseBlock:v20];

  return v18;
}

id __106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to add storefront header to request. Continuing without header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
  uint64_t v12 = +[AMSBinaryPromise promiseWithSuccess];

  return v12;
}

AMSPromise *__106__AMSCardEnrollmentEligibilityTask__createEligibilityRequestWithBag_iTunesAccount_iCloudAccount_cardType___block_invoke_74(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
}

- (id)_mediaType
{
  return +[AMSProcessInfo defaultMediaTypeForCurrentProcess];
}

- (id)_performSilentEnrollmentCheckWithRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "addIndexesInRange:", 200, 100);
  objc_msgSend(v6, "addIndexesInRange:", 400, 100);
  uint64_t v7 = (void *)MEMORY[0x1E4F18DD0];
  uint64_t v8 = +[AMSProcessInfo currentProcess];
  uint64_t v9 = [(AMSCardEnrollmentEligibilityTask *)self bag];
  id v10 = objc_msgSend(v7, "ams_configurationWithProcessInfo:bag:", v8, v9);

  uint64_t v11 = [[AMSURLSession alloc] initWithConfiguration:v10];
  uint64_t v12 = objc_alloc_init(AMSURLResponseDecoder);
  uint64_t v13 = (void *)[v6 copy];
  [(AMSURLResponseDecoder *)v12 setAllowedStatusCodes:v13];

  [(AMSURLSession *)v11 setResponseDecoder:v12];
  uint64_t v14 = objc_alloc_init(AMSAppleCardSilentEnrollmentProtocolHandler);
  [(AMSURLSession *)v11 setDelegate:v14];
  [(AMSURLSession *)v11 setProtocolHandler:v14];
  uint64_t v15 = [(AMSURLSession *)v11 dataTaskPromiseWithRequest:v5];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke;
  v18[3] = &unk_1E559F348;
  v18[4] = self;
  __int16 v16 = [v15 thenWithBlock:v18];

  return v16;
}

id __77__AMSCardEnrollmentEligibilityTask__performSilentEnrollmentCheckWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"eligible"];
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = AMSLogKey();
      uint64_t v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        a1 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v10, a1];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      uint64_t v11 = };
      id v19 = AMSHashIfNeeded(v4);
      *(_DWORD *)buf = 138543618;
      id v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v19;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Can write billing info completed with response: %{public}@", buf, 0x16u);
      if (v7)
      {

        uint64_t v11 = (void *)a1;
      }
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F28ED0];
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = [v4 BOOLValue];
    }
    else {
      uint64_t v21 = 0;
    }
    int8x16_t v22 = [v20 numberWithInt:v21];
    v23 = +[AMSPromise promiseWithResult:v22];
  }
  else
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = AMSLogKey();
      uint64_t v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        a1 = AMSLogKey();
        [v15 stringWithFormat:@"%@: [%@] ", v17, a1];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      uint64_t v18 = };
      *(_DWORD *)buf = 138543362;
      id v26 = v18;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@Can write billing info failed to deserialize response", buf, 0xCu);
      if (v14)
      {

        uint64_t v18 = (void *)a1;
      }
    }
    id v4 = AMSError(301, @"Silent Enrollment Error", @"Failed to deserialize JSON response", 0);
    v23 = +[AMSPromise promiseWithError:v4];
  }

  return v23;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end