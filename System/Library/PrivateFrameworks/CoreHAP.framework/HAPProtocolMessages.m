@interface HAPProtocolMessages
+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
+ (BOOL)parseAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 outChallengeResponse:(id *)a5 outMFICert:(id *)a6 withHeader:(BOOL)a7;
+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7;
+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
+ (id)constructAuthChallengeRequest:(id)a3 nonce:(id)a4 outTID:(char *)a5;
+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4;
+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5;
+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5;
+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4;
+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5;
+ (id)logCategory;
+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
@end

@implementation HAPProtocolMessages

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1) {
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_24470);
  }
  v2 = (void *)logCategory__hmf_once_v32;

  return v2;
}

uint64_t __34__HAPProtocolMessages_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)parseAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 outChallengeResponse:(id *)a5 outMFICert:(id *)a6 withHeader:(BOOL)a7
{
  BOOL v7 = a7;
  int v10 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = v12;
  if (v7)
  {
    LOBYTE(v38) = 0;
    LOBYTE(v37) = 0;
    unsigned __int8 v40 = 0;
    LOWORD(v39) = [v12 length];
    _extractResponseHeaderFields(v13, &v38, (uint64_t)&v37, (uint64_t)&v40);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v37 != v10)
      {
        v15 = (void *)MEMORY[0x1D944E080]();
        id v23 = a1;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v42 = v24;
          __int16 v43 = 1024;
          int v44 = v37;
          __int16 v45 = 1024;
          int v46 = v10;
          _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);
        }
        goto LABEL_13;
      }
      if (v40)
      {
        v15 = (void *)MEMORY[0x1D944E080]();
        id v16 = a1;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v18;
          __int16 v43 = 1024;
          int v44 = v40;
          v19 = "%{public}@Unexpected Status: 0x%02x";
          v20 = v17;
          uint32_t v21 = 18;
LABEL_10:
          _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
        }
LABEL_13:

        BOOL v25 = 0;
LABEL_30:

        return v25;
      }
      if ((unint64_t)[v14 length] > 1)
      {
        [v14 getBytes:&v39 length:2];
        v13 = objc_msgSend(v14, "subdataWithRange:", 2, objc_msgSend(v14, "length") - 2);

        goto LABEL_16;
      }
      v15 = (void *)MEMORY[0x1D944E080]();
      id v36 = a1;
      v17 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      v19 = "%{public}@Insufficient body length";
    }
    else
    {
      v15 = (void *)MEMORY[0x1D944E080]();
      id v22 = a1;
      v17 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      v19 = "%{public}@Failed parsing headers";
    }
    v20 = v17;
    uint32_t v21 = 12;
    goto LABEL_10;
  }
LABEL_16:
  if (v13)
  {
    id v14 = v13;
    [v14 bytes];
    [v14 length];
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    v37 = 0;
    int v26 = TLV8GetOrCopyCoalesced();
    if (v26)
    {
      int v27 = v26;
      id v28 = 0;
    }
    else
    {
      v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v39 length:v38];
      if (v37)
      {
        free(v37);
        v37 = 0;
      }
      if (a5) {
        *a5 = v29;
      }
      int v30 = TLV8GetOrCopyCoalesced();
      if (!v30)
      {
        id v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v39 length:v38];

        if (v37)
        {
          free(v37);
          v37 = 0;
        }
        if (a6)
        {
          id v28 = v28;
          *a6 = v28;
        }
        BOOL v25 = 1;
        goto LABEL_29;
      }
      int v27 = v30;
      id v28 = v29;
    }
    v31 = (void *)MEMORY[0x1D944E080]();
    id v32 = a1;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v34;
      __int16 v43 = 1024;
      int v44 = v27;
      _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Auth challenge response failed status: %d", buf, 0x12u);
    }
    BOOL v25 = 0;
LABEL_29:

    goto LABEL_30;
  }
  return 0;
}

+ (id)constructAuthChallengeRequest:(id)a3 nonce:(id)a4 outTID:(char *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = +[HAPProtocolMessages constructRequestHeaderFor:19 instanceID:a3 outTID:a5];
  if (v7)
  {
    __int16 v12 = [v7 length] + 2;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    TLV8BufferInit();
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend())
    {
      TLV8BufferFree();
      int v10 = 0;
      goto LABEL_6;
    }
    [v8 appendBytes:&v12 length:2];
    objc_msgSend(v8, "appendBytes:length:", v13);
    TLV8BufferFree();
  }
  int v10 = (void *)[v8 copy];
LABEL_6:

  return v10;
}

+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v35 = 0;
  unsigned __int8 v34 = 0;
  unsigned __int16 v9 = [v8 length];
  unsigned __int16 v33 = v9;
  if (!v5)
  {
    unsigned __int16 v18 = v9;
LABEL_8:
    if ([v8 length] == v18)
    {
      id v19 = v8;
      [v19 bytes];
      [v19 length];
      int v20 = TLV8GetOrCopyCoalesced();
      if (v20) {
        int v21 = v20;
      }
      else {
        int v21 = -6743;
      }
    }
    else
    {
      int v21 = -6742;
    }
    long long v28 = (void *)MEMORY[0x1D944E080]();
    id v29 = a1;
    long long v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      long long v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v31;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v21;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Acc Info Response failed status: %d", buf, 0x12u);
    }

    goto LABEL_29;
  }
  int v10 = _extractResponseHeaderFields(v8, (unsigned char *)&v35 + 1, (uint64_t)&v35, (uint64_t)&v34);

  if (v10)
  {
    if (v35 != v6)
    {
      v11 = (void *)MEMORY[0x1D944E080]();
      id v12 = a1;
      long long v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        long long v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v37 = v27;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v35;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v6;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);
      }
      goto LABEL_28;
    }
    if (v34)
    {
      v11 = (void *)MEMORY[0x1D944E080]();
      id v12 = a1;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v14;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v34;
        long long v15 = "%{public}@Unexpected Status: 0x%02x";
        long long v16 = v13;
        uint32_t v17 = 18;
LABEL_26:
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if ((unint64_t)[v10 length] < 2)
    {
      v11 = (void *)MEMORY[0x1D944E080]();
      id v12 = a1;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v14;
        long long v15 = "%{public}@Insufficient body length";
        long long v16 = v13;
        uint32_t v17 = 12;
        goto LABEL_26;
      }
LABEL_27:

LABEL_28:

      goto LABEL_29;
    }
    [v10 getBytes:&v33 length:2];
    objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    unsigned __int16 v18 = v33;
    goto LABEL_8;
  }
  long long v22 = (void *)MEMORY[0x1D944E080]();
  id v23 = a1;
  long long v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    long long v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v25;
    _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
  }
LABEL_29:

  return 0;
}

+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unsigned __int16 v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = a1;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    long long v13 = @"No";
    int v16 = 138543874;
    uint32_t v17 = v12;
    __int16 v18 = 2112;
    if (v5) {
      long long v13 = @"Yes";
    }
    id v19 = v8;
    __int16 v20 = 2112;
    int v21 = v13;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Update Response: %@ withHeader: %@", (uint8_t *)&v16, 0x20u);
  }
  char v14 = [v10 _parseEmptyResponse:v8 expectedTID:v6 withHeader:v5];

  return v14;
}

+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unsigned __int16 v9 = v8;
  __int16 v23 = 0;
  unsigned __int8 v22 = 0;
  if (v5)
  {
    uint64_t v10 = _extractResponseHeaderFields(v8, (unsigned char *)&v23 + 1, (uint64_t)&v23, (uint64_t)&v22);
    if (!v10)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v17 = a1;
      char v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v25 = v18;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_14;
    }
    v11 = (void *)v10;
    if (v23 != v6)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v19 = a1;
      char v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v25 = v20;
        __int16 v26 = 1024;
        int v27 = v23;
        __int16 v28 = 1024;
        int v29 = v6;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);
      }
      goto LABEL_14;
    }
    if (v22)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = a1;
      char v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v25 = v15;
        __int16 v26 = 1024;
        int v27 = v22;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Status: 0x%02x", buf, 0x12u);
      }
LABEL_14:

      BOOL v16 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v11 = 0;
  }
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7
{
  BOOL v7 = a5;
  int v8 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __int16 v35 = 0;
  unsigned __int8 v34 = 0;
  unsigned __int16 v11 = [v10 length];
  unsigned __int16 v33 = v11;
  if (!v7)
  {
    unsigned __int16 v20 = v11;
LABEL_8:
    if ([v10 length] == v20)
    {
      id v21 = v10;
      [v21 bytes];
      [v21 length];
      int v22 = TLV8GetOrCopyCoalesced();
      if (v22) {
        int v23 = v22;
      }
      else {
        int v23 = -6743;
      }
    }
    else
    {
      int v23 = -6742;
    }
    long long v24 = (void *)MEMORY[0x1D944E080]();
    id v25 = a1;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      __int16 v38 = 2048;
      *(void *)uint64_t v39 = v23;
      _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Auth response failed status: %ld", buf, 0x16u);
    }

    return 0;
  }
  id v12 = _extractResponseHeaderFields(v10, (unsigned char *)&v35 + 1, (uint64_t)&v35, (uint64_t)&v34);

  if (v12)
  {
    if (v35 != v8)
    {
      id v13 = (void *)MEMORY[0x1D944E080]();
      id v14 = a1;
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v37 = v16;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v35;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v8;
        id v17 = "%{public}@Unexpected TID: 0x%02x expected: 0x%02x";
        __int16 v18 = v15;
        uint32_t v19 = 24;
        goto LABEL_20;
      }
LABEL_21:

      return 0;
    }
    if (v34)
    {
      id v13 = (void *)MEMORY[0x1D944E080]();
      id v14 = a1;
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v16;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v34;
        id v17 = "%{public}@Unexpected Status: 0x%02x";
        __int16 v18 = v15;
        uint32_t v19 = 18;
LABEL_20:
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if ((unint64_t)[v12 length] < 2)
    {
      id v13 = (void *)MEMORY[0x1D944E080]();
      id v14 = a1;
      long long v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      id v17 = "%{public}@Insufficient body length";
      __int16 v18 = v15;
      uint32_t v19 = 12;
      goto LABEL_20;
    }
    [v12 getBytes:&v33 length:2];
    objc_msgSend(v12, "subdataWithRange:", 2, objc_msgSend(v12, "length") - 2);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    unsigned __int16 v20 = v33;
    goto LABEL_8;
  }
  __int16 v28 = (void *)MEMORY[0x1D944E080]();
  id v29 = a1;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    long long v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v31;
    _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
  }
  return 0;
}

+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5
{
  unint64_t v16 = a3;
  int v6 = (void *)MEMORY[0x1E4F1CA58];
  id v7 = a4;
  int v8 = [v6 dataWithCapacity:5];
  char v15 = 0;
  [v8 appendBytes:&v15 length:1];
  [v8 appendBytes:&v16 length:1];
  unsigned __int16 v9 = +[HAPBTLETransactionIdentifier randomTransactionIdentifier];
  char v10 = [v9 unsignedCharValue];

  char v14 = v10;
  [v8 appendBytes:&v14 length:1];
  if (a5) {
    *a5 = v14;
  }
  __int16 v11 = [v7 unsignedShortValue];

  __int16 v13 = v11;
  [v8 appendBytes:&v13 length:2];

  return v8;
}

+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  unsigned __int16 v10 = [v9 length];
  __int16 v11 = v10 / 0xFFu;
  __int16 v12 = v10 % 0xFFu;
  if (v10 % 0xFFu) {
    LOBYTE(v11) = v11 + 1;
  }
  unsigned int v13 = v11;
  __int16 v44 = v10 + 2 * v11;
  id v42 = v8;
  char v14 = a5;
  char v15 = v9;
  v41 = +[HAPProtocolMessages constructRequestHeaderFor:17 instanceID:v8 outTID:v14];
  [v41 appendBytes:&v44 length:2];
  TLV8BufferInit();
  if (v13)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 255 * (v13 - 1);
    uint64_t v18 = 255 * v13;
    __int16 v43 = v12;
    while (1)
    {
      if (v12) {
        BOOL v19 = v17 == v16;
      }
      else {
        BOOL v19 = 0;
      }
      if (v19) {
        unsigned __int8 v20 = v12;
      }
      else {
        unsigned __int8 v20 = -1;
      }
      int v21 = v20;
      int v22 = (void *)MEMORY[0x1D944E080](objc_msgSend(v15, "getBytes:range:", v49, v16, v20));
      id v23 = a1;
      long long v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        uint64_t v25 = v17;
        uint64_t v26 = v18;
        id v27 = a1;
        v29 = __int16 v28 = v15;
        *(_DWORD *)buf = 138543618;
        int v46 = v29;
        __int16 v47 = 1024;
        int v48 = v21;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Adding token TLV length: %u", buf, 0x12u);

        char v15 = v28;
        a1 = v27;
        uint64_t v18 = v26;
        uint64_t v17 = v25;
        __int16 v12 = v43;
      }

      int v30 = TLV8BufferAppend();
      if (v30) {
        break;
      }
      v16 += 255;
      if (v18 == v16) {
        goto LABEL_15;
      }
    }
    int v34 = v30;
    uint64_t v35 = TLV8BufferFree();
    id v36 = (void *)MEMORY[0x1D944E080](v35);
    id v37 = v23;
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v46 = v39;
      __int16 v47 = 1024;
      int v48 = v34;
      _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct token update request status: %d", buf, 0x12u);
    }
    id v32 = 0;
    long long v31 = v41;
    unsigned __int16 v33 = v42;
  }
  else
  {
LABEL_15:
    long long v31 = v41;
    objc_msgSend(v41, "appendBytes:length:", v50);
    TLV8BufferFree();
    id v32 = v41;
    unsigned __int16 v33 = v42;
  }

  return v32;
}

+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  id v7 = a4;
  id v8 = +[HAPProtocolMessages constructRequestHeaderFor:18 instanceID:a3 outTID:a5];
  __int16 v11 = 18;
  [v8 appendBytes:&v11 length:2];
  TLV8BufferInit();
  [v7 getUUIDBytes:v12];

  if (TLV8BufferAppend())
  {
    TLV8BufferFree();
    id v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "appendBytes:length:", v13);
    TLV8BufferFree();
    id v9 = v8;
  }

  return v9;
}

+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:18 instanceID:a3 outTID:a4];
}

+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:16 instanceID:a3 outTID:a4];
}

@end