@interface HMNetworkRouterWANStatus
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)identifier;
- (HAPTLVUnsignedNumberValue)status;
- (HMNetworkRouterWANStatus)init;
- (HMNetworkRouterWANStatus)initWithIdentifier:(id)a3 status:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation HMNetworkRouterWANStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setStatus:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)status
{
  return self->_status;
}

- (void)setIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMNetworkRouterWANStatus *)self identifier];
  v5 = [(HMNetworkRouterWANStatus *)self status];
  v6 = [v3 stringWithFormat:@"<HMNetworkRouterWANStatus identifier=%@, status=%@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMNetworkRouterWANStatus *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HMNetworkRouterWANStatus *)self identifier];
      v8 = [(HMNetworkRouterWANStatus *)v6 identifier];
      if (v7 != v8)
      {
        v9 = [(HMNetworkRouterWANStatus *)self identifier];
        v3 = [(HMNetworkRouterWANStatus *)v6 identifier];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMNetworkRouterWANStatus *)self status];
      v12 = [(HMNetworkRouterWANStatus *)v6 status];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMNetworkRouterWANStatus *)self status];
        v14 = [(HMNetworkRouterWANStatus *)v6 status];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMNetworkRouterWANStatus allocWithZone:a3];
  v5 = [(HMNetworkRouterWANStatus *)self identifier];
  v6 = [(HMNetworkRouterWANStatus *)self status];
  v7 = [(HMNetworkRouterWANStatus *)v4 initWithIdentifier:v5 status:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  TLV8BufferInit();
  v5 = [(HMNetworkRouterWANStatus *)self identifier];

  if (v5)
  {
    v6 = [(HMNetworkRouterWANStatus *)self identifier];
    id v18 = 0;
    v7 = [v6 serializeWithError:&v18];
    id v8 = v18;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        _HMErrorFromOSStatus(v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_11;
      }
      id v8 = 0;
      goto LABEL_14;
    }
  }
  v11 = [(HMNetworkRouterWANStatus *)self status];

  if (!v11)
  {
LABEL_12:
    v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v19);
    id v8 = 0;
    goto LABEL_15;
  }
  v12 = [(HMNetworkRouterWANStatus *)self status];
  id v17 = 0;
  v7 = [v12 serializeWithError:&v17];
  id v8 = v17;

  if (!v8)
  {
    id v14 = v7;
    [v14 bytes];
    [v14 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_6:

  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_11:
    v15 = 0;
    *a3 = v13;
    goto LABEL_15;
  }
LABEL_14:
  v15 = 0;
LABEL_15:
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
    uint64_t v10 = 0;
    v11 = 0;
    goto LABEL_26;
  }
  long long v25 = self;
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
  uint64_t v13 = v8 + v9;
  do
  {
    char v32 = 0;
    long long v30 = 0;
    uint64_t v31 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t Next = TLV8GetNext();
    if (Next || (uint64_t Next = TLV8GetOrCopyCoalesced(), Next))
    {
      if (a4)
      {
        _HMErrorFromOSStatus(Next);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      BOOL v22 = 0;
      goto LABEL_27;
    }
    if (!v31)
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      v12 = (void *)v23;
      if (!v23) {
        goto LABEL_25;
      }
LABEL_17:
      if (a4)
      {
        id v21 = v12;
        v12 = v21;
LABEL_22:
        BOOL v22 = 0;
        *a4 = v21;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v32 == 2)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id HAPTLVUnsignedNumberValueClass = getHAPTLVUnsignedNumberValueClass();
      long long v26 = v12;
      id v17 = &v26;
      [HAPTLVUnsignedNumberValueClass parsedFromData:v15 error:&v26];
      uint64_t v10 = v18 = v10;
    }
    else
    {
      if (v32 != 1) {
        goto LABEL_13;
      }
      v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v16 = getHAPTLVUnsignedNumberValueClass();
      long long v27 = v12;
      id v17 = &v27;
      [v16 parsedFromData:v15 error:&v27];
      v11 = id v18 = v11;
    }
    id v20 = *v17;

    v12 = v20;
LABEL_13:
    if (v30) {
      free(v30);
    }
  }
  while (v28 != v13);
  if (v12) {
    goto LABEL_17;
  }
LABEL_25:
  self = v25;
LABEL_26:
  -[HMNetworkRouterWANStatus setIdentifier:](self, "setIdentifier:", v11, v25);
  [(HMNetworkRouterWANStatus *)self setStatus:v10];
  v12 = 0;
  BOOL v22 = 1;
LABEL_27:

  return v22;
}

- (HMNetworkRouterWANStatus)initWithIdentifier:(id)a3 status:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMNetworkRouterWANStatus;
  uint64_t v9 = [(HMNetworkRouterWANStatus *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_status, a4);
  }

  return v10;
}

- (HMNetworkRouterWANStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMNetworkRouterWANStatus;
  return [(HMNetworkRouterWANStatus *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMNetworkRouterWANStatus);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMNetworkRouterWANStatus *)v6 parseFromData:v5 error:&v10];
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