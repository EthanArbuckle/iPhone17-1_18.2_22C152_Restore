@interface HAPNFCAccessDeviceCredentialKeyResponse
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPNFCAccessDeviceCredentialKeyResponse)init;
- (HAPNFCAccessDeviceCredentialKeyResponse)initWithIdentifier:(id)a3 issuerKeyIdentifier:(id)a4 statusCode:(id)a5;
- (HAPNFCAccessResponseStatusWrapper)statusCode;
- (NSData)identifier;
- (NSData)issuerKeyIdentifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setIssuerKeyIdentifier:(id)a3;
- (void)setStatusCode:(id)a3;
@end

@implementation HAPNFCAccessDeviceCredentialKeyResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setStatusCode:(id)a3
{
}

- (HAPNFCAccessResponseStatusWrapper)statusCode
{
  return self->_statusCode;
}

- (void)setIssuerKeyIdentifier:(id)a3
{
}

- (NSData)issuerKeyIdentifier
{
  return self->_issuerKeyIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];
  v5 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];
  v6 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];
  v7 = [v3 stringWithFormat:@"<HAPNFCAccessDeviceCredentialKeyResponse identifier=%@, issuerKeyIdentifier=%@, statusCode=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPNFCAccessDeviceCredentialKeyResponse *)a3;
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
      v8 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];
      v9 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 identifier];
      if (v8 != v9)
      {
        v3 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];
        v4 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 identifier];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];
      v12 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 issuerKeyIdentifier];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];
        v26 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 issuerKeyIdentifier];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];
      uint64_t v15 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 statusCode];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];
        v17 = v23 = v3;
        [(HAPNFCAccessDeviceCredentialKeyResponse *)v7 statusCode];
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
  v4 = +[HAPNFCAccessDeviceCredentialKeyResponse allocWithZone:a3];
  v5 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];
  v6 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];
  v7 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];
  v8 = [(HAPNFCAccessDeviceCredentialKeyResponse *)v4 initWithIdentifier:v5 issuerKeyIdentifier:v6 statusCode:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
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
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  TLV8BufferInit();
  v5 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];

  if (v5)
  {
    v6 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self identifier];
    id v28 = 0;
    v7 = [v6 serializeWithError:&v28];
    id v8 = v28;

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
  v14 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];

  if (v14)
  {
    uint64_t v15 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self issuerKeyIdentifier];
    id v27 = 0;
    v7 = [v15 serializeWithError:&v27];
    id v8 = v27;

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
      goto LABEL_31;
    }
LABEL_21:

    if (a3)
    {
      id v21 = v8;
      id v8 = v21;
LABEL_26:
      v23 = 0;
      *a3 = v21;
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_19:
  v19 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];

  if (v19)
  {
    v20 = [(HAPNFCAccessDeviceCredentialKeyResponse *)self statusCode];
    id v26 = 0;
    v7 = [v20 serializeWithError:&v26];
    id v8 = v26;

    if (v8) {
      goto LABEL_21;
    }
    id v24 = v7;
    [v24 bytes];
    [v24 length];
    uint64_t v22 = TLV8BufferAppend();

    if (v22) {
      goto LABEL_24;
    }
  }
  v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v29);
  id v8 = 0;
LABEL_31:
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
    goto LABEL_25;
  }
  id v26 = self;
  id v27 = a4;
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = v7 + v8;
  do
  {
    char v35 = 0;
    v33[1] = 0;
    uint64_t v34 = 0;
    v33[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      id v21 = v27;
      if (v27)
      {
        HMErrorFromOSStatus(Next);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_26:
      BOOL v23 = 0;
      goto LABEL_27;
    }
    if (!v34)
    {
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_24;
      }
LABEL_17:
      id v21 = v27;
      if (v27)
      {
        id v22 = v9;
        id v9 = v22;
LABEL_22:
        BOOL v23 = 0;
        *id v21 = v22;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    switch(v35)
    {
      case 3:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v28 = v9;
        uint64_t v19 = +[HAPNFCAccessResponseStatusWrapper parsedFromData:v15 error:&v28];
        id v16 = v28;

        uint64_t v18 = v10;
        unint64_t v10 = (void *)v19;
        goto LABEL_13;
      case 2:
        id v30 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v33, &v30);
        id v16 = v30;

        if (!v16)
        {
          id v29 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v29];
          id v16 = v29;
          uint64_t v18 = v11;
          unint64_t v11 = (void *)v20;
          goto LABEL_13;
        }
        break;
      case 1:
        id v32 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(1, v7, v13, v33, &v32);
        id v16 = v32;

        if (!v16)
        {
          id v31 = 0;
          uint64_t v17 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v31];
          id v16 = v31;
          uint64_t v18 = v12;
          uint64_t v12 = (void *)v17;
LABEL_13:
        }
        break;
      default:
        goto LABEL_15;
    }

    id v9 = v16;
LABEL_15:
    unint64_t v7 = v33[0];
  }
  while (v33[0] < v13);
  if (v9) {
    goto LABEL_17;
  }
LABEL_24:
  self = v26;
LABEL_25:
  [(HAPNFCAccessDeviceCredentialKeyResponse *)self setIdentifier:v12];
  [(HAPNFCAccessDeviceCredentialKeyResponse *)self setIssuerKeyIdentifier:v11];
  [(HAPNFCAccessDeviceCredentialKeyResponse *)self setStatusCode:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (HAPNFCAccessDeviceCredentialKeyResponse)initWithIdentifier:(id)a3 issuerKeyIdentifier:(id)a4 statusCode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPNFCAccessDeviceCredentialKeyResponse;
  uint64_t v12 = [(HAPNFCAccessDeviceCredentialKeyResponse *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_issuerKeyIdentifier, a4);
    objc_storeStrong((id *)&v13->_statusCode, a5);
  }

  return v13;
}

- (HAPNFCAccessDeviceCredentialKeyResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessDeviceCredentialKeyResponse;
  return [(HAPNFCAccessDeviceCredentialKeyResponse *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPNFCAccessDeviceCredentialKeyResponse);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPNFCAccessDeviceCredentialKeyResponse *)v6 parseFromData:v5 error:&v10];
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