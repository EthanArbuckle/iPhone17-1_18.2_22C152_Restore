@interface HMDNetworkRouterICMPTypeList
+ (id)parsedFromData:(id)a3 error:(id *)a4;
+ (id)typeListFromICMPTypes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterICMPTypeList)init;
- (HMDNetworkRouterICMPTypeList)initWithTypes:(id)a3;
- (NSMutableArray)types;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setTypes:(id)a3;
@end

@implementation HMDNetworkRouterICMPTypeList

+ (id)typeListFromICMPTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[HMDNetworkRouterICMPType typeFromICMPType:](HMDNetworkRouterICMPType, "typeFromICMPType:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (!v10)
          {

            v12 = 0;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v12 = [[HMDNetworkRouterICMPTypeList alloc] initWithTypes:v4];
LABEL_12:
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (void)setTypes:(id)a3
{
}

- (NSMutableArray)types
{
  return self->_types;
}

- (NSString)description
{
  v2 = NSString;
  id v3 = [(HMDNetworkRouterICMPTypeList *)self types];
  v4 = [v2 stringWithFormat:@"<HMDNetworkRouterICMPTypeList types=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterICMPTypeList *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HMDNetworkRouterICMPTypeList *)self types];
      uint64_t v7 = [(HMDNetworkRouterICMPTypeList *)v5 types];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v8 = [(HMDNetworkRouterICMPTypeList *)self types];
        v9 = [(HMDNetworkRouterICMPTypeList *)v5 types];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterICMPTypeList allocWithZone:a3];
  id v5 = [(HMDNetworkRouterICMPTypeList *)self types];
  uint64_t v6 = [(HMDNetworkRouterICMPTypeList *)v4 initWithTypes:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  TLV8BufferInit();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(HMDNetworkRouterICMPTypeList *)self types];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if ((v8 & 1) != 0 && TLV8BufferAppend())
      {
LABEL_15:

        if (a3)
        {
          HMErrorFromOSStatus();
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          long long v17 = 0;
          goto LABEL_17;
        }
        long long v17 = 0;
LABEL_19:
        long long v16 = 0;
        goto LABEL_20;
      }
      id v20 = 0;
      v12 = [v11 serializeWithError:&v20];
      id v13 = v20;
      if (v13)
      {
        long long v17 = v13;

        if (a3)
        {
          id v18 = v17;
          long long v17 = v18;
LABEL_17:
          long long v16 = 0;
          *a3 = v18;
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      id v14 = v12;
      [v14 bytes];
      [v14 length];
      int v15 = TLV8BufferAppend();

      if (v15) {
        goto LABEL_15;
      }
      char v8 = 1;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_12:

  long long v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v26);
  long long v17 = 0;
LABEL_20:
  TLV8BufferFree();

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];
  char v10 = [MEMORY[0x1E4F1CA48] array];
  if (v9)
  {
    v11 = 0;
    uint64_t v12 = v8 + v9;
    while (1)
    {
      char v26 = 0;
      long long v24 = 0;
      uint64_t v25 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced()) {
        break;
      }
      if (!v25)
      {
        uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        v11 = (void *)v17;
LABEL_19:
        if (!v11) {
          goto LABEL_23;
        }
        if (a4)
        {
          id v16 = v11;
          v11 = v16;
          goto LABEL_22;
        }
        goto LABEL_27;
      }
      if (v26 == 1)
      {
        id v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v21 = v11;
        id v14 = +[HMDNetworkRouterICMPType parsedFromData:v13 error:&v21];
        id v15 = v21;

        if (!v15) {
          [v10 addObject:v14];
        }

        v11 = v15;
      }
      if (v24) {
        free(v24);
      }
      if (v22 == v12) {
        goto LABEL_19;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v18 = 0;
      *a4 = v16;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v18 = 0;
  }
  else
  {
LABEL_23:
    if ([v10 count]) {
      uint64_t v19 = v10;
    }
    else {
      uint64_t v19 = 0;
    }
    [(HMDNetworkRouterICMPTypeList *)self setTypes:v19];
    v11 = 0;
    BOOL v18 = 1;
  }
LABEL_28:

  return v18;
}

- (HMDNetworkRouterICMPTypeList)initWithTypes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterICMPTypeList;
  id v6 = [(HMDNetworkRouterICMPTypeList *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_types, a3);
  }

  return v7;
}

- (HMDNetworkRouterICMPTypeList)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterICMPTypeList;
  return [(HMDNetworkRouterICMPTypeList *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterICMPTypeList);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterICMPTypeList *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      id v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end