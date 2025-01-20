@interface HMDNetworkRouterCredential
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterCredential)init;
- (HMDNetworkRouterCredential)initWithMacAddress:(id)a3 psk:(id)a4;
- (NSData)macAddress;
- (NSData)psk;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setMacAddress:(id)a3;
- (void)setPsk:(id)a3;
@end

@implementation HMDNetworkRouterCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

- (void)setPsk:(id)a3
{
}

- (NSData)psk
{
  return self->_psk;
}

- (void)setMacAddress:(id)a3
{
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterCredential *)self macAddress];
  v5 = [(HMDNetworkRouterCredential *)self psk];
  v6 = [v3 stringWithFormat:@"<HMDNetworkRouterCredential macAddress=%@, psk=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterCredential *)a3;
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
      v7 = [(HMDNetworkRouterCredential *)self macAddress];
      v8 = [(HMDNetworkRouterCredential *)v6 macAddress];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterCredential *)self macAddress];
        v3 = [(HMDNetworkRouterCredential *)v6 macAddress];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDNetworkRouterCredential *)self psk];
      v12 = [(HMDNetworkRouterCredential *)v6 psk];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDNetworkRouterCredential *)self psk];
        v14 = [(HMDNetworkRouterCredential *)v6 psk];
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
  v4 = +[HMDNetworkRouterCredential allocWithZone:a3];
  v5 = [(HMDNetworkRouterCredential *)self macAddress];
  v6 = [(HMDNetworkRouterCredential *)self psk];
  v7 = [(HMDNetworkRouterCredential *)v4 initWithMacAddress:v5 psk:v6];

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
  v5 = [(HMDNetworkRouterCredential *)self macAddress];

  if (v5)
  {
    v6 = [(HMDNetworkRouterCredential *)self macAddress];
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
  v11 = [(HMDNetworkRouterCredential *)self psk];

  if (!v11)
  {
LABEL_12:
    v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v20);
    id v8 = 0;
    goto LABEL_15;
  }
  v12 = [(HMDNetworkRouterCredential *)self psk];
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
LABEL_24:
    -[HMDNetworkRouterCredential setMacAddress:](self, "setMacAddress:", v11, v21);
    [(HMDNetworkRouterCredential *)self setPsk:v10];
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
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v22 = v12;
      int v15 = &v22;
      [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v22];
      int v10 = v16 = v10;
      goto LABEL_12;
    }
    if (v28 == 1)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v23 = v12;
      int v15 = &v23;
      [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v23];
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
  uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

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

- (HMDNetworkRouterCredential)initWithMacAddress:(id)a3 psk:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterCredential;
  uint64_t v9 = [(HMDNetworkRouterCredential *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_macAddress, a3);
    objc_storeStrong((id *)&v10->_psk, a4);
  }

  return v10;
}

- (HMDNetworkRouterCredential)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterCredential;
  return [(HMDNetworkRouterCredential *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterCredential);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterCredential *)v6 parseFromData:v5 error:&v10];
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