@interface HAP2TLVAccessorySignatureReadRequest
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVAccessorySignatureReadRequest)init;
- (HAP2TLVAccessorySignatureReadRequest)initWithAccessoryList:(id)a3;
- (HAP2TLVParamAccessoryList)accessoryList;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAccessoryList:(id)a3;
@end

@implementation HAP2TLVAccessorySignatureReadRequest

- (void).cxx_destruct
{
}

- (void)setAccessoryList:(id)a3
{
}

- (HAP2TLVParamAccessoryList)accessoryList
{
  return self->_accessoryList;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];
  v4 = [v2 stringWithFormat:@"<HAP2TLVAccessorySignatureReadRequest accessoryList=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAP2TLVAccessorySignatureReadRequest *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];
      v7 = [(HAP2TLVAccessorySignatureReadRequest *)v5 accessoryList];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];
        v9 = [(HAP2TLVAccessorySignatureReadRequest *)v5 accessoryList];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAP2TLVAccessorySignatureReadRequest allocWithZone:a3];
  v5 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];
  v6 = [(HAP2TLVAccessorySignatureReadRequest *)v4 initWithAccessoryList:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  TLV8BufferInit();
  v5 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];

  if (!v5) {
    goto LABEL_21;
  }
  v6 = [(HAP2TLVAccessorySignatureReadRequest *)self accessoryList];
  id v20 = 0;
  v7 = [v6 serializeWithError:&v20];
  id v8 = v20;

  if (!v8)
  {
    id v10 = v7;
    unint64_t v11 = [v10 bytes];
    unint64_t v12 = v11 + [v10 length];
    do
    {
      if ((uint64_t)(v12 - v11) >= 255) {
        uint64_t v13 = 255;
      }
      else {
        uint64_t v13 = v12 - v11;
      }
      uint64_t v14 = TLV8BufferAppend();
      if (v14) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v13;
      }
      v11 += v15;
      if (v14) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v11 >= v12;
      }
    }
    while (!v16);
    uint64_t v17 = v14;

    if (v17)
    {
      if (a3)
      {
        HMErrorFromOSStatus(v17);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_20;
      }
      id v8 = 0;
      goto LABEL_23;
    }
LABEL_21:
    v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v21);
    id v8 = 0;
    goto LABEL_24;
  }

  if (a3)
  {
    id v9 = v8;
    id v8 = v9;
LABEL_20:
    v18 = 0;
    *a3 = v9;
    goto LABEL_24;
  }
LABEL_23:
  v18 = 0;
LABEL_24:
  TLV8BufferFree();

  return v18;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    id v9 = 0;
LABEL_13:
    [(HAP2TLVAccessorySignatureReadRequest *)self setAccessoryList:v9];
    id v10 = 0;
    BOOL v16 = 1;
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
    unint64_t v11 = v7 + v8;
    while (1)
    {
      char v24 = 0;
      v22[1] = 0;
      uint64_t v23 = 0;
      v22[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v23)
      {
        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v10 = (void *)v18;
        if (!v18) {
          goto LABEL_13;
        }
LABEL_17:
        if (a4)
        {
          id v17 = v10;
          id v10 = v17;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      if (v24 == 24)
      {
        id v21 = v10;
        uint64_t v13 = HAPTLVParseContiguousTlvs(24, v7, v11, v22, &v21);
        id v14 = v21;

        if (!v14)
        {
          id v20 = 0;
          uint64_t v15 = +[HAP2TLVParamAccessoryList parsedFromData:v13 error:&v20];
          id v14 = v20;

          id v9 = (void *)v15;
        }

        id v10 = v14;
      }
      unint64_t v7 = v22[0];
      if (v22[0] >= v11)
      {
        if (!v10) {
          goto LABEL_13;
        }
        goto LABEL_17;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      BOOL v16 = 0;
      *a4 = v17;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v16 = 0;
  }
LABEL_21:

  return v16;
}

- (HAP2TLVAccessorySignatureReadRequest)initWithAccessoryList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2TLVAccessorySignatureReadRequest;
  id v6 = [(HAP2TLVAccessorySignatureReadRequest *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryList, a3);
  }

  return v7;
}

- (HAP2TLVAccessorySignatureReadRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVAccessorySignatureReadRequest;
  return [(HAP2TLVAccessorySignatureReadRequest *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVAccessorySignatureReadRequest);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVAccessorySignatureReadRequest *)v6 parseFromData:v5 error:&v10];
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