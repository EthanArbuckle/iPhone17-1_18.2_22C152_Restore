@interface HAP2TLVAddPairingRequest
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVAddPairingRequest)init;
- (HAP2TLVAddPairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5 publicKey:(id)a6 permissions:(id)a7;
- (HAP2TLVPairingMethodWrapper)method;
- (HAP2TLVPairingStateWrapper)state;
- (HAPTLVUnsignedNumberValue)permissions;
- (NSData)publicKey;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setMethod:(id)a3;
- (void)setPermissions:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setState:(id)a3;
@end

@implementation HAP2TLVAddPairingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_method, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setPermissions:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)permissions
{
  return self->_permissions;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setMethod:(id)a3
{
}

- (HAP2TLVPairingMethodWrapper)method
{
  return self->_method;
}

- (void)setState:(id)a3
{
}

- (HAP2TLVPairingStateWrapper)state
{
  return self->_state;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAP2TLVAddPairingRequest *)self state];
  v5 = [(HAP2TLVAddPairingRequest *)self method];
  v6 = [(HAP2TLVAddPairingRequest *)self identifier];
  v7 = [(HAP2TLVAddPairingRequest *)self publicKey];
  v8 = [(HAP2TLVAddPairingRequest *)self permissions];
  v9 = [v3 stringWithFormat:@"<HAP2TLVAddPairingRequest state=%@, method=%@, identifier=%@, publicKey=%@, permissions=%@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAP2TLVAddPairingRequest *)a3;
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
      v7 = [(HAP2TLVAddPairingRequest *)self state];
      v8 = [(HAP2TLVAddPairingRequest *)v6 state];
      if (v7 != v8)
      {
        v9 = [(HAP2TLVAddPairingRequest *)self state];
        [(HAP2TLVAddPairingRequest *)v6 state];
        v38 = v39 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      v11 = [(HAP2TLVAddPairingRequest *)self method];
      v12 = [(HAP2TLVAddPairingRequest *)v6 method];
      if (v11 != v12)
      {
        v3 = [(HAP2TLVAddPairingRequest *)self method];
        v35 = [(HAP2TLVAddPairingRequest *)v6 method];
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
      uint64_t v13 = [(HAP2TLVAddPairingRequest *)self identifier];
      uint64_t v36 = [(HAP2TLVAddPairingRequest *)v6 identifier];
      v37 = (void *)v13;
      if (v13 != v36)
      {
        v14 = [(HAP2TLVAddPairingRequest *)self identifier];
        v33 = [(HAP2TLVAddPairingRequest *)v6 identifier];
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
      v17 = [(HAP2TLVAddPairingRequest *)self publicKey];
      v18 = [(HAP2TLVAddPairingRequest *)v6 publicKey];
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        v19 = [(HAP2TLVAddPairingRequest *)self publicKey];
        v30 = [(HAP2TLVAddPairingRequest *)v6 publicKey];
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          char v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      v20 = [(HAP2TLVAddPairingRequest *)self permissions];
      uint64_t v21 = [(HAP2TLVAddPairingRequest *)v6 permissions];
      if (v20 == (void *)v21)
      {

        char v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        [(HAP2TLVAddPairingRequest *)self permissions];
        v23 = v27 = v17;
        [(HAP2TLVAddPairingRequest *)v6 permissions];
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
  v4 = +[HAP2TLVAddPairingRequest allocWithZone:a3];
  v5 = [(HAP2TLVAddPairingRequest *)self state];
  v6 = [(HAP2TLVAddPairingRequest *)self method];
  v7 = [(HAP2TLVAddPairingRequest *)self identifier];
  v8 = [(HAP2TLVAddPairingRequest *)self publicKey];
  v9 = [(HAP2TLVAddPairingRequest *)self permissions];
  char v10 = [(HAP2TLVAddPairingRequest *)v4 initWithState:v5 method:v6 identifier:v7 publicKey:v8 permissions:v9];

  return v10;
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
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  TLV8BufferInit();
  v5 = [(HAP2TLVAddPairingRequest *)self state];

  if (v5)
  {
    v6 = [(HAP2TLVAddPairingRequest *)self state];
    id v34 = 0;
    v7 = [v6 serializeWithError:&v34];
    id v8 = v34;

    if (v8) {
      goto LABEL_33;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_8:
      uint64_t v13 = v10;

LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus(v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
LABEL_35:
        v27 = 0;
        *a3 = v14;
        goto LABEL_37;
      }
      id v8 = 0;
LABEL_36:
      v27 = 0;
      goto LABEL_37;
    }
  }
  v11 = [(HAP2TLVAddPairingRequest *)self method];

  if (v11)
  {
    v12 = [(HAP2TLVAddPairingRequest *)self method];
    id v33 = 0;
    v7 = [v12 serializeWithError:&v33];
    id v8 = v33;

    if (v8) {
      goto LABEL_33;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_8;
    }
  }
  v15 = [(HAP2TLVAddPairingRequest *)self identifier];

  if (v15)
  {
    v16 = [(HAP2TLVAddPairingRequest *)self identifier];
    id v32 = 0;
    v7 = [v16 serializeWithError:&v32];
    id v8 = v32;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v17 = [v9 bytes];
      unint64_t v18 = v17 + [v9 length];
      while (1)
      {
        uint64_t v19 = (uint64_t)(v18 - v17) >= 255 ? 255 : v18 - v17;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_8;
        }
        v17 += v19;
        if (v17 >= v18)
        {

          goto LABEL_22;
        }
      }
    }
    goto LABEL_33;
  }
LABEL_22:
  v20 = [(HAP2TLVAddPairingRequest *)self publicKey];

  if (v20)
  {
    uint64_t v21 = [(HAP2TLVAddPairingRequest *)self publicKey];
    id v31 = 0;
    v7 = [v21 serializeWithError:&v31];
    id v8 = v31;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v22 = [v9 bytes];
      unint64_t v23 = v22 + [v9 length];
      while (1)
      {
        uint64_t v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_8;
        }
        v22 += v24;
        if (v22 >= v23)
        {

          goto LABEL_31;
        }
      }
    }
LABEL_33:

    if (a3)
    {
      id v14 = v8;
      id v8 = v14;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
LABEL_31:
  v25 = [(HAP2TLVAddPairingRequest *)self permissions];

  if (v25)
  {
    v26 = [(HAP2TLVAddPairingRequest *)self permissions];
    id v30 = 0;
    v7 = [v26 serializeWithError:&v30];
    id v8 = v30;

    if (v8) {
      goto LABEL_33;
    }
    id v29 = v7;
    [v29 bytes];
    [v29 length];
    uint64_t v13 = TLV8BufferAppend();

    if (v13) {
      goto LABEL_9;
    }
  }
  v27 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v35);
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
    uint64_t v24 = 0;
    unint64_t v23 = 0;
    v11 = 0;
    v12 = 0;
LABEL_24:
    -[HAP2TLVAddPairingRequest setState:](self, "setState:", v12, v28);
    [(HAP2TLVAddPairingRequest *)self setMethod:v11];
    [(HAP2TLVAddPairingRequest *)self setIdentifier:v23];
    [(HAP2TLVAddPairingRequest *)self setPublicKey:v24];
    [(HAP2TLVAddPairingRequest *)self setPermissions:v10];
    id v9 = 0;
    BOOL v25 = 1;
  }
  else
  {
    v28 = a4;
    id v29 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    id v30 = 0;
    v11 = 0;
    v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v40 = 0;
      v38[1] = 0;
      uint64_t v39 = 0;
      v38[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v39)
      {
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v26;
        if (v26) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
      switch(v40)
      {
        case 0:
          v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v36 = v9;
          uint64_t v16 = +[HAP2TLVPairingMethodWrapper parsedFromData:v15 error:&v36];
          id v17 = v36;

          unint64_t v18 = v11;
          v11 = (void *)v16;
          break;
        case 1:
          id v35 = v9;
          v15 = HAPTLVParseContiguousTlvs(1, v7, v13, v38, &v35);
          id v17 = v35;

          if (v17) {
            goto LABEL_14;
          }
          id v34 = 0;
          uint64_t v19 = [NSString parsedFromData:v15 error:&v34];
          id v17 = v34;
          unint64_t v18 = v30;
          id v30 = (void *)v19;
          break;
        case 3:
          id v33 = v9;
          v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v38, &v33);
          id v17 = v33;

          if (v17) {
            goto LABEL_14;
          }
          id v32 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v32];
          id v17 = v32;
          unint64_t v18 = v29;
          id v29 = (void *)v20;
          break;
        case 6:
          v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v37 = v9;
          uint64_t v21 = +[HAP2TLVPairingStateWrapper parsedFromData:v15 error:&v37];
          id v17 = v37;

          unint64_t v18 = v12;
          v12 = (void *)v21;
          break;
        case 11:
          v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v31 = v9;
          uint64_t v22 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v31];
          id v17 = v31;

          unint64_t v18 = v10;
          uint64_t v10 = (void *)v22;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      id v9 = v17;
LABEL_15:
      unint64_t v7 = v38[0];
      if (v38[0] >= v13)
      {
        if (v9)
        {
LABEL_17:
          uint64_t v24 = v29;
          unint64_t v23 = v30;
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
          goto LABEL_28;
        }
LABEL_23:
        uint64_t v24 = v29;
        unint64_t v23 = v30;
        goto LABEL_24;
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
    uint64_t v24 = v29;
    unint64_t v23 = v30;
  }
LABEL_28:

  return v25;
}

- (HAP2TLVAddPairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5 publicKey:(id)a6 permissions:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAP2TLVAddPairingRequest;
  id v17 = [(HAP2TLVAddPairingRequest *)&v21 init];
  unint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_state, a3);
    objc_storeStrong((id *)&v18->_method, a4);
    objc_storeStrong((id *)&v18->_identifier, a5);
    objc_storeStrong((id *)&v18->_publicKey, a6);
    objc_storeStrong((id *)&v18->_permissions, a7);
  }

  return v18;
}

- (HAP2TLVAddPairingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVAddPairingRequest;
  return [(HAP2TLVAddPairingRequest *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVAddPairingRequest);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVAddPairingRequest *)v6 parseFromData:v5 error:&v10];
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