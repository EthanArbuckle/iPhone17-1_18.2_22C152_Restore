@interface HMDNetworkRouterAccessViolation
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)clientIdentifier;
- (HAPTLVUnsignedNumberValue)lastResetTimestamp;
- (HAPTLVUnsignedNumberValue)lastViolationTimestamp;
- (HMDNetworkRouterAccessViolation)init;
- (HMDNetworkRouterAccessViolation)initWithClientIdentifier:(id)a3 lastViolationTimestamp:(id)a4 lastResetTimestamp:(id)a5;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setLastResetTimestamp:(id)a3;
- (void)setLastViolationTimestamp:(id)a3;
@end

@implementation HMDNetworkRouterAccessViolation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetTimestamp, 0);
  objc_storeStrong((id *)&self->_lastViolationTimestamp, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setLastResetTimestamp:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)lastResetTimestamp
{
  return self->_lastResetTimestamp;
}

- (void)setLastViolationTimestamp:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)lastViolationTimestamp
{
  return self->_lastViolationTimestamp;
}

- (void)setClientIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];
  v5 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];
  v6 = [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];
  v7 = [v3 stringWithFormat:@"<HMDNetworkRouterAccessViolation clientIdentifier=%@, lastViolationTimestamp=%@, lastResetTimestamp=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HMDNetworkRouterAccessViolation *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];
      v9 = [(HMDNetworkRouterAccessViolation *)v7 clientIdentifier];
      if (v8 != v9)
      {
        v3 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];
        v4 = [(HMDNetworkRouterAccessViolation *)v7 clientIdentifier];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];
      v12 = [(HMDNetworkRouterAccessViolation *)v7 lastViolationTimestamp];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];
        v26 = [(HMDNetworkRouterAccessViolation *)v7 lastViolationTimestamp];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];
      uint64_t v15 = [(HMDNetworkRouterAccessViolation *)v7 lastResetTimestamp];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];
        v17 = v23 = v3;
        [(HMDNetworkRouterAccessViolation *)v7 lastResetTimestamp];
        v22 = v4;
        v18 = v9;
        v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterAccessViolation allocWithZone:a3];
  v5 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];
  v6 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];
  v7 = [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];
  v8 = [(HMDNetworkRouterAccessViolation *)v4 initWithClientIdentifier:v5 lastViolationTimestamp:v6 lastResetTimestamp:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];

  if (v5)
  {
    v6 = [(HMDNetworkRouterAccessViolation *)self clientIdentifier];
    id v21 = 0;
    v7 = [v6 serializeWithError:&v21];
    id v8 = v21;

    if (v8) {
      goto LABEL_15;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend())
    {
LABEL_8:

LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
LABEL_17:
        uint64_t v15 = 0;
        *a3 = v12;
        goto LABEL_21;
      }
      id v8 = 0;
LABEL_18:
      uint64_t v15 = 0;
      goto LABEL_21;
    }
  }
  char v10 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];

  if (v10)
  {
    v11 = [(HMDNetworkRouterAccessViolation *)self lastViolationTimestamp];
    id v20 = 0;
    v7 = [v11 serializeWithError:&v20];
    id v8 = v20;

    if (v8) {
      goto LABEL_15;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_8;
    }
  }
  v13 = [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];

  if (v13)
  {
    v14 = [(HMDNetworkRouterAccessViolation *)self lastResetTimestamp];
    id v19 = 0;
    v7 = [v14 serializeWithError:&v19];
    id v8 = v19;

    if (v8)
    {
LABEL_15:

      if (a3)
      {
        id v12 = v8;
        id v8 = v12;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    id v16 = v7;
    [v16 bytes];
    [v16 length];
    int v17 = TLV8BufferAppend();

    if (v17) {
      goto LABEL_9;
    }
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v22);
  id v8 = 0;
LABEL_21:
  TLV8BufferFree();

  return v15;
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
  if (!v9)
  {
    v11 = 0;
    id v12 = 0;
    v13 = 0;
LABEL_26:
    -[HMDNetworkRouterAccessViolation setClientIdentifier:](self, "setClientIdentifier:", v13, v22);
    [(HMDNetworkRouterAccessViolation *)self setLastViolationTimestamp:v12];
    [(HMDNetworkRouterAccessViolation *)self setLastResetTimestamp:v11];
    id v10 = 0;
    BOOL v19 = 1;
    goto LABEL_30;
  }
  long long v22 = self;
  id v23 = v7;
  id v10 = 0;
  v11 = 0;
  id v12 = 0;
  v13 = 0;
  uint64_t v14 = v8 + v9;
  while (1)
  {
    char v31 = 0;
    long long v29 = 0;
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      id v7 = v23;
      if (a4)
      {
        HMErrorFromOSStatus();
        BOOL v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v19 = 0;
      }
      goto LABEL_30;
    }
    if (!v30) {
      break;
    }
    switch(v31)
    {
      case 3:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v24 = v10;
        id v16 = &v24;
        [MEMORY[0x1E4F5BE68] parsedFromData:v15 error:&v24];
        v11 = int v17 = v11;
        goto LABEL_14;
      case 2:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v25 = v10;
        id v16 = &v25;
        [MEMORY[0x1E4F5BE68] parsedFromData:v15 error:&v25];
        id v12 = v17 = v12;
        goto LABEL_14;
      case 1:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v26 = v10;
        id v16 = &v26;
        [MEMORY[0x1E4F5BE68] parsedFromData:v15 error:&v26];
        v13 = int v17 = v13;
LABEL_14:
        id v18 = *v16;

        id v10 = v18;
        break;
    }
    if (v29) {
      free(v29);
    }
    if (v27 == v14)
    {
      if (v10) {
        goto LABEL_19;
      }
LABEL_25:
      self = v22;
      id v7 = v23;
      goto LABEL_26;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

  id v10 = (id)v20;
  if (!v20) {
    goto LABEL_25;
  }
LABEL_19:
  if (a4)
  {
    id v10 = v10;
    BOOL v19 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v19 = 0;
  }
  id v7 = v23;
LABEL_30:

  return v19;
}

- (HMDNetworkRouterAccessViolation)initWithClientIdentifier:(id)a3 lastViolationTimestamp:(id)a4 lastResetTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterAccessViolation;
  id v12 = [(HMDNetworkRouterAccessViolation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientIdentifier, a3);
    objc_storeStrong((id *)&v13->_lastViolationTimestamp, a4);
    objc_storeStrong((id *)&v13->_lastResetTimestamp, a5);
  }

  return v13;
}

- (HMDNetworkRouterAccessViolation)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAccessViolation;
  return [(HMDNetworkRouterAccessViolation *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterAccessViolation);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterAccessViolation *)v6 parseFromData:v5 error:&v10];
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