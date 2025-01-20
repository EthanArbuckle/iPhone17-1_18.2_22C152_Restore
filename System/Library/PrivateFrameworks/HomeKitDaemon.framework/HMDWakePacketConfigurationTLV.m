@interface HMDWakePacketConfigurationTLV
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)wakeDestinationPort;
- (HMDSleepConfigurationWakePacketTypeWrapper)wakePacketType;
- (HMDSleepConfigurationWakeUpTypeWrapper)wakeType;
- (HMDWakePacketConfigurationTLV)init;
- (HMDWakePacketConfigurationTLV)initWithWakePacketType:(id)a3 wakeDestinationPort:(id)a4 wakeDestinationAddress:(id)a5 wakeType:(id)a6 wakePattern:(id)a7;
- (NSData)wakeDestinationAddress;
- (NSData)wakePattern;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setWakeDestinationAddress:(id)a3;
- (void)setWakeDestinationPort:(id)a3;
- (void)setWakePacketType:(id)a3;
- (void)setWakePattern:(id)a3;
- (void)setWakeType:(id)a3;
@end

@implementation HMDWakePacketConfigurationTLV

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeType, 0);
  objc_storeStrong((id *)&self->_wakeDestinationAddress, 0);
  objc_storeStrong((id *)&self->_wakeDestinationPort, 0);
  objc_storeStrong((id *)&self->_wakePacketType, 0);
}

- (void)setWakePattern:(id)a3
{
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void)setWakeType:(id)a3
{
}

- (HMDSleepConfigurationWakeUpTypeWrapper)wakeType
{
  return self->_wakeType;
}

- (void)setWakeDestinationAddress:(id)a3
{
}

- (NSData)wakeDestinationAddress
{
  return self->_wakeDestinationAddress;
}

- (void)setWakeDestinationPort:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)wakeDestinationPort
{
  return self->_wakeDestinationPort;
}

- (void)setWakePacketType:(id)a3
{
}

- (HMDSleepConfigurationWakePacketTypeWrapper)wakePacketType
{
  return self->_wakePacketType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];
  v5 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];
  v6 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];
  v7 = [(HMDWakePacketConfigurationTLV *)self wakeType];
  v8 = [(HMDWakePacketConfigurationTLV *)self wakePattern];
  v9 = [v3 stringWithFormat:@"<HMDWakePacketConfigurationTLV wakePacketType=%@, wakeDestinationPort=%@, wakeDestinationAddress=%@, wakeType=%@, wakePattern=%@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDWakePacketConfigurationTLV *)a3;
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
      v7 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];
      v8 = [(HMDWakePacketConfigurationTLV *)v6 wakePacketType];
      if (v7 != v8)
      {
        v9 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];
        [(HMDWakePacketConfigurationTLV *)v6 wakePacketType];
        v38 = v39 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      v11 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];
      v12 = [(HMDWakePacketConfigurationTLV *)v6 wakeDestinationPort];
      if (v11 != v12)
      {
        v3 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];
        v35 = [(HMDWakePacketConfigurationTLV *)v6 wakeDestinationPort];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      uint64_t v13 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];
      uint64_t v36 = [(HMDWakePacketConfigurationTLV *)v6 wakeDestinationAddress];
      v37 = (void *)v13;
      if (v13 != v36)
      {
        v14 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];
        v33 = [(HMDWakePacketConfigurationTLV *)v6 wakeDestinationAddress];
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      v17 = [(HMDWakePacketConfigurationTLV *)self wakeType];
      v18 = [(HMDWakePacketConfigurationTLV *)v6 wakeType];
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        v19 = [(HMDWakePacketConfigurationTLV *)self wakeType];
        v30 = [(HMDWakePacketConfigurationTLV *)v6 wakeType];
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          char v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      v20 = [(HMDWakePacketConfigurationTLV *)self wakePattern];
      uint64_t v21 = [(HMDWakePacketConfigurationTLV *)v6 wakePattern];
      if (v20 == (void *)v21)
      {

        char v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        [(HMDWakePacketConfigurationTLV *)self wakePattern];
        v23 = v27 = v17;
        [(HMDWakePacketConfigurationTLV *)v6 wakePattern];
        v28 = v11;
        v25 = v24 = v18;
        char v10 = [v23 isEqual:v25];

        v18 = v24;
        v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    char v10 = 0;
  }
LABEL_31:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDWakePacketConfigurationTLV allocWithZone:a3];
  v5 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];
  v6 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];
  v7 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];
  v8 = [(HMDWakePacketConfigurationTLV *)self wakeType];
  v9 = [(HMDWakePacketConfigurationTLV *)self wakePattern];
  char v10 = [(HMDWakePacketConfigurationTLV *)v4 initWithWakePacketType:v5 wakeDestinationPort:v6 wakeDestinationAddress:v7 wakeType:v8 wakePattern:v9];

  return v10;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  TLV8BufferInit();
  v5 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];

  if (v5)
  {
    v6 = [(HMDWakePacketConfigurationTLV *)self wakePacketType];
    id v36 = 0;
    v7 = [v6 serializeWithError:&v36];
    id v8 = v36;

    if (v8) {
      goto LABEL_28;
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
LABEL_30:
        v22 = 0;
        *a3 = v12;
        goto LABEL_32;
      }
      id v8 = 0;
LABEL_31:
      v22 = 0;
      goto LABEL_32;
    }
  }
  char v10 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];

  if (v10)
  {
    v11 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationPort];
    id v35 = 0;
    v7 = [v11 serializeWithError:&v35];
    id v8 = v35;

    if (v8) {
      goto LABEL_28;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_8;
    }
  }
  uint64_t v13 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];

  if (v13)
  {
    v14 = [(HMDWakePacketConfigurationTLV *)self wakeDestinationAddress];
    id v34 = 0;
    v7 = [v14 serializeWithError:&v34];
    id v8 = v34;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v15 = [v9 bytes];
      unint64_t v16 = v15 + [v9 length];
      while (1)
      {
        uint64_t v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        if (TLV8BufferAppend()) {
          goto LABEL_8;
        }
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_22;
        }
      }
    }
LABEL_28:

    if (a3)
    {
      id v12 = v8;
      id v8 = v12;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
LABEL_22:
  v18 = [(HMDWakePacketConfigurationTLV *)self wakeType];

  if (v18)
  {
    v19 = [(HMDWakePacketConfigurationTLV *)self wakeType];
    id v33 = 0;
    v7 = [v19 serializeWithError:&v33];
    id v8 = v33;

    if (v8) {
      goto LABEL_28;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_8;
    }
  }
  v20 = [(HMDWakePacketConfigurationTLV *)self wakePattern];

  if (v20)
  {
    uint64_t v21 = [(HMDWakePacketConfigurationTLV *)self wakePattern];
    id v32 = 0;
    v7 = [v21 serializeWithError:&v32];
    id v8 = v32;

    if (v8) {
      goto LABEL_28;
    }
    id v24 = v7;
    unint64_t v25 = [v24 bytes];
    unint64_t v26 = v25 + [v24 length];
    do
    {
      if ((uint64_t)(v26 - v25) >= 255) {
        uint64_t v27 = 255;
      }
      else {
        uint64_t v27 = v26 - v25;
      }
      int v28 = TLV8BufferAppend();
      if (v28) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = v27;
      }
      v25 += v29;
      if (v28) {
        BOOL v30 = 1;
      }
      else {
        BOOL v30 = v25 >= v26;
      }
    }
    while (!v30);
    int v31 = v28;

    if (v31) {
      goto LABEL_9;
    }
  }
  v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v37);
  id v8 = 0;
LABEL_32:
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
    v23 = 0;
    char v10 = 0;
    v22 = 0;
    v11 = 0;
    id v12 = 0;
LABEL_24:
    -[HMDWakePacketConfigurationTLV setWakePacketType:](self, "setWakePacketType:", v12, v27);
    [(HMDWakePacketConfigurationTLV *)self setWakeDestinationPort:v11];
    [(HMDWakePacketConfigurationTLV *)self setWakeDestinationAddress:v22];
    [(HMDWakePacketConfigurationTLV *)self setWakeType:v10];
    [(HMDWakePacketConfigurationTLV *)self setWakePattern:v23];
    id v9 = 0;
    BOOL v24 = 1;
  }
  else
  {
    uint64_t v27 = a4;
    int v28 = 0;
    id v9 = 0;
    char v10 = 0;
    uint64_t v29 = 0;
    v11 = 0;
    id v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v40 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      unint64_t v37 = 0;
      if (TLV8GetNext()) {
        break;
      }
      if (!v39)
      {
        uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

        id v9 = (id)v25;
        if (v25) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
      switch(v40)
      {
        case 1:
          v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v36 = v9;
          uint64_t v15 = +[HMDSleepConfigurationWakePacketTypeWrapper parsedFromData:v14 error:&v36];
          id v16 = v36;

          uint64_t v17 = v12;
          id v12 = (void *)v15;
          break;
        case 2:
          v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v35 = v9;
          uint64_t v18 = [MEMORY[0x263F35AF0] parsedFromData:v14 error:&v35];
          id v16 = v35;

          uint64_t v17 = v11;
          v11 = (void *)v18;
          break;
        case 3:
          id v34 = v9;
          v14 = HAPTLVParseContiguousTlvs();
          id v16 = v34;

          if (v16) {
            goto LABEL_14;
          }
          id v33 = 0;
          uint64_t v19 = [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v33];
          id v16 = v33;
          uint64_t v17 = v29;
          uint64_t v29 = (void *)v19;
          break;
        case 4:
          v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v32 = v9;
          uint64_t v20 = +[HMDSleepConfigurationWakeUpTypeWrapper parsedFromData:v14 error:&v32];
          id v16 = v32;

          uint64_t v17 = v10;
          char v10 = (void *)v20;
          break;
        case 5:
          id v31 = v9;
          v14 = HAPTLVParseContiguousTlvs();
          id v16 = v31;

          if (v16) {
            goto LABEL_14;
          }
          id v30 = 0;
          uint64_t v21 = [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v30];
          id v16 = v30;
          uint64_t v17 = v28;
          int v28 = (void *)v21;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      id v9 = v16;
LABEL_15:
      if (v37 >= v13)
      {
        if (v9)
        {
LABEL_17:
          v23 = v28;
          v22 = v29;
          if (v27)
          {
            id v9 = v9;
            BOOL v24 = 0;
            id *v27 = v9;
          }
          else
          {
            BOOL v24 = 0;
          }
          goto LABEL_28;
        }
LABEL_23:
        v23 = v28;
        v22 = v29;
        goto LABEL_24;
      }
    }
    if (v27)
    {
      HMErrorFromOSStatus();
      BOOL v24 = 0;
      id *v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v24 = 0;
    }
    v23 = v28;
    v22 = v29;
  }
LABEL_28:

  return v24;
}

- (HMDWakePacketConfigurationTLV)initWithWakePacketType:(id)a3 wakeDestinationPort:(id)a4 wakeDestinationAddress:(id)a5 wakeType:(id)a6 wakePattern:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDWakePacketConfigurationTLV;
  uint64_t v17 = [(HMDWakePacketConfigurationTLV *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_wakePacketType, a3);
    objc_storeStrong((id *)&v18->_wakeDestinationPort, a4);
    objc_storeStrong((id *)&v18->_wakeDestinationAddress, a5);
    objc_storeStrong((id *)&v18->_wakeType, a6);
    objc_storeStrong((id *)&v18->_wakePattern, a7);
  }

  return v18;
}

- (HMDWakePacketConfigurationTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDWakePacketConfigurationTLV;
  return [(HMDWakePacketConfigurationTLV *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDWakePacketConfigurationTLV);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDWakePacketConfigurationTLV *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end