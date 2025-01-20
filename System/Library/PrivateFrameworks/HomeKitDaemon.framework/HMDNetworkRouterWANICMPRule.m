@interface HMDNetworkRouterWANICMPRule
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterICMPTypeList)icmpTypes;
- (HMDNetworkRouterIPAddress)hostIPEnd;
- (HMDNetworkRouterIPAddress)hostIPStart;
- (HMDNetworkRouterWANICMPRule)init;
- (HMDNetworkRouterWANICMPRule)initWithHostDNSName:(id)a3 hostIPStart:(id)a4 hostIPEnd:(id)a5 icmpTypes:(id)a6;
- (NSString)description;
- (NSString)hostDNSName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)addTo:(id)a3;
- (void)setHostDNSName:(id)a3;
- (void)setHostIPEnd:(id)a3;
- (void)setHostIPStart:(id)a3;
- (void)setIcmpTypes:(id)a3;
@end

@implementation HMDNetworkRouterWANICMPRule

- (void)addTo:(id)a3
{
  id v7 = a3;
  v4 = [v7 icmpRules];
  v5 = v4;
  if (v4)
  {
    [v4 addObject:self];
  }
  else
  {
    v6 = [MEMORY[0x263EFF980] arrayWithObject:self];
    [v7 setIcmpRules:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypes, 0);
  objc_storeStrong((id *)&self->_hostIPEnd, 0);
  objc_storeStrong((id *)&self->_hostIPStart, 0);
  objc_storeStrong((id *)&self->_hostDNSName, 0);
}

- (void)setIcmpTypes:(id)a3
{
}

- (HMDNetworkRouterICMPTypeList)icmpTypes
{
  return self->_icmpTypes;
}

- (void)setHostIPEnd:(id)a3
{
}

- (HMDNetworkRouterIPAddress)hostIPEnd
{
  return self->_hostIPEnd;
}

- (void)setHostIPStart:(id)a3
{
}

- (HMDNetworkRouterIPAddress)hostIPStart
{
  return self->_hostIPStart;
}

- (void)setHostDNSName:(id)a3
{
}

- (NSString)hostDNSName
{
  return self->_hostDNSName;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];
  v5 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];
  v6 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];
  id v7 = [(HMDNetworkRouterWANICMPRule *)self icmpTypes];
  v8 = [v3 stringWithFormat:@"<HMDNetworkRouterWANICMPRule hostDNSName=%@, hostIPStart=%@, hostIPEnd=%@, icmpTypes=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDNetworkRouterWANICMPRule *)a3;
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
      id v7 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];
      v8 = [(HMDNetworkRouterWANICMPRule *)v6 hostDNSName];
      if (v7 != v8)
      {
        v9 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];
        v3 = [(HMDNetworkRouterWANICMPRule *)v6 hostDNSName];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];
      v12 = [(HMDNetworkRouterWANICMPRule *)v6 hostIPStart];
      if (v11 != v12)
      {
        v13 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];
        v31 = [(HMDNetworkRouterWANICMPRule *)v6 hostIPStart];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];
      v15 = [(HMDNetworkRouterWANICMPRule *)v6 hostIPEnd];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];
        v27 = [(HMDNetworkRouterWANICMPRule *)v6 hostIPEnd];
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      v17 = [(HMDNetworkRouterWANICMPRule *)self icmpTypes];
      uint64_t v18 = [(HMDNetworkRouterWANICMPRule *)v6 icmpTypes];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HMDNetworkRouterWANICMPRule *)self icmpTypes];
        v20 = v24 = v3;
        v21 = [(HMDNetworkRouterWANICMPRule *)v6 icmpTypes];
        char v10 = [v20 isEqual:v21];

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterWANICMPRule allocWithZone:a3];
  v5 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];
  v6 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];
  id v7 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];
  v8 = [(HMDNetworkRouterWANICMPRule *)self icmpTypes];
  v9 = [(HMDNetworkRouterWANICMPRule *)v4 initWithHostDNSName:v5 hostIPStart:v6 hostIPEnd:v7 icmpTypes:v8];

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
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
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  TLV8BufferInit();
  v5 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];

  if (v5)
  {
    v6 = [(HMDNetworkRouterWANICMPRule *)self hostDNSName];
    id v24 = 0;
    id v7 = [v6 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_12;
    }
  }
  char v10 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];

  if (!v10) {
    goto LABEL_9;
  }
  v11 = [(HMDNetworkRouterWANICMPRule *)self hostIPStart];
  id v23 = 0;
  id v7 = [v11 serializeWithError:&v23];
  id v8 = v23;

  if (v8) {
    goto LABEL_19;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  if (TLV8BufferAppend())
  {
LABEL_12:

LABEL_13:
    if (a3)
    {
      HMErrorFromOSStatus();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_21:
      v17 = 0;
      *a3 = v14;
      goto LABEL_23;
    }
    id v8 = 0;
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }

LABEL_9:
  v12 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];

  if (v12)
  {
    v13 = [(HMDNetworkRouterWANICMPRule *)self hostIPEnd];
    id v22 = 0;
    id v7 = [v13 serializeWithError:&v22];
    id v8 = v22;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_12;
    }
  }
  v15 = [(HMDNetworkRouterWANICMPRule *)self icmpTypes];

  if (v15)
  {
    v16 = [(HMDNetworkRouterWANICMPRule *)self icmpTypes];
    id v21 = 0;
    id v7 = [v16 serializeWithError:&v21];
    id v8 = v21;

    if (v8)
    {
LABEL_19:

      if (a3)
      {
        id v14 = v8;
        id v8 = v14;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    id v19 = v7;
    [v19 bytes];
    [v19 length];
    int v20 = TLV8BufferAppend();

    if (v20) {
      goto LABEL_13;
    }
  }
  v17 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v25);
  id v8 = 0;
LABEL_23:
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
  if (v9)
  {
    id v23 = self;
    id v24 = a4;
    id v25 = v7;
    id v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    id v14 = 0;
    uint64_t v15 = v8 + v9;
    while (1)
    {
      char v34 = 0;
      long long v32 = 0;
      uint64_t v33 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        id v7 = v25;
        if (v24)
        {
          HMErrorFromOSStatus();
          BOOL v20 = 0;
          id *v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v20 = 0;
        }
        goto LABEL_29;
      }
      if (!v33) {
        break;
      }
      switch(v34)
      {
        case 1:
          v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v29 = v10;
          v17 = &v29;
          [NSString parsedFromData:v16 error:&v29];
          id v14 = v18 = v14;
          goto LABEL_13;
        case 2:
          v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v28 = v10;
          v17 = &v28;
          +[HMDNetworkRouterIPAddress parsedFromData:v16 error:&v28];
          v13 = uint64_t v18 = v13;
          goto LABEL_13;
        case 3:
          v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v27 = v10;
          v17 = &v27;
          +[HMDNetworkRouterIPAddress parsedFromData:v16 error:&v27];
          v12 = uint64_t v18 = v12;
          goto LABEL_13;
        case 4:
          v16 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v26 = v10;
          v17 = &v26;
          +[HMDNetworkRouterICMPTypeList parsedFromData:v16 error:&v26];
          v11 = uint64_t v18 = v11;
LABEL_13:
          id v19 = *v17;

          id v10 = v19;
          break;
        default:
          break;
      }
      if (v32) {
        free(v32);
      }
      if (v30 == v15)
      {
        if (v10) {
          goto LABEL_18;
        }
LABEL_24:
        id v7 = v25;
        self = v23;
        goto LABEL_25;
      }
    }
    uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

    id v10 = (id)v21;
    if (!v21) {
      goto LABEL_24;
    }
LABEL_18:
    if (v24)
    {
      id v10 = v10;
      BOOL v20 = 0;
      id *v24 = v10;
    }
    else
    {
      BOOL v20 = 0;
    }
    id v7 = v25;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    id v14 = 0;
LABEL_25:
    -[HMDNetworkRouterWANICMPRule setHostDNSName:](self, "setHostDNSName:", v14, v23);
    [(HMDNetworkRouterWANICMPRule *)self setHostIPStart:v13];
    [(HMDNetworkRouterWANICMPRule *)self setHostIPEnd:v12];
    [(HMDNetworkRouterWANICMPRule *)self setIcmpTypes:v11];
    id v10 = 0;
    BOOL v20 = 1;
  }
LABEL_29:

  return v20;
}

- (HMDNetworkRouterWANICMPRule)initWithHostDNSName:(id)a3 hostIPStart:(id)a4 hostIPEnd:(id)a5 icmpTypes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterWANICMPRule;
  uint64_t v15 = [(HMDNetworkRouterWANICMPRule *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_hostDNSName, a3);
    objc_storeStrong((id *)&v16->_hostIPStart, a4);
    objc_storeStrong((id *)&v16->_hostIPEnd, a5);
    objc_storeStrong((id *)&v16->_icmpTypes, a6);
  }

  return v16;
}

- (HMDNetworkRouterWANICMPRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANICMPRule;
  return [(HMDNetworkRouterWANICMPRule *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterWANICMPRule);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterWANICMPRule *)v6 parseFromData:v5 error:&v10];
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