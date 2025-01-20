@interface HMMTRUtilities
+ (BOOL)compareUnorderedUniqueNumberArray:(id)a3 withArray:(id)a4;
+ (BOOL)isValidCATSubject:(id)a3;
+ (id)__baseClusterValueForAttributeDeviceListFromReadValue:(id)a3 forIdentify:(id)a4;
+ (id)_pathOfMTRClusterReadValue:(id)a3;
+ (id)caseAuthenticatedTagWithIdentifier:(unsigned __int16)a3 version:(unsigned __int16)a4;
+ (id)dateToMatterEpoch:(id)a3;
+ (id)encodeObject:(id)a3;
+ (id)hmmtr_shortTypeFromUUID:(id)a3;
+ (id)identifierStringWithCHIPNodeID:(id)a3;
+ (id)matterEpochToDate:(id)a3;
+ (id)mtrAuthModeAsString:(id)a3;
+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 clusterIdentifier:(id)a4 attributeIdentifier:(id)a5 forIdentify:(id)a6;
+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 forIdentify:(id)a4;
+ (id)mtrBaseClusterValueFromMTRClusterReportValue:(id)a3;
+ (id)mtrPrivilegeAsString:(id)a3;
+ (id)sanitizeHAPName:(id)a3;
+ (id)setupIDFromSetupCode:(id)a3 discriminator:(id)a4;
+ (int64_t)nextServiceInstanceID:(int64_t)a3 previousCharacteristicsCount:(unint64_t)a4;
+ (int64_t)randomDiscriminator;
+ (unint64_t)randomNodeID;
+ (unsigned)randomCASEAuthenticatedTagIdentifier;
+ (void)parseCaseAuthenticatedTag:(id)a3 identifier:(unsigned __int16 *)a4 version:(unsigned __int16 *)a5;
+ (void)printAccessControlList:(id)a3;
@end

@implementation HMMTRUtilities

+ (id)matterEpochToDate:(id)a3
{
  id v3 = a3;
  if ([v3 longLongValue] <= 0)
  {
    uint64_t v4 = [MEMORY[0x263EFF910] distantPast];
  }
  else
  {
    if ([v3 longLongValue] < 0xFFFFFFFFLL) {
      objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") + 946684800));
    }
    else {
    uint64_t v4 = [MEMORY[0x263EFF910] distantFuture];
    }
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)dateToMatterEpoch:(id)a3
{
  id v3 = NSNumber;
  [a3 timeIntervalSince1970];
  v5 = [v3 numberWithDouble:v4 + -946684800.0];
  uint64_t v6 = [v5 longLongValue];

  if (v6 < 1)
  {
    v7 = &unk_2702B5940;
  }
  else if ((unint64_t)v6 <= 0xFFFFFFFE)
  {
    v7 = [NSNumber numberWithUnsignedInt:v6];
  }
  else
  {
    v7 = &unk_2702B5958;
  }
  return v7;
}

+ (id)sanitizeHAPName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F089C0];
  id v4 = a3;
  v5 = [v3 alphanumericCharacterSet];
  uint64_t v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  [v5 addCharactersInString:@".’',-&#"];
  v7 = [v5 invertedSet];
  v8 = [v4 componentsSeparatedByCharactersInSet:v7];

  v9 = [v8 componentsJoinedByString:&stru_2702A0B38];

  return v9;
}

+ (void)printAccessControlList:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = a3;
  uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v36 + 1) + 8 * v3);
        v5 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v6 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = HMFGetLogIdentifier();
          v8 = [v4 privilege];
          v9 = +[HMMTRUtilities mtrPrivilegeAsString:v8];
          *(_DWORD *)buf = 138543618;
          v41 = v7;
          __int16 v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Privilege: %@", buf, 0x16u);
        }
        v10 = (void *)MEMORY[0x2533B64D0]();
        v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = HMFGetLogIdentifier();
          v13 = [v4 authMode];
          v14 = +[HMMTRUtilities mtrAuthModeAsString:v13];
          *(_DWORD *)buf = 138543618;
          v41 = v12;
          __int16 v42 = 2112;
          v43 = v14;
          _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@AuthMode: %@", buf, 0x16u);
        }
        uint64_t v31 = v3;

        v15 = (void *)MEMORY[0x2533B64D0]();
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v41 = v17;
          _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@    Subjects:", buf, 0xCu);
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v18 = [v4 subjects];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x2533B64D0]();
              v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                v26 = HMFGetLogIdentifier();
                int v27 = [v23 integerValue];
                *(_DWORD *)buf = 138543874;
                v41 = v26;
                __int16 v42 = 2112;
                v43 = v23;
                __int16 v44 = 1024;
                int v45 = v27;
                _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@    %@ (0x%016X)", buf, 0x1Cu);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v46 count:16];
          }
          while (v20);
        }

        uint64_t v3 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v30);
  }
}

+ (id)mtrAuthModeAsString:(id)a3
{
  id v3 = a3;
  if ([v3 integerValue] == 1)
  {
    id v4 = @"PASE";
  }
  else if ([v3 integerValue] == 2)
  {
    id v4 = @"CASE";
  }
  else if ([v3 integerValue] == 3)
  {
    id v4 = @"Group";
  }
  else
  {
    id v4 = @"Unknown";
  }

  return v4;
}

+ (id)mtrPrivilegeAsString:(id)a3
{
  id v3 = a3;
  if ([v3 integerValue] == 5)
  {
    id v4 = @"Administrator";
  }
  else if ([v3 integerValue] == 3)
  {
    id v4 = @"Operate";
  }
  else if ([v3 integerValue] == 4)
  {
    id v4 = @"Manage";
  }
  else if ([v3 integerValue] == 1)
  {
    id v4 = @"View";
  }
  else if ([v3 integerValue] == 2)
  {
    id v4 = @"ProxyView";
  }
  else
  {
    id v4 = @"Unknown";
  }

  return v4;
}

+ (BOOL)isValidCATSubject:(id)a3
{
  uint64_t v3 = [a3 longLongValue];
  return (_WORD)v3 && (~v3 & 0xFFFFFFFD00000000) == 0;
}

+ (void)parseCaseAuthenticatedTag:(id)a3 identifier:(unsigned __int16 *)a4 version:(unsigned __int16 *)a5
{
  id v7 = a3;
  *a4 = [v7 unsignedIntValue] >> 16;
  LOWORD(a4) = [v7 unsignedIntValue];

  *a5 = (unsigned __int16)a4;
}

+ (id)caseAuthenticatedTagWithIdentifier:(unsigned __int16)a3 version:(unsigned __int16)a4
{
  return (id)[NSNumber numberWithUnsignedLong:a4 | ((unint64_t)a3 << 16)];
}

+ (unsigned)randomCASEAuthenticatedTagIdentifier
{
  return arc4random_uniform(0xFFFFu);
}

+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 clusterIdentifier:(id)a4 attributeIdentifier:(id)a5 forIdentify:(id)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    uint64_t v14 = *MEMORY[0x263F10C18];
    v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F10C18]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = *MEMORY[0x263F10B68];
    id v67 = v11;
    v68 = v12;
    if ([v17 isEqual:*MEMORY[0x263F10B68]])
    {
      uint64_t v59 = *MEMORY[0x263F10C30];
      uint64_t v19 = objc_msgSend(v10, "objectForKeyedSubscript:");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = v20;

      v60 = v21;
      if (v21)
      {
        id v66 = v13;
        v65 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id obj = v21;
        uint64_t v22 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v64 = *(void *)v70;
          uint64_t v63 = *MEMORY[0x263F10B90];
          uint64_t v61 = *MEMORY[0x263F10C10];
          id v57 = v17;
          id v58 = v10;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v70 != v64) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v26 = (void *)MEMORY[0x2533B64D0]();
                id v27 = a1;
                v28 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v29 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v75 = v29;
                  __int16 v76 = 2112;
                  id v77 = v66;
                  _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Array element is not a dictionary %@", buf, 0x16u);
                }
                id v11 = v67;
              }
              uint64_t v30 = objc_msgSend(v25, "objectForKeyedSubscript:", v63, v57);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v31 = v30;
              }
              else {
                uint64_t v31 = 0;
              }
              id v32 = v31;

              if (!v32)
              {
                v52 = (void *)MEMORY[0x2533B64D0]();
                id v53 = a1;
                v54 = HMFGetOSLogHandle();
                id v13 = v66;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  v55 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v75 = v55;
                  __int16 v76 = 2112;
                  id v77 = v66;
                  _os_log_impl(&dword_252495000, v54, OS_LOG_TYPE_ERROR, "%{public}@Array element data missing from array type %@", buf, 0x16u);
                }
                id v10 = v58;
                id v12 = v68;
                goto LABEL_54;
              }
              long long v33 = [v32 objectForKeyedSubscript:v14];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                long long v34 = v33;
              }
              else {
                long long v34 = 0;
              }
              id v35 = v34;

              if (([v35 isEqual:v18] & 1) != 0 || objc_msgSend(v35, "isEqual:", v61))
              {
                id v12 = v68;
                if (!v11
                  || (int v36 = [v11 isEqual:&unk_2702B5910], !v68)
                  || !v36
                  || ![v68 isEqual:&unk_2702B5928])
                {
                  uint64_t v48 = (void *)MEMORY[0x2533B64D0]();
                  id v49 = a1;
                  v50 = HMFGetOSLogHandle();
                  id v13 = v66;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    v51 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v75 = v51;
                    __int16 v76 = 2112;
                    id v77 = v66;
                    _os_log_impl(&dword_252495000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nested aggregate type %@", buf, 0x16u);

                    id v12 = v68;
                  }

                  id v10 = v58;
LABEL_54:
                  id v17 = v57;

                  id v39 = 0;
                  id v11 = v67;
                  long long v38 = v65;
                  goto LABEL_55;
                }
                long long v37 = objc_msgSend(a1, "__baseClusterValueForAttributeDeviceListFromReadValue:forIdentify:", v32, v66);
                [v65 addObjectsFromArray:v37];
              }
              else
              {
                long long v37 = [v32 objectForKeyedSubscript:v59];
                [v65 addObject:v37];
                id v12 = v68;
              }
            }
            uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
            id v17 = v57;
            id v10 = v58;
            if (v23) {
              continue;
            }
            break;
          }
        }

        long long v38 = v65;
        id v39 = v65;
        id v13 = v66;
LABEL_55:
      }
      else
      {
        __int16 v44 = (void *)MEMORY[0x2533B64D0]();
        id v45 = a1;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v75 = v47;
          __int16 v76 = 2112;
          id v77 = v13;
          _os_log_impl(&dword_252495000, v46, OS_LOG_TYPE_ERROR, "%{public}@Array missing from array type %@", buf, 0x16u);
        }
        id v39 = 0;
        id v11 = v67;
      }
    }
    else if ([v17 isEqual:*MEMORY[0x263F10BF0]])
    {
      id v39 = 0;
    }
    else if ([v17 isEqual:*MEMORY[0x263F10C10]])
    {
      v40 = (void *)MEMORY[0x2533B64D0]();
      id v41 = a1;
      __int16 v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v75 = v43;
        __int16 v76 = 2112;
        id v77 = v13;
        _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unexpected structure type value %@", buf, 0x16u);

        id v12 = v68;
      }

      id v39 = 0;
      id v11 = v67;
    }
    else
    {
      id v39 = [v10 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

+ (id)mtrBaseClusterValueFromMTRClusterReadResultValue:(id)a3 forIdentify:(id)a4
{
  return (id)[a1 mtrBaseClusterValueFromMTRClusterReadResultValue:a3 clusterIdentifier:0 attributeIdentifier:0 forIdentify:a4];
}

+ (id)__baseClusterValueForAttributeDeviceListFromReadValue:(id)a3 forIdentify:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v37 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C18]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if ([v8 isEqual:*MEMORY[0x263F10C10]])
  {
    v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v35 = v8;
      id v36 = v5;
      id v12 = objc_opt_new();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v34 = v11;
      id obj = v11;
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(id *)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v18 = v17;
            }
            else {
              uint64_t v18 = 0;
            }
            id v19 = v18;

            if (!v19)
            {
              uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
              id v21 = a1;
              uint64_t v22 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v24 = uint64_t v23 = v15;
                *(_DWORD *)buf = 138543618;
                v46 = v24;
                __int16 v47 = 2112;
                id v48 = v37;
                _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@Structure Value does not contain a dictionary %@", buf, 0x16u);

                uint64_t v15 = v23;
              }
            }
            [v12 addObject:v19];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v14);
      }

      id v8 = v35;
      id v5 = v36;
      id v11 = v34;
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x2533B64D0]();
      id v30 = a1;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v46 = v32;
        __int16 v47 = 2112;
        id v48 = v37;
        _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_ERROR, "%{public}@Element data data array missing from array type %@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x2533B64D0]();
    id v26 = a1;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      __int16 v47 = 2112;
      id v48 = v37;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@Dictionary element is not a structure type %@", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)mtrBaseClusterValueFromMTRClusterReportValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v9 = [a1 _pathOfMTRClusterReadValue:v5];
      id v10 = [a1 mtrBaseClusterValueFromMTRClusterReadResultValue:v8 forIdentify:v9];
    }
    else
    {
      id v11 = (void *)MEMORY[0x2533B64D0]();
      id v12 = a1;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = [v12 _pathOfMTRClusterReadValue:v5];
        int v22 = 138543618;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Read value missing data key %@", (uint8_t *)&v22, 0x16u);
      }
      v16 = (void *)MEMORY[0x2533B64D0]();
      id v17 = v12;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = HMFGetLogIdentifier();
        uint64_t v20 = [MEMORY[0x263F08B88] callStackSymbols];
        int v22 = 138543874;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        v25 = v5;
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_DEBUG, "%{public}@%@\nat%@", (uint8_t *)&v22, 0x20u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_pathOfMTRClusterReadValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F10BD0]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v5 = v10;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)encodeObject:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:*MEMORY[0x263F081D0]];

  [v5 finishEncoding];
  uint64_t v6 = [v5 encodedData];

  return v6;
}

+ (unint64_t)randomNodeID
{
  return arc4random_uniform(0xFFFFFFFE) + 1;
}

+ (BOOL)compareUnorderedUniqueNumberArray:(id)a3 withArray:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = (void *)v7;
  if ((v6 != 0) != (v7 != 0))
  {
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_12;
  }
  if (!(v6 | v7))
  {
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  uint64_t v9 = [(id)v6 count];
  if (v9 != [v8 count])
  {
    id v17 = (void *)MEMORY[0x2533B64D0]();
    id v18 = a1;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543874;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      unint64_t v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@compareUnorderedUniqueNumberArray array %@ withArray %@ returned false", (uint8_t *)&v22, 0x20u);
    }
    goto LABEL_11;
  }
  id v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
  id v11 = [MEMORY[0x263EFFA08] setWithArray:v8];
  int v12 = [v10 isEqual:v11];
  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  id v14 = a1;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    int v22 = 138544130;
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    unint64_t v25 = v6;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 1024;
    int v29 = v12;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@compareUnorderedUniqueNumberArray array %@ withArray %@ returned %d", (uint8_t *)&v22, 0x26u);
  }

LABEL_12:
  return v12;
}

+ (int64_t)nextServiceInstanceID:(int64_t)a3 previousCharacteristicsCount:(unint64_t)a4
{
  return a3 + 10 * (a4 / 0xA) + 10;
}

+ (int64_t)randomDiscriminator
{
  return arc4random_uniform(0x1000u);
}

+ (id)hmmtr_shortTypeFromUUID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x263F357F0];
  if ([v3 hasSuffix:*MEMORY[0x263F357F0]])
  {
    id v5 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(v4, "length"));
    unint64_t v6 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", @"^0+", &stru_2702A0B38, 1024, 0, objc_msgSend(v5, "length"));
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)setupIDFromSetupCode:(id)a3 discriminator:(id)a4
{
  id v5 = NSNumber;
  id v6 = a3;
  unint64_t v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(a4, "intValue") & 0xF);
  id v8 = NSString;
  uint64_t v9 = [v6 stringValue];

  id v10 = objc_msgSend(v9, "hmmtr_sha256hash");
  id v11 = [v7 stringValue];
  int v12 = objc_msgSend(v11, "hmmtr_sha256hash");
  uint64_t v13 = [v8 stringWithFormat:@"%@%@", v10, v12];
  id v14 = objc_msgSend(v13, "hmmtr_sha256hash");

  uint64_t v15 = [v14 substringToIndex:4];

  return v15;
}

+ (id)identifierStringWithCHIPNodeID:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@", a3];
  id v4 = objc_msgSend(v3, "hmmtr_sha256hash");
  id v5 = [v4 substringToIndex:12];
  id v6 = [MEMORY[0x263F089D8] stringWithString:v5];
  uint64_t v7 = [v6 length];
  uint64_t v8 = v7 - 2;
  if (v7 != 2)
  {
    do
    {
      [v6 insertString:@":" atIndex:v8];
      v8 -= 2;
    }
    while (v8);
  }

  return v6;
}

@end