@interface HMDSupportedSleepConfigurationTLV
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)version;
- (HMDSupportedSleepConfigurationTLV)init;
- (HMDSupportedSleepConfigurationTLV)initWithVersion:(id)a3 supportedWoLPacketConfigurations:(id)a4;
- (NSMutableArray)supportedWoLPacketConfigurations;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setSupportedWoLPacketConfigurations:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HMDSupportedSleepConfigurationTLV

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedWoLPacketConfigurations, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setSupportedWoLPacketConfigurations:(id)a3
{
}

- (NSMutableArray)supportedWoLPacketConfigurations
{
  return self->_supportedWoLPacketConfigurations;
}

- (void)setVersion:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)version
{
  return self->_version;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDSupportedSleepConfigurationTLV *)self version];
  v5 = [(HMDSupportedSleepConfigurationTLV *)self supportedWoLPacketConfigurations];
  v6 = [v3 stringWithFormat:@"<HMDSupportedSleepConfigurationTLV version=%@, supportedWoLPacketConfigurations=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMDSupportedSleepConfigurationTLV *)a3;
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
      v7 = [(HMDSupportedSleepConfigurationTLV *)self version];
      v8 = [(HMDSupportedSleepConfigurationTLV *)v6 version];
      if (v7 != v8)
      {
        v9 = [(HMDSupportedSleepConfigurationTLV *)self version];
        v3 = [(HMDSupportedSleepConfigurationTLV *)v6 version];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HMDSupportedSleepConfigurationTLV *)self supportedWoLPacketConfigurations];
      v12 = [(HMDSupportedSleepConfigurationTLV *)v6 supportedWoLPacketConfigurations];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HMDSupportedSleepConfigurationTLV *)self supportedWoLPacketConfigurations];
        v14 = [(HMDSupportedSleepConfigurationTLV *)v6 supportedWoLPacketConfigurations];
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
  v4 = +[HMDSupportedSleepConfigurationTLV allocWithZone:a3];
  v5 = [(HMDSupportedSleepConfigurationTLV *)self version];
  v6 = [(HMDSupportedSleepConfigurationTLV *)self supportedWoLPacketConfigurations];
  v7 = [(HMDSupportedSleepConfigurationTLV *)v4 initWithVersion:v5 supportedWoLPacketConfigurations:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
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
  long long v33 = 0u;
  TLV8BufferInit();
  v5 = [(HMDSupportedSleepConfigurationTLV *)self version];

  if (!v5) {
    goto LABEL_7;
  }
  v6 = [(HMDSupportedSleepConfigurationTLV *)self version];
  id v31 = 0;
  id v7 = [v6 serializeWithError:&v31];
  id v8 = v31;

  if (v8) {
    goto LABEL_3;
  }
  id v7 = v7;
  [v7 bytes];
  [v7 length];
  if (!TLV8BufferAppend())
  {

LABEL_7:
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [(HMDSupportedSleepConfigurationTLV *)self supportedWoLPacketConfigurations];
    uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (!v10)
    {
LABEL_23:

      v23 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v33);
      id v8 = 0;
      goto LABEL_31;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    char v13 = 1;
    v25 = a3;
    while (1)
    {
      uint64_t v14 = 0;
LABEL_10:
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v7);
      }
      v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      if ((v13 & 1) == 0 && TLV8BufferAppend())
      {
LABEL_25:
        a3 = v25;
        goto LABEL_26;
      }
      id v26 = 0;
      v16 = objc_msgSend(v15, "serializeWithError:", &v26, v25);
      id v17 = v26;
      if (v17) {
        break;
      }
      uint64_t v18 = v12;
      id v19 = v16;
      unint64_t v20 = [v19 bytes];
      unint64_t v21 = v20 + [v19 length];
      do
      {
        if ((uint64_t)(v21 - v20) >= 255) {
          uint64_t v22 = 255;
        }
        else {
          uint64_t v22 = v21 - v20;
        }
        if (TLV8BufferAppend())
        {

          goto LABEL_25;
        }
        v20 += v22;
      }
      while (v20 < v21);

      char v13 = 0;
      ++v14;
      uint64_t v12 = v18;
      if (v14 != v11) {
        goto LABEL_10;
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      char v13 = 0;
      if (!v11) {
        goto LABEL_23;
      }
    }
    id v8 = v17;

    a3 = v25;
LABEL_3:

    if (a3)
    {
      id v9 = v8;
      id v8 = v9;
LABEL_28:
      v23 = 0;
      *a3 = v9;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_26:

  if (a3)
  {
    HMErrorFromOSStatus();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_28;
  }
  id v8 = 0;
LABEL_30:
  v23 = 0;
LABEL_31:
  TLV8BufferFree();

  return v23;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  id v9 = [MEMORY[0x263EFF980] array];
  if (v8 < 1)
  {
    uint64_t v11 = 0;
LABEL_23:
    -[HMDSupportedSleepConfigurationTLV setVersion:](self, "setVersion:", v11, v22);
    [(HMDSupportedSleepConfigurationTLV *)self setSupportedWoLPacketConfigurations:v9];
    uint64_t v10 = 0;
    BOOL v20 = 1;
    goto LABEL_25;
  }
  uint64_t v22 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v29 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    unint64_t v26 = 0;
    if (TLV8GetNext()) {
      break;
    }
    if (!v28)
    {
      uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

      uint64_t v10 = (void *)v19;
LABEL_19:
      if (!v10) {
        goto LABEL_23;
      }
      id v17 = v22;
      if (v22)
      {
        id v18 = v10;
        uint64_t v10 = v18;
        goto LABEL_22;
      }
      goto LABEL_24;
    }
    if (v29 == 2)
    {
      id v24 = v10;
      char v13 = HAPTLVParseContiguousTlvs();
      id v15 = v24;

      if (v15) {
        goto LABEL_10;
      }
      id v23 = 0;
      v16 = +[HMDWakePacketConfigurationTLV parsedFromData:v13 error:&v23];
      id v15 = v23;
      if (!v15) {
        [v9 addObject:v16];
      }
LABEL_8:

LABEL_10:
      uint64_t v10 = v15;
      goto LABEL_11;
    }
    if (v29 == 1)
    {
      char v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v25 = v10;
      uint64_t v14 = [MEMORY[0x263F35AF0] parsedFromData:v13 error:&v25];
      id v15 = v25;

      v16 = v11;
      uint64_t v11 = (void *)v14;
      goto LABEL_8;
    }
LABEL_11:
    if (v26 >= v12) {
      goto LABEL_19;
    }
  }
  id v17 = v22;
  if (v22)
  {
    HMErrorFromOSStatus();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    BOOL v20 = 0;
    *id v17 = v18;
    goto LABEL_25;
  }
LABEL_24:
  BOOL v20 = 0;
LABEL_25:

  return v20;
}

- (HMDSupportedSleepConfigurationTLV)initWithVersion:(id)a3 supportedWoLPacketConfigurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSupportedSleepConfigurationTLV;
  id v9 = [(HMDSupportedSleepConfigurationTLV *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_version, a3);
    uint64_t v11 = [v8 mutableCopy];
    supportedWoLPacketConfigurations = v10->_supportedWoLPacketConfigurations;
    v10->_supportedWoLPacketConfigurations = (NSMutableArray *)v11;
  }
  return v10;
}

- (HMDSupportedSleepConfigurationTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSupportedSleepConfigurationTLV;
  return [(HMDSupportedSleepConfigurationTLV *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSupportedSleepConfigurationTLV);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSupportedSleepConfigurationTLV *)v6 parseFromData:v5 error:&v10];
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