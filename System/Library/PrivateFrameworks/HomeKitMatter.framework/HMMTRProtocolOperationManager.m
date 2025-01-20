@interface HMMTRProtocolOperationManager
+ (HMMTRProtocolOperationManager)sharedInstance;
+ (id)logCategory;
- (BOOL)_isBasicClusterOperationForBridgedDevice:(Class)a3 endpointID:(unint64_t)a4;
- (BOOL)handleSpecialCaseCharacteristicWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6 updatedAttributesHandler:(id)a7;
- (id)_processGenericResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5;
- (id)_processReadResponseForOperation:(id)a3 readResponseValues:(id)a4 readResponseError:(id)a5;
- (id)_processResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5;
- (id)_processWriteResponseForOperation:(id)a3 writeResponseValues:(id)a4 writeResponseError:(id)a5;
- (id)_responseTupleWithMappedValueForOperation:(id)a3 responseValue:(id)a4 responseError:(id)a5;
- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7;
- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9;
- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7;
- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9;
- (void)handleHueSaturationWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5 updatedAttributesHandler:(id)a6;
- (void)handleIdentifyDeviceWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5;
- (void)handleLockTargetStateWriteWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6;
- (void)registerOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 reportDistributor:(id)a6 operationResponseHandler:(id)a7 updatedAttributesHandler:(id)a8;
@end

@implementation HMMTRProtocolOperationManager

- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v91 = a4;
  id v90 = a5;
  id v89 = a6;
  id v15 = a7;
  id v88 = v15;
  id v16 = a8;
  id v78 = a9;
  v17 = +[HMMTRHAPService chipPluginServiceForCharacteristic:](HMMTRHAPService, "chipPluginServiceForCharacteristic:");
  if (!v17)
  {
    v18 = (void *)MEMORY[0x2533B64D0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v94 = v21;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Trying send a message for a characteristic that does not belong to a service owned by HomeKitMatter", buf, 0xCu);
    }
  }
  v22 = (void *)MEMORY[0x2533B64D0]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    v26 = NSStringFromSelector((SEL)[v77 selector]);
    v27 = [v17 endpoint];
    *(_DWORD *)buf = 138544130;
    v94 = v25;
    __int16 v95 = 2112;
    id v96 = v78;
    __int16 v97 = 2112;
    id v98 = v26;
    __int16 v99 = 2112;
    v100 = v27;
    _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Constructing arguments for invocation for characteristic: %@, selector: %@, endpoint: %@", buf, 0x2Au);
  }
  v28 = [v16 arguments];
  uint64_t v29 = [v16 primaryArgIndex];
  if ([v16 syncWriteFunc]) {
    unsigned int v30 = 1;
  }
  else {
    unsigned int v30 = 2;
  }
  v31 = (void *)v29;
  if (v29) {
    ++v30;
  }
  if (v15) {
    uint64_t v32 = v30 + 1;
  }
  else {
    uint64_t v32 = v30;
  }
  v33 = v77;
  v79 = v28;
  if ([v28 count]) {
    uint64_t v32 = v32 + [v28 count];
  }
  v34 = (void *)MEMORY[0x2533B64D0]();
  v35 = v23;
  v36 = HMFGetOSLogHandle();
  v81 = v35;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    v38 = [NSNumber numberWithInt:v32];
    *(_DWORD *)buf = 138543874;
    v94 = v37;
    __int16 v95 = 2112;
    id v96 = v78;
    __int16 v97 = 2112;
    id v98 = v38;
    _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), numberOfArguments = %@", buf, 0x20u);

    v35 = v81;
  }

  if (v15)
  {
    uint64_t v39 = (int)v32 - 1;
    uint64_t v40 = (int)v32 + 1;
    v41 = (void *)MEMORY[0x2533B64D0]([v77 setArgument:&v88 atIndex:v40]);
    v42 = v35;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = HMFGetLogIdentifier();
      v45 = [NSNumber numberWithInteger:v40];
      *(_DWORD *)buf = 138543874;
      v94 = v44;
      __int16 v95 = 2112;
      id v96 = v78;
      __int16 v97 = 2112;
      id v98 = v45;
      _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added completion handler at index %@", buf, 0x20u);

      v35 = v81;
    }
  }
  else
  {
    uint64_t v39 = (int)v32;
  }
  [v77 setArgument:&v89 atIndex:v39 + 1];
  if ([v16 syncWriteFunc])
  {
    uint64_t v82 = v39 - 1;
  }
  else
  {
    uint64_t v82 = v39 - 2;
    [v77 setArgument:&v90 atIndex:v39];
  }
  v75 = v17;
  v76 = v16;
  v74 = v31;
  if (v31)
  {
    uint64_t v46 = [v31 integerValue];
    v47 = (void *)MEMORY[0x2533B64D0]([v77 setArgument:&v91 atIndex:v46 + 2]);
    v48 = v35;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = HMFGetLogIdentifier();
      id v51 = v91;
      v52 = [NSNumber numberWithInteger:v46 + 2];
      *(_DWORD *)buf = 138544130;
      v94 = v50;
      __int16 v95 = 2112;
      id v96 = v78;
      __int16 v97 = 2112;
      id v98 = v51;
      __int16 v99 = 2112;
      v100 = v52;
      _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added primary argument %@ at index %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v46 = -1;
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v53 = v79;
  id obj = [v79 allKeys];
  uint64_t v54 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v85 != v56) {
          objc_enumerationMutation(obj);
        }
        v58 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v59 = [v58 integerValue];
        if (v59 != v82 && v59 != v46)
        {
          uint64_t v61 = v59;
          id v83 = [v53 objectForKey:v58];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v83 isEqualToString:@"NULL"])
          {
            v62 = (void *)MEMORY[0x2533B64D0]();
            v63 = v81;
            v64 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              v65 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v94 = v65;
              _os_log_impl(&dword_252495000, v64, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

              v53 = v79;
            }

            id v66 = v83;
            id v83 = 0;
          }
          uint64_t v67 = v61 + 2;
          v68 = (void *)MEMORY[0x2533B64D0]([v33 setArgument:&v83 atIndex:v61 + 2]);
          v69 = v81;
          v70 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v71 = HMFGetLogIdentifier();
            id v72 = v83;
            v73 = [NSNumber numberWithInteger:v67];
            *(_DWORD *)buf = 138544130;
            v94 = v71;
            __int16 v95 = 2112;
            id v96 = v78;
            __int16 v97 = 2112;
            id v98 = v72;
            v33 = v77;
            __int16 v99 = 2112;
            v100 = v73;
            _os_log_impl(&dword_252495000, v70, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added default argument %@ at index %@", buf, 0x2Au);

            v53 = v79;
          }
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v55);
  }
}

- (void)_addArgumentsToInvocation:(id)a3 primaryArgument:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v84 = a4;
  id v12 = a5;
  id v83 = v12;
  id v13 = a6;
  id v73 = a7;
  v14 = +[HMMTRHAPService chipPluginServiceForCharacteristic:](HMMTRHAPService, "chipPluginServiceForCharacteristic:");
  if (!v14)
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v87 = v18;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Trying send a message for a characteristic that does not belong to a service owned by HomeKitMatter", buf, 0xCu);
    }
  }
  v19 = (void *)MEMORY[0x2533B64D0]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = NSStringFromSelector((SEL)[v72 selector]);
    v24 = [v14 endpoint];
    *(_DWORD *)buf = 138544130;
    long long v87 = v22;
    __int16 v88 = 2112;
    id v89 = v73;
    __int16 v90 = 2112;
    id v91 = v23;
    __int16 v92 = 2112;
    v93 = v24;
    _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Constructing arguments for invocation for characteristic: %@, selector: %@, endpoint: %@", buf, 0x2Au);
  }
  v25 = [v13 arguments];
  uint64_t v26 = [v13 primaryArgIndex];
  if (v12) {
    unsigned int v27 = 2;
  }
  else {
    unsigned int v27 = 1;
  }
  v28 = (void *)v26;
  if (v26) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = v12 != 0;
  }
  v74 = v25;
  if ([v25 count]) {
    uint64_t v29 = v29 + [v25 count];
  }
  unsigned int v30 = v72;
  v31 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v32 = v20;
  v33 = HMFGetOSLogHandle();
  v76 = v32;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = HMFGetLogIdentifier();
    v35 = [NSNumber numberWithInt:v29];
    *(_DWORD *)buf = 138543874;
    long long v87 = v34;
    __int16 v88 = 2112;
    id v89 = v73;
    __int16 v90 = 2112;
    id v91 = v35;
    _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), numberOfArguments = %@", buf, 0x20u);

    uint64_t v32 = v76;
  }

  if (v12)
  {
    uint64_t v77 = (int)v29 - 1;
    v36 = (void *)MEMORY[0x2533B64D0]([v72 setArgument:&v83 atIndex:v77 + 2]);
    v37 = v32;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      uint64_t v40 = [NSNumber numberWithInteger:v77 + 2];
      *(_DWORD *)buf = 138543874;
      long long v87 = v39;
      __int16 v88 = 2112;
      id v89 = v73;
      __int16 v90 = 2112;
      id v91 = v40;
      _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added completion handler at index %@", buf, 0x20u);

      uint64_t v32 = v76;
    }
  }
  else
  {
    uint64_t v77 = -1;
  }
  v70 = v14;
  v71 = v13;
  v69 = v28;
  if (v28)
  {
    uint64_t v41 = [v28 integerValue];
    v42 = (void *)MEMORY[0x2533B64D0]([v72 setArgument:&v84 atIndex:v41 + 2]);
    v43 = v32;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      id v46 = v84;
      v47 = [NSNumber numberWithInteger:v41 + 2];
      *(_DWORD *)buf = 138544130;
      long long v87 = v45;
      __int16 v88 = 2112;
      id v89 = v73;
      __int16 v90 = 2112;
      id v91 = v46;
      __int16 v92 = 2112;
      v93 = v47;
      _os_log_impl(&dword_252495000, v44, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added primary argument %@ at index %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v41 = -1;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v48 = v74;
  id obj = [v74 allKeys];
  uint64_t v49 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v80 != v51) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v54 = [v53 integerValue];
        if (v54 != v77 && v54 != v41)
        {
          uint64_t v56 = v54;
          id v78 = [v48 objectForKey:v53];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v78 isEqualToString:@"NULL"])
          {
            v57 = (void *)MEMORY[0x2533B64D0]();
            v58 = v76;
            uint64_t v59 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              long long v87 = v60;
              _os_log_impl(&dword_252495000, v59, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

              v48 = v74;
            }

            id v61 = v78;
            id v78 = 0;
          }
          uint64_t v62 = v56 + 2;
          v63 = (void *)MEMORY[0x2533B64D0]([v30 setArgument:&v78 atIndex:v56 + 2]);
          v64 = v76;
          v65 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            id v66 = HMFGetLogIdentifier();
            id v67 = v78;
            v68 = [NSNumber numberWithInteger:v62];
            *(_DWORD *)buf = 138544130;
            long long v87 = v66;
            __int16 v88 = 2112;
            id v89 = v73;
            __int16 v90 = 2112;
            id v91 = v67;
            unsigned int v30 = v72;
            __int16 v92 = 2112;
            v93 = v68;
            _os_log_impl(&dword_252495000, v65, OS_LOG_TYPE_INFO, "%{public}@Characteristic (%@), Added default argument %@ at index %@", buf, 0x2Au);

            v48 = v74;
          }
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v50);
  }
}

- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 expectedValues:(id)a5 expectedValueInterval:(id)a6 completionHandlerArgument:(id)a7 characteristicDescriptor:(id)a8 forCharacteristic:(id)a9
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v15 = a4;
  id v59 = v15;
  id v58 = a5;
  id v57 = a6;
  id v56 = a7;
  id v16 = a8;
  v17 = self;
  id v46 = a9;
  v18 = [v16 paramsIndex];
  uint64_t v43 = [v18 integerValue];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [v16 paramsArguments];
  uint64_t v50 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v50)
  {
    uint64_t v19 = *(void *)v53;
    id v47 = v16;
    uint64_t v48 = *(void *)v53;
    v45 = v17;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(NSString **)(*((void *)&v52 + 1) + 8 * i);
        SEL v22 = NSSelectorFromString(v21);
        v23 = [v16 paramsArguments];
        id v51 = [v23 objectForKey:v21];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v51 isEqualToString:@"NULL"])
        {
          v24 = (void *)MEMORY[0x2533B64D0]();
          v25 = v17;
          uint64_t v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            unsigned int v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v61 = v27;
            _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

            uint64_t v19 = v48;
          }

          id v28 = v51;
          id v51 = 0;
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v29 = [v15 methodSignatureForSelector:v22];
          if (v29)
          {
            unsigned int v30 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v29];
            [v30 setSelector:v22];
            [v30 setArgument:&v51 atIndex:2];
            [v30 invokeWithTarget:v15];

            id v16 = v47;
          }
          else
          {
            v37 = (void *)MEMORY[0x2533B64D0]();
            v38 = v17;
            uint64_t v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = HMFGetLogIdentifier();
              uint64_t v41 = [v16 paramsClass];
              v42 = [v46 instanceID];
              *(_DWORD *)buf = 138544130;
              id v61 = v40;
              __int16 v62 = 2112;
              v63 = v21;
              __int16 v64 = 2112;
              uint64_t v65 = v41;
              uint64_t v19 = v48;
              __int16 v66 = 2112;
              id v67 = v42;
              _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get Signature for Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

              id v16 = v47;
              v17 = v45;
            }
          }
        }
        else
        {
          v31 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v32 = v17;
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = HMFGetLogIdentifier();
            uint64_t v35 = [v16 paramsClass];
            v36 = [v46 instanceID];
            *(_DWORD *)buf = 138544130;
            id v61 = v34;
            __int16 v62 = 2112;
            v63 = v21;
            __int16 v64 = 2112;
            uint64_t v65 = v35;
            uint64_t v19 = v48;
            __int16 v66 = 2112;
            id v67 = v36;
            _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

            v17 = v45;
          }
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v50);
  }

  [v44 setArgument:&v59 atIndex:v43 + 2];
  [v44 setArgument:&v58 atIndex:v43 + 3];
  [v44 setArgument:&v57 atIndex:v43 + 4];
  [v44 setArgument:&v56 atIndex:v43 + 5];
}

- (void)_addParamsToInvocation:(id)a3 paramsObject:(id)a4 completionHandlerArgument:(id)a5 characteristicDescriptor:(id)a6 forCharacteristic:(id)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v12 = a4;
  id v13 = self;
  id v14 = v12;
  id v56 = v12;
  id v55 = a5;
  id v15 = a6;
  id v45 = a7;
  id v16 = [v15 paramsIndex];
  uint64_t v42 = [v16 integerValue];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v15 paramsArguments];
  uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v52;
    id v46 = v14;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        v18 = *(NSString **)(*((void *)&v51 + 1) + 8 * i);
        SEL v19 = NSSelectorFromString(v18);
        v20 = [v15 paramsArguments];
        id v50 = [v20 objectForKey:v18];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v50 isEqualToString:@"NULL"])
        {
          v21 = (void *)MEMORY[0x2533B64D0]();
          SEL v22 = v13;
          v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v58 = v24;
            _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@NULL argument requested, setting arg to nil.", buf, 0xCu);

            id v14 = v46;
          }

          id v25 = v50;
          id v50 = 0;
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v26 = [v14 methodSignatureForSelector:v19];
          if (v26)
          {
            unsigned int v27 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v26];
            [v27 setSelector:v19];
            [v27 setArgument:&v50 atIndex:2];
            [v27 invokeWithTarget:v14];
          }
          else
          {
            v34 = (void *)MEMORY[0x2533B64D0]();
            uint64_t v35 = v13;
            v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = HMFGetLogIdentifier();
              uint64_t v38 = [v15 paramsClass];
              [v45 instanceID];
              id v44 = v34;
              uint64_t v39 = v13;
              v41 = id v40 = v15;
              *(_DWORD *)buf = 138544130;
              id v58 = v37;
              __int16 v59 = 2112;
              v60 = v18;
              __int16 v61 = 2112;
              uint64_t v62 = v38;
              id v14 = v46;
              __int16 v63 = 2112;
              __int16 v64 = v41;
              _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get Signature for Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);

              id v15 = v40;
              id v13 = v39;
              v34 = v44;
            }
          }
        }
        else
        {
          id v28 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v29 = v13;
          unsigned int v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = HMFGetLogIdentifier();
            uint64_t v32 = [v15 paramsClass];
            v33 = [v45 instanceID];
            *(_DWORD *)buf = 138544130;
            id v58 = v31;
            __int16 v59 = 2112;
            v60 = v18;
            __int16 v61 = 2112;
            uint64_t v62 = v32;
            id v14 = v46;
            __int16 v63 = 2112;
            __int16 v64 = v33;
            _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to set Property %@ for Params of type %@ for characteristic %@", buf, 0x2Au);
          }
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v49);
  }

  [v43 setArgument:&v56 atIndex:v42 + 2];
  [v43 setArgument:&v55 atIndex:v42 + 3];
}

- (id)_processReadResponseForOperation:(id)a3 readResponseValues:(id)a4 readResponseError:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 characteristic];
  id v12 = (void *)MEMORY[0x2533B64D0]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v11 instanceID];
    int v24 = 138544130;
    id v25 = v15;
    __int16 v26 = 2112;
    unsigned int v27 = v16;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing read response for characteristic %@. Value: %@ Error: %@", (uint8_t *)&v24, 0x2Au);
  }
  if ([v10 code] == 2)
  {
    v17 = (void *)MEMORY[0x2533B64D0]();
    v18 = v13;
    SEL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v24 = 138543618;
      id v25 = v20;
      __int16 v26 = 2112;
      unsigned int v27 = v11;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Could not find description for characteristic %@, falling back to localized version", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v21 = [MEMORY[0x263F358E8] responseTupleForCharacteristic:v11 error:0];
  }
  else
  {
    uint64_t v21 = [(HMMTRProtocolOperationManager *)v13 _responseTupleWithMappedValueForOperation:v8 responseValue:v9 responseError:v10];
  }
  SEL v22 = (void *)v21;

  return v22;
}

- (id)_responseTupleWithMappedValueForOperation:(id)a3 responseValue:(id)a4 responseError:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 characteristic];
  if (v10)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    id v13 = [v10 domain];
    id v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v10, "code"), 0);
  }
  else
  {
    if (v9)
    {
      id v15 = [v8 characteristicDescription];
      id v16 = [v15 mapValue];

      if (v16)
      {
        v17 = [v8 characteristicDescription];
        v18 = [v17 mapValue];
        SEL v19 = ((void (**)(void, id))v18)[2](v18, v9);
        [v11 setValue:v19];

        v20 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v21 = self;
        SEL v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          int v24 = [v11 value];
          id v25 = [v11 instanceID];
          int v28 = 138544130;
          id v29 = v23;
          __int16 v30 = 2112;
          id v31 = v9;
          __int16 v32 = 2112;
          v33 = v24;
          __int16 v34 = 2112;
          uint64_t v35 = v25;
          _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Mapped value from dictionary %@ to %@ for instanceID %@.", (uint8_t *)&v28, 0x2Au);
        }
      }
      else
      {
        [v11 setValue:v9];
      }
    }
    id v14 = 0;
  }
  __int16 v26 = [MEMORY[0x263F358E8] responseTupleForCharacteristic:v11 error:v14];

  return v26;
}

- (id)_processWriteResponseForOperation:(id)a3 writeResponseValues:(id)a4 writeResponseError:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    id v15 = [v8 characteristic];
    id v16 = [v15 instanceID];
    v17 = [v8 value];
    int v26 = 138544130;
    unsigned int v27 = v14;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received write response for characteristic %@. Targeted value: %@\nError: %@", (uint8_t *)&v26, 0x2Au);
  }
  if (v10)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    SEL v19 = [v10 domain];
    v20 = objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v10, "code"), 0);
  }
  else
  {
    SEL v19 = [v8 value];
    uint64_t v21 = [v8 characteristic];
    [v21 setValue:v19];

    v20 = 0;
  }

  SEL v22 = (void *)MEMORY[0x263F358E8];
  v23 = [v8 characteristic];
  int v24 = [v22 responseTupleForCharacteristic:v23 error:v20];

  return v24;
}

- (id)_processGenericResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v17 = 138543874;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@ Response %@", (uint8_t *)&v17, 0x20u);
  }
  id v15 = [(HMMTRProtocolOperationManager *)v12 _responseTupleWithMappedValueForOperation:v8 responseValue:v9 responseError:v10];

  return v15;
}

- (id)_processResponseForOperation:(id)a3 responseValues:(id)a4 responseError:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch([v8 type])
  {
    case 0:
    case 4:
      uint64_t v11 = [(HMMTRProtocolOperationManager *)self _processReadResponseForOperation:v8 readResponseValues:v9 readResponseError:v10];
      goto LABEL_10;
    case 1:
      uint64_t v11 = [(HMMTRProtocolOperationManager *)self _processWriteResponseForOperation:v8 writeResponseValues:v9 writeResponseError:v10];
      goto LABEL_10;
    case 2:
    case 3:
      id v12 = [v8 characteristic];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x2533B64D0]();
        id v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          int v17 = [v8 characteristic];
          int v24 = 138543618;
          id v25 = v16;
          __int16 v26 = 2112;
          unsigned int v27 = v17;
          _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating a copy for characteristic before modifying it %@", (uint8_t *)&v24, 0x16u);
        }
        v18 = [v8 characteristic];
        __int16 v19 = (void *)[v18 copy];

        id v20 = [v8 characteristic];
        __int16 v21 = [v20 service];
        [v19 setService:v21];

        [v8 setCharacteristic:v19];
      }
      uint64_t v11 = [(HMMTRProtocolOperationManager *)self _processGenericResponseForOperation:v8 responseValues:v9 responseError:v10];
LABEL_10:
      id v22 = (void *)v11;
      break;
    default:
      id v22 = 0;
      break;
  }

  return v22;
}

- (void)registerOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 reportDistributor:(id)a6 operationResponseHandler:(id)a7 updatedAttributesHandler:(id)a8
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v113 = a6;
  int v17 = (void (**)(id, void *))a7;
  id v18 = a8;
  v112 = v15;
  if (![(HMMTRProtocolOperationManager *)self handleSpecialCaseCharacteristicWithOperation:v14 accessoryServer:v15 clientQueue:v16 operationResponseHandler:v17 updatedAttributesHandler:v18])
  {
    __int16 v19 = [v14 characteristicDescription];
    v114 = v19;
    id v20 = v19;
    if (!v19)
    {
      uint64_t v23 = 2;
      goto LABEL_21;
    }
    if (-[HMMTRProtocolOperationManager _isBasicClusterOperationForBridgedDevice:endpointID:](self, "_isBasicClusterOperationForBridgedDevice:endpointID:", [v19 clusterClass], objc_msgSend(v14, "endpoint")))
    {
      id v21 = objc_alloc(MEMORY[0x263F10CE0]);
      id v22 = [v14 matterDevice];
      v109 = objc_msgSend(v21, "initWithDevice:endpoint:queue:", v22, (unsigned __int16)objc_msgSend(v14, "endpoint"), v16);
      v107 = &unk_2702B5370;
    }
    else
    {
      id v24 = objc_alloc((Class)[v20 clusterClass]);
      id v25 = [v14 matterDevice];
      __int16 v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
      v109 = (void *)[v24 initWithDevice:v25 endpointID:v26 queue:v16];

      id v22 = [v14 characteristicDescription];
      v107 = [v22 clusterID];
    }

    unsigned int v27 = [v14 characteristicDescription];
    v108 = [v27 attributeID];

    [v114 clusterSelector];
    uint64_t v28 = v109;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v109, "methodSignatureForSelector:", objc_msgSend(v114, "clusterSelector")),
          (v111 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v111 = 0;
LABEL_16:

      if (v111)
      {
        __int16 v32 = 0;
LABEL_105:

        goto LABEL_106;
      }
      id v33 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        v37 = NSStringFromSelector((SEL)[v114 clusterSelector]);
        uint64_t v38 = [v114 clusterClass];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v132 = 2112;
        v133 = v37;
        __int16 v134 = 2112;
        uint64_t v135 = v38;
        _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@CHIP Accessory couldn't get signature for Selector:%@ on Cluster:%@", buf, 0x20u);
      }
      uint64_t v23 = 1;
LABEL_21:
      uint64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTRProtocolOperationErrorDomain" code:v23 userInfo:0];
      __int16 v32 = (void *)v39;
      v111 = 0;
      if (v17 && v39)
      {
        v110 = [(HMMTRProtocolOperationManager *)self _processResponseForOperation:v14 responseValues:0 responseError:v39];
        v17[2](v17, v110);
        v111 = 0;
      }
      goto LABEL_105;
    }
    v106 = objc_msgSend(MEMORY[0x263EFF958], "invocationWithMethodSignature:");
    objc_msgSend(v106, "setSelector:", objc_msgSend(v114, "clusterSelector"));
    objc_initWeak(&location, self);
    uint64_t v29 = [v14 type];
    if (v29 != 1 || ([v14 matterDevice], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v30 = [v14 type];
      if (v29 == 1)
      {
        BOOL v31 = v30 == 3;

        if (!v31)
        {
LABEL_13:
          if ([v14 type] != 1)
          {
            v118[0] = MEMORY[0x263EF8330];
            v118[1] = 3221225472;
            v118[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_2;
            v118[3] = &unk_265375948;
            objc_copyWeak(&v122, &location);
            v118[4] = self;
            id v119 = v14;
            v121 = v17;
            id v120 = v16;
            v105 = (void (**)(void, void, void))MEMORY[0x2533B66E0](v118);
            uint64_t v101 = (void *)MEMORY[0x2533B66E0](v105);

            objc_destroyWeak(&v122);
            goto LABEL_28;
          }
          v123[0] = MEMORY[0x263EF8330];
          v123[1] = 3221225472;
          v123[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_117;
          v123[3] = &unk_265377458;
          v123[4] = self;
          id v124 = v14;
          v126 = v17;
          id v125 = v16;
          uint64_t v101 = (void *)MEMORY[0x2533B66E0](v123);

LABEL_26:
          v105 = 0;
LABEL_28:
          id v40 = v114;
          id v99 = objc_alloc_init((Class)[v114 paramsClass]);
          v102 = [v14 value];
          id v117 = objc_alloc_init(MEMORY[0x263F10FA0]);
          uint64_t v41 = [v14 matterDevice];
          if (v41)
          {
            BOOL v42 = [v14 type] == 4;

            id v40 = v114;
            if (v42)
            {
              uint64_t v43 = [v106 setArgument:&v117 atIndex:2];
LABEL_44:
              id v98 = 0;
              v100 = 0;
              goto LABEL_74;
            }
          }
          id v44 = [v14 matterDevice];
          if (!v44 || (v45 = [v14 type] == 1, v44, id v40 = v114, !v45))
          {
            id v55 = [v14 matterDevice];
            if (v55)
            {
              BOOL v56 = [v14 type] == 2;

              id v40 = v114;
              if (!v56)
              {
                context = (void *)MEMORY[0x2533B64D0]();
                id v58 = self;
                HMFGetOSLogHandle();
                __int16 v59 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  id v60 = (id)objc_claimAutoreleasedReturnValue();
                  __int16 v61 = [v14 characteristic];
                  uint64_t v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "type"));
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v60;
                  __int16 v132 = 2112;
                  v133 = v61;
                  __int16 v134 = 2112;
                  uint64_t v135 = (uint64_t)v62;
                  _os_log_impl(&dword_252495000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unexpected operation for characteristic %@: %@ with MTRDevice, not building arguments", buf, 0x20u);
                }
                goto LABEL_44;
              }
            }
            if ([v40 paramsClass])
            {
              id v57 = [v14 characteristic];
              [(HMMTRProtocolOperationManager *)self _addParamsToInvocation:v106 paramsObject:v99 completionHandlerArgument:v101 characteristicDescriptor:v40 forCharacteristic:v57];
            }
            else
            {
              if ([v14 type] == 1 && v102)
              {
                __int16 v63 = [v40 mapValue];
                BOOL v64 = v63 == 0;

                if (!v64)
                {
                  uint64_t v65 = [v114 mapValue];
                  uint64_t v66 = [v14 value];
                  uint64_t v67 = ((void (**)(void, void *))v65)[2](v65, v66);

                  v102 = (void *)v67;
                }
                id v40 = v114;
              }
              id v57 = [v14 characteristic];
              [(HMMTRProtocolOperationManager *)self _addArgumentsToInvocation:v106 primaryArgument:v102 completionHandlerArgument:v101 characteristicDescriptor:v40 forCharacteristic:v57];
            }
            id v98 = 0;
            v100 = 0;
LABEL_73:

LABEL_74:
            uint64_t v77 = (void *)MEMORY[0x2533B64D0](v43);
            contexta = self;
            HMFGetOSLogHandle();
            id v78 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              __int16 v97 = v77;
              HMFGetLogIdentifier();
              id v79 = (id)objc_claimAutoreleasedReturnValue();
              long long v80 = [v14 characteristic];
              long long v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "type"));
              long long v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v79;
              __int16 v132 = 2112;
              v133 = v80;
              __int16 v134 = 2112;
              uint64_t v135 = (uint64_t)v81;
              __int16 v136 = 2112;
              v137 = v82;
              _os_log_impl(&dword_252495000, v78, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

              uint64_t v77 = v97;
            }

            if ([v14 type] == 4
              && (([v14 matterDevice], (id v83 = objc_claimAutoreleasedReturnValue()) != 0)
                ? (BOOL v84 = v108 == 0)
                : (BOOL v84 = 1),
                  v84 ? (int v85 = 0) : (int v85 = 1),
                  v83,
                  v85))
            {
              long long v86 = [HMMTRDeviceReader alloc];
              long long v87 = [v14 matterDevice];
              __int16 v88 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "endpoint"));
              id v89 = [(HMMTRDeviceReader *)v86 initWithClientQueue:v16 distributor:v113 device:v87 endpointID:v88 clusterID:v107 attributeID:v108];

              v115[0] = MEMORY[0x263EF8330];
              v115[1] = 3221225472;
              v115[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_123;
              v115[3] = &unk_265375970;
              v116 = v105;
              [(HMMTRDeviceReader *)v89 readAttributeWithCompletion:v115];
            }
            else
            {
              [v106 invokeWithTarget:v109];
            }
            __int16 v90 = [v14 matterDevice];

            if (v90)
            {
              if ([v14 type] == 4 && !v108)
              {
                *(void *)buf = 0;
                [v106 getReturnValue:buf];
                id v91 = *(id *)buf;
                if (v91)
                {
                  __int16 v92 = 0;
                }
                else
                {
                  __int16 v92 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
                }
                ((void (**)(void, id, void *))v105)[2](v105, v91, v92);

LABEL_102:
                char v96 = 0;
                goto LABEL_103;
              }
              if ([v14 type] == 1)
              {
                int v93 = [v114 syncWriteFunc] ^ 1;
                if (!v17) {
                  LOBYTE(v93) = 1;
                }
                if ((v93 & 1) == 0)
                {
                  uint64_t v94 = [(HMMTRProtocolOperationManager *)contexta _processResponseForOperation:v14 responseValues:0 responseError:0];
                  v17[2](v17, v94);
                }
                goto LABEL_102;
              }
            }
            if (v17 && [v14 type] == 1)
            {
              __int16 v95 = [(HMMTRProtocolOperationManager *)contexta _processResponseForOperation:v14 responseValues:0 responseError:0];
              v17[2](v17, v95);
            }
            char v96 = 1;
LABEL_103:

            objc_destroyWeak(&location);
            if ((v96 & 1) == 0)
            {

              __int16 v32 = 0;
              goto LABEL_105;
            }
            goto LABEL_16;
          }
          id v46 = [v114 mapWriteValueToExpectedValues];

          if (v46)
          {
            id v47 = [v114 mapWriteValueToExpectedValues];
            uint64_t v48 = [v14 endpoint];
            uint64_t v49 = [v14 value];
            v100 = ((void (**)(void, uint64_t, void *))v47)[2](v47, v48, v49);

            id v50 = (id)[v100 count];
            long long v51 = v114;
            if (!v50) {
              goto LABEL_55;
            }
            long long v52 = [v100 objectAtIndexedSubscript:0];
            long long v53 = [v52 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
            BOOL v54 = v53 == 0;

            if (v54)
            {
              id v50 = 0;
            }
            else
            {
              id v50 = v100;
              v100 = v50;
            }
          }
          else
          {
            id v50 = 0;
            v100 = 0;
          }
          long long v51 = v114;
LABEL_55:
          v68 = &unk_2702B5340;
          id v98 = v50;
          if (!v50) {
            v68 = 0;
          }
          id v57 = v68;
          if ([v51 paramsClass])
          {
            uint64_t v69 = [v14 characteristic];
            [(HMMTRProtocolOperationManager *)self _addParamsToInvocation:v106 paramsObject:v99 expectedValues:v98 expectedValueInterval:v57 completionHandlerArgument:v101 characteristicDescriptor:v51 forCharacteristic:v69];
LABEL_72:

            goto LABEL_73;
          }
          if (!v102)
          {
            v102 = 0;
            goto LABEL_68;
          }
          if ([v51 syncWriteFunc] && objc_msgSend(v100, "count") == 1)
          {
            v70 = [v100 objectAtIndexedSubscript:0];
            uint64_t v71 = [v70 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
            id v72 = v102;
          }
          else
          {
            id v73 = [v51 mapValue];

            if (!v73)
            {
LABEL_66:
              long long v51 = v114;
LABEL_68:
              int v74 = [v51 syncWriteFunc];
              uint64_t v75 = [v14 characteristic];
              uint64_t v69 = (void *)v75;
              if (v74) {
                v76 = 0;
              }
              else {
                v76 = v101;
              }
              [(HMMTRProtocolOperationManager *)self _addArgumentsToInvocation:v106 primaryArgument:v102 expectedValues:v98 expectedValueInterval:v57 completionHandlerArgument:v76 characteristicDescriptor:v51 forCharacteristic:v75];
              goto LABEL_72;
            }
            v70 = [v114 mapValue];
            id v72 = [v14 value];
            uint64_t v71 = ((void (**)(void, void *))v70)[2](v70, v72);
          }
          v102 = (void *)v71;
          goto LABEL_66;
        }
      }
      else if (v30 != 3)
      {
        goto LABEL_13;
      }
    }
    v127[0] = MEMORY[0x263EF8330];
    v127[1] = 3221225472;
    v127[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke;
    v127[3] = &unk_265375920;
    objc_copyWeak(&v129, &location);
    v127[4] = self;
    id v128 = v14;
    uint64_t v101 = (void *)MEMORY[0x2533B66E0](v127);

    objc_destroyWeak(&v129);
    goto LABEL_26;
  }
LABEL_106:
}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = *(id *)(a1 + 32);
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@", (uint8_t *)&v10, 0x16u);
  }
  if (WeakRetained) {
    id v9 = (id)[WeakRetained _processResponseForOperation:*(void *)(a1 + 40) responseValues:0 responseError:v3];
  }
}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory received response. Error: %@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) _processResponseForOperation:*(void *)(a1 + 40) responseValues:0 responseError:v3];
  id v9 = *(void **)(a1 + 56);
  if (v9)
  {
    int v10 = *(NSObject **)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_118;
    v11[3] = &unk_2653770F0;
    id v13 = v9;
    id v12 = v8;
    dispatch_async(v10, v11);
  }
}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = *(id *)(a1 + 32);
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@CHIP Accessory received response. Values: %@ Error: %@", buf, 0x20u);
  }
  if (WeakRetained)
  {
    id v12 = [WeakRetained _processResponseForOperation:*(void *)(a1 + 40) responseValues:v5 responseError:v6];
    id v13 = *(void **)(a1 + 56);
    if (v13)
    {
      uint64_t v14 = *(NSObject **)(a1 + 48);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_119;
      v15[3] = &unk_2653770F0;
      id v17 = v13;
      id v16 = v12;
      dispatch_async(v14, v15);
    }
  }
}

void __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_123(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F355F0] code:8 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __147__HMMTRProtocolOperationManager_registerOperation_accessoryServer_clientQueue_reportDistributor_operationResponseHandler_updatedAttributesHandler___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleLockTargetStateWriteWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v50 = v17;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling special case lock target state write", buf, 0xCu);
  }
  uint64_t v18 = [v10 writePrimaryRequestTuple];
  __int16 v19 = [v18 hmdAccessoryUUID];

  if (v19
    && ([v10 matterDevice], __int16 v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
  {
    id v21 = (void *)MEMORY[0x263F10CA8];
    __int16 v22 = [v11 nodeID];
    id v23 = [v11 deviceController];
    uint64_t v24 = [v21 deviceWithNodeID:v22 controller:v23];

    id v25 = [HMMTRSyncClusterDoorLock alloc];
    __int16 v26 = [v10 matterDevice];
    unsigned int v27 = -[HMMTRSyncClusterDoorLock initWithDevice:baseDevice:endpoint:queue:accessoryServer:](v25, "initWithDevice:baseDevice:endpoint:queue:accessoryServer:", v26, v24, (unsigned __int16)[v10 endpoint], v12, v11);

    uint64_t v28 = [v10 value];
    uint64_t v29 = [v28 integerValue];

    if (v29 == 1)
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke_2;
      v43[3] = &unk_265377368;
      v43[4] = v15;
      id v44 = v10;
      id v45 = v13;
      [(HMMTRSyncClusterDoorLock *)v27 lockDoorWithAccessoryUUID:v19 completionHandler:v43];

      uint64_t v30 = v44;
      goto LABEL_12;
    }
    if (!v29)
    {
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke;
      v46[3] = &unk_265377368;
      v46[4] = v15;
      id v47 = v10;
      id v48 = v13;
      [(HMMTRSyncClusterDoorLock *)v27 unlockDoorWithAccessoryUUID:v19 completionHandler:v46];

      uint64_t v30 = v47;
LABEL_12:

      goto LABEL_16;
    }
    uint64_t v36 = (void *)MEMORY[0x2533B64D0]();
    v37 = v15;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v39 = v41 = v12;
      [v10 value];
      id v40 = v42 = v36;
      *(_DWORD *)buf = 138543618;
      id v50 = v39;
      __int16 v51 = 2112;
      long long v52 = v40;
      _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unhandled write value for lock target state: %@", buf, 0x16u);

      uint64_t v36 = v42;
      id v12 = v41;
    }
  }
  else
  {
    BOOL v31 = (void *)MEMORY[0x2533B64D0]();
    __int16 v32 = v15;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      uint64_t v35 = [v10 matterDevice];
      *(_DWORD *)buf = 138543874;
      id v50 = v34;
      __int16 v51 = 2112;
      long long v52 = v19;
      __int16 v53 = 2112;
      BOOL v54 = v35;
      _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_ERROR, "%{public}@A required parameter was not included in write request for door lock target state. accessoryUUID: %@, matterDevice: %@", buf, 0x20u);
    }
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:3 userInfo:0];
    unsigned int v27 = [(HMMTRProtocolOperationManager *)v32 _processWriteResponseForOperation:v10 writeResponseValues:0 writeResponseError:v24];
    (*((void (**)(id, HMMTRSyncClusterDoorLock *))v13 + 2))(v13, v27);
  }
LABEL_16:
}

uint64_t __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

uint64_t __126__HMMTRProtocolOperationManager_handleLockTargetStateWriteWithOperation_accessoryServer_clientQueue_operationResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (void)handleHueSaturationWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5 updatedAttributesHandler:(id)a6
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 matterDevice];

  if (v14)
  {
    id v15 = [v10 characteristicDescription];
    v131[0] = MEMORY[0x263EF8330];
    v131[1] = 3221225472;
    v131[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke;
    v131[3] = &unk_265378900;
    id v16 = v10;
    id v132 = v16;
    v133 = self;
    id v134 = v13;
    v118 = (void *)MEMORY[0x2533B66E0](v131);
    id v17 = objc_alloc((Class)[v15 clusterClass]);
    uint64_t v18 = [v16 matterDevice];
    id v117 = objc_msgSend(v17, "initWithDevice:endpoint:queue:", v18, (unsigned __int16)objc_msgSend(v16, "endpoint"), v11);

    id v19 = [v15 mapWriteValueToExpectedValues];

    id v115 = v10;
    if (v19)
    {
      __int16 v20 = [v15 mapWriteValueToExpectedValues];
      uint64_t v21 = [v16 endpoint];
      __int16 v22 = [v16 value];
      id v23 = ((void (**)(void, uint64_t, void *))v20)[2](v20, v21, v22);

      if ([v23 count])
      {
        uint64_t v24 = [v23 objectAtIndexedSubscript:0];
        [v24 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
        __int16 v26 = v25 = v23;

        if (v26)
        {
          id v19 = v25;
          v116 = v19;
          goto LABEL_13;
        }
        v116 = v25;
      }
      else
      {
        v116 = v23;
      }
      id v19 = 0;
    }
    else
    {
      v116 = 0;
    }
LABEL_13:
    __int16 v32 = &unk_2702B5340;
    if (!v19) {
      __int16 v32 = 0;
    }
    id v33 = v32;
    uint64_t v34 = [v16 handlingType];
    uint64_t v35 = v118;
    if (v34 == 2)
    {
      id v112 = v33;
      id v114 = v19;
      id v104 = v13;
      v107 = v12;
      id v110 = v11;
      uint64_t v55 = v15;
      id v56 = objc_alloc_init(MEMORY[0x263F10D70]);
      id v57 = [v16 characteristic];
      id v58 = [v57 type];
      int v59 = [v58 isEqualToString:@"00000013-0000-1000-8000-0026BB765291"];

      v102 = v55;
      id v60 = [v55 mapValue];
      __int16 v61 = [v16 writePrimaryRequestTuple];
      uint64_t v62 = [v61 value];
      __int16 v63 = ((void (**)(void, void *))v60)[2](v60, v62);
      if (v59)
      {
        [v56 setHue:v63];

        BOOL v64 = [v16 writeSecondaryRequestTuple];
        uint64_t v65 = [v64 value];
        uint64_t v66 = +[HMMTRProtocolMap linearMapForCharacteristic:@"0000002F-0000-1000-8000-0026BB765291" value:v65 fromRange:&unk_2702B61C8 toRange:&unk_2702B61E0];
        [v56 setSaturation:v66];
      }
      else
      {
        [v56 setSaturation:v63];

        BOOL v64 = [v16 writeSecondaryRequestTuple];
        uint64_t v65 = [v64 value];
        uint64_t v66 = +[HMMTRProtocolMap linearMapForCharacteristic:@"00000013-0000-1000-8000-0026BB765291" value:v65 fromRange:&unk_2702B6198 toRange:&unk_2702B61B0];
        [v56 setHue:v66];
      }

      [v56 setTransitionTime:&unk_2702B5298];
      [v56 setOptionsMask:&unk_2702B5358];
      uint64_t v75 = (void *)MEMORY[0x2533B64D0]([v56 setOptionsOverride:&unk_2702B5358]);
      v76 = self;
      uint64_t v77 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        id v78 = HMFGetLogIdentifier();
        id v79 = [v16 characteristic];
        long long v80 = [v16 writeSecondaryRequestTuple];
        [v80 characteristic];
        v81 = id v101 = v56;
        long long v82 = v75;
        id v83 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
        BOOL v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
        *(_DWORD *)buf = 138544386;
        __int16 v136 = v78;
        __int16 v137 = 2112;
        uint64_t v138 = (uint64_t)v79;
        __int16 v139 = 2112;
        v140 = v81;
        __int16 v141 = 2112;
        v142 = v83;
        __int16 v143 = 2112;
        v144 = v84;
        _os_log_impl(&dword_252495000, v77, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristics %@ and %@ of type %@ on endpoint %@", buf, 0x34u);

        uint64_t v75 = v82;
        id v56 = v101;
      }
      v119[0] = MEMORY[0x263EF8330];
      v119[1] = 3221225472;
      v119[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_110;
      v119[3] = &unk_2653783C0;
      v119[4] = v76;
      id v120 = v16;
      id v12 = v107;
      id v121 = v107;
      uint64_t v35 = v118;
      id v122 = v118;
      id v33 = v112;
      long long v52 = v114;
      [v117 moveToHueAndSaturationWithParams:v56 expectedValues:v114 expectedValueInterval:v112 completionHandler:v119];

      id v11 = v110;
      id v15 = v102;
      id v13 = v104;
      goto LABEL_39;
    }
    if (v34 == 1)
    {
      id v67 = v19;
      v68 = [(HMMTRProtocolOperationManager *)self _processWriteResponseForOperation:v16 writeResponseValues:0 writeResponseError:0];
      if (v12) {
        (*((void (**)(id, void *))v12 + 2))(v12, v68);
      }

      long long v52 = v67;
      goto LABEL_39;
    }
    id v111 = v33;
    id v113 = v19;
    if (v34)
    {
      uint64_t v69 = (void *)MEMORY[0x2533B64D0]();
      v70 = self;
      uint64_t v71 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v73 = id v72 = v13;
        uint64_t v74 = [v16 handlingType];
        *(_DWORD *)buf = 138543618;
        __int16 v136 = v73;
        __int16 v137 = 2048;
        uint64_t v138 = v74;
        _os_log_impl(&dword_252495000, v71, OS_LOG_TYPE_ERROR, "%{public}@Unhandled handling type: %lu", buf, 0x16u);

        id v13 = v72;
      }

      uint64_t v35 = v118;
      long long v52 = v113;
      goto LABEL_39;
    }
    uint64_t v36 = [v16 characteristic];
    v37 = [v36 type];
    int v38 = [v37 isEqualToString:@"00000013-0000-1000-8000-0026BB765291"];

    if (v38)
    {
      v106 = v12;
      id v109 = v11;
      id v39 = objc_alloc_init(MEMORY[0x263F10D78]);
      id v40 = [v15 mapValue];
      id v41 = [v16 writePrimaryRequestTuple];
      BOOL v42 = [v41 value];
      uint64_t v43 = ((void (**)(void, void *))v40)[2](v40, v42);
      [v39 setHue:v43];

      [v39 setTransitionTime:&unk_2702B5298];
      [v39 setOptionsMask:&unk_2702B5358];
      id v44 = (void *)MEMORY[0x2533B64D0]([v39 setOptionsOverride:&unk_2702B5358]);
      id v45 = self;
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v47 = v103 = v44;
        id v48 = [v16 characteristic];
        uint64_t v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
        id v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
        *(_DWORD *)buf = 138544130;
        __int16 v136 = v47;
        __int16 v137 = 2112;
        uint64_t v138 = (uint64_t)v48;
        __int16 v139 = 2112;
        v140 = v49;
        __int16 v141 = 2112;
        v142 = v50;
        _os_log_impl(&dword_252495000, v46, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

        id v44 = v103;
      }

      v127[0] = MEMORY[0x263EF8330];
      v127[1] = 3221225472;
      v127[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_105;
      v127[3] = &unk_2653783C0;
      v127[4] = v45;
      id v128 = v16;
      id v12 = v106;
      id v129 = v106;
      uint64_t v35 = v118;
      id v130 = v118;
      id v51 = v39;
      long long v52 = v113;
      __int16 v53 = v39;
      id v33 = v111;
      [v117 moveToHueWithParams:v51 expectedValues:v113 expectedValueInterval:v111 completionHandler:v127];

      BOOL v54 = v128;
    }
    else
    {
      int v85 = [v16 characteristic];
      long long v86 = [v85 type];
      int v87 = [v86 isEqualToString:@"0000002F-0000-1000-8000-0026BB765291"];

      uint64_t v35 = v118;
      long long v52 = v113;
      if (!v87)
      {
LABEL_39:

        BOOL v31 = v117;
        id v10 = v115;
        goto LABEL_40;
      }
      v108 = v12;
      id v109 = v11;
      id v88 = objc_alloc_init(MEMORY[0x263F10D80]);
      id v89 = [v15 mapValue];
      __int16 v90 = [v16 writePrimaryRequestTuple];
      id v91 = [v90 value];
      __int16 v92 = ((void (**)(void, void *))v89)[2](v89, v91);
      [v88 setSaturation:v92];

      [v88 setTransitionTime:&unk_2702B5298];
      [v88 setOptionsMask:&unk_2702B5358];
      int v93 = (void *)MEMORY[0x2533B64D0]([v88 setOptionsOverride:&unk_2702B5358]);
      uint64_t v94 = self;
      __int16 v95 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        char v96 = v105 = v93;
        __int16 v97 = [v16 characteristic];
        id v98 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "type"));
        id v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "endpoint"));
        *(_DWORD *)buf = 138544130;
        __int16 v136 = v96;
        __int16 v137 = 2112;
        uint64_t v138 = (uint64_t)v97;
        __int16 v139 = 2112;
        v140 = v98;
        __int16 v141 = 2112;
        v142 = v99;
        _os_log_impl(&dword_252495000, v95, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory sending request for characteristic %@ of type %@ on endpoint %@", buf, 0x2Au);

        int v93 = v105;
      }

      v123[0] = MEMORY[0x263EF8330];
      v123[1] = 3221225472;
      v123[2] = __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_107;
      v123[3] = &unk_2653783C0;
      v123[4] = v94;
      id v124 = v16;
      id v12 = v108;
      id v125 = v108;
      uint64_t v35 = v118;
      id v126 = v118;
      id v100 = v88;
      long long v52 = v113;
      __int16 v53 = v88;
      id v33 = v111;
      [v117 moveToSaturationWithParams:v100 expectedValues:v113 expectedValueInterval:v111 completionHandler:v123];

      BOOL v54 = v124;
    }

    id v11 = v109;
    goto LABEL_39;
  }
  unsigned int v27 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v28 = self;
  uint64_t v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v136 = v30;
    _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Required parameter matterDevice is nil in the hue/saturation write request", buf, 0xCu);
  }
  BOOL v31 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:3 userInfo:0];
  id v15 = [(HMMTRProtocolOperationManager *)v28 _processWriteResponseForOperation:v10 writeResponseValues:0 writeResponseError:v31];
  (*((void (**)(id, void *))v12 + 2))(v12, v15);
LABEL_40:
}

void __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  v26[0] = *MEMORY[0x263F10B70];
  v2 = (void *)MEMORY[0x263F10C50];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "endpoint"));
  id v4 = [v2 attributePathWithEndpointID:v3 clusterID:&unk_2702B52F8 attributeID:&unk_2702B5310];
  v27[0] = v4;
  v26[1] = *MEMORY[0x263F10B90];
  uint64_t v5 = *MEMORY[0x263F10C28];
  uint64_t v6 = *MEMORY[0x263F10C30];
  v24[0] = *MEMORY[0x263F10C18];
  v24[1] = v6;
  v25[0] = v5;
  v25[1] = &unk_2702B5328;
  v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  v27[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v28[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

  id v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "endpoint"));
    id v15 = (void *)MEMORY[0x2533B66E0](*(void *)(a1 + 48));
    int v16 = 138544130;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = &unk_2702B5328;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Faking a color temperature attribute report %@ on endpoint %@ upon hue/sat command invocation, updatedAttributesHandler %@", (uint8_t *)&v16, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_105(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

uint64_t __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_107(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

uint64_t __133__HMMTRProtocolOperationManager_handleHueSaturationWriteWithOperation_clientQueue_operationResponseHandler_updatedAttributesHandler___block_invoke_110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (void)handleIdentifyDeviceWriteWithOperation:(id)a3 clientQueue:(id)a4 operationResponseHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 writePrimaryRequestTuple];
  id v12 = [v11 hmdAccessoryUUID];

  if (v12
    && ([v8 matterDevice], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    uint64_t v14 = [HMMTRIdentifyDevice alloc];
    id v15 = [v8 matterDevice];
    int v16 = [v8 topology];
    id v17 = [(HMMTRIdentifyDevice *)v14 initWithDevice:v15 topology:v16 queue:v9];

    LOWORD(v15) = [v8 endpoint];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __109__HMMTRProtocolOperationManager_handleIdentifyDeviceWriteWithOperation_clientQueue_operationResponseHandler___block_invoke;
    v24[3] = &unk_265377368;
    v24[4] = self;
    id v25 = v8;
    id v26 = v10;
    [(HMMTRIdentifyDevice *)v17 identifyWithEndpoint:(unsigned __int16)v15 completionHandler:v24];
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      __int16 v22 = [v8 matterDevice];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      __int16 v32 = v22;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@A required parameter was not included in identify write request. accessoryUUID: %@, matterDevice: %@", buf, 0x20u);
    }
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"HMMTROperationErrorDomain" code:3 userInfo:0];
    id v23 = [(HMMTRProtocolOperationManager *)v19 _processWriteResponseForOperation:v8 writeResponseValues:0 writeResponseError:v17];
    (*((void (**)(id, void *))v10 + 2))(v10, v23);
  }
}

uint64_t __109__HMMTRProtocolOperationManager_handleIdentifyDeviceWriteWithOperation_clientQueue_operationResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _processWriteResponseForOperation:*(void *)(a1 + 40) writeResponseValues:0 writeResponseError:a2];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)handleSpecialCaseCharacteristicWithOperation:(id)a3 accessoryServer:(id)a4 clientQueue:(id)a5 operationResponseHandler:(id)a6 updatedAttributesHandler:(id)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a6;
  id v16 = a7;
  id v17 = [v12 characteristic];
  __int16 v18 = [v17 type];
  if ([v18 isEqualToString:@"0000001E-0000-1000-8000-0026BB765291"])
  {
    uint64_t v19 = [v12 type];

    if (v19 == 1)
    {
      [(HMMTRProtocolOperationManager *)self handleLockTargetStateWriteWithOperation:v12 accessoryServer:v13 clientQueue:v14 operationResponseHandler:v15];
LABEL_26:
      BOOL v43 = 1;
      goto LABEL_27;
    }
  }
  else
  {
  }
  __int16 v20 = [v12 characteristic];
  uint64_t v21 = [v20 type];
  if ([v21 isEqualToString:@"00000014-0000-1000-8000-0026BB765291"])
  {
    uint64_t v22 = [v12 type];

    if (v22 == 1)
    {
      [(HMMTRProtocolOperationManager *)self handleIdentifyDeviceWriteWithOperation:v12 clientQueue:v14 operationResponseHandler:v15];
      goto LABEL_26;
    }
  }
  else
  {
  }
  if ([v12 type] == 1)
  {
    id v23 = [v12 characteristic];
    uint64_t v24 = [v23 type];
    if ([v24 isEqualToString:@"00000013-0000-1000-8000-0026BB765291"])
    {

LABEL_13:
      [(HMMTRProtocolOperationManager *)self handleHueSaturationWriteWithOperation:v12 clientQueue:v14 operationResponseHandler:v15 updatedAttributesHandler:v16];
      goto LABEL_26;
    }
    id v25 = [v12 characteristic];
    [v25 type];
    id v26 = self;
    unsigned int v27 = v15;
    id v28 = v14;
    id v29 = v16;
    v31 = id v30 = v13;
    int v51 = [v31 isEqualToString:@"0000002F-0000-1000-8000-0026BB765291"];

    id v13 = v30;
    id v16 = v29;
    id v14 = v28;
    id v15 = v27;
    self = v26;

    if (v51) {
      goto LABEL_13;
    }
  }
  if ([v12 type] == 1)
  {
    __int16 v32 = [v12 characteristic];
    uint64_t v33 = [v32 type];
    int v34 = [v33 isEqualToString:@"000000B0-0000-1000-8000-0026BB765291"];

    if (v34)
    {
      if ([v12 handlingType])
      {
        uint64_t v35 = [v12 handlingType];
        uint64_t v36 = (void *)MEMORY[0x2533B64D0]();
        v37 = self;
        int v38 = HMFGetOSLogHandle();
        id v39 = v38;
        if (v35 == 3)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            id v40 = HMFGetLogIdentifier();
            id v41 = [v12 writePrimaryRequestTuple];
            [v41 hmdAccessoryUUID];
            v42 = id v52 = v13;
            *(_DWORD *)buf = 138543618;
            uint64_t v55 = v40;
            __int16 v56 = 2112;
            uint64_t v57 = (uint64_t)v42;
            _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Dropping write request for active characteristic. accessoryUUID: %@", buf, 0x16u);

            id v13 = v52;
          }
        }
        else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = id v50 = v36;
          uint64_t v45 = [v12 handlingType];
          [v12 writePrimaryRequestTuple];
          id v46 = v53 = v13;
          id v47 = [v46 hmdAccessoryUUID];
          *(_DWORD *)buf = 138543874;
          uint64_t v55 = v44;
          __int16 v56 = 2048;
          uint64_t v57 = v45;
          __int16 v58 = 2112;
          int v59 = v47;
          _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@Invalid handling type %lu. Dropping write request for active characteristic. accessoryUUID: %@", buf, 0x20u);

          id v13 = v53;
          uint64_t v36 = v50;
        }

        id v48 = [(HMMTRProtocolOperationManager *)v37 _processWriteResponseForOperation:v12 writeResponseValues:0 writeResponseError:0];
        if (v15) {
          v15[2](v15, v48);
        }

        goto LABEL_26;
      }
    }
  }
  BOOL v43 = 0;
LABEL_27:

  return v43;
}

- (BOOL)_isBasicClusterOperationForBridgedDevice:(Class)a3 endpointID:(unint64_t)a4
{
  if (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) == 0)
  {
    char v6 = [(objc_class *)a3 isEqual:objc_opt_class()];
    return a4 && (v6 & 1) != 0;
  }
  return a4 != 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44 != -1) {
    dispatch_once(&logCategory__hmf_once_t44, &__block_literal_global_132);
  }
  v2 = (void *)logCategory__hmf_once_v45;
  return v2;
}

uint64_t __44__HMMTRProtocolOperationManager_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v45 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

+ (HMMTRProtocolOperationManager)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2166);
  }
  v2 = (void *)sharedInstance_manager;
  return (HMMTRProtocolOperationManager *)v2;
}

uint64_t __47__HMMTRProtocolOperationManager_sharedInstance__block_invoke()
{
  sharedInstance_manager = objc_alloc_init(HMMTRProtocolOperationManager);
  return MEMORY[0x270F9A758]();
}

@end