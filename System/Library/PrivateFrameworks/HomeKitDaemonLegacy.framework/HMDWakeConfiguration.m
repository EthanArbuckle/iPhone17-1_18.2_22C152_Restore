@interface HMDWakeConfiguration
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDWakeConfiguration)init;
- (HMDWakeConfiguration)initWithReserved:(id)a3 custom1:(id)a4 custom2:(id)a5;
- (HMDWakeConfigurationParameters)custom1;
- (HMDWakeConfigurationParameters)custom2;
- (NSData)reserved;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCustom1:(id)a3;
- (void)setCustom2:(id)a3;
- (void)setReserved:(id)a3;
@end

@implementation HMDWakeConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom2, 0);
  objc_storeStrong((id *)&self->_custom1, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
}

- (void)setCustom2:(id)a3
{
}

- (HMDWakeConfigurationParameters)custom2
{
  return self->_custom2;
}

- (void)setCustom1:(id)a3
{
}

- (HMDWakeConfigurationParameters)custom1
{
  return self->_custom1;
}

- (void)setReserved:(id)a3
{
}

- (NSData)reserved
{
  return self->_reserved;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDWakeConfiguration *)self reserved];
  v5 = [(HMDWakeConfiguration *)self custom1];
  v6 = [(HMDWakeConfiguration *)self custom2];
  v7 = [v3 stringWithFormat:@"<HMDWakeConfiguration reserved=%@, custom1=%@, custom2=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HMDWakeConfiguration *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(HMDWakeConfiguration *)self reserved];
      v9 = [(HMDWakeConfiguration *)v7 reserved];
      if (v8 != v9)
      {
        v3 = [(HMDWakeConfiguration *)self reserved];
        v4 = [(HMDWakeConfiguration *)v7 reserved];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HMDWakeConfiguration *)self custom1];
      v12 = [(HMDWakeConfiguration *)v7 custom1];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HMDWakeConfiguration *)self custom1];
        v26 = [(HMDWakeConfiguration *)v7 custom1];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HMDWakeConfiguration *)self custom2];
      uint64_t v15 = [(HMDWakeConfiguration *)v7 custom2];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HMDWakeConfiguration *)self custom2];
        v17 = v23 = v3;
        [(HMDWakeConfiguration *)v7 custom2];
        v22 = v4;
        v18 = v9;
        v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDWakeConfiguration allocWithZone:a3];
  v5 = [(HMDWakeConfiguration *)self reserved];
  v6 = [(HMDWakeConfiguration *)self custom1];
  v7 = [(HMDWakeConfiguration *)self custom2];
  v8 = [(HMDWakeConfiguration *)v4 initWithReserved:v5 custom1:v6 custom2:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
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
  long long v34 = 0u;
  TLV8BufferInit();
  v5 = [(HMDWakeConfiguration *)self reserved];

  if (v5)
  {
    v6 = [(HMDWakeConfiguration *)self reserved];
    id v33 = 0;
    v7 = [v6 serializeWithError:&v33];
    id v8 = v33;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v10 = [v9 bytes];
      unint64_t v11 = v10 + [v9 length];
      while (1)
      {
        uint64_t v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        if (TLV8BufferAppend()) {
          goto LABEL_23;
        }
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
    }
    goto LABEL_21;
  }
LABEL_10:
  v13 = [(HMDWakeConfiguration *)self custom1];

  if (v13)
  {
    v14 = [(HMDWakeConfiguration *)self custom1];
    id v32 = 0;
    v7 = [v14 serializeWithError:&v32];
    id v8 = v32;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v15 = [v9 bytes];
      unint64_t v16 = v15 + [v9 length];
      while (1)
      {
        uint64_t v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        if (TLV8BufferAppend()) {
          break;
        }
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_19;
        }
      }
LABEL_23:

LABEL_24:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_26;
      }
      id v8 = 0;
LABEL_28:
      v21 = 0;
      goto LABEL_43;
    }
LABEL_21:

    if (a3)
    {
      id v20 = v8;
      id v8 = v20;
LABEL_26:
      v21 = 0;
      *a3 = v20;
      goto LABEL_43;
    }
    goto LABEL_28;
  }
LABEL_19:
  v18 = [(HMDWakeConfiguration *)self custom2];

  if (v18)
  {
    v19 = [(HMDWakeConfiguration *)self custom2];
    id v31 = 0;
    v7 = [v19 serializeWithError:&v31];
    id v8 = v31;

    if (v8) {
      goto LABEL_21;
    }
    id v22 = v7;
    unint64_t v23 = [v22 bytes];
    unint64_t v24 = v23 + [v22 length];
    do
    {
      if ((uint64_t)(v24 - v23) >= 255) {
        uint64_t v25 = 255;
      }
      else {
        uint64_t v25 = v24 - v23;
      }
      int v26 = TLV8BufferAppend();
      if (v26) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = v25;
      }
      v23 += v27;
      if (v26) {
        BOOL v28 = 1;
      }
      else {
        BOOL v28 = v23 >= v24;
      }
    }
    while (!v28);
    int v29 = v26;

    if (v29) {
      goto LABEL_24;
    }
  }
  v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v34);
  id v8 = 0;
LABEL_43:
  TLV8BufferFree();

  return v21;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
LABEL_20:
    [(HMDWakeConfiguration *)self setReserved:v12];
    [(HMDWakeConfiguration *)self setCustom1:v11];
    [(HMDWakeConfiguration *)self setCustom2:v10];
    id v9 = 0;
    BOOL v18 = 1;
    goto LABEL_28;
  }
  unint64_t v23 = a4;
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = v7 + v8;
  while (1)
  {
    char v33 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    unint64_t v30 = 0;
    if (TLV8GetNext()) {
      break;
    }
    if (!v32)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v21;
      if (!v21) {
        goto LABEL_20;
      }
LABEL_24:
      v19 = v23;
      if (v23)
      {
        id v20 = v9;
        id v9 = v20;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v33)
    {
      case 2:
        id v25 = v9;
        v14 = HAPTLVParseContiguousTlvs();
        id v15 = v25;

        if (!v15)
        {
          uint64_t v24 = 0;
          unint64_t v16 = (id *)&v24;
          +[HMDWakeConfigurationParameters parsedFromData:v14 error:&v24];
          unint64_t v10 = v17 = v10;
          goto LABEL_14;
        }
LABEL_15:

        id v9 = v15;
        break;
      case 1:
        id v27 = v9;
        v14 = HAPTLVParseContiguousTlvs();
        id v15 = v27;

        if (!v15)
        {
          uint64_t v26 = 0;
          unint64_t v16 = (id *)&v26;
          +[HMDWakeConfigurationParameters parsedFromData:v14 error:&v26];
          unint64_t v11 = v17 = v11;
LABEL_14:
          id v15 = *v16;
        }
        goto LABEL_15;
      case 0:
        id v29 = v9;
        v14 = HAPTLVParseContiguousTlvs();
        id v15 = v29;

        if (!v15)
        {
          uint64_t v28 = 0;
          unint64_t v16 = (id *)&v28;
          [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v28];
          uint64_t v12 = v17 = v12;
          goto LABEL_14;
        }
        goto LABEL_15;
    }
    if (v30 >= v13)
    {
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }
  }
  v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    BOOL v18 = 0;
    id *v19 = v20;
    goto LABEL_28;
  }
LABEL_27:
  BOOL v18 = 0;
LABEL_28:

  return v18;
}

- (HMDWakeConfiguration)initWithReserved:(id)a3 custom1:(id)a4 custom2:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDWakeConfiguration;
  uint64_t v12 = [(HMDWakeConfiguration *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_reserved, a3);
    objc_storeStrong((id *)&v13->_custom1, a4);
    objc_storeStrong((id *)&v13->_custom2, a5);
  }

  return v13;
}

- (HMDWakeConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDWakeConfiguration;
  return [(HMDWakeConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDWakeConfiguration);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDWakeConfiguration *)v6 parseFromData:v5 error:&v10];
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