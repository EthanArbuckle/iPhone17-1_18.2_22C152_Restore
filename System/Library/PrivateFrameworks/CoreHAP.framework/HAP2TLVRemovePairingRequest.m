@interface HAP2TLVRemovePairingRequest
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVPairingMethodWrapper)method;
- (HAP2TLVPairingStateWrapper)state;
- (HAP2TLVRemovePairingRequest)init;
- (HAP2TLVRemovePairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setMethod:(id)a3;
- (void)setState:(id)a3;
@end

@implementation HAP2TLVRemovePairingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_method, 0);

  objc_storeStrong((id *)&self->_state, 0);
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
  v4 = [(HAP2TLVRemovePairingRequest *)self state];
  v5 = [(HAP2TLVRemovePairingRequest *)self method];
  v6 = [(HAP2TLVRemovePairingRequest *)self identifier];
  v7 = [v3 stringWithFormat:@"<HAP2TLVRemovePairingRequest state=%@, method=%@, identifier=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAP2TLVRemovePairingRequest *)a3;
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
      v8 = [(HAP2TLVRemovePairingRequest *)self state];
      v9 = [(HAP2TLVRemovePairingRequest *)v7 state];
      if (v8 != v9)
      {
        v3 = [(HAP2TLVRemovePairingRequest *)self state];
        v4 = [(HAP2TLVRemovePairingRequest *)v7 state];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAP2TLVRemovePairingRequest *)self method];
      v12 = [(HAP2TLVRemovePairingRequest *)v7 method];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAP2TLVRemovePairingRequest *)self method];
        v26 = [(HAP2TLVRemovePairingRequest *)v7 method];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAP2TLVRemovePairingRequest *)self identifier];
      uint64_t v15 = [(HAP2TLVRemovePairingRequest *)v7 identifier];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAP2TLVRemovePairingRequest *)self identifier];
        v17 = v23 = v3;
        [(HAP2TLVRemovePairingRequest *)v7 identifier];
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
  v4 = +[HAP2TLVRemovePairingRequest allocWithZone:a3];
  v5 = [(HAP2TLVRemovePairingRequest *)self state];
  v6 = [(HAP2TLVRemovePairingRequest *)self method];
  v7 = [(HAP2TLVRemovePairingRequest *)self identifier];
  v8 = [(HAP2TLVRemovePairingRequest *)v4 initWithState:v5 method:v6 identifier:v7];

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
  v5 = [(HAP2TLVRemovePairingRequest *)self state];

  if (v5)
  {
    v6 = [(HAP2TLVRemovePairingRequest *)self state];
    id v28 = 0;
    v7 = [v6 serializeWithError:&v28];
    id v8 = v28;

    if (v8) {
      goto LABEL_15;
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
LABEL_17:
        v17 = 0;
        *a3 = v14;
        goto LABEL_33;
      }
      id v8 = 0;
LABEL_18:
      v17 = 0;
      goto LABEL_33;
    }
  }
  v11 = [(HAP2TLVRemovePairingRequest *)self method];

  if (v11)
  {
    v12 = [(HAP2TLVRemovePairingRequest *)self method];
    id v27 = 0;
    v7 = [v12 serializeWithError:&v27];
    id v8 = v27;

    if (v8) {
      goto LABEL_15;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_8;
    }
  }
  uint64_t v15 = [(HAP2TLVRemovePairingRequest *)self identifier];

  if (v15)
  {
    v16 = [(HAP2TLVRemovePairingRequest *)self identifier];
    id v26 = 0;
    v7 = [v16 serializeWithError:&v26];
    id v8 = v26;

    if (v8)
    {
LABEL_15:

      if (a3)
      {
        id v14 = v8;
        id v8 = v14;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    id v18 = v7;
    unint64_t v19 = [v18 bytes];
    unint64_t v20 = v19 + [v18 length];
    do
    {
      if ((uint64_t)(v20 - v19) >= 255) {
        uint64_t v21 = 255;
      }
      else {
        uint64_t v21 = v20 - v19;
      }
      uint64_t v22 = TLV8BufferAppend();
      if (v22) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v21;
      }
      v19 += v23;
      if (v22) {
        BOOL v24 = 1;
      }
      else {
        BOOL v24 = v19 >= v20;
      }
    }
    while (!v24);
    uint64_t v13 = v22;

    if (v13) {
      goto LABEL_9;
    }
  }
  v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v29);
  id v8 = 0;
LABEL_33:
  TLV8BufferFree();

  return v17;
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
LABEL_18:
    [(HAP2TLVRemovePairingRequest *)self setState:v12];
    [(HAP2TLVRemovePairingRequest *)self setMethod:v11];
    [(HAP2TLVRemovePairingRequest *)self setIdentifier:v10];
    id v9 = 0;
    BOOL v21 = 1;
    goto LABEL_26;
  }
  id v26 = a4;
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
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
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v22 = v26;
      if (v26)
      {
        id v23 = v9;
        id v9 = v23;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    switch(v33)
    {
      case 0:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v29 = v9;
        uint64_t v19 = +[HAP2TLVPairingMethodWrapper parsedFromData:v15 error:&v29];
        id v17 = v29;

        id v18 = v11;
        v11 = (void *)v19;
        goto LABEL_12;
      case 1:
        id v28 = v9;
        uint64_t v15 = HAPTLVParseContiguousTlvs(1, v7, v13, v31, &v28);
        id v17 = v28;

        if (!v17)
        {
          id v27 = 0;
          uint64_t v20 = [NSString parsedFromData:v15 error:&v27];
          id v17 = v27;
          id v18 = v10;
          uint64_t v10 = (void *)v20;
LABEL_12:
        }
        id v9 = v17;
        break;
      case 6:
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v30 = v9;
        uint64_t v16 = +[HAP2TLVPairingStateWrapper parsedFromData:v15 error:&v30];
        id v17 = v30;

        id v18 = v12;
        v12 = (void *)v16;
        goto LABEL_12;
    }
    unint64_t v7 = v31[0];
    if (v31[0] >= v13)
    {
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  uint64_t v22 = v26;
  if (v26)
  {
    HMErrorFromOSStatus(Next);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
    BOOL v21 = 0;
    id *v22 = v23;
    goto LABEL_26;
  }
LABEL_25:
  BOOL v21 = 0;
LABEL_26:

  return v21;
}

- (HAP2TLVRemovePairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAP2TLVRemovePairingRequest;
  v12 = [(HAP2TLVRemovePairingRequest *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_method, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (HAP2TLVRemovePairingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVRemovePairingRequest;
  return [(HAP2TLVRemovePairingRequest *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVRemovePairingRequest);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVRemovePairingRequest *)v6 parseFromData:v5 error:&v10];
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