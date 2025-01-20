@interface HMDSiriEndpointSessionStateTLV
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDSiriEndpointSessionStateTLV)init;
- (HMDSiriEndpointSessionStateTLV)initWithSessionState:(id)a3 hubIdentifier:(id)a4;
- (HMDSiriEndpointSessionStateTypeWrapper)sessionState;
- (NSData)hubIdentifier;
- (NSString)description;
- (NSUUID)hubUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setHubIdentifier:(id)a3;
- (void)setSessionState:(id)a3;
@end

@implementation HMDSiriEndpointSessionStateTLV

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hubIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
}

- (void)setHubIdentifier:(id)a3
{
}

- (NSData)hubIdentifier
{
  return self->_hubIdentifier;
}

- (void)setSessionState:(id)a3
{
}

- (HMDSiriEndpointSessionStateTypeWrapper)sessionState
{
  return self->_sessionState;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];
  v5 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
  v6 = [v3 stringWithFormat:@"<HMDSiriEndpointSessionStateTLV sessionState=%@, hubIdentifier=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDSiriEndpointSessionStateTLV *)a3;
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
      v7 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];
      v8 = [(HMDSiriEndpointSessionStateTLV *)v6 sessionState];
      if (v7 != v8)
      {
        v9 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];
        v3 = [(HMDSiriEndpointSessionStateTLV *)v6 sessionState];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
      v12 = [(HMDSiriEndpointSessionStateTLV *)v6 hubIdentifier];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
        v14 = [(HMDSiriEndpointSessionStateTLV *)v6 hubIdentifier];
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
  v4 = +[HMDSiriEndpointSessionStateTLV allocWithZone:a3];
  v5 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];
  v6 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
  v7 = [(HMDSiriEndpointSessionStateTLV *)v4 initWithSessionState:v5 hubIdentifier:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
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
  v5 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];

  if (v5)
  {
    v6 = [(HMDSiriEndpointSessionStateTLV *)self sessionState];
    id v25 = 0;
    v7 = [v6 serializeWithError:&v25];
    id v8 = v25;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    int v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_21:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_23;
      }
      id v8 = 0;
      goto LABEL_26;
    }
  }
  v11 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];

  if (!v11)
  {
LABEL_24:
    v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v26);
    id v8 = 0;
    goto LABEL_27;
  }
  v12 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
  id v24 = 0;
  v7 = [v12 serializeWithError:&v24];
  id v8 = v24;

  if (!v8)
  {
    id v14 = v7;
    unint64_t v15 = [v14 bytes];
    unint64_t v16 = v15 + [v14 length];
    do
    {
      if ((uint64_t)(v16 - v15) >= 255) {
        uint64_t v17 = 255;
      }
      else {
        uint64_t v17 = v16 - v15;
      }
      int v18 = TLV8BufferAppend();
      if (v18) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v17;
      }
      v15 += v19;
      if (v18) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v15 >= v16;
      }
    }
    while (!v20);
    int v21 = v18;

    if (v21) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
LABEL_6:

  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_23:
    v22 = 0;
    *a3 = v13;
    goto LABEL_27;
  }
LABEL_26:
  v22 = 0;
LABEL_27:
  TLV8BufferFree();

  return v22;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    id v9 = 0;
    int v10 = 0;
LABEL_16:
    -[HMDSiriEndpointSessionStateTLV setSessionState:](self, "setSessionState:", v10, v23);
    [(HMDSiriEndpointSessionStateTLV *)self setHubIdentifier:v9];
    v11 = 0;
    BOOL v18 = 1;
    goto LABEL_24;
  }
  v23 = a4;
  id v9 = 0;
  int v10 = 0;
  v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v30 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    unint64_t v27 = 0;
    if (TLV8GetNext()) {
      break;
    }
    if (!v29)
    {
      uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

      v11 = (void *)v21;
      if (!v21) {
        goto LABEL_16;
      }
LABEL_20:
      uint64_t v19 = v23;
      if (v23)
      {
        id v20 = v11;
        v11 = v20;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      id v25 = v11;
      id v13 = HAPTLVParseContiguousTlvs();
      id v15 = v25;

      if (!v15)
      {
        id v24 = 0;
        uint64_t v17 = [MEMORY[0x263EFF8F8] parsedFromData:v13 error:&v24];
        id v15 = v24;
        unint64_t v16 = v9;
        id v9 = (void *)v17;
LABEL_10:
      }
      v11 = v15;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      id v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v26 = v11;
      uint64_t v14 = +[HMDSiriEndpointSessionStateTypeWrapper parsedFromData:v13 error:&v26];
      id v15 = v26;

      unint64_t v16 = v10;
      int v10 = (void *)v14;
      goto LABEL_10;
    }
LABEL_12:
    if (v27 >= v12)
    {
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  uint64_t v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    BOOL v18 = 0;
    *uint64_t v19 = v20;
    goto LABEL_24;
  }
LABEL_23:
  BOOL v18 = 0;
LABEL_24:

  return v18;
}

- (HMDSiriEndpointSessionStateTLV)initWithSessionState:(id)a3 hubIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSiriEndpointSessionStateTLV;
  id v9 = [(HMDSiriEndpointSessionStateTLV *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionState, a3);
    objc_storeStrong((id *)&v10->_hubIdentifier, a4);
  }

  return v10;
}

- (HMDSiriEndpointSessionStateTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSiriEndpointSessionStateTLV;
  return [(HMDSiriEndpointSessionStateTLV *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSiriEndpointSessionStateTLV);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSiriEndpointSessionStateTLV *)v6 parseFromData:v5 error:&v10];
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

- (NSUUID)hubUUID
{
  v8[2] = *MEMORY[0x263EF8340];
  v8[0] = 0;
  v8[1] = 0;
  v2 = [(HMDSiriEndpointSessionStateTLV *)self hubIdentifier];
  [v2 getBytes:v8 length:16];

  uint64_t v3 = 0;
  for (uint64_t i = 15; i > v3; --i)
  {
    char v5 = *((unsigned char *)v8 + v3);
    *((unsigned char *)v8 + v3) = *((unsigned char *)v8 + i);
    *((unsigned char *)v8 + i) = v5;
    ++v3;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v8];
  if (!v6)
  {
    id v6 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  }
  return (NSUUID *)v6;
}

@end