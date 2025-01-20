@interface HMDNetworkRouterClientControlOperation
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterClientConfiguration)configuration;
- (HMDNetworkRouterClientControlOperation)init;
- (HMDNetworkRouterClientControlOperation)initWithOperation:(id)a3 configuration:(id)a4;
- (HMDNetworkRouterControlOperation)operation;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setConfiguration:(id)a3;
- (void)setOperation:(id)a3;
@end

@implementation HMDNetworkRouterClientControlOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

- (void)setConfiguration:(id)a3
{
}

- (HMDNetworkRouterClientConfiguration)configuration
{
  return self->_configuration;
}

- (void)setOperation:(id)a3
{
}

- (HMDNetworkRouterControlOperation)operation
{
  return self->_operation;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterClientControlOperation *)self operation];
  v5 = [(HMDNetworkRouterClientControlOperation *)self configuration];
  v6 = [v3 stringWithFormat:@"<HMDNetworkRouterClientControlOperation operation=%@, configuration=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterClientControlOperation *)a3;
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
      v7 = [(HMDNetworkRouterClientControlOperation *)self operation];
      v8 = [(HMDNetworkRouterClientControlOperation *)v6 operation];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterClientControlOperation *)self operation];
        v3 = [(HMDNetworkRouterClientControlOperation *)v6 operation];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDNetworkRouterClientControlOperation *)self configuration];
      v12 = [(HMDNetworkRouterClientControlOperation *)v6 configuration];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterClientControlOperation *)self configuration];
        v14 = [(HMDNetworkRouterClientControlOperation *)v6 configuration];
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
  v4 = +[HMDNetworkRouterClientControlOperation allocWithZone:a3];
  v5 = [(HMDNetworkRouterClientControlOperation *)self operation];
  v6 = [(HMDNetworkRouterClientControlOperation *)self configuration];
  v7 = [(HMDNetworkRouterClientControlOperation *)v4 initWithOperation:v5 configuration:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterClientControlOperation *)self operation];

  if (v5)
  {
    v6 = [(HMDNetworkRouterClientControlOperation *)self operation];
    id v19 = 0;
    v7 = [v6 serializeWithError:&v19];
    id v8 = v19;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    int v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_11;
      }
      id v8 = 0;
      goto LABEL_14;
    }
  }
  v11 = [(HMDNetworkRouterClientControlOperation *)self configuration];

  if (!v11)
  {
LABEL_12:
    v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v20);
    id v8 = 0;
    goto LABEL_15;
  }
  v12 = [(HMDNetworkRouterClientControlOperation *)self configuration];
  id v18 = 0;
  v7 = [v12 serializeWithError:&v18];
  id v8 = v18;

  if (!v8)
  {
    id v14 = v7;
    [v14 bytes];
    [v14 length];
    int v15 = TLV8BufferAppend();

    if (v15) {
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
    v16 = 0;
    *a3 = v13;
    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
LABEL_15:
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
  if (!v9)
  {
    int v10 = 0;
    v11 = 0;
    goto LABEL_26;
  }
  long long v22 = self;
  int v10 = 0;
  v11 = 0;
  v12 = 0;
  uint64_t v13 = v8 + v9;
  do
  {
    char v29 = 0;
    long long v27 = 0;
    uint64_t v28 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      BOOL v19 = 0;
      goto LABEL_27;
    }
    if (!v28)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      v12 = (void *)v20;
      if (!v20) {
        goto LABEL_25;
      }
LABEL_17:
      if (a4)
      {
        id v18 = v12;
        v12 = v18;
LABEL_22:
        BOOL v19 = 0;
        *a4 = v18;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v29 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v23 = v12;
      int v15 = &v23;
      +[HMDNetworkRouterClientConfiguration parsedFromData:v14 error:&v23];
      int v10 = v16 = v10;
    }
    else
    {
      if (v29 != 1) {
        goto LABEL_13;
      }
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v24 = v12;
      int v15 = &v24;
      +[HMDNetworkRouterControlOperation parsedFromData:v14 error:&v24];
      v11 = v16 = v11;
    }
    id v17 = *v15;

    v12 = v17;
LABEL_13:
    if (v27) {
      free(v27);
    }
  }
  while (v25 != v13);
  if (v12) {
    goto LABEL_17;
  }
LABEL_25:
  self = v22;
LABEL_26:
  -[HMDNetworkRouterClientControlOperation setOperation:](self, "setOperation:", v11, v22);
  [(HMDNetworkRouterClientControlOperation *)self setConfiguration:v10];
  v12 = 0;
  BOOL v19 = 1;
LABEL_27:

  return v19;
}

- (HMDNetworkRouterClientControlOperation)initWithOperation:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterClientControlOperation;
  uint64_t v9 = [(HMDNetworkRouterClientControlOperation *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operation, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (HMDNetworkRouterClientControlOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientControlOperation;
  return [(HMDNetworkRouterClientControlOperation *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterClientControlOperation);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterClientControlOperation *)v6 parseFromData:v5 error:&v10];
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