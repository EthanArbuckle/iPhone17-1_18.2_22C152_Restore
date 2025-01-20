@interface HMDWakeConfigurationParameters
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDWakeConfigurationParameters)init;
- (HMDWakeConfigurationParameters)initWithDelimiter:(id)a3 primaryIdentifier:(id)a4 secondaryIdentifier:(id)a5;
- (NSData)delimiter;
- (NSData)primaryIdentifier;
- (NSMutableArray)secondaryIdentifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDelimiter:(id)a3;
- (void)setPrimaryIdentifier:(id)a3;
- (void)setSecondaryIdentifier:(id)a3;
@end

@implementation HMDWakeConfigurationParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryIdentifier, 0);
  objc_storeStrong((id *)&self->_delimiter, 0);
}

- (void)setSecondaryIdentifier:(id)a3
{
}

- (NSMutableArray)secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (void)setPrimaryIdentifier:(id)a3
{
}

- (NSData)primaryIdentifier
{
  return self->_primaryIdentifier;
}

- (void)setDelimiter:(id)a3
{
}

- (NSData)delimiter
{
  return self->_delimiter;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDWakeConfigurationParameters *)self delimiter];
  v5 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];
  v6 = [(HMDWakeConfigurationParameters *)self secondaryIdentifier];
  v7 = [v3 stringWithFormat:@"<HMDWakeConfigurationParameters delimiter=%@, primaryIdentifier=%@, secondaryIdentifier=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HMDWakeConfigurationParameters *)a3;
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
      v8 = [(HMDWakeConfigurationParameters *)self delimiter];
      v9 = [(HMDWakeConfigurationParameters *)v7 delimiter];
      if (v8 != v9)
      {
        v3 = [(HMDWakeConfigurationParameters *)self delimiter];
        v4 = [(HMDWakeConfigurationParameters *)v7 delimiter];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];
      v12 = [(HMDWakeConfigurationParameters *)v7 primaryIdentifier];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];
        v26 = [(HMDWakeConfigurationParameters *)v7 primaryIdentifier];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HMDWakeConfigurationParameters *)self secondaryIdentifier];
      uint64_t v15 = [(HMDWakeConfigurationParameters *)v7 secondaryIdentifier];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HMDWakeConfigurationParameters *)self secondaryIdentifier];
        v17 = v23 = v3;
        [(HMDWakeConfigurationParameters *)v7 secondaryIdentifier];
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
  v4 = +[HMDWakeConfigurationParameters allocWithZone:a3];
  v5 = [(HMDWakeConfigurationParameters *)self delimiter];
  v6 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];
  v7 = [(HMDWakeConfigurationParameters *)self secondaryIdentifier];
  v8 = [(HMDWakeConfigurationParameters *)v4 initWithDelimiter:v5 primaryIdentifier:v6 secondaryIdentifier:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
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
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  TLV8BufferInit();
  v5 = [(HMDWakeConfigurationParameters *)self delimiter];

  if (v5)
  {
    v6 = [(HMDWakeConfigurationParameters *)self delimiter];
    id v37 = 0;
    id v7 = [v6 serializeWithError:&v37];
    id v8 = v37;

    if (!v8)
    {
      id v7 = v7;
      unint64_t v9 = [v7 bytes];
      unint64_t v10 = v9 + [v7 length];
      while (1)
      {
        uint64_t v11 = (uint64_t)(v10 - v9) >= 255 ? 255 : v10 - v9;
        if (TLV8BufferAppend()) {
          goto LABEL_40;
        }
        v9 += v11;
        if (v9 >= v10)
        {

          goto LABEL_10;
        }
      }
    }
  }
  else
  {
LABEL_10:
    v12 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];

    if (!v12)
    {
LABEL_21:
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = [(HMDWakeConfigurationParameters *)self secondaryIdentifier];
      uint64_t v30 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (!v30)
      {
LABEL_37:

        v28 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v39);
        id v8 = 0;
        goto LABEL_45;
      }
      uint64_t v18 = *(void *)v33;
      char v19 = 1;
      while (1)
      {
        uint64_t v20 = 0;
        while (2)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v7);
          }
          v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
          if ((v19 & 1) == 0)
          {
            if (TLV8BufferAppend()) {
              goto LABEL_40;
            }
          }
          id v31 = 0;
          v22 = objc_msgSend(v21, "serializeWithError:", &v31, v30);
          id v23 = v31;
          if (v23)
          {
            id v8 = v23;

            goto LABEL_12;
          }
          id v24 = v22;
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
            if (TLV8BufferAppend())
            {

              goto LABEL_40;
            }
            v25 += v27;
          }
          while (v25 < v26);

          char v19 = 0;
          if (++v20 != v30) {
            continue;
          }
          break;
        }
        char v19 = 0;
        uint64_t v30 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v30) {
          goto LABEL_37;
        }
      }
    }
    v13 = [(HMDWakeConfigurationParameters *)self primaryIdentifier];
    id v36 = 0;
    id v7 = [v13 serializeWithError:&v36];
    id v8 = v36;

    if (!v8)
    {
      id v7 = v7;
      unint64_t v15 = [v7 bytes];
      unint64_t v16 = v15 + [v7 length];
      while (1)
      {
        uint64_t v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        if (TLV8BufferAppend()) {
          break;
        }
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_21;
        }
      }
LABEL_40:

      if (a3)
      {
        HMErrorFromOSStatus();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_42;
      }
      id v8 = 0;
      goto LABEL_44;
    }
  }
LABEL_12:

  if (a3)
  {
    id v14 = v8;
    id v8 = v14;
LABEL_42:
    v28 = 0;
    *a3 = v14;
    goto LABEL_45;
  }
LABEL_44:
  v28 = 0;
LABEL_45:
  TLV8BufferFree();

  return v28;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  unint64_t v9 = (void *)v8;
  if (v7 < 1)
  {
    uint64_t v11 = 0;
    v12 = 0;
LABEL_27:
    -[HMDWakeConfigurationParameters setDelimiter:](self, "setDelimiter:", v12, v24);
    [(HMDWakeConfigurationParameters *)self setPrimaryIdentifier:v11];
    [(HMDWakeConfigurationParameters *)self setSecondaryIdentifier:v9];
    unint64_t v10 = 0;
    BOOL v21 = 1;
    goto LABEL_30;
  }
  id v24 = (void *)v8;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  v12 = 0;
  unint64_t v13 = v6 + v7;
  while (1)
  {
    char v35 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    unint64_t v32 = 0;
    if (TLV8GetNext()) {
      break;
    }
    if (!v34)
    {
      uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

      unint64_t v10 = (void *)v22;
      if (!v22) {
        goto LABEL_26;
      }
LABEL_19:
      char v19 = a4;
      if (a4)
      {
        id v20 = v10;
        unint64_t v10 = v20;
LABEL_24:
        BOOL v21 = 0;
        id *v19 = v20;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    switch(v35)
    {
      case 2:
        id v27 = v10;
        id v14 = HAPTLVParseContiguousTlvs();
        id v15 = v27;

        if (!v15)
        {
          id v26 = 0;
          uint64_t v17 = [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v26];
          id v15 = v26;
          if (!v15) {
            [v24 addObject:v17];
          }
LABEL_15:
        }
LABEL_16:

        unint64_t v10 = v15;
        break;
      case 1:
        id v29 = v10;
        id v14 = HAPTLVParseContiguousTlvs();
        id v15 = v29;

        if (!v15)
        {
          id v28 = 0;
          uint64_t v18 = [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v28];
          id v15 = v28;
          uint64_t v17 = v11;
          uint64_t v11 = (void *)v18;
          goto LABEL_15;
        }
        goto LABEL_16;
      case 0:
        id v31 = v10;
        id v14 = HAPTLVParseContiguousTlvs();
        id v15 = v31;

        if (!v15)
        {
          id v30 = 0;
          uint64_t v16 = [MEMORY[0x263EFF8F8] parsedFromData:v14 error:&v30];
          id v15 = v30;
          uint64_t v17 = v12;
          v12 = (void *)v16;
          goto LABEL_15;
        }
        goto LABEL_16;
    }
    if (v32 >= v13)
    {
      if (v10) {
        goto LABEL_19;
      }
LABEL_26:
      unint64_t v9 = v24;
      goto LABEL_27;
    }
  }
  char v19 = a4;
  if (a4)
  {
    HMErrorFromOSStatus();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_28:
  BOOL v21 = 0;
LABEL_29:
  unint64_t v9 = v24;
LABEL_30:

  return v21;
}

- (HMDWakeConfigurationParameters)initWithDelimiter:(id)a3 primaryIdentifier:(id)a4 secondaryIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDWakeConfigurationParameters;
  v12 = [(HMDWakeConfigurationParameters *)&v17 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delimiter, a3);
    objc_storeStrong((id *)&v13->_primaryIdentifier, a4);
    uint64_t v14 = [v11 mutableCopy];
    secondaryIdentifier = v13->_secondaryIdentifier;
    v13->_secondaryIdentifier = (NSMutableArray *)v14;
  }
  return v13;
}

- (HMDWakeConfigurationParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDWakeConfigurationParameters;
  return [(HMDWakeConfigurationParameters *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(HMDWakeConfigurationParameters);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDWakeConfigurationParameters *)v6 parseFromData:v5 error:&v10];
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