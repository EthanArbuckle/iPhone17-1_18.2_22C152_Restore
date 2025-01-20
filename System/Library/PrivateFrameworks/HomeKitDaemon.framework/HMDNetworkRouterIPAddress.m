@interface HMDNetworkRouterIPAddress
+ (id)ipAddressFromNetAddress:(id)a3 error:(id *)a4;
+ (id)ipAddressFromRuleAddress:(id)a3 allowWildcard:(BOOL)a4;
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterIPAddress)init;
- (HMDNetworkRouterIPAddress)initWithV4:(id)a3 v6:(id)a4;
- (NSData)v4;
- (NSData)v6;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setV4:(id)a3;
- (void)setV6:(id)a3;
@end

@implementation HMDNetworkRouterIPAddress

+ (id)ipAddressFromRuleAddress:(id)a3 allowWildcard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4
    && (+[HMDNetworkRouterFirewallRuleWAN ipAddressAny],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqual:v7],
        v7,
        v8))
  {
    int v14 = 0;
    v9 = [HMDNetworkRouterIPAddress alloc];
    v10 = [MEMORY[0x263EFF8F8] dataWithBytes:&v14 length:4];
    v11 = [MEMORY[0x263EFF8F8] dataWithBytes:MEMORY[0x263EF88F0] length:16];
    v12 = [(HMDNetworkRouterIPAddress *)v9 initWithV4:v10 v6:v11];
  }
  else
  {
    v12 = [a1 ipAddressFromNetAddress:v6 error:0];
  }

  return v12;
}

+ (id)ipAddressFromNetAddress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 dataUsingEncoding:1];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 addressFamily];
  if (v7 == 2)
  {
    uint64_t v8 = [v6 bytes] + 8;
    v9 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v10 = 16;
    goto LABEL_7;
  }
  if (v7 != 1)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [v6 bytes] + 4;
  v9 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v10 = 4;
LABEL_7:
  v11 = [v9 dataWithBytes:v8 length:v10];
LABEL_8:

  if (v11)
  {
    uint64_t v12 = [v5 addressFamily];
    if (v12 == 2)
    {
      v13 = [HMDNetworkRouterIPAddress alloc];
      int v14 = 0;
      v15 = v11;
      goto LABEL_15;
    }
    if (v12 == 1)
    {
      v13 = [HMDNetworkRouterIPAddress alloc];
      int v14 = v11;
      v15 = 0;
LABEL_15:
      v16 = [(HMDNetworkRouterIPAddress *)v13 initWithV4:v14 v6:v15];
      goto LABEL_17;
    }
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v6, 0);
  objc_storeStrong((id *)&self->_v4, 0);
}

- (void)setV6:(id)a3
{
}

- (NSData)v6
{
  return self->_v6;
}

- (void)setV4:(id)a3
{
}

- (NSData)v4
{
  return self->_v4;
}

- (NSString)description
{
  v3 = NSString;
  BOOL v4 = [(HMDNetworkRouterIPAddress *)self v4];
  id v5 = [(HMDNetworkRouterIPAddress *)self v6];
  id v6 = [v3 stringWithFormat:@"<HMDNetworkRouterIPAddress v4=%@, v6=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMDNetworkRouterIPAddress *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [(HMDNetworkRouterIPAddress *)self v4];
      uint64_t v8 = [(HMDNetworkRouterIPAddress *)v6 v4];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterIPAddress *)self v4];
        v3 = [(HMDNetworkRouterIPAddress *)v6 v4];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDNetworkRouterIPAddress *)self v6];
      uint64_t v12 = [(HMDNetworkRouterIPAddress *)v6 v6];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterIPAddress *)self v6];
        int v14 = [(HMDNetworkRouterIPAddress *)v6 v6];
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
  BOOL v4 = +[HMDNetworkRouterIPAddress allocWithZone:a3];
  id v5 = [(HMDNetworkRouterIPAddress *)self v4];
  id v6 = [(HMDNetworkRouterIPAddress *)self v6];
  uint64_t v7 = [(HMDNetworkRouterIPAddress *)v4 initWithV4:v5 v6:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
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
  id v5 = [(HMDNetworkRouterIPAddress *)self v4];

  if (v5)
  {
    id v6 = [(HMDNetworkRouterIPAddress *)self v4];
    id v19 = 0;
    uint64_t v7 = [v6 serializeWithError:&v19];
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
  v11 = [(HMDNetworkRouterIPAddress *)self v6];

  if (!v11)
  {
LABEL_12:
    v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v20);
    id v8 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = [(HMDNetworkRouterIPAddress *)self v6];
  id v18 = 0;
  uint64_t v7 = [v12 serializeWithError:&v18];
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
LABEL_24:
    -[HMDNetworkRouterIPAddress setV4:](self, "setV4:", v11, v21);
    [(HMDNetworkRouterIPAddress *)self setV6:v10];
    id v12 = 0;
    BOOL v18 = 1;
    goto LABEL_28;
  }
  id v21 = v7;
  int v10 = 0;
  v11 = 0;
  id v12 = 0;
  uint64_t v13 = v8 + v9;
  while (1)
  {
    char v28 = 0;
    long long v26 = 0;
    uint64_t v27 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      id v7 = v21;
      if (a4)
      {
        HMErrorFromOSStatus();
        BOOL v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v18 = 0;
      }
      goto LABEL_28;
    }
    if (!v27) {
      break;
    }
    if (v28 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v22 = v12;
      int v15 = &v22;
      [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v22];
      int v10 = v16 = v10;
      goto LABEL_12;
    }
    if (v28 == 1)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v23 = v12;
      int v15 = &v23;
      [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v23];
      v11 = v16 = v11;
LABEL_12:
      id v17 = *v15;

      id v12 = v17;
    }
    if (v26) {
      free(v26);
    }
    if (v24 == v13)
    {
      if (v12) {
        goto LABEL_17;
      }
LABEL_23:
      id v7 = v21;
      goto LABEL_24;
    }
  }
  uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

  id v12 = (id)v19;
  if (!v19) {
    goto LABEL_23;
  }
LABEL_17:
  if (a4)
  {
    id v12 = v12;
    BOOL v18 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v18 = 0;
  }
  id v7 = v21;
LABEL_28:

  return v18;
}

- (HMDNetworkRouterIPAddress)initWithV4:(id)a3 v6:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterIPAddress;
  uint64_t v9 = [(HMDNetworkRouterIPAddress *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v4, a3);
    objc_storeStrong((id *)&v10->_v6, a4);
  }

  return v10;
}

- (HMDNetworkRouterIPAddress)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterIPAddress;
  return [(HMDNetworkRouterIPAddress *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterIPAddress);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterIPAddress *)v6 parseFromData:v5 error:&v10];
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