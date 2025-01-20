@interface HMDNetworkRouterClientStatus
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVSignedNumberValue)rssi;
- (HAPTLVUnsignedNumberValue)clientIdentifier;
- (HAPTLVUnsignedNumberValue)lanIdentifier;
- (HMDNetworkRouterClientStatus)init;
- (HMDNetworkRouterClientStatus)initWithClientIdentifier:(id)a3 macAddress:(id)a4 ipAddressList:(id)a5 lanIdentifier:(id)a6 name:(id)a7 rssi:(id)a8;
- (HMDNetworkRouterIPAddressList)ipAddressList;
- (NSData)macAddress;
- (NSString)description;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setIpAddressList:(id)a3;
- (void)setLanIdentifier:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setName:(id)a3;
- (void)setRssi:(id)a3;
@end

@implementation HMDNetworkRouterClientStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lanIdentifier, 0);
  objc_storeStrong((id *)&self->_ipAddressList, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setRssi:(id)a3
{
}

- (HAPTLVSignedNumberValue)rssi
{
  return self->_rssi;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setLanIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)lanIdentifier
{
  return self->_lanIdentifier;
}

- (void)setIpAddressList:(id)a3
{
}

- (HMDNetworkRouterIPAddressList)ipAddressList
{
  return self->_ipAddressList;
}

- (void)setMacAddress:(id)a3
{
}

- (NSData)macAddress
{
  return self->_macAddress;
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
  v4 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];
  v5 = [(HMDNetworkRouterClientStatus *)self macAddress];
  v6 = [(HMDNetworkRouterClientStatus *)self ipAddressList];
  v7 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];
  v8 = [(HMDNetworkRouterClientStatus *)self name];
  v9 = [(HMDNetworkRouterClientStatus *)self rssi];
  v10 = [v3 stringWithFormat:@"<HMDNetworkRouterClientStatus clientIdentifier=%@, macAddress=%@, ipAddressList=%@, lanIdentifier=%@, name=%@, rssi=%@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterClientStatus *)a3;
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
      v7 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];
      v8 = [(HMDNetworkRouterClientStatus *)v6 clientIdentifier];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];
        v48 = [(HMDNetworkRouterClientStatus *)v6 clientIdentifier];
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_36;
        }
      }
      v11 = [(HMDNetworkRouterClientStatus *)self macAddress];
      v12 = [(HMDNetworkRouterClientStatus *)v6 macAddress];
      if (v11 != v12)
      {
        v3 = [(HMDNetworkRouterClientStatus *)self macAddress];
        v47 = [(HMDNetworkRouterClientStatus *)v6 macAddress];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      uint64_t v13 = [(HMDNetworkRouterClientStatus *)self ipAddressList];
      uint64_t v14 = [(HMDNetworkRouterClientStatus *)v6 ipAddressList];
      v46 = (void *)v13;
      BOOL v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        v17 = [(HMDNetworkRouterClientStatus *)self ipAddressList];
        v41 = [(HMDNetworkRouterClientStatus *)v6 ipAddressList];
        v42 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v10 = 0;
          v18 = v46;
LABEL_32:

LABEL_33:
          if (v11 == v12) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
      }
      uint64_t v19 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];
      uint64_t v44 = [(HMDNetworkRouterClientStatus *)v6 lanIdentifier];
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        v21 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];
        v39 = [(HMDNetworkRouterClientStatus *)v6 lanIdentifier];
        v40 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v10 = 0;
          v24 = (void *)v44;
          v3 = v20;
LABEL_30:

LABEL_31:
          v16 = v43;
          v18 = v46;
          if (v46 == v43) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        v37 = v12;
        v3 = v20;
      }
      v22 = [(HMDNetworkRouterClientStatus *)self name];
      uint64_t v38 = [(HMDNetworkRouterClientStatus *)v6 name];
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        v23 = [(HMDNetworkRouterClientStatus *)self name];
        v35 = [(HMDNetworkRouterClientStatus *)v6 name];
        v36 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          char v10 = 0;
          v12 = v37;
          v30 = (void *)v38;
          goto LABEL_28;
        }
        v33 = v3;
        v34 = v11;
      }
      v25 = [(HMDNetworkRouterClientStatus *)self rssi];
      uint64_t v26 = [(HMDNetworkRouterClientStatus *)v6 rssi];
      if (v25 == (void *)v26)
      {

        char v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        [(HMDNetworkRouterClientStatus *)self rssi];
        v28 = v32 = v22;
        v29 = [(HMDNetworkRouterClientStatus *)v6 rssi];
        char v10 = [v28 isEqual:v29];

        v22 = v32;
      }
      v12 = v37;
      v30 = (void *)v38;
      v3 = v33;
      v11 = v34;
      if (v22 == (void *)v38)
      {
LABEL_29:

        v24 = (void *)v44;
        if (v45 == (void *)v44) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v10 = 0;
  }
LABEL_38:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterClientStatus allocWithZone:a3];
  v5 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];
  v6 = [(HMDNetworkRouterClientStatus *)self macAddress];
  v7 = [(HMDNetworkRouterClientStatus *)self ipAddressList];
  v8 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];
  v9 = [(HMDNetworkRouterClientStatus *)self name];
  char v10 = [(HMDNetworkRouterClientStatus *)self rssi];
  v11 = [(HMDNetworkRouterClientStatus *)v4 initWithClientIdentifier:v5 macAddress:v6 ipAddressList:v7 lanIdentifier:v8 name:v9 rssi:v10];

  return v11;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
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
  long long v31 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];

  if (v5)
  {
    v6 = [(HMDNetworkRouterClientStatus *)self clientIdentifier];
    id v30 = 0;
    v7 = [v6 serializeWithError:&v30];
    id v8 = v30;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  char v10 = [(HMDNetworkRouterClientStatus *)self macAddress];

  if (v10)
  {
    v11 = [(HMDNetworkRouterClientStatus *)self macAddress];
    id v29 = 0;
    v7 = [v11 serializeWithError:&v29];
    id v8 = v29;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  v12 = [(HMDNetworkRouterClientStatus *)self ipAddressList];

  if (v12)
  {
    uint64_t v13 = [(HMDNetworkRouterClientStatus *)self ipAddressList];
    id v28 = 0;
    v7 = [v13 serializeWithError:&v28];
    id v8 = v28;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];

  if (!v14) {
    goto LABEL_17;
  }
  BOOL v15 = [(HMDNetworkRouterClientStatus *)self lanIdentifier];
  id v27 = 0;
  v7 = [v15 serializeWithError:&v27];
  id v8 = v27;

  if (v8) {
    goto LABEL_27;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  if (TLV8BufferAppend())
  {
LABEL_20:

LABEL_21:
    if (a3)
    {
      HMErrorFromOSStatus();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_29:
      v21 = 0;
      *a3 = v18;
      goto LABEL_31;
    }
    id v8 = 0;
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }

LABEL_17:
  v16 = [(HMDNetworkRouterClientStatus *)self name];

  if (v16)
  {
    v17 = [(HMDNetworkRouterClientStatus *)self name];
    id v26 = 0;
    v7 = [v17 serializeWithError:&v26];
    id v8 = v26;

    if (v8) {
      goto LABEL_27;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_20;
    }
  }
  uint64_t v19 = [(HMDNetworkRouterClientStatus *)self rssi];

  if (v19)
  {
    v20 = [(HMDNetworkRouterClientStatus *)self rssi];
    id v25 = 0;
    v7 = [v20 serializeWithError:&v25];
    id v8 = v25;

    if (v8)
    {
LABEL_27:

      if (a3)
      {
        id v18 = v8;
        id v8 = v18;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    id v23 = v7;
    [v23 bytes];
    [v23 length];
    int v24 = TLV8BufferAppend();

    if (v24) {
      goto LABEL_21;
    }
  }
  v21 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v31);
  id v8 = 0;
LABEL_31:
  TLV8BufferFree();

  return v21;
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
  if (v9)
  {
    id v25 = v7;
    uint64_t v26 = 0;
    id v10 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    v11 = 0;
    v12 = 0;
    uint64_t v27 = 0;
    uint64_t v13 = v8 + v9;
    while (1)
    {
      char v40 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      long long v38 = 0;
      uint64_t v36 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        uint64_t v19 = (void *)v29;
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
        goto LABEL_31;
      }
      if (!v39) {
        break;
      }
      switch(v40)
      {
        case 1:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v35 = v10;
          BOOL v15 = &v35;
          [MEMORY[0x263F35AF0] parsedFromData:v14 error:&v35];
          uint64_t v29 = v16 = (void *)v29;
          goto LABEL_15;
        case 2:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v34 = v10;
          BOOL v15 = &v34;
          [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v34];
          uint64_t v28 = v16 = (void *)v28;
          goto LABEL_15;
        case 3:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v33 = v10;
          BOOL v15 = &v33;
          +[HMDNetworkRouterIPAddressList parsedFromData:v14 error:&v33];
          uint64_t v27 = v16 = (void *)v27;
          goto LABEL_15;
        case 5:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v32 = v10;
          BOOL v15 = &v32;
          [MEMORY[0x263F35AF0] parsedFromData:v14 error:&v32];
          uint64_t v26 = v16 = (void *)v26;
          goto LABEL_15;
        case 6:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v31 = v10;
          BOOL v15 = &v31;
          [NSString parsedFromData:v14 error:&v31];
          v12 = v16 = v12;
          goto LABEL_15;
        case 7:
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v30 = v10;
          BOOL v15 = &v30;
          [MEMORY[0x263F35AE8] parsedFromData:v14 error:&v30];
          v11 = v16 = v11;
LABEL_15:
          id v17 = *v15;

          id v10 = v17;
          break;
        default:
          break;
      }
      if (v38) {
        free(v38);
      }
      if (v36 == v13)
      {
        if (v10) {
          goto LABEL_20;
        }
LABEL_26:
        v20 = (void *)v26;
        v22 = (void *)v28;
        uint64_t v19 = (void *)v29;
        v21 = (void *)v27;
        goto LABEL_27;
      }
    }
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

    id v10 = (id)v23;
    if (!v23) {
      goto LABEL_26;
    }
LABEL_20:
    if (a4)
    {
      id v10 = v10;
      BOOL v18 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v18 = 0;
    }
    uint64_t v19 = (void *)v29;
LABEL_31:
    v21 = (void *)v27;
    v22 = (void *)v28;
    v20 = (void *)v26;
  }
  else
  {
    uint64_t v19 = 0;
    v11 = 0;
    v12 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
LABEL_27:
    -[HMDNetworkRouterClientStatus setClientIdentifier:](self, "setClientIdentifier:", v19, v25);
    [(HMDNetworkRouterClientStatus *)self setMacAddress:v22];
    [(HMDNetworkRouterClientStatus *)self setIpAddressList:v21];
    [(HMDNetworkRouterClientStatus *)self setLanIdentifier:v20];
    [(HMDNetworkRouterClientStatus *)self setName:v12];
    [(HMDNetworkRouterClientStatus *)self setRssi:v11];
    id v10 = 0;
    BOOL v18 = 1;
  }

  return v18;
}

- (HMDNetworkRouterClientStatus)initWithClientIdentifier:(id)a3 macAddress:(id)a4 ipAddressList:(id)a5 lanIdentifier:(id)a6 name:(id)a7 rssi:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterClientStatus;
  BOOL v18 = [(HMDNetworkRouterClientStatus *)&v24 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientIdentifier, a3);
    objc_storeStrong((id *)&v19->_macAddress, a4);
    objc_storeStrong((id *)&v19->_ipAddressList, a5);
    objc_storeStrong((id *)&v19->_lanIdentifier, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_rssi, a8);
  }

  return v19;
}

- (HMDNetworkRouterClientStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientStatus;
  return [(HMDNetworkRouterClientStatus *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterClientStatus);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterClientStatus *)v6 parseFromData:v5 error:&v10];
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