@interface HAPNFCAccessControl
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPNFCAccessControl)init;
- (HAPNFCAccessControl)initWithOperationType:(id)a3 issuerKeyRequest:(id)a4 issuerKeyResponse:(id)a5 deviceCredentialKeyRequest:(id)a6 deviceCredentialKeyResponse:(id)a7 readerKeyRequest:(id)a8 readerKeyResponse:(id)a9;
- (HAPNFCAccessDeviceCredentialKeyRequest)deviceCredentialKeyRequest;
- (HAPNFCAccessDeviceCredentialKeyResponse)deviceCredentialKeyResponse;
- (HAPNFCAccessIssuerKeyRequest)issuerKeyRequest;
- (HAPNFCAccessIssuerKeyResponse)issuerKeyResponse;
- (HAPNFCAccessOperationTypeWrapper)operationType;
- (HAPNFCAccessReaderKeyRequest)readerKeyRequest;
- (HAPNFCAccessReaderKeyResponse)readerKeyResponse;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDeviceCredentialKeyRequest:(id)a3;
- (void)setDeviceCredentialKeyResponse:(id)a3;
- (void)setIssuerKeyRequest:(id)a3;
- (void)setIssuerKeyResponse:(id)a3;
- (void)setOperationType:(id)a3;
- (void)setReaderKeyRequest:(id)a3;
- (void)setReaderKeyResponse:(id)a3;
@end

@implementation HAPNFCAccessControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerKeyResponse, 0);
  objc_storeStrong((id *)&self->_readerKeyRequest, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKeyResponse, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKeyRequest, 0);
  objc_storeStrong((id *)&self->_issuerKeyResponse, 0);
  objc_storeStrong((id *)&self->_issuerKeyRequest, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (void)setReaderKeyResponse:(id)a3
{
}

- (HAPNFCAccessReaderKeyResponse)readerKeyResponse
{
  return self->_readerKeyResponse;
}

- (void)setReaderKeyRequest:(id)a3
{
}

- (HAPNFCAccessReaderKeyRequest)readerKeyRequest
{
  return self->_readerKeyRequest;
}

- (void)setDeviceCredentialKeyResponse:(id)a3
{
}

- (HAPNFCAccessDeviceCredentialKeyResponse)deviceCredentialKeyResponse
{
  return self->_deviceCredentialKeyResponse;
}

- (void)setDeviceCredentialKeyRequest:(id)a3
{
}

- (HAPNFCAccessDeviceCredentialKeyRequest)deviceCredentialKeyRequest
{
  return self->_deviceCredentialKeyRequest;
}

- (void)setIssuerKeyResponse:(id)a3
{
}

- (HAPNFCAccessIssuerKeyResponse)issuerKeyResponse
{
  return self->_issuerKeyResponse;
}

- (void)setIssuerKeyRequest:(id)a3
{
}

- (HAPNFCAccessIssuerKeyRequest)issuerKeyRequest
{
  return self->_issuerKeyRequest;
}

- (void)setOperationType:(id)a3
{
}

- (HAPNFCAccessOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPNFCAccessControl *)self operationType];
  v5 = [(HAPNFCAccessControl *)self issuerKeyRequest];
  v6 = [(HAPNFCAccessControl *)self issuerKeyResponse];
  v7 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];
  v8 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];
  v9 = [(HAPNFCAccessControl *)self readerKeyRequest];
  v10 = [(HAPNFCAccessControl *)self readerKeyResponse];
  v11 = [v3 stringWithFormat:@"<HAPNFCAccessControl operationType=%@, issuerKeyRequest=%@, issuerKeyResponse=%@, deviceCredentialKeyRequest=%@, deviceCredentialKeyResponse=%@, readerKeyRequest=%@, readerKeyResponse=%@>", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPNFCAccessControl *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HAPNFCAccessControl *)self operationType];
      v8 = [(HAPNFCAccessControl *)v6 operationType];
      if (v7 != v8)
      {
        v9 = [(HAPNFCAccessControl *)self operationType];
        v10 = [(HAPNFCAccessControl *)v6 operationType];
        v54 = v9;
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_45;
        }
        v53 = v10;
      }
      v12 = [(HAPNFCAccessControl *)self issuerKeyRequest];
      v13 = [(HAPNFCAccessControl *)v6 issuerKeyRequest];
      if (v12 == v13)
      {
        v51 = v12;
      }
      else
      {
        v3 = [(HAPNFCAccessControl *)self issuerKeyRequest];
        v52 = [(HAPNFCAccessControl *)v6 issuerKeyRequest];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v11 = 0;
LABEL_43:

LABEL_44:
          v10 = v53;
          if (v7 == v8)
          {
LABEL_46:

            goto LABEL_47;
          }
LABEL_45:

          goto LABEL_46;
        }
        v51 = v12;
      }
      v14 = [(HAPNFCAccessControl *)self issuerKeyResponse];
      [(HAPNFCAccessControl *)v6 issuerKeyResponse];
      uint64_t v49 = v50 = v14;
      if (v14 != (void *)v49)
      {
        v15 = [(HAPNFCAccessControl *)self issuerKeyResponse];
        v47 = [(HAPNFCAccessControl *)v6 issuerKeyResponse];
        v48 = v15;
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v16 = v3;
          char v11 = 0;
          v17 = (void *)v49;
LABEL_41:

LABEL_42:
          v12 = v51;
          v3 = v16;
          if (v51 == v13) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }
      }
      v18 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];
      uint64_t v46 = [(HAPNFCAccessControl *)v6 deviceCredentialKeyRequest];
      if (v18 == (void *)v46)
      {
        v42 = v13;
      }
      else
      {
        v19 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];
        v43 = [(HAPNFCAccessControl *)v6 deviceCredentialKeyRequest];
        v44 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v16 = v3;
          char v11 = 0;
          v22 = (void *)v46;
LABEL_39:

LABEL_40:
          v14 = v50;
          v17 = (void *)v49;
          if (v50 == (void *)v49) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
        v42 = v13;
      }
      v20 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];
      v45 = [(HAPNFCAccessControl *)v6 deviceCredentialKeyResponse];
      if (v20 != v45)
      {
        v21 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];
        v40 = [(HAPNFCAccessControl *)v6 deviceCredentialKeyResponse];
        v41 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v23 = [(HAPNFCAccessControl *)self readerKeyRequest];
      uint64_t v39 = [(HAPNFCAccessControl *)v6 readerKeyRequest];
      if (v23 == v39)
      {
        v34 = v20;
        v35 = v3;
      }
      else
      {
        v24 = [(HAPNFCAccessControl *)self readerKeyRequest];
        v36 = [(HAPNFCAccessControl *)v6 readerKeyRequest];
        v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          char v11 = 0;
          v30 = (void *)v23;
          v31 = (void *)v39;
          goto LABEL_34;
        }
        v34 = v20;
        v35 = v3;
      }
      uint64_t v38 = v23;
      v25 = [(HAPNFCAccessControl *)self readerKeyResponse];
      uint64_t v26 = [(HAPNFCAccessControl *)v6 readerKeyResponse];
      if (v25 == (void *)v26)
      {

        char v11 = 1;
      }
      else
      {
        v27 = (void *)v26;
        v28 = [(HAPNFCAccessControl *)self readerKeyResponse];
        [(HAPNFCAccessControl *)v6 readerKeyResponse];
        v29 = v33 = v18;
        char v11 = [v28 isEqual:v29];

        v18 = v33;
      }
      v30 = (void *)v23;
      v31 = (void *)v39;
      v20 = v34;
      v3 = v35;
      if (v38 == v39)
      {
LABEL_35:

        if (v20 == v45)
        {
          v16 = v3;
LABEL_38:

          v22 = (void *)v46;
          v13 = v42;
          if (v18 == (void *)v46) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
LABEL_36:
        v16 = v3;

        goto LABEL_38;
      }
LABEL_34:

      goto LABEL_35;
    }
    char v11 = 0;
  }
LABEL_47:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPNFCAccessControl allocWithZone:a3];
  v5 = [(HAPNFCAccessControl *)self operationType];
  v6 = [(HAPNFCAccessControl *)self issuerKeyRequest];
  v7 = [(HAPNFCAccessControl *)self issuerKeyResponse];
  v8 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];
  v9 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];
  v10 = [(HAPNFCAccessControl *)self readerKeyRequest];
  char v11 = [(HAPNFCAccessControl *)self readerKeyResponse];
  v12 = [(HAPNFCAccessControl *)v4 initWithOperationType:v5 issuerKeyRequest:v6 issuerKeyResponse:v7 deviceCredentialKeyRequest:v8 deviceCredentialKeyResponse:v9 readerKeyRequest:v10 readerKeyResponse:v11];

  return v12;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  TLV8BufferInit();
  v5 = [(HAPNFCAccessControl *)self operationType];

  if (v5)
  {
    v6 = [(HAPNFCAccessControl *)self operationType];
    id v56 = 0;
    v7 = [v6 serializeWithError:&v56];
    id v8 = v56;

    if (v8) {
      goto LABEL_51;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_54:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_56;
      }
      id v8 = 0;
LABEL_58:
      v41 = 0;
      goto LABEL_59;
    }
  }
  char v11 = [(HAPNFCAccessControl *)self issuerKeyRequest];

  if (v11)
  {
    v12 = [(HAPNFCAccessControl *)self issuerKeyRequest];
    id v55 = 0;
    v7 = [v12 serializeWithError:&v55];
    id v8 = v55;

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
          goto LABEL_53;
        }
        v14 += v16;
        if (v14 >= v15)
        {

          goto LABEL_13;
        }
      }
    }
LABEL_51:

    if (a3)
    {
      id v40 = v8;
      id v8 = v40;
LABEL_56:
      v41 = 0;
      *a3 = v40;
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_13:
  v18 = [(HAPNFCAccessControl *)self issuerKeyResponse];

  if (v18)
  {
    v19 = [(HAPNFCAccessControl *)self issuerKeyResponse];
    id v54 = 0;
    v7 = [v19 serializeWithError:&v54];
    id v8 = v54;

    if (v8) {
      goto LABEL_51;
    }
    id v13 = v7;
    unint64_t v20 = [v13 bytes];
    unint64_t v21 = v20 + [v13 length];
    while (1)
    {
      uint64_t v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
      uint64_t v17 = TLV8BufferAppend();
      if (v17) {
        goto LABEL_53;
      }
      v20 += v22;
      if (v20 >= v21)
      {

        break;
      }
    }
  }
  uint64_t v23 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];

  if (v23)
  {
    v24 = [(HAPNFCAccessControl *)self deviceCredentialKeyRequest];
    id v53 = 0;
    v7 = [v24 serializeWithError:&v53];
    id v8 = v53;

    if (v8) {
      goto LABEL_51;
    }
    id v13 = v7;
    unint64_t v25 = [v13 bytes];
    unint64_t v26 = v25 + [v13 length];
    while (1)
    {
      uint64_t v27 = (uint64_t)(v26 - v25) >= 255 ? 255 : v26 - v25;
      uint64_t v17 = TLV8BufferAppend();
      if (v17) {
        goto LABEL_53;
      }
      v25 += v27;
      if (v25 >= v26)
      {

        break;
      }
    }
  }
  v28 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];

  if (v28)
  {
    v29 = [(HAPNFCAccessControl *)self deviceCredentialKeyResponse];
    id v52 = 0;
    v7 = [v29 serializeWithError:&v52];
    id v8 = v52;

    if (v8) {
      goto LABEL_51;
    }
    id v13 = v7;
    unint64_t v30 = [v13 bytes];
    unint64_t v31 = v30 + [v13 length];
    while (1)
    {
      uint64_t v32 = (uint64_t)(v31 - v30) >= 255 ? 255 : v31 - v30;
      uint64_t v17 = TLV8BufferAppend();
      if (v17) {
        goto LABEL_53;
      }
      v30 += v32;
      if (v30 >= v31)
      {

        break;
      }
    }
  }
  v33 = [(HAPNFCAccessControl *)self readerKeyRequest];

  if (v33)
  {
    v34 = [(HAPNFCAccessControl *)self readerKeyRequest];
    id v51 = 0;
    v7 = [v34 serializeWithError:&v51];
    id v8 = v51;

    if (v8) {
      goto LABEL_51;
    }
    id v13 = v7;
    unint64_t v35 = [v13 bytes];
    unint64_t v36 = v35 + [v13 length];
    while (1)
    {
      uint64_t v37 = (uint64_t)(v36 - v35) >= 255 ? 255 : v36 - v35;
      uint64_t v17 = TLV8BufferAppend();
      if (v17) {
        break;
      }
      v35 += v37;
      if (v35 >= v36)
      {

        goto LABEL_49;
      }
    }
LABEL_53:
    uint64_t v10 = v17;

    goto LABEL_54;
  }
LABEL_49:
  uint64_t v38 = [(HAPNFCAccessControl *)self readerKeyResponse];

  if (v38)
  {
    uint64_t v39 = [(HAPNFCAccessControl *)self readerKeyResponse];
    id v50 = 0;
    v7 = [v39 serializeWithError:&v50];
    id v8 = v50;

    if (v8) {
      goto LABEL_51;
    }
    id v43 = v7;
    unint64_t v44 = [v43 bytes];
    unint64_t v45 = v44 + [v43 length];
    do
    {
      if ((uint64_t)(v45 - v44) >= 255) {
        uint64_t v46 = 255;
      }
      else {
        uint64_t v46 = v45 - v44;
      }
      uint64_t v47 = TLV8BufferAppend();
      if (v47) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = v46;
      }
      v44 += v48;
      if (v47) {
        BOOL v49 = 1;
      }
      else {
        BOOL v49 = v44 >= v45;
      }
    }
    while (!v49);
    uint64_t v10 = v47;

    if (v10) {
      goto LABEL_54;
    }
  }
  v41 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v57);
  id v8 = 0;
LABEL_59:
  TLV8BufferFree();

  return v41;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  if (v7 < 1)
  {
    id v9 = 0;
    v24 = 0;
    uint64_t v10 = 0;
    char v11 = 0;
    v28 = 0;
    unint64_t v26 = 0;
    unint64_t v25 = 0;
LABEL_30:
    [(HAPNFCAccessControl *)self setOperationType:v9];
    [(HAPNFCAccessControl *)self setIssuerKeyRequest:v24];
    [(HAPNFCAccessControl *)self setIssuerKeyResponse:v25];
    [(HAPNFCAccessControl *)self setDeviceCredentialKeyRequest:v26];
    [(HAPNFCAccessControl *)self setDeviceCredentialKeyResponse:v28];
    [(HAPNFCAccessControl *)self setReaderKeyRequest:v11];
    [(HAPNFCAccessControl *)self setReaderKeyResponse:v10];
    id v8 = 0;
    unint64_t v30 = v28;
    BOOL v27 = 1;
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    uint64_t v10 = 0;
    char v11 = 0;
    v33 = 0;
    v34 = 0;
    unint64_t v12 = v6 + v7;
    while (1)
    {
      char v52 = 0;
      v50[1] = 0;
      uint64_t v51 = 0;
      v50[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v51)
      {
        uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v8 = (id)v29;
        if (v29) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      switch(v52)
      {
        case 1:
          unint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v49 = v8;
          uint64_t v15 = +[HAPNFCAccessOperationTypeWrapper parsedFromData:v14 error:&v49];
          id v16 = v49;

          uint64_t v17 = v9;
          id v9 = (void *)v15;
          break;
        case 2:
          id v48 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(2, v6, v12, v50, &v48);
          id v16 = v48;

          if (v16) {
            goto LABEL_20;
          }
          id v47 = 0;
          uint64_t v18 = +[HAPNFCAccessIssuerKeyRequest parsedFromData:v14 error:&v47];
          id v16 = v47;
          uint64_t v17 = v36;
          unint64_t v36 = (void *)v18;
          break;
        case 3:
          id v46 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(3, v6, v12, v50, &v46);
          id v16 = v46;

          if (v16) {
            goto LABEL_20;
          }
          id v45 = 0;
          uint64_t v19 = +[HAPNFCAccessIssuerKeyResponse parsedFromData:v14 error:&v45];
          id v16 = v45;
          uint64_t v17 = v35;
          unint64_t v35 = (void *)v19;
          break;
        case 4:
          id v44 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(4, v6, v12, v50, &v44);
          id v16 = v44;

          if (v16) {
            goto LABEL_20;
          }
          id v43 = 0;
          uint64_t v20 = +[HAPNFCAccessDeviceCredentialKeyRequest parsedFromData:v14 error:&v43];
          id v16 = v43;
          uint64_t v17 = v34;
          v34 = (void *)v20;
          break;
        case 5:
          id v42 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(5, v6, v12, v50, &v42);
          id v16 = v42;

          if (v16) {
            goto LABEL_20;
          }
          id v41 = 0;
          uint64_t v21 = +[HAPNFCAccessDeviceCredentialKeyResponse parsedFromData:v14 error:&v41];
          id v16 = v41;
          uint64_t v17 = v33;
          v33 = (void *)v21;
          break;
        case 6:
          id v40 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(6, v6, v12, v50, &v40);
          id v16 = v40;

          if (v16) {
            goto LABEL_20;
          }
          id v39 = 0;
          uint64_t v22 = +[HAPNFCAccessReaderKeyRequest parsedFromData:v14 error:&v39];
          id v16 = v39;
          uint64_t v17 = v11;
          char v11 = (void *)v22;
          break;
        case 7:
          id v38 = v8;
          unint64_t v14 = HAPTLVParseContiguousTlvs(7, v6, v12, v50, &v38);
          id v16 = v38;

          if (v16) {
            goto LABEL_20;
          }
          id v37 = 0;
          uint64_t v23 = +[HAPNFCAccessReaderKeyResponse parsedFromData:v14 error:&v37];
          id v16 = v37;
          uint64_t v17 = v10;
          uint64_t v10 = (void *)v23;
          break;
        default:
          goto LABEL_21;
      }

LABEL_20:
      id v8 = v16;
LABEL_21:
      unint64_t v6 = v50[0];
      if (v50[0] >= v12)
      {
        if (v8)
        {
LABEL_23:
          unint64_t v25 = v35;
          v24 = v36;
          unint64_t v26 = v34;
          if (a4)
          {
            id v8 = v8;
            BOOL v27 = 0;
            *a4 = v8;
          }
          else
          {
            BOOL v27 = 0;
          }
          goto LABEL_34;
        }
LABEL_29:
        unint64_t v25 = v35;
        v24 = v36;
        v28 = v33;
        unint64_t v26 = v34;
        goto LABEL_30;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      BOOL v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v27 = 0;
    }
    unint64_t v25 = v35;
    v24 = v36;
    unint64_t v26 = v34;
LABEL_34:
    unint64_t v30 = v33;
  }

  return v27;
}

- (HAPNFCAccessControl)initWithOperationType:(id)a3 issuerKeyRequest:(id)a4 issuerKeyResponse:(id)a5 deviceCredentialKeyRequest:(id)a6 deviceCredentialKeyResponse:(id)a7 readerKeyRequest:(id)a8 readerKeyResponse:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HAPNFCAccessControl;
  uint64_t v18 = [(HAPNFCAccessControl *)&v26 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationType, a3);
    objc_storeStrong((id *)&v19->_issuerKeyRequest, a4);
    objc_storeStrong((id *)&v19->_issuerKeyResponse, a5);
    objc_storeStrong((id *)&v19->_deviceCredentialKeyRequest, a6);
    objc_storeStrong((id *)&v19->_deviceCredentialKeyResponse, a7);
    objc_storeStrong((id *)&v19->_readerKeyRequest, a8);
    objc_storeStrong((id *)&v19->_readerKeyResponse, a9);
  }

  return v19;
}

- (HAPNFCAccessControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessControl;
  return [(HAPNFCAccessControl *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HAPNFCAccessControl);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPNFCAccessControl *)v6 parseFromData:v5 error:&v10];
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