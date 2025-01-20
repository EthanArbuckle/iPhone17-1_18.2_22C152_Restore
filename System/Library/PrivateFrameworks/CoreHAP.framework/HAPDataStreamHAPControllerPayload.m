@interface HAPDataStreamHAPControllerPayload
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamHAPControllerPayload)init;
- (HAPDataStreamHAPControllerPayload)initWithPayload:(id)a3 sessionIdentifier:(id)a4 forceClose:(id)a5;
- (HAPTLVUnsignedNumberValue)forceClose;
- (HAPTLVUnsignedNumberValue)sessionIdentifier;
- (NSData)payload;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setForceClose:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation HAPDataStreamHAPControllerPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceClose, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)setForceClose:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)forceClose
{
  return self->_forceClose;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPDataStreamHAPControllerPayload *)self payload];
  v5 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];
  v6 = [(HAPDataStreamHAPControllerPayload *)self forceClose];
  v7 = [v3 stringWithFormat:@"<HAPDataStreamHAPControllerPayload payload=%@, sessionIdentifier=%@, forceClose=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPDataStreamHAPControllerPayload *)a3;
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
      v8 = [(HAPDataStreamHAPControllerPayload *)self payload];
      v9 = [(HAPDataStreamHAPControllerPayload *)v7 payload];
      if (v8 != v9)
      {
        v3 = [(HAPDataStreamHAPControllerPayload *)self payload];
        v4 = [(HAPDataStreamHAPControllerPayload *)v7 payload];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];
      v12 = [(HAPDataStreamHAPControllerPayload *)v7 sessionIdentifier];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];
        v26 = [(HAPDataStreamHAPControllerPayload *)v7 sessionIdentifier];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPDataStreamHAPControllerPayload *)self forceClose];
      uint64_t v15 = [(HAPDataStreamHAPControllerPayload *)v7 forceClose];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPDataStreamHAPControllerPayload *)self forceClose];
        v17 = v23 = v3;
        [(HAPDataStreamHAPControllerPayload *)v7 forceClose];
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
  v4 = +[HAPDataStreamHAPControllerPayload allocWithZone:a3];
  v5 = [(HAPDataStreamHAPControllerPayload *)self payload];
  v6 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];
  v7 = [(HAPDataStreamHAPControllerPayload *)self forceClose];
  v8 = [(HAPDataStreamHAPControllerPayload *)v4 initWithPayload:v5 sessionIdentifier:v6 forceClose:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
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
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  TLV8BufferInit();
  v5 = [(HAPDataStreamHAPControllerPayload *)self payload];

  if (v5)
  {
    v6 = [(HAPDataStreamHAPControllerPayload *)self payload];
    id v26 = 0;
    v7 = [v6 serializeWithError:&v26];
    id v8 = v26;

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
          break;
        }
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
      uint64_t v17 = v13;

      goto LABEL_19;
    }
LABEL_15:

    if (a3)
    {
      id v20 = v8;
      id v8 = v20;
LABEL_21:
      v22 = 0;
      *a3 = v20;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_10:
  v14 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];

  if (!v14) {
    goto LABEL_30;
  }
  uint64_t v15 = [(HAPDataStreamHAPControllerPayload *)self sessionIdentifier];
  id v25 = 0;
  v7 = [v15 serializeWithError:&v25];
  id v8 = v25;

  if (v8) {
    goto LABEL_15;
  }
  id v16 = v7;
  [v16 bytes];
  [v16 length];
  uint64_t v17 = TLV8BufferAppend();

  if (!v17)
  {
LABEL_30:
    v18 = [(HAPDataStreamHAPControllerPayload *)self forceClose];

    if (!v18) {
      goto LABEL_22;
    }
    v19 = [(HAPDataStreamHAPControllerPayload *)self forceClose];
    id v24 = 0;
    v7 = [v19 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_15;
    }
    id v21 = v7;
    [v21 bytes];
    [v21 length];
    uint64_t v17 = TLV8BufferAppend();

    if (!v17)
    {
LABEL_22:
      v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v27);
      id v8 = 0;
      goto LABEL_25;
    }
  }
LABEL_19:
  if (a3)
  {
    HMErrorFromOSStatus(v17);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_21;
  }
  id v8 = 0;
LABEL_24:
  v22 = 0;
LABEL_25:
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
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_24;
  }
  id v26 = self;
  long long v27 = a4;
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = v7 + v8;
  do
  {
    char v34 = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    v32[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      id v21 = v27;
      if (v27)
      {
        HMErrorFromOSStatus(Next);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_25:
      BOOL v23 = 0;
      goto LABEL_26;
    }
    if (!v33)
    {
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_23;
      }
LABEL_16:
      id v21 = v27;
      if (v27)
      {
        id v22 = v9;
        id v9 = v22;
LABEL_21:
        BOOL v23 = 0;
        *id v21 = v22;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v34 == 3)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v28 = v9;
      uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v28];
      id v16 = v28;

      v18 = v10;
      unint64_t v10 = (void *)v19;
      goto LABEL_12;
    }
    if (v34 == 2)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v29 = v9;
      uint64_t v20 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v29];
      id v16 = v29;

      v18 = v11;
      unint64_t v11 = (void *)v20;
      goto LABEL_12;
    }
    if (v34 != 1) {
      goto LABEL_14;
    }
    id v31 = v9;
    uint64_t v15 = HAPTLVParseContiguousTlvs(1, v7, v13, v32, &v31);
    id v16 = v31;

    if (!v16)
    {
      id v30 = 0;
      uint64_t v17 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v30];
      id v16 = v30;
      v18 = v12;
      uint64_t v12 = (void *)v17;
LABEL_12:
    }
    id v9 = v16;
LABEL_14:
    unint64_t v7 = v32[0];
  }
  while (v32[0] < v13);
  if (v9) {
    goto LABEL_16;
  }
LABEL_23:
  self = v26;
LABEL_24:
  -[HAPDataStreamHAPControllerPayload setPayload:](self, "setPayload:", v12, v26);
  [(HAPDataStreamHAPControllerPayload *)self setSessionIdentifier:v11];
  [(HAPDataStreamHAPControllerPayload *)self setForceClose:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (HAPDataStreamHAPControllerPayload)initWithPayload:(id)a3 sessionIdentifier:(id)a4 forceClose:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamHAPControllerPayload;
  uint64_t v12 = [(HAPDataStreamHAPControllerPayload *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payload, a3);
    objc_storeStrong((id *)&v13->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v13->_forceClose, a5);
  }

  return v13;
}

- (HAPDataStreamHAPControllerPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamHAPControllerPayload;
  return [(HAPDataStreamHAPControllerPayload *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPDataStreamHAPControllerPayload);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamHAPControllerPayload *)v6 parseFromData:v5 error:&v10];
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