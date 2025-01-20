@interface HMDBiomeLogEventObserver
+ (id)shortDescription;
- (HMDBiomeLogEventObserver)initWithBiomeEventManager:(id)a3 dataSource:(id)a4;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation HMDBiomeLogEventObserver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_biomeEventManager, 0);
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v30 = v4;
    [v4 biomeEventsRepresentationForLogObserver:self];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v35;
      *(void *)&long long v7 = 138543874;
      long long v29 = v7;
      id v33 = v5;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(id *)(*((void *)&v34 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            if (self) {
              id Property = objc_getProperty(self, v14, 8, 1);
            }
            else {
              id Property = 0;
            }
            objc_msgSend(Property, "submitActionSetEvent:", v13, v29);
          }
          else
          {
            id v16 = v11;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v17 = v16;
            }
            else {
              v17 = 0;
            }
            id v18 = v17;

            if (v18)
            {
              if (self) {
                id v20 = objc_getProperty(self, v19, 8, 1);
              }
              else {
                id v20 = 0;
              }
              objc_msgSend(v20, "submitAccessoryEvent:", v18, v29);
            }
            else
            {
              id v21 = v16;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v22 = v21;
              }
              else {
                v22 = 0;
              }
              id v23 = v22;

              if (v23)
              {
                if (self) {
                  id v25 = objc_getProperty(self, v24, 8, 1);
                }
                else {
                  id v25 = 0;
                }
                id v5 = v33;
                objc_msgSend(v25, "submitMediaAccessoryEvent:", v23, v29);
              }
              else
              {
                context = (void *)MEMORY[0x1D9452090]();
                v26 = self;
                v27 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v31 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v29;
                  v39 = v31;
                  __int16 v40 = 2112;
                  id v41 = v21;
                  __int16 v42 = 2112;
                  id v43 = v30;
                  _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Skipping submission of unknown biome event: %@ for event: %@", buf, 0x20u);
                }
                id v5 = v33;
              }
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v28 = [v5 countByEnumeratingWithState:&v34 objects:v44 count:16];
        uint64_t v8 = v28;
      }
      while (v28);
    }

    id v4 = v30;
  }
}

- (HMDBiomeLogEventObserver)initWithBiomeEventManager:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBiomeLogEventObserver;
  uint64_t v9 = [(HMDBiomeLogEventObserver *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biomeEventManager, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
  }

  return v10;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end