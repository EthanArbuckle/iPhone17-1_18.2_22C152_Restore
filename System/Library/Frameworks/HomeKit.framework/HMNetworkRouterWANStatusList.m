@interface HMNetworkRouterWANStatusList
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMNetworkRouterWANStatusList)init;
- (HMNetworkRouterWANStatusList)initWithStatuses:(id)a3;
- (NSMutableArray)statuses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializeWithError:(id *)a3;
- (void)setStatuses:(id)a3;
@end

@implementation HMNetworkRouterWANStatusList

- (void).cxx_destruct
{
}

- (void)setStatuses:(id)a3
{
}

- (NSMutableArray)statuses
{
  return self->_statuses;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMNetworkRouterWANStatusList *)self statuses];
  v4 = [v2 stringWithFormat:@"<HMNetworkRouterWANStatusList statuses=%@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMNetworkRouterWANStatusList *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMNetworkRouterWANStatusList *)self statuses];
      v7 = [(HMNetworkRouterWANStatusList *)v5 statuses];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HMNetworkRouterWANStatusList *)self statuses];
        v9 = [(HMNetworkRouterWANStatusList *)v5 statuses];
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
  v4 = +[HMNetworkRouterWANStatusList allocWithZone:a3];
  v5 = [(HMNetworkRouterWANStatusList *)self statuses];
  v6 = [(HMNetworkRouterWANStatusList *)v4 initWithStatuses:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  TLV8BufferInit();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(HMNetworkRouterWANStatusList *)self statuses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (v8)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12)
        {
          uint64_t v16 = v12;
LABEL_16:

          if (a3)
          {
            _HMErrorFromOSStatus(v16);
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            goto LABEL_18;
          }
          v18 = 0;
LABEL_20:
          v17 = 0;
          goto LABEL_21;
        }
      }
      id v21 = 0;
      v13 = [v11 serializeWithError:&v21];
      id v14 = v21;
      if (v14)
      {
        v18 = v14;

        if (a3)
        {
          id v19 = v18;
          v18 = v19;
LABEL_18:
          v17 = 0;
          *a3 = v19;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      id v15 = v13;
      [v15 bytes];
      [v15 length];
      uint64_t v16 = TLV8BufferAppend();

      if (v16) {
        goto LABEL_16;
      }
      char v8 = 1;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_12:

  v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v27);
  v18 = 0;
LABEL_21:
  TLV8BufferFree();

  return v17;
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
      char v27 = 0;
      long long v25 = 0;
      uint64_t v26 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      uint64_t Next = TLV8GetOrCopyCoalesced();
      if (Next) {
        break;
      }
      if (!v26)
      {
        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        v11 = (void *)v18;
LABEL_19:
        if (!v11) {
          goto LABEL_23;
        }
        if (a4)
        {
          id v17 = v11;
          v11 = v17;
          goto LABEL_22;
        }
        goto LABEL_27;
      }
      if (v27 == 1)
      {
        id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v22 = v11;
        id v15 = +[HMNetworkRouterWANStatus parsedFromData:v14 error:&v22];
        id v16 = v22;

        if (!v16) {
          [v10 addObject:v15];
        }

        v11 = v16;
      }
      if (v25) {
        free(v25);
      }
      if (v23 == v12) {
        goto LABEL_19;
      }
    }
    if (a4)
    {
      _HMErrorFromOSStatus(Next);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v19 = 0;
      *a4 = v17;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v19 = 0;
  }
  else
  {
LABEL_23:
    if ([v10 count]) {
      v20 = v10;
    }
    else {
      v20 = 0;
    }
    [(HMNetworkRouterWANStatusList *)self setStatuses:v20];
    v11 = 0;
    BOOL v19 = 1;
  }
LABEL_28:

  return v19;
}

- (HMNetworkRouterWANStatusList)initWithStatuses:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMNetworkRouterWANStatusList;
  id v6 = [(HMNetworkRouterWANStatusList *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statuses, a3);
  }

  return v7;
}

- (HMNetworkRouterWANStatusList)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMNetworkRouterWANStatusList;
  return [(HMNetworkRouterWANStatusList *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMNetworkRouterWANStatusList);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMNetworkRouterWANStatusList *)v6 parseFromData:v5 error:&v10];
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