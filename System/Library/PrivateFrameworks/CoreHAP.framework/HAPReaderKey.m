@interface HAPReaderKey
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPNFCAccessKeyTypeWrapper)type;
- (HAPReaderKey)init;
- (HAPReaderKey)initWithType:(id)a3 key:(id)a4 keyIdentifier:(id)a5 readerIdentifier:(id)a6;
- (NSData)key;
- (NSData)keyIdentifier;
- (NSData)readerIdentifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setKey:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setReaderIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation HAPReaderKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setReaderIdentifier:(id)a3
{
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
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
  v4 = [(HAPReaderKey *)self type];
  v5 = [(HAPReaderKey *)self key];
  v6 = [(HAPReaderKey *)self keyIdentifier];
  v7 = [(HAPReaderKey *)self readerIdentifier];
  v8 = [v3 stringWithFormat:@"<HAPReaderKey type=%@, key=%@, keyIdentifier=%@, readerIdentifier=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPReaderKey *)a3;
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
      v7 = [(HAPReaderKey *)self type];
      v8 = [(HAPReaderKey *)v6 type];
      if (v7 != v8)
      {
        v9 = [(HAPReaderKey *)self type];
        v3 = [(HAPReaderKey *)v6 type];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HAPReaderKey *)self key];
      v12 = [(HAPReaderKey *)v6 key];
      if (v11 != v12)
      {
        v13 = [(HAPReaderKey *)self key];
        v31 = [(HAPReaderKey *)v6 key];
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
      uint64_t v14 = [(HAPReaderKey *)self keyIdentifier];
      v15 = [(HAPReaderKey *)v6 keyIdentifier];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HAPReaderKey *)self keyIdentifier];
        v27 = [(HAPReaderKey *)v6 keyIdentifier];
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
      v17 = [(HAPReaderKey *)self readerIdentifier];
      uint64_t v18 = [(HAPReaderKey *)v6 readerIdentifier];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HAPReaderKey *)self readerIdentifier];
        v20 = v24 = v3;
        v21 = [(HAPReaderKey *)v6 readerIdentifier];
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
  v4 = +[HAPReaderKey allocWithZone:a3];
  v5 = [(HAPReaderKey *)self type];
  v6 = [(HAPReaderKey *)self key];
  v7 = [(HAPReaderKey *)self keyIdentifier];
  v8 = [(HAPReaderKey *)self readerIdentifier];
  v9 = [(HAPReaderKey *)v4 initWithType:v5 key:v6 keyIdentifier:v7 readerIdentifier:v8];

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
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
  v5 = [(HAPReaderKey *)self type];

  if (v5)
  {
    v6 = [(HAPReaderKey *)self type];
    id v38 = 0;
    v7 = [v6 serializeWithError:&v38];
    id v8 = v38;

    if (v8) {
      goto LABEL_24;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_27:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_29;
      }
      id v8 = 0;
LABEL_31:
      v26 = 0;
      goto LABEL_32;
    }
  }
  v11 = [(HAPReaderKey *)self key];

  if (v11)
  {
    v12 = [(HAPReaderKey *)self key];
    id v37 = 0;
    v7 = [v12 serializeWithError:&v37];
    id v8 = v37;

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
          goto LABEL_26;
        }
        v14 += v16;
        if (v14 >= v15)
        {

          goto LABEL_13;
        }
      }
    }
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v18 = [(HAPReaderKey *)self keyIdentifier];

  if (v18)
  {
    v19 = [(HAPReaderKey *)self keyIdentifier];
    id v36 = 0;
    v7 = [v19 serializeWithError:&v36];
    id v8 = v36;

    if (!v8)
    {
      id v13 = v7;
      unint64_t v20 = [v13 bytes];
      unint64_t v21 = v20 + [v13 length];
      while (1)
      {
        uint64_t v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
        uint64_t v17 = TLV8BufferAppend();
        if (v17) {
          break;
        }
        v20 += v22;
        if (v20 >= v21)
        {

          goto LABEL_22;
        }
      }
LABEL_26:
      uint64_t v10 = v17;

      goto LABEL_27;
    }
LABEL_24:

    if (a3)
    {
      id v25 = v8;
      id v8 = v25;
LABEL_29:
      v26 = 0;
      *a3 = v25;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_22:
  v23 = [(HAPReaderKey *)self readerIdentifier];

  if (v23)
  {
    v24 = [(HAPReaderKey *)self readerIdentifier];
    id v35 = 0;
    v7 = [v24 serializeWithError:&v35];
    id v8 = v35;

    if (v8) {
      goto LABEL_24;
    }
    id v28 = v7;
    unint64_t v29 = [v28 bytes];
    unint64_t v30 = v29 + [v28 length];
    do
    {
      if ((uint64_t)(v30 - v29) >= 255) {
        uint64_t v31 = 255;
      }
      else {
        uint64_t v31 = v30 - v29;
      }
      uint64_t v32 = TLV8BufferAppend();
      if (v32) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = v31;
      }
      v29 += v33;
      if (v32) {
        BOOL v34 = 1;
      }
      else {
        BOOL v34 = v29 >= v30;
      }
    }
    while (!v34);
    uint64_t v10 = v32;

    if (v10) {
      goto LABEL_27;
    }
  }
  v26 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v39);
  id v8 = 0;
LABEL_32:
  TLV8BufferFree();

  return v26;
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
    uint64_t v22 = 0;
    v12 = 0;
LABEL_24:
    [(HAPReaderKey *)self setType:v12];
    [(HAPReaderKey *)self setKey:v22];
    [(HAPReaderKey *)self setKeyIdentifier:v11];
    [(HAPReaderKey *)self setReaderIdentifier:v10];
    id v9 = 0;
    BOOL v23 = 1;
  }
  else
  {
    v26 = a4;
    v27 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v37 = 0;
      v35[1] = 0;
      uint64_t v36 = 0;
      v35[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v36)
      {
        uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v24;
        if (v24) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
      switch(v37)
      {
        case 1:
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v34 = v9;
          uint64_t v16 = +[HAPNFCAccessKeyTypeWrapper parsedFromData:v15 error:&v34];
          id v17 = v34;

          uint64_t v18 = v12;
          v12 = (void *)v16;
          break;
        case 2:
          id v33 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v35, &v33);
          id v17 = v33;

          if (v17) {
            goto LABEL_14;
          }
          id v32 = 0;
          uint64_t v19 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v32];
          id v17 = v32;
          uint64_t v18 = v27;
          v27 = (void *)v19;
          break;
        case 3:
          id v31 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v35, &v31);
          id v17 = v31;

          if (v17) {
            goto LABEL_14;
          }
          id v30 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v30];
          id v17 = v30;
          uint64_t v18 = v11;
          v11 = (void *)v20;
          break;
        case 4:
          id v29 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(4, v7, v13, v35, &v29);
          id v17 = v29;

          if (v17) {
            goto LABEL_14;
          }
          id v28 = 0;
          uint64_t v21 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v28];
          id v17 = v28;
          uint64_t v18 = v10;
          uint64_t v10 = (void *)v21;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      id v9 = v17;
LABEL_15:
      unint64_t v7 = v35[0];
      if (v35[0] >= v13)
      {
        if (v9)
        {
LABEL_17:
          uint64_t v22 = v27;
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
          goto LABEL_28;
        }
LABEL_23:
        uint64_t v22 = v27;
        goto LABEL_24;
      }
    }
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
    uint64_t v22 = v27;
  }
LABEL_28:

  return v23;
}

- (HAPReaderKey)initWithType:(id)a3 key:(id)a4 keyIdentifier:(id)a5 readerIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPReaderKey;
  unint64_t v15 = [(HAPReaderKey *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_key, a4);
    objc_storeStrong((id *)&v16->_keyIdentifier, a5);
    objc_storeStrong((id *)&v16->_readerIdentifier, a6);
  }

  return v16;
}

- (HAPReaderKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPReaderKey;
  return [(HAPReaderKey *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPReaderKey);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPReaderKey *)v6 parseFromData:v5 error:&v10];
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