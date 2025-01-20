@interface HMAccessoryBrowser
+ (id)logCategory;
- (BOOL)isBrowsing;
- (HMAccessoryBrowser)init;
- (HMMutableArray)accessories;
- (NSArray)discoveredAccessories;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)delegate;
- (unint64_t)generationCounter;
- (void)_fetchNewAccessories;
- (void)_fetchNewAccessoriesWithPrivacyCheck;
- (void)_handleNewAccessoriesFound:(id)a3;
- (void)_handleNewAccessoriesRemoved:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_start;
- (void)_startSearchingForNewAccessories;
- (void)_stopSearchingForNewAccessoriesWithError:(id)a3;
- (void)_updateNewAccessories:(id)a3;
- (void)dealloc;
- (void)handleStartWithError:(id)a3 response:(id)a4;
- (void)setAccessories:(id)a3;
- (void)setBrowsing:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setGenerationCounter:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)startSearchingForNewAccessories;
- (void)stopSearchingForNewAccessories;
- (void)stopSearchingForNewAccessoriesWithError:(id)a3;
@end

@implementation HMAccessoryBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (void)setAccessories:(id)a3
{
}

- (HMMutableArray)accessories
{
  return self->_accessories;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)_handleNewAccessoriesRemoved:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessoryBrowser *)self context];
  if (v5)
  {
    v6 = [v4 dataForKey:@"kAccessoriesInfoDataKey"];
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28DC0];
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      v74[0] = objc_opt_class();
      v74[1] = objc_opt_class();
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
      v10 = [v8 setWithArray:v9];
      id v70 = 0;
      v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v70];
      v47 = (char *)v70;

      if (v11)
      {
        v44 = v6;
        v45 = v5;
        id v46 = v4;
        v43 = v11;
        id v12 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        id v51 = v13;

        v14 = [MEMORY[0x1E4F1CA48] array];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v48 = self;
        obuint64_t j = [(HMAccessoryBrowser *)self discoveredAccessories];
        id v52 = (id)[obj countByEnumeratingWithState:&v66 objects:v73 count:16];
        if (v52)
        {
          uint64_t v50 = *(void *)v67;
          do
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v67 != v50) {
                objc_enumerationMutation(obj);
              }
              v16 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              long long v62 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              id v17 = v51;
              uint64_t v18 = [v17 countByEnumeratingWithState:&v62 objects:v72 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v63 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    v22 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                    v23 = [v16 uuid];
                    v24 = [v22 uuid];
                    int v25 = [v23 isEqual:v24];

                    if (v25) {
                      [v14 addObject:v16];
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v62 objects:v72 count:16];
                }
                while (v19);
              }
            }
            id v52 = (id)[obj countByEnumeratingWithState:&v66 objects:v73 count:16];
          }
          while (v52);
        }

        v26 = [(HMAccessoryBrowser *)v48 accessories];
        [v26 removeObjectsInArray:v14];

        v27 = [(HMAccessoryBrowser *)v48 delegate];
        if ([v14 count]
          && [(HMAccessoryBrowser *)v48 isBrowsing]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v53 = v14;
          uint64_t v28 = [v53 countByEnumeratingWithState:&v58 objects:v71 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v59;
            do
            {
              for (uint64_t k = 0; k != v29; ++k)
              {
                if (*(void *)v59 != v30) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v32 = *(void *)(*((void *)&v58 + 1) + 8 * k);
                v33 = [(HMAccessoryBrowser *)v48 context];
                v34 = [v33 delegateCaller];
                v54[0] = MEMORY[0x1E4F143A8];
                v54[1] = 3221225472;
                v54[2] = __51__HMAccessoryBrowser__handleNewAccessoriesRemoved___block_invoke;
                v54[3] = &unk_1E5945650;
                id v55 = v27;
                v56 = v48;
                uint64_t v57 = v32;
                [v34 invokeBlock:v54];
              }
              uint64_t v29 = [v53 countByEnumeratingWithState:&v58 objects:v71 count:16];
            }
            while (v29);
          }
        }
        v5 = v45;
        id v4 = v46;
        v11 = v43;
        v6 = v44;
      }
      else
      {
        v39 = (void *)MEMORY[0x19F3A64A0]();
        v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v76 = v42;
          __int16 v77 = 2112;
          v78 = v47;
          _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessories from accessories data: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x19F3A64A0]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v76 = v38;
      __int16 v77 = 2080;
      v78 = "-[HMAccessoryBrowser _handleNewAccessoriesRemoved:]";
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __51__HMAccessoryBrowser__handleNewAccessoriesRemoved___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryBrowser:*(void *)(a1 + 40) didRemoveNewAccessory:*(void *)(a1 + 48)];
}

- (void)_handleNewAccessoriesFound:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMAccessoryBrowser *)self context];
  if (v5)
  {
    long long v67 = self;
    v6 = [v4 dataForKey:@"kAccessoriesInfoDataKey"];
    if (v6 && [(HMAccessoryBrowser *)self isBrowsing])
    {
      v7 = (void *)MEMORY[0x1E4F28DC0];
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      v97[0] = objc_opt_class();
      v97[1] = objc_opt_class();
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
      v10 = [v8 setWithArray:v9];
      id v92 = 0;
      v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v92];
      long long v59 = (char *)v92;

      if (v11)
      {
        v56 = v6;
        uint64_t v57 = v5;
        id v58 = v4;
        id v55 = v11;
        id v12 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        id v14 = v13;

        v15 = [MEMORY[0x1E4F1CA48] array];
        long long v62 = v14;
        [v15 setArray:v14];
        v16 = [(HMAccessoryBrowser *)v67 delegate];
        int v17 = [v16 conformsToProtocol:&unk_1EEF704E8];

        long long v66 = 0;
        if (v17)
        {
          long long v66 = [(HMAccessoryBrowser *)v67 delegate];
        }
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        obuint64_t j = [(HMAccessoryBrowser *)v67 discoveredAccessories];
        uint64_t v63 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
        if (v63)
        {
          uint64_t v61 = *(void *)v89;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v89 != v61) {
                objc_enumerationMutation(obj);
              }
              uint64_t v64 = v18;
              uint64_t v19 = *(void **)(*((void *)&v88 + 1) + 8 * v18);
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              id v20 = v62;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v84 objects:v95 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v85;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v85 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    int v25 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                    v26 = [v19 uuid];
                    v27 = [v25 uuid];
                    int v28 = [v26 isEqual:v27];

                    if (v28)
                    {
                      [v19 _updateFromAccessory:v25];
                      if ([v15 count]
                        && [(HMAccessoryBrowser *)v67 isBrowsing]
                        && (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        uint64_t v29 = [(HMAccessoryBrowser *)v67 context];
                        uint64_t v30 = [v29 delegateCaller];
                        v80[0] = MEMORY[0x1E4F143A8];
                        v80[1] = 3221225472;
                        v80[2] = __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke;
                        v80[3] = &unk_1E5945650;
                        id v81 = v66;
                        v82 = v67;
                        v83 = v19;
                        [v30 invokeBlock:v80];
                      }
                      [v15 removeObject:v25];
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v84 objects:v95 count:16];
                }
                while (v22);
              }

              uint64_t v18 = v64 + 1;
            }
            while (v64 + 1 != v63);
            uint64_t v63 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
          }
          while (v63);
        }

        v31 = [(HMAccessoryBrowser *)v67 accessories];
        [v31 addObjectsFromArray:v15];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v77 = 0u;
        long long v76 = 0u;
        id v32 = v15;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v77;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v77 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v76 + 1) + 8 * j);
              v38 = [(HMAccessoryBrowser *)v67 context];
              objc_msgSend(v37, "__configureWithContext:home:", v38, 0);
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
          }
          while (v34);
        }

        v39 = [(HMAccessoryBrowser *)v67 delegate];
        if ([v32 count]
          && [(HMAccessoryBrowser *)v67 isBrowsing]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v65 = v32;
          uint64_t v40 = [v65 countByEnumeratingWithState:&v72 objects:v93 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v73;
            do
            {
              for (uint64_t k = 0; k != v41; ++k)
              {
                if (*(void *)v73 != v42) {
                  objc_enumerationMutation(v65);
                }
                uint64_t v44 = *(void *)(*((void *)&v72 + 1) + 8 * k);
                v45 = [(HMAccessoryBrowser *)v67 context];
                id v46 = [v45 delegateCaller];
                v68[0] = MEMORY[0x1E4F143A8];
                v68[1] = 3221225472;
                v68[2] = __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke_2;
                v68[3] = &unk_1E5945650;
                id v69 = v39;
                id v70 = v67;
                uint64_t v71 = v44;
                [v46 invokeBlock:v68];
              }
              uint64_t v41 = [v65 countByEnumeratingWithState:&v72 objects:v93 count:16];
            }
            while (v41);
          }
        }
        v5 = v57;
        id v4 = v58;
        v11 = v55;
        v6 = v56;
      }
      else
      {
        id v51 = (void *)MEMORY[0x19F3A64A0]();
        id v52 = v67;
        id v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v99 = v54;
          __int16 v100 = 2112;
          v101 = v59;
          _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessories from accessories data: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    v47 = (void *)MEMORY[0x19F3A64A0]();
    v48 = self;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v50;
      __int16 v100 = 2080;
      v101 = "-[HMAccessoryBrowser _handleNewAccessoriesFound:]";
      _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryBrowser:*(void *)(a1 + 40) didUpdateNewAccessory:*(void *)(a1 + 48)];
}

uint64_t __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryBrowser:*(void *)(a1 + 40) didFindNewAccessory:*(void *)(a1 + 48)];
}

- (void)_registerNotificationHandlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  if (v3)
  {
    id v4 = [(HMAccessoryBrowser *)self context];
    v5 = [v4 messageDispatcher];
    [v5 registerForMessage:@"kNewAccessoriesFoundNotificationKey" receiver:self selector:sel__handleNewAccessoriesFound_];

    v6 = [(HMAccessoryBrowser *)self context];
    v7 = [v6 messageDispatcher];
    [v7 registerForMessage:@"kNewAccessoriesRemovedNotificationKey" receiver:self selector:sel__handleNewAccessoriesRemoved_];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v11;
      __int16 v14 = 2080;
      v15 = "-[HMAccessoryBrowser _registerNotificationHandlers]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_updateNewAccessories:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49 = [(HMAccessoryBrowser *)self delegate];
  v5 = objc_opt_new();
  obuint64_t j = (id)objc_opt_new();
  uint64_t v50 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v6 = [(HMAccessoryBrowser *)self discoveredAccessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        int v12 = [v11 uniqueIdentifier];
        v13 = objc_msgSend(v4, "hmf_firstObjectWithUniqueIdentifier:", v12);

        if (v13) {
          __int16 v14 = v5;
        }
        else {
          __int16 v14 = v50;
        }
        [v14 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v75 objects:v83 count:16];
    }
    while (v8);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v72 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        uint64_t v21 = [v20 uniqueIdentifier];
        uint64_t v22 = objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v21);

        if (!v22) {
          [obj addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v17);
  }
  v45 = v15;

  [v5 addObjectsFromArray:obj];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v23 = obj;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v81 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v68 != v26) {
          objc_enumerationMutation(v23);
        }
        int v28 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        uint64_t v29 = [(HMAccessoryBrowser *)self context];
        objc_msgSend(v28, "__configureWithContext:home:", v29, 0);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v81 count:16];
    }
    while (v25);
  }

  uint64_t v30 = [(HMAccessoryBrowser *)self accessories];
  [v30 setArray:v5];

  if (v49 && [(HMAccessoryBrowser *)self isBrowsing])
  {
    if (objc_opt_respondsToSelector())
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id obja = v50;
      uint64_t v31 = [obja countByEnumeratingWithState:&v63 objects:v80 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v64;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v64 != v33) {
              objc_enumerationMutation(obja);
            }
            uint64_t v35 = *(void *)(*((void *)&v63 + 1) + 8 * m);
            v36 = [(HMAccessoryBrowser *)self context];
            v37 = [v36 delegateCaller];
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __44__HMAccessoryBrowser__updateNewAccessories___block_invoke;
            v59[3] = &unk_1E5945650;
            id v60 = v49;
            uint64_t v61 = self;
            uint64_t v62 = v35;
            [v37 invokeBlock:v59];
          }
          uint64_t v32 = [obja countByEnumeratingWithState:&v63 objects:v80 count:16];
        }
        while (v32);
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id objb = v23;
      uint64_t v38 = [objb countByEnumeratingWithState:&v55 objects:v79 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v56;
        do
        {
          for (uint64_t n = 0; n != v39; ++n)
          {
            if (*(void *)v56 != v40) {
              objc_enumerationMutation(objb);
            }
            uint64_t v42 = *(void *)(*((void *)&v55 + 1) + 8 * n);
            v43 = [(HMAccessoryBrowser *)self context];
            uint64_t v44 = [v43 delegateCaller];
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __44__HMAccessoryBrowser__updateNewAccessories___block_invoke_2;
            v51[3] = &unk_1E5945650;
            id v52 = v49;
            id v53 = self;
            uint64_t v54 = v42;
            [v44 invokeBlock:v51];
          }
          uint64_t v39 = [objb countByEnumeratingWithState:&v55 objects:v79 count:16];
        }
        while (v39);
      }
    }
  }
}

uint64_t __44__HMAccessoryBrowser__updateNewAccessories___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryBrowser:*(void *)(a1 + 40) didRemoveNewAccessory:*(void *)(a1 + 48)];
}

uint64_t __44__HMAccessoryBrowser__updateNewAccessories___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryBrowser:*(void *)(a1 + 40) didFindNewAccessory:*(void *)(a1 + 48)];
}

- (void)_fetchNewAccessories
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F65488]);
    v5 = [(HMAccessoryBrowser *)self uuid];
    v6 = (void *)[v4 initWithTarget:v5];

    uint64_t v7 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v18 = @"kConfigGenerationCounterKey";
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAccessoryBrowser generationCounter](self, "generationCounter"));
    uint64_t v19 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v10 = [v7 messageWithName:@"kFetchNewAccessoriesRequestKey" destination:v6 payload:v9];

    objc_initWeak((id *)location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__HMAccessoryBrowser__fetchNewAccessories__block_invoke;
    v16[3] = &unk_1E5943F78;
    objc_copyWeak(&v17, (id *)location);
    [v10 setResponseHandler:v16];
    v11 = [v3 messageDispatcher];
    [v11 sendMessage:v10];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    int v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v15;
      __int16 v21 = 2080;
      uint64_t v22 = "-[HMAccessoryBrowser _fetchNewAccessories]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __42__HMAccessoryBrowser__fetchNewAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 && v6)
    {
      uint64_t v9 = objc_msgSend(v6, "hmf_numberForKey:", @"kConfigGenerationCounterKey");
      v10 = v9;
      if (!v9) {
        goto LABEL_19;
      }
      uint64_t v11 = [v9 unsignedIntegerValue];
      if (v11 == [v8 generationCounter]) {
        goto LABEL_19;
      }
      objc_msgSend(v8, "setGenerationCounter:", objc_msgSend(v10, "unsignedIntegerValue"));
      int v12 = objc_msgSend(v6, "hmf_dataForKey:", @"kAccessoriesInfoDataKey");
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E4F1CAD0];
        v31[0] = objc_opt_class();
        v31[1] = objc_opt_class();
        __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        id v15 = [v13 setWithArray:v14];

        id v26 = 0;
        uint64_t v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v12 error:&v26];
        id v17 = v26;
        if (!v16)
        {
          __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
          id v22 = v8;
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v24 = uint64_t v25 = v21;
            *(_DWORD *)buf = 138543618;
            int v28 = v24;
            __int16 v29 = 2112;
            id v30 = v17;
            _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory from accessory data: %@", buf, 0x16u);

            __int16 v21 = v25;
          }

          goto LABEL_18;
        }
        id v18 = v16;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 0;
        }
        id v20 = v19;

        id v17 = v20;
      }
      else
      {
        id v17 = 0;
      }
      [v8 _updateNewAccessories:v17];
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    [WeakRetained _updateNewAccessories:0];
  }
LABEL_20:
}

- (void)_fetchNewAccessoriesWithPrivacyCheck
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  if (v3)
  {
    objc_initWeak((id *)location, self);
    id v4 = [v3 queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HMAccessoryBrowser__fetchNewAccessoriesWithPrivacyCheck__block_invoke;
    v9[3] = &unk_1E59430B0;
    objc_copyWeak(&v10, (id *)location);
    __HMPrivacyRequestAccessForService(*MEMORY[0x1E4FA9B40], v4, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v8;
      __int16 v12 = 2080;
      v13 = "-[HMAccessoryBrowser _fetchNewAccessoriesWithPrivacyCheck]";
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __58__HMAccessoryBrowser__fetchNewAccessoriesWithPrivacyCheck__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchNewAccessories];
}

- (void)_start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  if (v3)
  {
    [(HMAccessoryBrowser *)self _registerNotificationHandlers];
    objc_initWeak((id *)location, self);
    id v4 = [v3 xpcClient];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__HMAccessoryBrowser__start__block_invoke;
    v9[3] = &unk_1E59455B8;
    objc_copyWeak(&v10, (id *)location);
    [v4 registerReconnectionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v8;
      __int16 v12 = 2080;
      v13 = "-[HMAccessoryBrowser _start]";
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __28__HMAccessoryBrowser__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setGenerationCounter:-1];
  if ([WeakRetained isBrowsing]) {
    [WeakRetained _startSearchingForNewAccessories];
  }
  else {
    [WeakRetained _stopSearchingForNewAccessoriesWithError:0];
  }
}

- (void)_stopSearchingForNewAccessoriesWithError:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessoryBrowser *)self context];
  if (!v5)
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v21;
      __int16 v32 = 2080;
      uint64_t v33 = "-[HMAccessoryBrowser _stopSearchingForNewAccessoriesWithError:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
    goto LABEL_13;
  }
  if (![(HMAccessoryBrowser *)self isBrowsing])
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543362;
      *(void *)&location[4] = v22;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Asked to stop searching for new accessories but we are not currently browsing", location, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v29 = @"kStartSearch";
  uint64_t v30 = MEMORY[0x1E4F1CC28];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v8 = [v6 dictionaryWithDictionary:v7];

  if (v4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    if (v9) {
      [v8 setObject:v9 forKeyedSubscript:@"kStopSearchReason"];
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v11 = [(HMAccessoryBrowser *)self uuid];
  __int16 v12 = (void *)[v10 initWithTarget:v11];

  v13 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v14 = (void *)[v8 copy];
  id v15 = [v13 messageWithName:@"kSearchForNewAccessoriesRequestKey" destination:v12 payload:v14];

  objc_initWeak((id *)location, self);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke;
  id v26 = &unk_1E5943088;
  objc_copyWeak(&v28, (id *)location);
  id v16 = v5;
  id v27 = v16;
  [v15 setResponseHandler:&v23];
  id v17 = objc_msgSend(v16, "messageDispatcher", v23, v24, v25, v26);
  [v17 sendMessage:v15];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)location);

LABEL_14:
}

void __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke_2;
    block[3] = &unk_1E59452E8;
    block[4] = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessories];
  [v2 removeAllObjects];

  v3 = *(void **)(a1 + 32);
  id v4 = [v3 discoveredAccessories];
  [v3 _updateNewAccessories:v4];

  [*(id *)(a1 + 32) setBrowsing:0];
  id v5 = *(void **)(a1 + 32);

  return [v5 setGenerationCounter:-1];
}

- (void)stopSearchingForNewAccessoriesWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessoryBrowser *)self context];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HMAccessoryBrowser_stopSearchingForNewAccessoriesWithError___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMAccessoryBrowser stopSearchingForNewAccessoriesWithError:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __62__HMAccessoryBrowser_stopSearchingForNewAccessoriesWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSearchingForNewAccessoriesWithError:*(void *)(a1 + 40)];
}

- (void)stopSearchingForNewAccessories
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop searching for new accessories", (uint8_t *)&v7, 0xCu);
  }
  [(HMAccessoryBrowser *)v4 stopSearchingForNewAccessoriesWithError:0];
}

- (void)handleStartWithError:(id)a3 response:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessoryBrowser *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMAccessoryBrowser_handleStartWithError_response___block_invoke;
    block[3] = &unk_1E5945650;
    id v16 = v6;
    id v17 = v7;
    uint64_t v18 = self;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v14;
      __int16 v21 = 2080;
      id v22 = "-[HMAccessoryBrowser handleStartWithError:response:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __52__HMAccessoryBrowser_handleStartWithError_response___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "hmf_dataForKey:", @"kIdentifierSaltKey");
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E4F29128], "hm_setIdentifierSalt:", v2);
      [*(id *)(a1 + 48) setBrowsing:1];
      [*(id *)(a1 + 48) _fetchNewAccessoriesWithPrivacyCheck];
    }
    else
    {
      v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = *(id *)(a1 + 48);
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = HMFGetLogIdentifier();
        int v7 = 138543362;
        uint64_t v8 = v6;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_ERROR, "%{public}@Missing identifier salt, failed to start browse", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)_startSearchingForNewAccessories
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F65488]);
    id v5 = [(HMAccessoryBrowser *)self uuid];
    id v6 = (void *)[v4 initWithTarget:v5];

    int v7 = (void *)MEMORY[0x1E4F654B0];
    id v17 = @"kStartSearch";
    uint64_t v18 = MEMORY[0x1E4F1CC38];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v9 = [v7 messageWithName:@"kSearchForNewAccessoriesRequestKey" destination:v6 payload:v8];

    objc_initWeak((id *)location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__HMAccessoryBrowser__startSearchingForNewAccessories__block_invoke;
    v15[3] = &unk_1E5943F78;
    objc_copyWeak(&v16, (id *)location);
    [v9 setResponseHandler:v15];
    id v10 = [v3 messageDispatcher];
    [v10 sendMessage:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)locatiouint64_t n = 138543618;
      *(void *)&location[4] = v14;
      __int16 v20 = 2080;
      __int16 v21 = "-[HMAccessoryBrowser _startSearchingForNewAccessories]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __54__HMAccessoryBrowser__startSearchingForNewAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleStartWithError:v6 response:v5];
}

- (void)startSearchingForNewAccessories
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryBrowser *)self context];
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to start searching for new accessories", buf, 0xCu);
    }
    uint64_t v9 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMAccessoryBrowser_startSearchingForNewAccessories__block_invoke;
    block[3] = &unk_1E59452E8;
    void block[4] = v5;
    dispatch_async(v9, block);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2080;
      id v15 = "-[HMAccessoryBrowser startSearchingForNewAccessories]";
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __53__HMAccessoryBrowser_startSearchingForNewAccessories__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSearchingForNewAccessories];
}

- (NSArray)discoveredAccessories
{
  v2 = [(HMAccessoryBrowser *)self accessories];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)setDelegate:(id)delegate
{
  p_locuint64_t k = &self->_lock;
  id v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)delegate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMAccessoryBrowser", buf, 0xCu);
  }
  int v7 = [(HMMutableArray *)v4->_accessories array];
  uint64_t v8 = [(_HMContext *)v4->_context queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HMAccessoryBrowser_dealloc__block_invoke;
  block[3] = &unk_1E59452E8;
  id v12 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  v10.receiver = v4;
  v10.super_class = (Class)HMAccessoryBrowser;
  [(HMAccessoryBrowser *)&v10 dealloc];
}

void __29__HMAccessoryBrowser_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "_unconfigure", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (HMAccessoryBrowser)init
{
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryBrowser;
  uint64_t v2 = [(HMAccessoryBrowser *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.AccessoryBrowser"];
    context = v2->_context;
    v2->_context = v3;

    if (initializeMappingsAndPaths_pred != -1) {
      dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_24447);
    }
    uint64_t v5 = +[HMMutableArray array];
    accessories = v2->_accessories;
    v2->_accessories = (HMMutableArray *)v5;

    long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BF2B0921-858B-42F5-B2EB-C915FB953E5B"];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v7);
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v8;

    v2->_generationCounter = -1;
    v2->_browsing = 0;
    [(HMAccessoryBrowser *)v2 _start];
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_38829 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_38829, &__block_literal_global_38830);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v25_38831;

  return v2;
}

uint64_t __33__HMAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v25_38831;
  logCategory__hmf_once_v25_38831 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end