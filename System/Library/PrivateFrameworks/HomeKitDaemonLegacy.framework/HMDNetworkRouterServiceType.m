@interface HMDNetworkRouterServiceType
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterServiceType)init;
- (HMDNetworkRouterServiceType)initWithName:(id)a3;
- (NSString)description;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setName:(id)a3;
@end

@implementation HMDNetworkRouterServiceType

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HMDNetworkRouterServiceType *)self name];
  v4 = [v2 stringWithFormat:@"<HMDNetworkRouterServiceType name=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterServiceType *)a3;
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
      v6 = [(HMDNetworkRouterServiceType *)self name];
      v7 = [(HMDNetworkRouterServiceType *)v5 name];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HMDNetworkRouterServiceType *)self name];
        v9 = [(HMDNetworkRouterServiceType *)v5 name];
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
  v4 = +[HMDNetworkRouterServiceType allocWithZone:a3];
  v5 = [(HMDNetworkRouterServiceType *)self name];
  v6 = [(HMDNetworkRouterServiceType *)v4 initWithName:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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
  long long v23 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterServiceType *)self name];

  if (!v5) {
    goto LABEL_9;
  }
  v6 = [(HMDNetworkRouterServiceType *)self name];
  id v14 = 0;
  v7 = [v6 serializeWithError:&v14];
  id v8 = v14;

  if (!v8)
  {
    id v10 = v7;
    [v10 bytes];
    [v10 length];
    int v11 = TLV8BufferAppend();

    if (v11)
    {
      if (a3)
      {
        HMErrorFromOSStatus();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_8;
      }
      id v8 = 0;
      goto LABEL_11;
    }
LABEL_9:
    v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15);
    id v8 = 0;
    goto LABEL_12;
  }

  if (a3)
  {
    id v9 = v8;
    id v8 = v9;
LABEL_8:
    v12 = 0;
    *a3 = v9;
    goto LABEL_12;
  }
LABEL_11:
  v12 = 0;
LABEL_12:
  TLV8BufferFree();

  return v12;
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
    id v10 = 0;
    goto LABEL_23;
  }
  long long v20 = self;
  id v10 = 0;
  int v11 = 0;
  uint64_t v12 = v8 + v9;
  do
  {
    char v26 = 0;
    long long v24 = 0;
    uint64_t v25 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_20:
      BOOL v17 = 0;
      goto LABEL_24;
    }
    if (!v25)
    {
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      int v11 = (void *)v18;
      if (!v18) {
        goto LABEL_22;
      }
LABEL_14:
      if (a4)
      {
        id v16 = v11;
        int v11 = v16;
LABEL_19:
        BOOL v17 = 0;
        *a4 = v16;
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    if (v26 == 1)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v21 = v11;
      uint64_t v14 = [NSString parsedFromData:v13 error:&v21];
      id v15 = v21;

      int v11 = v15;
      id v10 = (void *)v14;
    }
    if (v24) {
      free(v24);
    }
  }
  while (v22 != v12);
  if (v11) {
    goto LABEL_14;
  }
LABEL_22:
  self = v20;
LABEL_23:
  [(HMDNetworkRouterServiceType *)self setName:v10];
  int v11 = 0;
  BOOL v17 = 1;
LABEL_24:

  return v17;
}

- (HMDNetworkRouterServiceType)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterServiceType;
  id v6 = [(HMDNetworkRouterServiceType *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (HMDNetworkRouterServiceType)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterServiceType;
  return [(HMDNetworkRouterServiceType *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterServiceType);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterServiceType *)v6 parseFromData:v5 error:&v10];
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