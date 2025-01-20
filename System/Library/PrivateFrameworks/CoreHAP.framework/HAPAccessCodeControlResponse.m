@interface HAPAccessCodeControlResponse
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPAccessCodeControlResponse)init;
- (HAPAccessCodeControlResponse)initWithIdentifier:(id)a3 accessCode:(id)a4 flags:(id)a5 statusCode:(id)a6;
- (HAPAccessCodeFlagsWrapper)flags;
- (HAPAccessCodeResponseStatusWrapper)statusCode;
- (HAPTLVUnsignedNumberValue)identifier;
- (NSString)accessCode;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAccessCode:(id)a3;
- (void)setFlags:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStatusCode:(id)a3;
@end

@implementation HAPAccessCodeControlResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setStatusCode:(id)a3
{
}

- (HAPAccessCodeResponseStatusWrapper)statusCode
{
  return self->_statusCode;
}

- (void)setFlags:(id)a3
{
}

- (HAPAccessCodeFlagsWrapper)flags
{
  return self->_flags;
}

- (void)setAccessCode:(id)a3
{
}

- (NSString)accessCode
{
  return self->_accessCode;
}

- (void)setIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPAccessCodeControlResponse *)self identifier];
  v5 = [(HAPAccessCodeControlResponse *)self accessCode];
  v6 = [(HAPAccessCodeControlResponse *)self flags];
  v7 = [(HAPAccessCodeControlResponse *)self statusCode];
  v8 = [v3 stringWithFormat:@"<HAPAccessCodeControlResponse identifier=%@, accessCode=%@, flags=%@, statusCode=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPAccessCodeControlResponse *)a3;
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
      v7 = [(HAPAccessCodeControlResponse *)self identifier];
      v8 = [(HAPAccessCodeControlResponse *)v6 identifier];
      if (v7 != v8)
      {
        v9 = [(HAPAccessCodeControlResponse *)self identifier];
        v3 = [(HAPAccessCodeControlResponse *)v6 identifier];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HAPAccessCodeControlResponse *)self accessCode];
      v12 = [(HAPAccessCodeControlResponse *)v6 accessCode];
      if (v11 != v12)
      {
        v13 = [(HAPAccessCodeControlResponse *)self accessCode];
        v31 = [(HAPAccessCodeControlResponse *)v6 accessCode];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(HAPAccessCodeControlResponse *)self flags];
      v15 = [(HAPAccessCodeControlResponse *)v6 flags];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HAPAccessCodeControlResponse *)self flags];
        v27 = [(HAPAccessCodeControlResponse *)v6 flags];
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      v17 = [(HAPAccessCodeControlResponse *)self statusCode];
      uint64_t v18 = [(HAPAccessCodeControlResponse *)v6 statusCode];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HAPAccessCodeControlResponse *)self statusCode];
        v20 = v24 = v3;
        v21 = [(HAPAccessCodeControlResponse *)v6 statusCode];
        char v10 = [v20 isEqual:v21];

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPAccessCodeControlResponse allocWithZone:a3];
  v5 = [(HAPAccessCodeControlResponse *)self identifier];
  v6 = [(HAPAccessCodeControlResponse *)self accessCode];
  v7 = [(HAPAccessCodeControlResponse *)self flags];
  v8 = [(HAPAccessCodeControlResponse *)self statusCode];
  v9 = [(HAPAccessCodeControlResponse *)v4 initWithIdentifier:v5 accessCode:v6 flags:v7 statusCode:v8];

  return v9;
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
  v5 = [(HAPAccessCodeControlResponse *)self identifier];

  if (v5)
  {
    v6 = [(HAPAccessCodeControlResponse *)self identifier];
    id v28 = 0;
    v7 = [v6 serializeWithError:&v28];
    id v8 = v28;

    if (v8) {
      goto LABEL_24;
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
LABEL_26:
        v22 = 0;
        *a3 = v12;
        goto LABEL_28;
      }
      id v8 = 0;
LABEL_27:
      v22 = 0;
      goto LABEL_28;
    }
  }
  v13 = [(HAPAccessCodeControlResponse *)self accessCode];

  if (v13)
  {
    uint64_t v14 = [(HAPAccessCodeControlResponse *)self accessCode];
    id v27 = 0;
    v7 = [v14 serializeWithError:&v27];
    id v8 = v27;

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
LABEL_24:

    if (a3)
    {
      id v12 = v8;
      id v8 = v12;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_18:
  uint64_t v18 = [(HAPAccessCodeControlResponse *)self flags];

  if (v18)
  {
    v19 = [(HAPAccessCodeControlResponse *)self flags];
    id v26 = 0;
    v7 = [v19 serializeWithError:&v26];
    id v8 = v26;

    if (v8) {
      goto LABEL_24;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_4;
    }
  }
  v20 = [(HAPAccessCodeControlResponse *)self statusCode];

  if (v20)
  {
    v21 = [(HAPAccessCodeControlResponse *)self statusCode];
    id v25 = 0;
    v7 = [v21 serializeWithError:&v25];
    id v8 = v25;

    if (v8) {
      goto LABEL_24;
    }
    id v24 = v7;
    [v24 bytes];
    [v24 length];
    uint64_t v11 = TLV8BufferAppend();

    if (v11) {
      goto LABEL_5;
    }
  }
  v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v29);
  id v8 = 0;
LABEL_28:
  TLV8BufferFree();

  return v22;
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
    v22 = 0;
    id v12 = 0;
LABEL_22:
    [(HAPAccessCodeControlResponse *)self setIdentifier:v12];
    [(HAPAccessCodeControlResponse *)self setAccessCode:v22];
    [(HAPAccessCodeControlResponse *)self setFlags:v11];
    [(HAPAccessCodeControlResponse *)self setStatusCode:v10];
    id v9 = 0;
    BOOL v23 = 1;
    goto LABEL_26;
  }
  id v26 = a4;
  id v27 = 0;
  id v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v12 = 0;
  unint64_t v13 = v7 + v8;
  while (2)
  {
    char v35 = 0;
    v33[1] = 0;
    uint64_t v34 = 0;
    v33[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      if (v26)
      {
        HMErrorFromOSStatus(Next);
        BOOL v23 = 0;
        id *v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v23 = 0;
      }
      v22 = v27;
    }
    else
    {
      if (v34)
      {
        switch(v35)
        {
          case 1:
            unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
            id v32 = v9;
            uint64_t v16 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v32];
            id v17 = v32;

            uint64_t v18 = v12;
            id v12 = (void *)v16;
            goto LABEL_11;
          case 2:
            id v31 = v9;
            unint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v33, &v31);
            id v17 = v31;

            if (v17) {
              goto LABEL_12;
            }
            id v30 = 0;
            uint64_t v19 = [NSString parsedFromData:v15 error:&v30];
            id v17 = v30;
            uint64_t v18 = v27;
            id v27 = (void *)v19;
LABEL_11:

LABEL_12:
            id v9 = v17;
LABEL_13:
            unint64_t v7 = v33[0];
            if (v33[0] < v13) {
              continue;
            }
            if (v9) {
              goto LABEL_15;
            }
            goto LABEL_21;
          case 3:
            unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
            id v29 = v9;
            uint64_t v20 = +[HAPAccessCodeFlagsWrapper parsedFromData:v15 error:&v29];
            id v17 = v29;

            uint64_t v18 = v11;
            uint64_t v11 = (void *)v20;
            goto LABEL_11;
          case 4:
            unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
            id v28 = v9;
            uint64_t v21 = +[HAPAccessCodeResponseStatusWrapper parsedFromData:v15 error:&v28];
            id v17 = v28;

            uint64_t v18 = v10;
            uint64_t v10 = (void *)v21;
            goto LABEL_11;
          default:
            goto LABEL_13;
        }
      }
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (id)v24;
      if (!v24)
      {
LABEL_21:
        v22 = v27;
        goto LABEL_22;
      }
LABEL_15:
      v22 = v27;
      if (v26)
      {
        id v9 = v9;
        BOOL v23 = 0;
        id *v26 = v9;
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    break;
  }
LABEL_26:

  return v23;
}

- (HAPAccessCodeControlResponse)initWithIdentifier:(id)a3 accessCode:(id)a4 flags:(id)a5 statusCode:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPAccessCodeControlResponse;
  unint64_t v15 = [(HAPAccessCodeControlResponse *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_accessCode, a4);
    objc_storeStrong((id *)&v16->_flags, a5);
    objc_storeStrong((id *)&v16->_statusCode, a6);
  }

  return v16;
}

- (HAPAccessCodeControlResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPAccessCodeControlResponse;
  return [(HAPAccessCodeControlResponse *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPAccessCodeControlResponse);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPAccessCodeControlResponse *)v6 parseFromData:v5 error:&v10];
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