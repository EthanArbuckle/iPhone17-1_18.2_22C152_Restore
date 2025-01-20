@interface HMDCoreFollowUpRemoveItemsOperation
- (HMDCoreFollowUpRemoveItemsOperation)initWithIdentifiersToRemove:(id)a3 followUpController:(id)a4;
- (HMDFollowUpController)followUpController;
- (NSArray)identifiersToRemove;
- (void)main;
- (void)setFollowUpController:(id)a3;
- (void)setIdentifiersToRemove:(id)a3;
@end

@implementation HMDCoreFollowUpRemoveItemsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_identifiersToRemove, 0);
}

- (void)setFollowUpController:(id)a3
{
}

- (HMDFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setIdentifiersToRemove:(id)a3
{
}

- (NSArray)identifiersToRemove
{
  return self->_identifiersToRemove;
}

- (void)main
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [(HMDCoreFollowUpRemoveItemsOperation *)v4 identifiersToRemove];
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping advertisement for existing followup items: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v4);
  v8 = [(HMDCoreFollowUpRemoveItemsOperation *)v4 followUpController];
  v9 = [(HMDCoreFollowUpRemoveItemsOperation *)v4 identifiersToRemove];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HMDCoreFollowUpRemoveItemsOperation_main__block_invoke;
  v10[3] = &unk_1E6A12DC8;
  objc_copyWeak(&v11, (id *)buf);
  [v8 clearPendingFollowUpItemsWithUniqueIdentifiers:v9 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __43__HMDCoreFollowUpRemoveItemsOperation_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      v12 = [v8 identifiersToRemove];
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully stopped advertising followup items: %@", (uint8_t *)&v16, 0x16u);
    }
    [v8 finish];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      __int16 v14 = [v8 identifiersToRemove];
      v15 = [v5 shortDescription];
      int v16 = 138543874;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop advertisement for followup items: %@, with error: %@", (uint8_t *)&v16, 0x20u);
    }
    [v8 cancelWithError:v5];
  }
}

- (HMDCoreFollowUpRemoveItemsOperation)initWithIdentifiersToRemove:(id)a3 followUpController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (![v6 count])
  {
LABEL_7:
    v13 = (HMDDefaultUARPControllerDelegate *)_HMFPreconditionFailure();
    [(HMDDefaultUARPControllerDelegate *)v13 .cxx_destruct];
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCoreFollowUpRemoveItemsOperation;
  v9 = [(HMFOperation *)&v15 initWithTimeout:0.0];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifiersToRemove = v9->_identifiersToRemove;
    v9->_identifiersToRemove = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_followUpController, a4);
  }

  return v9;
}

@end