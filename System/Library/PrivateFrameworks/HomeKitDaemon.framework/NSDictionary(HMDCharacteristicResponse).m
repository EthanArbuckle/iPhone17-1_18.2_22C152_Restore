@interface NSDictionary(HMDCharacteristicResponse)
- (id)hmd_responseByRemovingEntriesForCharacteristics:()HMDCharacteristicResponse;
- (id)hmd_valueOfCharacteristic:()HMDCharacteristicResponse error:;
- (uint64_t)hmd_isValidResponseForWriteRequest:()HMDCharacteristicResponse naturalLightingEnabled:error:;
@end

@implementation NSDictionary(HMDCharacteristicResponse)

- (id)hmd_responseByRemovingEntriesForCharacteristics:()HMDCharacteristicResponse
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28 = (void *)[a1 mutableCopy];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v34;
    v27 = a1;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "service", v27);
        v8 = [v7 instanceID];
        v9 = [v8 stringValue];

        v10 = [v7 accessory];
        v11 = [v10 uuid];
        v12 = [v11 UUIDString];

        v13 = [v6 instanceID];
        v14 = [v13 stringValue];

        v15 = objc_msgSend(a1, "hmf_dictionaryForKey:", v12);
        v16 = v15;
        if (v15)
        {
          v17 = v9;
          v18 = objc_msgSend(v15, "hmf_dictionaryForKey:", v9);
          v19 = v18;
          if (v18)
          {
            v20 = objc_msgSend(v18, "hmf_dictionaryForKey:", v14);
            if (v20)
            {
              id v29 = v20;
              v21 = (void *)[v19 mutableCopy];
              [v21 setObject:0 forKeyedSubscript:v14];
              v22 = (void *)[v16 mutableCopy];
              if ([v21 count])
              {
                v23 = (void *)[v21 copy];
                [v22 setObject:v23 forKeyedSubscript:v17];
              }
              else
              {
                [v22 setObject:0 forKeyedSubscript:v17];
              }
              if ([v22 count])
              {
                v24 = (void *)[v22 copy];
                [v28 setObject:v24 forKeyedSubscript:v12];
              }
              else
              {
                [v28 removeObjectForKey:v12];
              }
              a1 = v27;

              v20 = v29;
            }
          }
          v9 = v17;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }

  v25 = (void *)[v28 copy];
  return v25;
}

- (id)hmd_valueOfCharacteristic:()HMDCharacteristicResponse error:
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 service];
  v8 = [v7 instanceID];
  v9 = [v7 accessory];
  v10 = [v9 uuid];

  v11 = [v6 instanceID];
  v12 = [v10 UUIDString];
  v13 = objc_msgSend(a1, "hmf_dictionaryForKey:", v12);

  if (v13)
  {
    v14 = [v8 stringValue];
    v15 = objc_msgSend(v13, "hmf_dictionaryForKey:", v14);

    if (v15)
    {
      v42 = v11;
      v16 = [v11 stringValue];
      v17 = objc_msgSend(v15, "hmf_dictionaryForKey:", v16);

      if (v17)
      {
        v18 = [v17 objectForKeyedSubscript:@"kCharacteristicValue"];
        uint64_t v19 = objc_msgSend(v17, "hmf_dataForKey:", @"kCharacteristicErrorDataKey");
        v20 = (void *)v19;
        if (a4 && !v18)
        {
          uint64_t v38 = v8;
          v40 = (void *)v19;
          v21 = (void *)MEMORY[0x263F08928];
          uint64_t v22 = objc_opt_class();
          id v44 = 0;
          v23 = v21;
          v20 = v40;
          v24 = [v23 unarchivedObjectOfClass:v22 fromData:v40 error:&v44];
          id v39 = v44;
          if (v24)
          {
            *a4 = v24;
          }
          else
          {
            *a4 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
            context = (void *)MEMORY[0x230FBD990]();
            long long v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              long long v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v46 = v35;
              __int16 v47 = 2112;
              v48 = v40;
              __int16 v49 = 2112;
              id v50 = v39;
              _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode error from data %@:%@", buf, 0x20u);

              v20 = v40;
            }
          }

          v8 = v38;
        }
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x230FBD990]();
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          long long v33 = v41 = v31;
          *(_DWORD *)buf = 138544130;
          v46 = v33;
          __int16 v47 = 2112;
          v48 = v42;
          __int16 v49 = 2112;
          id v50 = v8;
          __int16 v51 = 2112;
          v52 = v10;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for characteristic with iid of service with iid of accessory with uuid %@:%@:%@", buf, 0x2Au);

          uint64_t v31 = v41;
        }

        if (a4)
        {
          [MEMORY[0x263F087E8] hmfErrorWithCode:2];
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
      }
      v11 = v42;
    }
    else
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = v43 = v11;
        *(_DWORD *)buf = 138543874;
        v46 = v30;
        __int16 v47 = 2112;
        v48 = v8;
        __int16 v49 = 2112;
        id v50 = v10;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for service with iid of accessory with uuid %@:%@", buf, 0x20u);

        v11 = v43;
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] hmfErrorWithCode:2];
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v27;
      __int16 v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Missing entry for accessory with uuid in write response %@", buf, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] hmfErrorWithCode:2];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (uint64_t)hmd_isValidResponseForWriteRequest:()HMDCharacteristicResponse naturalLightingEnabled:error:
{
  v65[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v65[0] = v8;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
    *(_DWORD *)buf = 138543874;
    v58 = v11;
    __int16 v59 = 2112;
    id v60 = v12;
    __int16 v61 = 2112;
    id v62 = a1;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Received response for requests %@:%@", buf, 0x20u);
  }
  v13 = [v8 characteristic];
  id v56 = 0;
  v14 = objc_msgSend(a1, "hmd_valueOfCharacteristic:error:", v13, &v56);
  id v15 = v56;

  if (v14)
  {
    id v16 = v14;
    objc_opt_class();
    int v17 = objc_opt_isKindOfClass() & 1;
    if (v17) {
      v18 = v16;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    if (v17)
    {
      id v54 = v19;
      v20 = [v8 value];
      int v21 = [v16 isEqual:v20];

      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      v23 = HMFGetOSLogHandle();
      v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v58 = v25;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Calling completion by ignoring the write response", buf, 0xCu);
        }
        uint64_t v26 = 1;
        id v27 = v15;
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v36 = HMFGetLogIdentifier();
          v37 = objc_msgSend(v16, "hmf_hexadecimalRepresentation");
          *(_DWORD *)buf = 138543618;
          v58 = v36;
          __int16 v59 = 2112;
          id v60 = v37;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@[Natural Lighting] Decoding value transition control response: %@", buf, 0x16u);
        }
        id v55 = v15;
        uint64_t v38 = [MEMORY[0x263F35918] parsedFromData:v16 error:&v55];
        id v27 = v55;

        id v39 = (void *)MEMORY[0x230FBD990]();
        v40 = HMFGetOSLogHandle();
        v41 = v40;
        if (v38)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v58 = v42;
            __int16 v59 = 2112;
            id v60 = v38;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@[Natural Lighting] Transition control response is: %@", buf, 0x16u);
          }
          v43 = [v8 characteristic];
          id v44 = [v43 service];
          v45 = [v44 findCharacteristicWithType:*MEMORY[0x263F0BFF8]];

          int v46 = [v38 isNaturalLightingEnabledForCharacteristic:v45] ^ a4;
          if (v46 == 1)
          {
            context = (void *)MEMORY[0x230FBD990]();
            __int16 v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v52 = HMFGetLogIdentifier();
              v48 = HMFBooleanToString();
              __int16 v49 = HMFBooleanToString();
              *(_DWORD *)buf = 138543874;
              v58 = v52;
              __int16 v59 = 2112;
              id v60 = v48;
              __int16 v61 = 2112;
              id v62 = v49;
              _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Write response indicates Natural Lighting was enabled: %@ expected: %@", buf, 0x20u);
            }
            *a5 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
          }
          uint64_t v26 = v46 ^ 1u;
        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v58 = v50;
            __int16 v59 = 2112;
            id v60 = v16;
            __int16 v61 = 2112;
            id v62 = v27;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Failed to parse Transition Control Response %@:%@", buf, 0x20u);
          }
          uint64_t v26 = 0;
          if (a5) {
            *a5 = v27;
          }
        }
      }
      id v19 = v54;
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x230FBD990]();
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = id v33 = v19;
        uint64_t v35 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v58 = v34;
        __int16 v59 = 2112;
        id v60 = v8;
        __int16 v61 = 2112;
        id v62 = v16;
        __int16 v63 = 2112;
        uint64_t v64 = v35;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Response value for request %@ is not of expected type %@:%@", buf, 0x2Au);

        id v19 = v33;
      }

      if (a5)
      {
        [MEMORY[0x263F087E8] hmfErrorWithCode:15];
        uint64_t v26 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v26 = 0;
      }
      id v27 = v15;
    }

    id v15 = v27;
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v58 = v30;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      id v62 = v15;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Natural Lighting] Failed to parse response for request %@:%@", buf, 0x20u);
    }
    if (a5)
    {
      id v15 = v15;
      uint64_t v26 = 0;
      *a5 = v15;
    }
    else
    {
      uint64_t v26 = 0;
    }
  }

  return v26;
}

@end