@interface HAPNFCAccessIssuerKeyRequest
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPNFCAccessIssuerKeyRequest)init;
- (HAPNFCAccessIssuerKeyRequest)initWithType:(id)a3 key:(id)a4 identifier:(id)a5;
- (HAPNFCAccessKeyTypeWrapper)type;
- (NSData)identifier;
- (NSData)key;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HAPNFCAccessIssuerKeyRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setKey:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setType:(id)a3
{
}

- (HAPNFCAccessKeyTypeWrapper)type
{
  return self->_type;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPNFCAccessIssuerKeyRequest *)self type];
  v5 = [(HAPNFCAccessIssuerKeyRequest *)self key];
  v6 = [(HAPNFCAccessIssuerKeyRequest *)self identifier];
  v7 = [v3 stringWithFormat:@"<HAPNFCAccessIssuerKeyRequest type=%@, key=%@, identifier=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPNFCAccessIssuerKeyRequest *)a3;
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
      v8 = [(HAPNFCAccessIssuerKeyRequest *)self type];
      v9 = [(HAPNFCAccessIssuerKeyRequest *)v7 type];
      if (v8 != v9)
      {
        v3 = [(HAPNFCAccessIssuerKeyRequest *)self type];
        v4 = [(HAPNFCAccessIssuerKeyRequest *)v7 type];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPNFCAccessIssuerKeyRequest *)self key];
      v12 = [(HAPNFCAccessIssuerKeyRequest *)v7 key];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPNFCAccessIssuerKeyRequest *)self key];
        v26 = [(HAPNFCAccessIssuerKeyRequest *)v7 key];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPNFCAccessIssuerKeyRequest *)self identifier];
      uint64_t v15 = [(HAPNFCAccessIssuerKeyRequest *)v7 identifier];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPNFCAccessIssuerKeyRequest *)self identifier];
        v17 = v23 = v3;
        [(HAPNFCAccessIssuerKeyRequest *)v7 identifier];
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
  v4 = +[HAPNFCAccessIssuerKeyRequest allocWithZone:a3];
  v5 = [(HAPNFCAccessIssuerKeyRequest *)self type];
  v6 = [(HAPNFCAccessIssuerKeyRequest *)self key];
  v7 = [(HAPNFCAccessIssuerKeyRequest *)self identifier];
  v8 = [(HAPNFCAccessIssuerKeyRequest *)v4 initWithType:v5 key:v6 identifier:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
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
  v5 = [(HAPNFCAccessIssuerKeyRequest *)self type];

  if (!v5) {
    goto LABEL_4;
  }
  v6 = [(HAPNFCAccessIssuerKeyRequest *)self type];
  id v32 = 0;
  v7 = [v6 serializeWithError:&v32];
  id v8 = v32;

  if (v8) {
    goto LABEL_15;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = TLV8BufferAppend();

  if (!v10)
  {
LABEL_4:
    v11 = [(HAPNFCAccessIssuerKeyRequest *)self key];

    if (v11)
    {
      v12 = [(HAPNFCAccessIssuerKeyRequest *)self key];
      id v31 = 0;
      v7 = [v12 serializeWithError:&v31];
      id v8 = v31;

      if (!v8)
      {
        id v13 = v7;
        unint64_t v14 = [v13 bytes];
        unint64_t v15 = v14 + [v13 length];
        while (1)
        {
          uint64_t v16 = (uint64_t)(v15 - v14) >= 255 ? 255 : v15 - v14;
          uint64_t v17 = TLV8BufferAppend();
          if (v17) {
            break;
          }
          v14 += v16;
          if (v14 >= v15)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = v17;

        goto LABEL_31;
      }
LABEL_15:

      if (a3)
      {
        id v20 = v8;
        id v8 = v20;
LABEL_33:
        v28 = 0;
        *a3 = v20;
        goto LABEL_37;
      }
      goto LABEL_36;
    }
LABEL_13:
    v18 = [(HAPNFCAccessIssuerKeyRequest *)self identifier];

    if (!v18) {
      goto LABEL_34;
    }
    v19 = [(HAPNFCAccessIssuerKeyRequest *)self identifier];
    id v30 = 0;
    v7 = [v19 serializeWithError:&v30];
    id v8 = v30;

    if (v8) {
      goto LABEL_15;
    }
    id v21 = v7;
    unint64_t v22 = [v21 bytes];
    unint64_t v23 = v22 + [v21 length];
    do
    {
      if ((uint64_t)(v23 - v22) >= 255) {
        uint64_t v24 = 255;
      }
      else {
        uint64_t v24 = v23 - v22;
      }
      uint64_t v25 = TLV8BufferAppend();
      if (v25) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = v24;
      }
      v22 += v26;
      if (v25) {
        BOOL v27 = 1;
      }
      else {
        BOOL v27 = v22 >= v23;
      }
    }
    while (!v27);
    uint64_t v10 = v25;

    if (!v10)
    {
LABEL_34:
      v28 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v33);
      id v8 = 0;
      goto LABEL_37;
    }
  }
LABEL_31:
  if (a3)
  {
    HMErrorFromOSStatus(v10);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_33;
  }
  id v8 = 0;
LABEL_36:
  v28 = 0;
LABEL_37:
  TLV8BufferFree();

  return v28;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_19:
    -[HAPNFCAccessIssuerKeyRequest setType:](self, "setType:", v12, v26);
    [(HAPNFCAccessIssuerKeyRequest *)self setKey:v11];
    [(HAPNFCAccessIssuerKeyRequest *)self setIdentifier:v10];
    id v9 = 0;
    BOOL v21 = 1;
    goto LABEL_27;
  }
  uint64_t v26 = a4;
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
  unint64_t v13 = v7 + v8;
  while (1)
  {
    char v34 = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    v32[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v33)
    {
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_19;
      }
LABEL_23:
      unint64_t v22 = v26;
      if (v26)
      {
        id v23 = v9;
        id v9 = v23;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    switch(v34)
    {
      case 3:
        id v28 = v9;
        unint64_t v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v32, &v28);
        id v17 = v28;

        if (!v17)
        {
          id v27 = 0;
          uint64_t v19 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v27];
          id v17 = v27;
          v18 = v10;
          uint64_t v10 = (void *)v19;
          goto LABEL_13;
        }
LABEL_14:

        id v9 = v17;
        break;
      case 2:
        id v30 = v9;
        unint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v32, &v30);
        id v17 = v30;

        if (!v17)
        {
          id v29 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v29];
          id v17 = v29;
          v18 = v11;
          v11 = (void *)v20;
LABEL_13:
        }
        goto LABEL_14;
      case 1:
        unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v31 = v9;
        uint64_t v16 = +[HAPNFCAccessKeyTypeWrapper parsedFromData:v15 error:&v31];
        id v17 = v31;

        v18 = v12;
        v12 = (void *)v16;
        goto LABEL_13;
    }
    unint64_t v7 = v32[0];
    if (v32[0] >= v13)
    {
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_23;
    }
  }
  unint64_t v22 = v26;
  if (v26)
  {
    HMErrorFromOSStatus(Next);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    BOOL v21 = 0;
    id *v22 = v23;
    goto LABEL_27;
  }
LABEL_26:
  BOOL v21 = 0;
LABEL_27:

  return v21;
}

- (HAPNFCAccessIssuerKeyRequest)initWithType:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPNFCAccessIssuerKeyRequest;
  v12 = [(HAPNFCAccessIssuerKeyRequest *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (HAPNFCAccessIssuerKeyRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessIssuerKeyRequest;
  return [(HAPNFCAccessIssuerKeyRequest *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPNFCAccessIssuerKeyRequest);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPNFCAccessIssuerKeyRequest *)v6 parseFromData:v5 error:&v10];
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