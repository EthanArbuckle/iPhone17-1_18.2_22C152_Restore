@interface HAPMatterCredential
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDeviceCredentialKey)deviceCredentialKey;
- (HAPIssuerKey)issuerKey;
- (HAPMatterCredential)init;
- (HAPMatterCredential)initWithIssuerKey:(id)a3 readerKey:(id)a4 deviceCredentialKey:(id)a5;
- (HAPReaderKey)readerKey;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDeviceCredentialKey:(id)a3;
- (void)setIssuerKey:(id)a3;
- (void)setReaderKey:(id)a3;
@end

@implementation HAPMatterCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
  objc_storeStrong((id *)&self->_readerKey, 0);

  objc_storeStrong((id *)&self->_issuerKey, 0);
}

- (void)setDeviceCredentialKey:(id)a3
{
}

- (HAPDeviceCredentialKey)deviceCredentialKey
{
  return self->_deviceCredentialKey;
}

- (void)setReaderKey:(id)a3
{
}

- (HAPReaderKey)readerKey
{
  return self->_readerKey;
}

- (void)setIssuerKey:(id)a3
{
}

- (HAPIssuerKey)issuerKey
{
  return self->_issuerKey;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPMatterCredential *)self issuerKey];
  v5 = [(HAPMatterCredential *)self readerKey];
  v6 = [(HAPMatterCredential *)self deviceCredentialKey];
  v7 = [v3 stringWithFormat:@"<HAPMatterCredential issuerKey=%@, readerKey=%@, deviceCredentialKey=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPMatterCredential *)a3;
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
      v8 = [(HAPMatterCredential *)self issuerKey];
      v9 = [(HAPMatterCredential *)v7 issuerKey];
      if (v8 != v9)
      {
        v3 = [(HAPMatterCredential *)self issuerKey];
        v4 = [(HAPMatterCredential *)v7 issuerKey];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPMatterCredential *)self readerKey];
      v12 = [(HAPMatterCredential *)v7 readerKey];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPMatterCredential *)self readerKey];
        v26 = [(HAPMatterCredential *)v7 readerKey];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPMatterCredential *)self deviceCredentialKey];
      uint64_t v15 = [(HAPMatterCredential *)v7 deviceCredentialKey];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPMatterCredential *)self deviceCredentialKey];
        v17 = v23 = v3;
        [(HAPMatterCredential *)v7 deviceCredentialKey];
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
  v4 = +[HAPMatterCredential allocWithZone:a3];
  v5 = [(HAPMatterCredential *)self issuerKey];
  v6 = [(HAPMatterCredential *)self readerKey];
  v7 = [(HAPMatterCredential *)self deviceCredentialKey];
  v8 = [(HAPMatterCredential *)v4 initWithIssuerKey:v5 readerKey:v6 deviceCredentialKey:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  TLV8BufferInit();
  v5 = [(HAPMatterCredential *)self issuerKey];

  if (v5)
  {
    v6 = [(HAPMatterCredential *)self issuerKey];
    id v34 = 0;
    v7 = [v6 serializeWithError:&v34];
    id v8 = v34;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v10 = [v9 bytes];
      unint64_t v11 = v10 + [v9 length];
      while (1)
      {
        uint64_t v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        uint64_t v13 = TLV8BufferAppend();
        if (v13) {
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
  v14 = [(HAPMatterCredential *)self readerKey];

  if (v14)
  {
    uint64_t v15 = [(HAPMatterCredential *)self readerKey];
    id v33 = 0;
    v7 = [v15 serializeWithError:&v33];
    id v8 = v33;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v16 = [v9 bytes];
      unint64_t v17 = v16 + [v9 length];
      while (1)
      {
        uint64_t v18 = (uint64_t)(v17 - v16) >= 255 ? 255 : v17 - v16;
        uint64_t v13 = TLV8BufferAppend();
        if (v13) {
          break;
        }
        v16 += v18;
        if (v16 >= v17)
        {

          goto LABEL_19;
        }
      }
LABEL_23:
      uint64_t v22 = v13;

LABEL_24:
      if (a3)
      {
        HMErrorFromOSStatus(v22);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_26;
      }
      id v8 = 0;
LABEL_28:
      v23 = 0;
      goto LABEL_43;
    }
LABEL_21:

    if (a3)
    {
      id v21 = v8;
      id v8 = v21;
LABEL_26:
      v23 = 0;
      *a3 = v21;
      goto LABEL_43;
    }
    goto LABEL_28;
  }
LABEL_19:
  v19 = [(HAPMatterCredential *)self deviceCredentialKey];

  if (v19)
  {
    v20 = [(HAPMatterCredential *)self deviceCredentialKey];
    id v32 = 0;
    v7 = [v20 serializeWithError:&v32];
    id v8 = v32;

    if (v8) {
      goto LABEL_21;
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
      uint64_t v28 = TLV8BufferAppend();
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
    uint64_t v22 = v28;

    if (v22) {
      goto LABEL_24;
    }
  }
  v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v35);
  id v8 = 0;
LABEL_43:
  TLV8BufferFree();

  return v23;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
LABEL_20:
    [(HAPMatterCredential *)self setIssuerKey:v12];
    [(HAPMatterCredential *)self setReaderKey:v11];
    [(HAPMatterCredential *)self setDeviceCredentialKey:v10];
    id v9 = 0;
    BOOL v19 = 1;
    goto LABEL_28;
  }
  id v24 = a4;
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = v7 + v8;
  while (1)
  {
    char v33 = 0;
    v31[1] = 0;
    uint64_t v32 = 0;
    v31[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v32)
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v22;
      if (!v22) {
        goto LABEL_20;
      }
LABEL_24:
      v20 = v24;
      if (v24)
      {
        id v21 = v9;
        id v9 = v21;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v33)
    {
      case 3:
        id v26 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v31, &v26);
        id v16 = v26;

        if (!v16)
        {
          uint64_t v25 = 0;
          unint64_t v17 = (id *)&v25;
          +[HAPDeviceCredentialKey parsedFromData:v15 error:&v25];
          unint64_t v10 = v18 = v10;
          goto LABEL_14;
        }
LABEL_15:

        id v9 = v16;
        break;
      case 2:
        id v28 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v31, &v28);
        id v16 = v28;

        if (!v16)
        {
          uint64_t v27 = 0;
          unint64_t v17 = (id *)&v27;
          +[HAPReaderKey parsedFromData:v15 error:&v27];
          unint64_t v11 = v18 = v11;
LABEL_14:
          id v16 = *v17;
        }
        goto LABEL_15;
      case 1:
        id v30 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(1, v7, v13, v31, &v30);
        id v16 = v30;

        if (!v16)
        {
          uint64_t v29 = 0;
          unint64_t v17 = (id *)&v29;
          +[HAPIssuerKey parsedFromData:v15 error:&v29];
          uint64_t v12 = v18 = v12;
          goto LABEL_14;
        }
        goto LABEL_15;
    }
    unint64_t v7 = v31[0];
    if (v31[0] >= v13)
    {
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }
  }
  v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_28;
  }
LABEL_27:
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

- (HAPMatterCredential)initWithIssuerKey:(id)a3 readerKey:(id)a4 deviceCredentialKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPMatterCredential;
  uint64_t v12 = [(HAPMatterCredential *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_issuerKey, a3);
    objc_storeStrong((id *)&v13->_readerKey, a4);
    objc_storeStrong((id *)&v13->_deviceCredentialKey, a5);
  }

  return v13;
}

- (HAPMatterCredential)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPMatterCredential;
  return [(HAPMatterCredential *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPMatterCredential);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPMatterCredential *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      unint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end