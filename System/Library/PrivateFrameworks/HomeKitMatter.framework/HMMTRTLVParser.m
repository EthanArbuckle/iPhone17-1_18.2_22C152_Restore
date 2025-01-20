@interface HMMTRTLVParser
+ (id)csrFromNOCSRElements:(id)a3;
+ (id)fabricIndicesFromTLV:(id)a3;
+ (id)keyPairDataFromTLV:(id)a3;
+ (id)logCategory;
@end

@implementation HMMTRTLVParser

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_8333 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_8333, &__block_literal_global_8334);
  }
  v2 = (void *)logCategory__hmf_once_v3_8335;
  return v2;
}

uint64_t __29__HMMTRTLVParser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_8335;
  logCategory__hmf_once_v3_8335 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)keyPairDataFromTLV:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (unsigned char *)[v4 bytes];
  uint64_t v6 = [v4 length];
  if (!v6 || *v5 != 21) {
    goto LABEL_17;
  }
  v7 = 0;
  uint64_t v27 = v6 - 1;
  v28 = v5 + 1;
  char v8 = 1;
  while (1)
  {
    char v9 = v8;
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    id v24 = 0;
    int v10 = ReadIntegerWithContextSpecificTag(&v28, (unint64_t *)&v27, &v24);
    id v11 = v24;
    v12 = v11;
    if (v10) {
      break;
    }
    if (!ReadOctetStringWithContextSpecificTag(&v28, (unint64_t *)&v27, &v26, &v25))
    {
      v14 = (void *)MEMORY[0x2533B64D0]();
      id v22 = a1;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      v19 = "%{public}@Unknown field in the key pair TLV struct";
      v20 = v16;
      uint32_t v21 = 12;
      goto LABEL_15;
    }
    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v26 length:v25];

    v7 = (void *)v13;
LABEL_9:

    char v8 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_18;
    }
  }
  if ([v11 isEqual:&unk_2702B5970]) {
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = a1;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    __int16 v31 = 2112;
    v32 = v12;
    v19 = "%{public}@Unexpected key pair data version: %@";
    v20 = v16;
    uint32_t v21 = 22;
LABEL_15:
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
  }
LABEL_16:

LABEL_17:
  v7 = 0;
LABEL_18:

  return v7;
}

+ (id)fabricIndicesFromTLV:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (unsigned char *)[v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 && *v4 == 21)
  {
    unint64_t v6 = v5 - 1;
    unint64_t v34 = v5 - 1;
    v35 = v4 + 1;
    for (int i = 1; ; int i = 0)
    {
      uint64_t v8 = v6 - 2;
      if (v6 >= 2)
      {
        char v9 = v35;
        if ((*v35 & 0xE0) == 0x20 && (*v35 & 0x1F) == 0x16 && v35[1] == 1) {
          break;
        }
      }
      if ((ReadIntegerWithContextSpecificTag(&v35, &v34, &v29) & i & 1) == 0) {
        goto LABEL_12;
      }
      unint64_t v6 = v34;
    }
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    if (v8 < 1) {
      goto LABEL_29;
    }
    uint64_t v14 = 0;
    id v15 = v9 + 2;
    unint64_t v16 = v8;
    while (2)
    {
      unsigned int v17 = v15[v14];
      if (v17 > 0x1F)
      {
LABEL_29:

        id v22 = 0;
LABEL_30:
        id v11 = 0;
      }
      else
      {
        unint64_t v18 = 1;
        int v19 = 1;
        switch(v15[v14])
        {
          case 0:
            goto LABEL_27;
          case 1:
            goto LABEL_22;
          case 2:
            goto LABEL_24;
          case 3:
            goto LABEL_26;
          case 4:
            int v19 = 0;
            unint64_t v18 = 1;
            goto LABEL_27;
          case 5:
            int v19 = 0;
LABEL_22:
            unint64_t v18 = 2;
            goto LABEL_27;
          case 6:
            int v19 = 0;
LABEL_24:
            unint64_t v18 = 4;
            goto LABEL_27;
          case 7:
            int v19 = 0;
LABEL_26:
            unint64_t v18 = 8;
LABEL_27:
            if (v16 <= v18) {
              goto LABEL_29;
            }
            uint64_t v20 = v14 + 1;
            uint32_t v21 = LittleEndianNumberFromBytes((uint64_t)&v15[v14 + 1], v18, v19);
            [v13 addObject:v21];

            uint64_t v14 = v18 + v20;
            unint64_t v16 = v8 - (v18 + v20);
            if (v8 <= (uint64_t)(v18 + v20)) {
              goto LABEL_29;
            }
            continue;
          default:
            if (v17 != 24) {
              goto LABEL_29;
            }
            id v23 = v13;

            id v24 = v23;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v22 = v24;
            uint64_t v25 = [v22 countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (!v25) {
              goto LABEL_41;
            }
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v31;
            break;
        }
        while (2)
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(v22);
            }
            if ((unint64_t)([*(id *)(*((void *)&v30 + 1) + 8 * j) longLongValue] - 1) > 0xFD)
            {

              goto LABEL_30;
            }
          }
          uint64_t v26 = [v22 countByEnumeratingWithState:&v30 objects:v36 count:16];
          if (v26) {
            continue;
          }
          break;
        }
LABEL_41:

        id v22 = v22;
        id v11 = v22;
      }
      break;
    }
  }
  else
  {
LABEL_12:
    id v11 = 0;
  }

  return v11;
}

+ (id)csrFromNOCSRElements:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned char *)[v3 bytes];
  uint64_t v5 = [v3 length];

  if (v5 && *v4 == 21)
  {
    uint64_t v11 = v5 - 1;
    v12 = v4 + 1;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    int v6 = ReadOctetStringWithContextSpecificTag(&v12, (unint64_t *)&v11, &v10, &v9);
    v7 = 0;
    if (v6)
    {
      v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:v9];
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end