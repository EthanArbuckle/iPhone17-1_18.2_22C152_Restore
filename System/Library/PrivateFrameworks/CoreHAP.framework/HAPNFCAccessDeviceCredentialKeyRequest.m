@interface HAPNFCAccessDeviceCredentialKeyRequest
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPNFCAccessDeviceCredentialKeyRequest)init;
- (HAPNFCAccessDeviceCredentialKeyRequest)initWithType:(id)a3 key:(id)a4 issuerKeyIdentifier:(id)a5 state:(id)a6 identifier:(id)a7;
- (HAPNFCAccessKeyStateWrapper)state;
- (HAPNFCAccessKeyTypeWrapper)type;
- (NSData)identifier;
- (NSData)issuerKeyIdentifier;
- (NSData)key;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setIssuerKeyIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setState:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HAPNFCAccessDeviceCredentialKeyRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, 0);
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

- (void)setState:(id)a3
{
}

- (HAPNFCAccessKeyStateWrapper)state
{
  return self->_state;
}

- (void)setIssuerKeyIdentifier:(id)a3
{
}

- (NSData)issuerKeyIdentifier
{
  return self->_issuerKeyIdentifier;
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
  v4 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];
  v5 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];
  v6 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];
  v7 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];
  v8 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];
  v9 = [v3 stringWithFormat:@"<HAPNFCAccessDeviceCredentialKeyRequest type=%@, key=%@, issuerKeyIdentifier=%@, state=%@, identifier=%@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPNFCAccessDeviceCredentialKeyRequest *)a3;
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
      v7 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];
      v8 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 type];
      if (v7 != v8)
      {
        v9 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];
        [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 type];
        v38 = v39 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      v11 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];
      v12 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 key];
      if (v11 != v12)
      {
        v3 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];
        v35 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 key];
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
      uint64_t v13 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];
      uint64_t v36 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 issuerKeyIdentifier];
      v37 = (void *)v13;
      if (v13 != v36)
      {
        v14 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];
        v33 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 issuerKeyIdentifier];
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
      v17 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];
      v18 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 state];
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        v19 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];
        v30 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 state];
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          char v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      v20 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];
      uint64_t v21 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 identifier];
      if (v20 == (void *)v21)
      {

        char v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];
        v23 = v27 = v17;
        [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 identifier];
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
  v4 = +[HAPNFCAccessDeviceCredentialKeyRequest allocWithZone:a3];
  v5 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];
  v6 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];
  v7 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];
  v8 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];
  v9 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];
  char v10 = [(HAPNFCAccessDeviceCredentialKeyRequest *)v4 initWithType:v5 key:v6 issuerKeyIdentifier:v7 state:v8 identifier:v9];

  return v10;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  long long v61 = 0u;
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
  long long v47 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  TLV8BufferInit();
  v5 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];

  if (v5)
  {
    v6 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self type];
    id v40 = 0;
    v7 = [v6 serializeWithError:&v40];
    id v8 = v40;

    if (v8) {
      goto LABEL_33;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_4:
      uint64_t v11 = v10;

LABEL_5:
      if (a3)
      {
        HMErrorFromOSStatus(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
LABEL_35:
        v27 = 0;
        *a3 = v12;
        goto LABEL_37;
      }
      id v8 = 0;
LABEL_36:
      v27 = 0;
      goto LABEL_37;
    }
  }
  uint64_t v13 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];

  if (v13)
  {
    v14 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self key];
    id v39 = 0;
    v7 = [v14 serializeWithError:&v39];
    id v8 = v39;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v15 = [v9 bytes];
      unint64_t v16 = v15 + [v9 length];
      while (1)
      {
        uint64_t v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_18;
        }
      }
    }
    goto LABEL_33;
  }
LABEL_18:
  v18 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];

  if (v18)
  {
    v19 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self issuerKeyIdentifier];
    id v38 = 0;
    v7 = [v19 serializeWithError:&v38];
    id v8 = v38;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v20 = [v9 bytes];
      unint64_t v21 = v20 + [v9 length];
      while (1)
      {
        uint64_t v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v20 += v22;
        if (v20 >= v21)
        {

          goto LABEL_27;
        }
      }
    }
LABEL_33:

    if (a3)
    {
      id v12 = v8;
      id v8 = v12;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
LABEL_27:
  v23 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];

  if (v23)
  {
    v24 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self state];
    id v37 = 0;
    v7 = [v24 serializeWithError:&v37];
    id v8 = v37;

    if (v8) {
      goto LABEL_33;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_4;
    }
  }
  v25 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];

  if (v25)
  {
    v26 = [(HAPNFCAccessDeviceCredentialKeyRequest *)self identifier];
    id v36 = 0;
    v7 = [v26 serializeWithError:&v36];
    id v8 = v36;

    if (v8) {
      goto LABEL_33;
    }
    id v29 = v7;
    unint64_t v30 = [v29 bytes];
    unint64_t v31 = v30 + [v29 length];
    do
    {
      if ((uint64_t)(v31 - v30) >= 255) {
        uint64_t v32 = 255;
      }
      else {
        uint64_t v32 = v31 - v30;
      }
      uint64_t v33 = TLV8BufferAppend();
      if (v33) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = v32;
      }
      v30 += v34;
      if (v33) {
        BOOL v35 = 1;
      }
      else {
        BOOL v35 = v30 >= v31;
      }
    }
    while (!v35);
    uint64_t v11 = v33;

    if (v11) {
      goto LABEL_5;
    }
  }
  v27 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v41);
  id v8 = 0;
LABEL_37:
  TLV8BufferFree();

  return v27;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    v24 = 0;
    v23 = 0;
    id v12 = 0;
LABEL_25:
    [(HAPNFCAccessDeviceCredentialKeyRequest *)self setType:v12];
    [(HAPNFCAccessDeviceCredentialKeyRequest *)self setKey:v23];
    [(HAPNFCAccessDeviceCredentialKeyRequest *)self setIssuerKeyIdentifier:v24];
    [(HAPNFCAccessDeviceCredentialKeyRequest *)self setState:v11];
    [(HAPNFCAccessDeviceCredentialKeyRequest *)self setIdentifier:v10];
    id v9 = 0;
    BOOL v25 = 1;
  }
  else
  {
    v28 = a4;
    id v29 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v30 = 0;
    id v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v41 = 0;
      uint64_t v40 = 0;
      v39[0] = 0;
      v39[1] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v40)
      {
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v26;
        if (v26) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
      switch(v41)
      {
        case 1:
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v38 = v9;
          uint64_t v16 = +[HAPNFCAccessKeyTypeWrapper parsedFromData:v15 error:&v38];
          id v17 = v38;

          v18 = v12;
          id v12 = (void *)v16;
          break;
        case 2:
          id v37 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v39, &v37);
          id v17 = v37;

          if (v17) {
            goto LABEL_15;
          }
          id v36 = 0;
          uint64_t v19 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v36];
          id v17 = v36;
          v18 = v30;
          unint64_t v30 = (void *)v19;
          break;
        case 3:
          id v35 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v39, &v35);
          id v17 = v35;

          if (v17) {
            goto LABEL_15;
          }
          id v34 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v34];
          id v17 = v34;
          v18 = v29;
          id v29 = (void *)v20;
          break;
        case 4:
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v33 = v9;
          uint64_t v21 = +[HAPNFCAccessKeyStateWrapper parsedFromData:v15 error:&v33];
          id v17 = v33;

          v18 = v11;
          uint64_t v11 = (void *)v21;
          break;
        case 5:
          id v32 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(5, v7, v13, v39, &v32);
          id v17 = v32;

          if (v17) {
            goto LABEL_15;
          }
          id v31 = 0;
          uint64_t v22 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v31];
          id v17 = v31;
          v18 = v10;
          uint64_t v10 = (void *)v22;
          break;
        default:
          goto LABEL_16;
      }

LABEL_15:
      id v9 = v17;
LABEL_16:
      unint64_t v7 = v39[0];
      if (v39[0] >= v13)
      {
        if (v9)
        {
LABEL_18:
          v24 = v29;
          v23 = v30;
          if (v28)
          {
            id v9 = v9;
            BOOL v25 = 0;
            id *v28 = v9;
          }
          else
          {
            BOOL v25 = 0;
          }
          goto LABEL_29;
        }
LABEL_24:
        v24 = v29;
        v23 = v30;
        goto LABEL_25;
      }
    }
    if (v28)
    {
      HMErrorFromOSStatus(Next);
      BOOL v25 = 0;
      id *v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v25 = 0;
    }
    v24 = v29;
    v23 = v30;
  }
LABEL_29:

  return v25;
}

- (HAPNFCAccessDeviceCredentialKeyRequest)initWithType:(id)a3 key:(id)a4 issuerKeyIdentifier:(id)a5 state:(id)a6 identifier:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPNFCAccessDeviceCredentialKeyRequest;
  id v17 = [(HAPNFCAccessDeviceCredentialKeyRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_key, a4);
    objc_storeStrong((id *)&v18->_issuerKeyIdentifier, a5);
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong((id *)&v18->_identifier, a7);
  }

  return v18;
}

- (HAPNFCAccessDeviceCredentialKeyRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessDeviceCredentialKeyRequest;
  return [(HAPNFCAccessDeviceCredentialKeyRequest *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPNFCAccessDeviceCredentialKeyRequest);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPNFCAccessDeviceCredentialKeyRequest *)v6 parseFromData:v5 error:&v10];
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