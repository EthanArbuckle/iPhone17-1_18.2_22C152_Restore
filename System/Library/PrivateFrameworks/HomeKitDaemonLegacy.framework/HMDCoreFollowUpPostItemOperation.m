@interface HMDCoreFollowUpPostItemOperation
- (HMDCoreFollowUpPostItemOperation)initWithItemToPost:(id)a3 followUpController:(id)a4;
- (HMDFollowUpController)followUpController;
- (HMDFollowUpItem)itemToPost;
- (void)_postFollowUpItem;
- (void)main;
- (void)setFollowUpController:(id)a3;
- (void)setItemToPost:(id)a3;
@end

@implementation HMDCoreFollowUpPostItemOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_itemToPost, 0);
}

- (void)setFollowUpController:(id)a3
{
}

- (HMDFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setItemToPost:(id)a3
{
}

- (HMDFollowUpItem)itemToPost
{
  return self->_itemToPost;
}

- (void)main
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [(HMDCoreFollowUpPostItemOperation *)v4 itemToPost];
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Posting advertisement for new followup item: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v4);
  v8 = [(HMDCoreFollowUpPostItemOperation *)v4 followUpController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__HMDCoreFollowUpPostItemOperation_main__block_invoke;
  v9[3] = &unk_1E6A0CC98;
  objc_copyWeak(&v10, (id *)buf);
  [v8 pendingFollowUpItemsWithCompletion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __40__HMDCoreFollowUpPostItemOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v48 = v6;
  id val = WeakRetained;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v6 shortDescription];
      *(_DWORD *)buf = 138543618;
      v65 = v11;
      __int16 v66 = 2112;
      v67 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch pending followup items with error: %@", buf, 0x16u);
    }
    id WeakRetained = val;
  }
  __int16 v13 = objc_msgSend(WeakRetained, "itemToPost", v48);
  id v50 = v5;
  id v14 = v13;
  if (val)
  {
    objc_initWeak(&location, val);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v50;
    uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:buf count:16];
    if (v15)
    {
      uint64_t v54 = *(void *)v57;
      char v51 = 1;
LABEL_8:
      uint64_t v55 = v15;
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
        v18 = [v17 uniqueIdentifier];
        v19 = [v14 uniqueIdentifier];
        char v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          v21 = [v17 uniqueIdentifier];
          v22 = [v14 uniqueIdentifier];
          if (![v21 isEqualToString:v22]) {
            goto LABEL_21;
          }
          v23 = [v17 targetBundleIdentifier];
          v24 = [v14 targetBundleIdentifier];
          if (![v23 isEqualToString:v24])
          {

LABEL_21:
            goto LABEL_22;
          }
          v25 = [v17 title];
          v26 = [v14 title];
          char v27 = [v25 isEqualToString:v26];

          if ((v27 & 1) == 0)
          {
            v42 = (void *)MEMORY[0x1D9452090]();
            id v43 = val;
            HMFGetOSLogHandle();
            v44 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v46 = (id)objc_claimAutoreleasedReturnValue();
              v47 = [v17 uniqueIdentifier];
              *(_DWORD *)v61 = 138543618;
              *(void *)&v61[4] = v46;
              *(_WORD *)&v61[12] = 2112;
              *(void *)&v61[14] = v47;
              _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Detected followup item with same identifier (%@), but different title, removing and reposting.", v61, 0x16u);
            }
            v40 = [v43 followUpController];
            v41 = +[HMDCoreFollowUpManager allPossibleFollowUpItemIdentifiers];
            *(void *)v61 = MEMORY[0x1E4F143A8];
            *(void *)&v61[8] = 3221225472;
            *(void *)&v61[16] = __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke_6;
            v62 = &unk_1E6A12DC8;
            objc_copyWeak(v63, &location);
            [v40 clearPendingFollowUpItemsWithUniqueIdentifiers:v41 completion:v61];
LABEL_29:

            objc_destroyWeak(v63);
            goto LABEL_32;
          }
        }
        else
        {
          v28 = [v14 uniqueIdentifier];
          int v29 = [v28 isEqualToString:@"com.apple.HomeKit.UpdateTvOS"];

          v30 = (void *)MEMORY[0x1D9452090]();
          id v31 = val;
          if (v29)
          {
            HMFGetOSLogHandle();
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v37 = (id)objc_claimAutoreleasedReturnValue();
              v38 = [v17 uniqueIdentifier];
              v39 = [v14 uniqueIdentifier];
              *(_DWORD *)v61 = 138543874;
              *(void *)&v61[4] = v37;
              *(_WORD *)&v61[12] = 2112;
              *(void *)&v61[14] = v38;
              *(_WORD *)&v61[22] = 2112;
              v62 = v39;
              _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Removing existing followup with identifier: %@ in favor of: %@", v61, 0x20u);
            }
            v40 = [v31 followUpController];
            v41 = +[HMDCoreFollowUpManager allPossibleFollowUpItemIdentifiers];
            *(void *)v61 = MEMORY[0x1E4F143A8];
            *(void *)&v61[8] = 3221225472;
            *(void *)&v61[16] = __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke;
            v62 = &unk_1E6A12DC8;
            objc_copyWeak(v63, &location);
            [v40 clearPendingFollowUpItemsWithUniqueIdentifiers:v41 completion:v61];
            goto LABEL_29;
          }
          HMFGetOSLogHandle();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = [v14 uniqueIdentifier];
            v35 = [v17 uniqueIdentifier];
            *(_DWORD *)v61 = 138543874;
            *(void *)&v61[4] = v33;
            *(_WORD *)&v61[12] = 2112;
            *(void *)&v61[14] = v34;
            *(_WORD *)&v61[22] = 2112;
            v62 = v35;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Not posting followup with identifier: %@ as currently posted followup is preferred: %@", v61, 0x20u);
          }
          char v51 = 0;
        }
LABEL_22:
        if (v55 == ++v16)
        {
          uint64_t v15 = [obj countByEnumeratingWithState:&v56 objects:buf count:16];
          if (v15) {
            goto LABEL_8;
          }

          if ((v51 & 1) == 0)
          {
            [val finish];
            goto LABEL_32;
          }
          goto LABEL_31;
        }
      }
    }

LABEL_31:
    -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](val);
LABEL_32:
    objc_destroyWeak(&location);
  }
}

void __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](WeakRetained);
}

void __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](WeakRetained);
}

- (void)_postFollowUpItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = a1;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [v3 itemToPost];
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting followup item: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v3);
    v7 = [v3 followUpController];
    v8 = [v3 itemToPost];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__HMDCoreFollowUpPostItemOperation__postFollowUpItem__block_invoke;
    v9[3] = &unk_1E6A12DC8;
    objc_copyWeak(&v10, (id *)buf);
    [v7 postFollowUpItem:v8 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __53__HMDCoreFollowUpPostItemOperation__postFollowUpItem__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [v8 itemToPost];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully started advertising followup item: %@", (uint8_t *)&v16, 0x16u);
    }
    [v8 finish];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      id v14 = [v8 itemToPost];
      uint64_t v15 = [v5 shortDescription];
      int v16 = 138543874;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to advertise followup item: %@ with error: %@", (uint8_t *)&v16, 0x20u);
    }
    [v8 cancelWithError:v5];
  }
}

- (HMDCoreFollowUpPostItemOperation)initWithItemToPost:(id)a3 followUpController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    __int16 v13 = (HMDHomePodSetupLatencyLogEvent *)_HMFPreconditionFailure();
    [(HMDHomePodSetupLatencyLogEvent *)v13 .cxx_destruct];
    return result;
  }
  id v9 = v8;
  v15.receiver = self;
  v15.super_class = (Class)HMDCoreFollowUpPostItemOperation;
  id v10 = [(HMFOperation *)&v15 initWithTimeout:0.0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_itemToPost, a3);
    objc_storeStrong((id *)&v11->_followUpController, a4);
  }

  return v11;
}

@end