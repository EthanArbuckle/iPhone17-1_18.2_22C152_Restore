@interface HAPDataStreamTransportInterruptPayload
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportInterruptPayload)init;
- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4;
- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber;
- (NSData)requestToSendIdentifiers;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3;
- (void)setRequestToSendIdentifiers:(id)a3;
@end

@implementation HAPDataStreamTransportInterruptPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, 0);

  objc_storeStrong((id *)&self->_requestToSendIdentifiers, 0);
}

- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber
{
  return self->_dataStreamTransportInterruptSequenceNumber;
}

- (void)setRequestToSendIdentifiers:(id)a3
{
}

- (NSData)requestToSendIdentifiers
{
  return self->_requestToSendIdentifiers;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
  v5 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  v6 = [v3 stringWithFormat:@"<HAPDataStreamTransportInterruptPayload requestToSendIdentifiers=%@, dataStreamTransportInterruptSequenceNumber=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPDataStreamTransportInterruptPayload *)a3;
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
      v7 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
      v8 = [(HAPDataStreamTransportInterruptPayload *)v6 requestToSendIdentifiers];
      if (v7 != v8)
      {
        v9 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
        v3 = [(HAPDataStreamTransportInterruptPayload *)v6 requestToSendIdentifiers];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
      v12 = [(HAPDataStreamTransportInterruptPayload *)v6 dataStreamTransportInterruptSequenceNumber];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
        v14 = [(HAPDataStreamTransportInterruptPayload *)v6 dataStreamTransportInterruptSequenceNumber];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportInterruptPayload allocWithZone:a3];
  v5 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
  v6 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  v7 = [(HAPDataStreamTransportInterruptPayload *)v4 initWithRequestToSendIdentifiers:v5 dataStreamTransportInterruptSequenceNumber:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
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
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  TLV8BufferInit();
  v5 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];

  if (v5)
  {
    v6 = [(HAPDataStreamTransportInterruptPayload *)self requestToSendIdentifiers];
    id v22 = 0;
    v7 = [v6 serializeWithError:&v22];
    id v8 = v22;

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

      goto LABEL_16;
    }
LABEL_12:

    if (a3)
    {
      id v16 = v8;
      id v8 = v16;
LABEL_18:
      v19 = 0;
      *a3 = v16;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_10:
  v14 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];

  if (!v14) {
    goto LABEL_19;
  }
  v15 = [(HAPDataStreamTransportInterruptPayload *)self dataStreamTransportInterruptSequenceNumber];
  id v21 = 0;
  v7 = [v15 serializeWithError:&v21];
  id v8 = v21;

  if (v8) {
    goto LABEL_12;
  }
  id v18 = v7;
  [v18 bytes];
  [v18 length];
  uint64_t v17 = TLV8BufferAppend();

  if (!v17)
  {
LABEL_19:
    v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v23);
    id v8 = 0;
    goto LABEL_22;
  }
LABEL_16:
  if (a3)
  {
    HMErrorFromOSStatus(v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_18;
  }
  id v8 = 0;
LABEL_21:
  v19 = 0;
LABEL_22:
  TLV8BufferFree();

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    id v9 = 0;
    unint64_t v10 = 0;
LABEL_16:
    -[HAPDataStreamTransportInterruptPayload setRequestToSendIdentifiers:](self, "setRequestToSendIdentifiers:", v10, v24);
    [(HAPDataStreamTransportInterruptPayload *)self setDataStreamTransportInterruptSequenceNumber:v9];
    unint64_t v11 = 0;
    BOOL v19 = 1;
    goto LABEL_24;
  }
  long long v24 = a4;
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v30 = 0;
    v28[1] = 0;
    uint64_t v29 = 0;
    v28[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v29)
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      unint64_t v11 = (void *)v22;
      if (!v22) {
        goto LABEL_16;
      }
LABEL_20:
      v20 = v24;
      if (v24)
      {
        id v21 = v11;
        unint64_t v11 = v21;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v25 = v11;
      uint64_t v18 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v25];
      id v15 = v25;

      uint64_t v17 = v9;
      id v9 = (void *)v18;
LABEL_10:

LABEL_11:
      unint64_t v11 = v15;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      id v27 = v11;
      v14 = HAPTLVParseContiguousTlvs(1, v7, v12, v28, &v27);
      id v15 = v27;

      if (!v15)
      {
        id v26 = 0;
        uint64_t v16 = [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v26];
        id v15 = v26;
        uint64_t v17 = v10;
        unint64_t v10 = (void *)v16;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_12:
    unint64_t v7 = v28[0];
    if (v28[0] >= v12)
    {
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_24;
  }
LABEL_23:
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  id v9 = [(HAPDataStreamTransportInterruptPayload *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestToSendIdentifiers, a3);
    objc_storeStrong((id *)&v10->_dataStreamTransportInterruptSequenceNumber, a4);
  }

  return v10;
}

- (HAPDataStreamTransportInterruptPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  return [(HAPDataStreamTransportInterruptPayload *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPDataStreamTransportInterruptPayload);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportInterruptPayload *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      id v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end