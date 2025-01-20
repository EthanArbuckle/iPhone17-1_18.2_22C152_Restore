@interface HMMediaDestinationController
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)availableDestinationIdentifiersIsEqualToIdentifiers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsSameRoomB620Destinations;
- (HMMediaDestination)destination;
- (HMMediaDestinationController)initWithControllerData:(id)a3;
- (HMMediaDestinationController)initWithIdentifier:(id)a3 destinationIdentifier:(id)a4 supportedOptions:(unint64_t)a5 availableDestinationIdentifiers:(id)a6;
- (HMMediaDestinationControllerDataSource)dataSource;
- (HMMediaDestinationControllerDelegate)delegate;
- (NSArray)attributeDescriptions;
- (NSArray)availableDestinationIdentifiers;
- (NSArray)availableDestinations;
- (NSString)description;
- (NSString)lastNotifiedDestinationIdentifier;
- (NSString)shortDescription;
- (NSUUID)destinationIdentifier;
- (NSUUID)identifier;
- (_HMContext)context;
- (id)logIdentifier;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (void)_notifyDidUpdateDestination;
- (void)callCompletionHandler:(id)a3;
- (void)callCompletionHandler:(id)a3 error:(id)a4;
- (void)configureLastNotifiedDestinationIdentifier;
- (void)configureWithContext:(id)a3 dataSource:(id)a4;
- (void)mergeSupportedOptionsWithNewController:(id)a3;
- (void)notifyDidUpdateAvailableDestinations;
- (void)notifyDidUpdateDestination;
- (void)setAvailableDestinationIdentifiers:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationIdentifier:(id)a3;
- (void)setLastNotifiedDestinationIdentifier:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)unconfigure;
- (void)updateDestination:(id)a3 completionHandler:(id)a4;
- (void)updateDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation HMMediaDestinationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotifiedDestinationIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);

  objc_storeStrong((id *)&self->_availableDestinationIdentifiers, 0);
}

- (void)setLastNotifiedDestinationIdentifier:(id)a3
{
}

- (NSString)lastNotifiedDestinationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMMediaDestinationControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMMediaDestinationControllerDataSource *)WeakRetained;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMMediaDestinationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMMediaDestinationControllerDelegate *)WeakRetained;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMMediaDestinationController *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMediaDestinationController *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMMediaDestinationController *)self identifier];
      v8 = [(HMMediaDestinationController *)v6 identifier];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMMediaDestinationController *)v6 availableDestinationIdentifiers];
        if ([(HMMediaDestinationController *)self availableDestinationIdentifiersIsEqualToIdentifiers:v9])
        {
          v10 = [(HMMediaDestinationController *)self destinationIdentifier];
          v11 = [(HMMediaDestinationController *)v6 destinationIdentifier];
          char v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMediaDestinationController *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMMediaDestinationController *)self destinationIdentifier];
  v8 = (void *)[v6 initWithName:@"destinationIdentifier" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = HMMediaDestinationControllerSupportOptionsAsString([(HMMediaDestinationController *)self supportedOptions]);
  v11 = (void *)[v9 initWithName:@"supportedOptions" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMMediaDestinationController *)self availableDestinationIdentifiers];
  v14 = (void *)[v12 initWithName:@"availableDestinationIdentifiers" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)logIdentifier
{
  v2 = [(HMMediaDestinationController *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)mergeSupportedOptionsWithNewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HMMediaDestinationController *)self supportedOptions];
  if (v5 != [v4 supportedOptions])
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      v10 = HMMediaDestinationControllerSupportOptionsAsString([v4 supportedOptions]);
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging supported options: %@", (uint8_t *)&v11, 0x16u);
    }
    -[HMMediaDestinationController setSupportedOptions:](v7, "setSupportedOptions:", [v4 supportedOptions]);
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v21;
      __int16 v51 = 2112;
      id v52 = v4;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media destination controller using new object: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v7 = [(HMMediaDestinationController *)self identifier];
  v8 = [v6 identifier];
  char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if ((v9 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [v6 identifier];
      v24 = [(HMMediaDestinationController *)v19 identifier];
      *(_DWORD *)buf = 138543874;
      v50 = v22;
      __int16 v51 = 2112;
      id v52 = v23;
      __int16 v53 = 2112;
      v54 = v24;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media destination controller with identifier: %@ due to existing identifier: %@", buf, 0x20u);
    }
LABEL_14:

    char v25 = 0;
    goto LABEL_27;
  }
  v10 = [(HMMediaDestinationController *)self destinationIdentifier];
  int v11 = [v6 destinationIdentifier];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_15;
  }
  __int16 v13 = [(HMMediaDestinationController *)self lastNotifiedDestinationIdentifier];
  v14 = [v6 destinationIdentifier];
  uint64_t v15 = [v14 UUIDString];
  char v16 = HMFEqualObjects();

  if (v16)
  {
    char v17 = 0;
  }
  else
  {
LABEL_15:
    v26 = (void *)MEMORY[0x19F3A64A0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      v30 = [v6 destinationIdentifier];
      *(_DWORD *)buf = 138543618;
      v50 = v29;
      __int16 v51 = 2112;
      id v52 = v30;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Merging new media destination controller destination: %@", buf, 0x16u);
    }
    char v17 = 1;
  }
  v31 = [v6 availableDestinationIdentifiers];
  BOOL v32 = [(HMMediaDestinationController *)self availableDestinationIdentifiersIsEqualToIdentifiers:v31];

  if (!v32)
  {
    v33 = (void *)MEMORY[0x19F3A64A0]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      v37 = [v6 availableDestinationIdentifiers];
      *(_DWORD *)buf = 138543618;
      v50 = v36;
      __int16 v51 = 2112;
      id v52 = v37;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@Merging new media destination controller available destinations: %@", buf, 0x16u);
    }
  }
  os_unfair_lock_lock_with_options();
  v38 = [v6 availableDestinationIdentifiers];
  availableDestinationIdentifiers = self->_availableDestinationIdentifiers;
  self->_availableDestinationIdentifiers = v38;

  v40 = [v6 destinationIdentifier];
  destinationIdentifier = self->_destinationIdentifier;
  self->_destinationIdentifier = v40;

  os_unfair_lock_unlock(&self->_lock);
  [(HMMediaDestinationController *)self mergeSupportedOptionsWithNewController:v6];
  if (v17)
  {
    v42 = [(HMMediaDestinationController *)self context];
    v43 = [v42 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMMediaDestinationController_mergeFromNewObject___block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v43, block);
  }
  if (!v32)
  {
    v44 = [(HMMediaDestinationController *)self context];
    v45 = [v44 queue];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __51__HMMediaDestinationController_mergeFromNewObject___block_invoke_2;
    v47[3] = &unk_1E59452E8;
    v47[4] = self;
    dispatch_async(v45, v47);
  }
  char v25 = v17 | !v32;
LABEL_27:

  return v25;
}

uint64_t __51__HMMediaDestinationController_mergeFromNewObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDidUpdateDestination];
}

uint64_t __51__HMMediaDestinationController_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDidUpdateAvailableDestinations];
}

- (BOOL)availableDestinationIdentifiersIsEqualToIdentifiers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMMediaDestinationController *)self availableDestinationIdentifiers];
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__HMMediaDestinationController_availableDestinationIdentifiersIsEqualToIdentifiers___block_invoke;
    v9[3] = &unk_1E5940578;
    id v10 = v5;
    char v7 = objc_msgSend(v4, "na_allObjectsPassTest:", v9);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

uint64_t __84__HMMediaDestinationController_availableDestinationIdentifiersIsEqualToIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)notifyDidUpdateAvailableDestinations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self context];
  id v4 = [v3 delegateCaller];
  unint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__HMMediaDestinationController_notifyDidUpdateAvailableDestinations__block_invoke;
    v10[3] = &unk_1E59452E8;
    v10[4] = self;
    [v4 invokeBlock:v10];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    char v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated available destinations due to no delegate caller given by context: %@", buf, 0x16u);
    }
  }
}

void __68__HMMediaDestinationController_notifyDidUpdateAvailableDestinations__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling did update available destinations for delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 mediaDestinationControllerDidUpdateAvailableDestinations:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDidUpdateDestination
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self destination];
  id v4 = [(HMMediaDestinationController *)self lastNotifiedDestinationIdentifier];
  unint64_t v5 = [v3 audioDestinationIdentifier];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    int v7 = (void *)MEMORY[0x19F3A64A0]();
    v8 = self;
    __int16 v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [(HMMediaDestinationController *)v8 lastNotifiedDestinationIdentifier];
      int v18 = 138543618;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping notifying of update destination due to matching destination identifiers: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    int v12 = [v3 audioDestinationIdentifier];
    [(HMMediaDestinationController *)self setLastNotifiedDestinationIdentifier:v12];

    __int16 v13 = [(HMMediaDestinationController *)self delegate];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v17 = HMFGetLogIdentifier();
      int v18 = 138543874;
      v19 = v17;
      __int16 v20 = 2112;
      v21 = v3;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying client did update destination: %@ delegate: %@", (uint8_t *)&v18, 0x20u);
    }
    if (objc_opt_respondsToSelector()) {
      [v13 mediaDestinationController:v15 didUpdateDestination:v3];
    }
  }
}

- (void)notifyDidUpdateDestination
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self context];
  id v4 = [v3 delegateCaller];
  unint64_t v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__HMMediaDestinationController_notifyDidUpdateDestination__block_invoke;
    v10[3] = &unk_1E59452E8;
    v10[4] = self;
    [v4 invokeBlock:v10];
  }
  else
  {
    int v6 = (void *)MEMORY[0x19F3A64A0]();
    int v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated destination due to no delegate caller given by context: %@", buf, 0x16u);
    }
  }
}

uint64_t __58__HMMediaDestinationController_notifyDidUpdateDestination__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDidUpdateDestination];
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(HMMediaDestinationController *)self context];
    __int16 v9 = [v8 delegateCaller];
    id v10 = v9;
    if (v9)
    {
      [v9 callCompletion:v6 error:v7];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
      char v16 = self;
      char v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        __int16 v20 = v18;
        __int16 v21 = 2112;
        __int16 v22 = v8;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)callCompletionHandler:(id)a3
{
}

- (NSArray)availableDestinations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self availableDestinationIdentifiers];
  id v4 = [(HMMediaDestinationController *)self dataSource];
  if (v4)
  {
    unint64_t v5 = [(HMMediaDestinationController *)self availableDestinationIdentifiers];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMMediaDestinationController_availableDestinations__block_invoke;
    v12[3] = &unk_1E593EA60;
    id v13 = v4;
    v14 = self;
    id v6 = objc_msgSend(v5, "na_map:", v12);
  }
  else
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    v8 = self;
    __int16 v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v16 = v10;
      __int16 v17 = 2112;
      int v18 = v3;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@No data source set to get available destinations with identifiers: %@", buf, 0x16u);
    }
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

id __53__HMMediaDestinationController_availableDestinations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mediaDestinationController:*(void *)(a1 + 40) destinationWithIdentifier:v3];
  if (!v4)
  {
    unint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543874;
      int v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination with identifier: %@ from data source: %@", (uint8_t *)&v11, 0x20u);
    }
  }

  return v4;
}

- (HMMediaDestination)destination
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self destinationIdentifier];
  if (v3)
  {
    id v4 = [(HMMediaDestinationController *)self dataSource];
    unint64_t v5 = v4;
    if (v4)
    {
      id v6 = [v4 mediaDestinationController:self destinationWithIdentifier:v3];
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
        id v14 = self;
        __int16 v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          int v18 = 138543874;
          uint64_t v19 = v16;
          __int16 v20 = 2112;
          __int16 v21 = v3;
          __int16 v22 = 2112;
          uint64_t v23 = v5;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination with identifier: %@ from data source: %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        __int16 v21 = v3;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@No data source set to get destination with identifier: %@", (uint8_t *)&v18, 0x16u);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (HMMediaDestination *)v7;
}

- (void)setDestinationIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  destinationIdentifier = self->_destinationIdentifier;
  self->_destinationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)destinationIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_destinationIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAvailableDestinationIdentifiers:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  availableDestinationIdentifiers = self->_availableDestinationIdentifiers;
  self->_availableDestinationIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)availableDestinationIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_availableDestinationIdentifiers;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)unconfigure
{
}

- (void)configureLastNotifiedDestinationIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaDestinationController *)self destination];
  id v4 = [v3 audioDestinationIdentifier];
  unint64_t v5 = [(HMMediaDestinationController *)self lastNotifiedDestinationIdentifier];
  char v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring last notified destination identifier: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMMediaDestinationController *)v8 setLastNotifiedDestinationIdentifier:v4];
  }
}

- (void)configureWithContext:(id)a3 dataSource:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v12 = 138544130;
    __int16 v13 = v11;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring destination controller: %@ context: %@ data source: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(HMMediaDestinationController *)v9 setContext:v6];
  [(HMMediaDestinationController *)v9 setDataSource:v7];
  [(HMMediaDestinationController *)v9 configureLastNotifiedDestinationIdentifier];
}

- (void)updateDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  int v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    __int16 v14 = HMMediaDestinationControllerUpateOptionsAsString(a4);
    *(_DWORD *)buf = 138543874;
    v42 = v13;
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending update destination message with destination: %@ options: %@", buf, 0x20u);
  }
  uint64_t v15 = [(HMMediaDestinationController *)v11 context];
  __int16 v16 = [v15 messageDispatcher];
  if (v16)
  {
    if (v8) {
      +[HMMediaDestination payloadForDestination:v8 options:a4];
    }
    else {
    id v17 = +[HMMediaDestination payloadForNullDestination];
    }
    __int16 v22 = v17;
    if (v17)
    {
      uint64_t v23 = (void *)[v17 mutableCopy];
      uint64_t v24 = [NSNumber numberWithUnsignedInteger:a4];
      [v23 setObject:v24 forKey:@"HMMediaDestinationControllerUpdateOptionsPayloadKey"];

      id v25 = objc_alloc(MEMORY[0x1E4F65488]);
      v26 = [(HMMediaDestinationController *)v11 identifier];
      v27 = (void *)[v25 initWithTarget:v26];

      v28 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMMediaDestinationControllerUpdateDestinationRequestMessage" destination:v27 payload:v23];
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __76__HMMediaDestinationController_updateDestination_options_completionHandler___block_invoke;
      v38 = &unk_1E5944EF0;
      v39 = v11;
      id v40 = v9;
      [v28 setResponseHandler:&v35];
      v29 = objc_msgSend(v28, "copy", v35, v36, v37, v38, v39);
      [v16 sendMessage:v29];
    }
    else
    {
      v30 = (void *)MEMORY[0x19F3A64A0]();
      v31 = v11;
      BOOL v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        v34 = HMMediaDestinationControllerUpateOptionsAsString(a4);
        *(_DWORD *)buf = 138543874;
        v42 = v33;
        __int16 v43 = 2112;
        id v44 = v8;
        __int16 v45 = 2112;
        v46 = v34;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination payload for destination: %@ options: %@", buf, 0x20u);
      }
      uint64_t v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [(HMMediaDestinationController *)v31 callCompletionHandler:v9 error:v23];
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = v11;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v21;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination due to no message dispatcher given by context: %@", buf, 0x16u);
    }
    __int16 v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [(HMMediaDestinationController *)v19 callCompletionHandler:v9 error:v22];
  }
}

void __76__HMMediaDestinationController_updateDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination message responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40) error:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination message succeeded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)supportsSameRoomB620Destinations
{
  return ([(HMMediaDestinationController *)self supportedOptions] >> 2) & 1;
}

- (HMMediaDestinationController)initWithIdentifier:(id)a3 destinationIdentifier:(id)a4 supportedOptions:(unint64_t)a5 availableDestinationIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  __int16 v14 = v13;
  if (!v13)
  {
LABEL_7:
    uint64_t v20 = (HMMediaDestinationController *)_HMFPreconditionFailure();
    return [(HMMediaDestinationController *)v20 initWithControllerData:v22];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMMediaDestinationController;
  __int16 v15 = [(HMMediaDestinationController *)&v23 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_destinationIdentifier, a4);
    uint64_t v17 = [v12 UUIDString];
    lastNotifiedDestinationIdentifier = v16->_lastNotifiedDestinationIdentifier;
    v16->_lastNotifiedDestinationIdentifier = (NSString *)v17;

    v16->_supportedOptions = a5;
    objc_storeStrong((id *)&v16->_availableDestinationIdentifiers, a6);
  }

  return v16;
}

- (HMMediaDestinationController)initWithControllerData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 destinationIdentifier];
  uint64_t v7 = [v4 supportedOptions];
  id v8 = [v4 availableDestinationIdentifiers];

  id v9 = [(HMMediaDestinationController *)self initWithIdentifier:v5 destinationIdentifier:v6 supportedOptions:v7 availableDestinationIdentifiers:v8];
  return v9;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1) {
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global_7300);
  }
  v2 = (void *)logCategory__hmf_once_v30;

  return v2;
}

uint64_t __43__HMMediaDestinationController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end