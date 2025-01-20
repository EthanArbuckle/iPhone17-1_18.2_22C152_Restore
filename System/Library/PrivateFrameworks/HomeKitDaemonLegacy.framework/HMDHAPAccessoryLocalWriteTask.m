@interface HMDHAPAccessoryLocalWriteTask
- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6;
@end

@implementation HMDHAPAccessoryLocalWriteTask

- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v10 = a4;
  id v25 = a5;
  id v11 = a6;
  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v27 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        if (v20) {
          [v12 addObject:v20];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  unint64_t v21 = [(HMDHAPAccessoryTask *)self sourceType];
  v22 = [(HMDHAPAccessoryTask *)self context];
  v23 = [v22 requestMessage];
  v24 = [(HMDHAPAccessoryTask *)self workQueue];
  [v26 writeCharacteristicValues:v12 source:v21 message:v23 queue:v24 logEvent:v25 completionHandler:v11];
}

@end