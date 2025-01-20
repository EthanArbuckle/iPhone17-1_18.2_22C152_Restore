@interface HAPDataStreamTransportParameters
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportParameters)init;
- (HAPDataStreamTransportParameters)initWithTcpListeningPort:(id)a3 sessionIdentifier:(id)a4;
- (HAPTLVUnsignedNumberValue)sessionIdentifier;
- (HAPTLVUnsignedNumberValue)tcpListeningPort;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTcpListeningPort:(id)a3;
@end

@implementation HAPDataStreamTransportParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_tcpListeningPort, 0);
}

- (void)setSessionIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setTcpListeningPort:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)tcpListeningPort
{
  return self->_tcpListeningPort;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
  v5 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
  v6 = [v3 stringWithFormat:@"<HAPDataStreamTransportParameters tcpListeningPort=%@, sessionIdentifier=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPDataStreamTransportParameters *)a3;
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
      v7 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
      v8 = [(HAPDataStreamTransportParameters *)v6 tcpListeningPort];
      if (v7 != v8)
      {
        v9 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
        v3 = [(HAPDataStreamTransportParameters *)v6 tcpListeningPort];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
      v12 = [(HAPDataStreamTransportParameters *)v6 sessionIdentifier];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
        v14 = [(HAPDataStreamTransportParameters *)v6 sessionIdentifier];
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
  v4 = +[HAPDataStreamTransportParameters allocWithZone:a3];
  v5 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
  v6 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
  v7 = [(HAPDataStreamTransportParameters *)v4 initWithTcpListeningPort:v5 sessionIdentifier:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  TLV8BufferInit();
  v5 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];

  if (v5)
  {
    v6 = [(HAPDataStreamTransportParameters *)self tcpListeningPort];
    id v18 = 0;
    v7 = [v6 serializeWithError:&v18];
    id v8 = v18;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_11;
      }
      id v8 = 0;
      goto LABEL_14;
    }
  }
  v11 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];

  if (!v11)
  {
LABEL_12:
    v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v19);
    id v8 = 0;
    goto LABEL_15;
  }
  v12 = [(HAPDataStreamTransportParameters *)self sessionIdentifier];
  id v17 = 0;
  v7 = [v12 serializeWithError:&v17];
  id v8 = v17;

  if (!v8)
  {
    id v14 = v7;
    [v14 bytes];
    [v14 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_6:

  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_11:
    v15 = 0;
    *a3 = v13;
    goto LABEL_15;
  }
LABEL_14:
  v15 = 0;
LABEL_15:
  TLV8BufferFree();

  return v15;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 >= 1)
  {
    long long v21 = a4;
    id v22 = v6;
    id v9 = 0;
    uint64_t v10 = 0;
    id v11 = 0;
    unint64_t v12 = v7 + v8;
    while (1)
    {
      char v28 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      unint64_t v25 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (v21)
        {
          HMErrorFromOSStatus(Next);
          BOOL v18 = 0;
          *long long v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v18 = 0;
        }
        id v6 = v22;
        goto LABEL_23;
      }
      if (!v27)
      {
        uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v11 = (id)v19;
        if (v19) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
      if (v28 == 2) {
        break;
      }
      if (v28 == 1)
      {
        id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v24 = v11;
        v15 = &v24;
        +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v24];
        uint64_t v10 = v16 = v10;
LABEL_9:
        id v17 = *v15;

        id v11 = v17;
      }
      if (v25 >= v12)
      {
        if (v11)
        {
LABEL_12:
          id v6 = v22;
          if (v21)
          {
            id v11 = v11;
            BOOL v18 = 0;
            *long long v21 = v11;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_23;
        }
LABEL_18:
        id v6 = v22;
        goto LABEL_19;
      }
    }
    id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
    id v23 = v11;
    v15 = &v23;
    +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v23];
    id v9 = v16 = v9;
    goto LABEL_9;
  }
  id v9 = 0;
  uint64_t v10 = 0;
LABEL_19:
  -[HAPDataStreamTransportParameters setTcpListeningPort:](self, "setTcpListeningPort:", v10, v21);
  [(HAPDataStreamTransportParameters *)self setSessionIdentifier:v9];
  id v11 = 0;
  BOOL v18 = 1;
LABEL_23:

  return v18;
}

- (HAPDataStreamTransportParameters)initWithTcpListeningPort:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportParameters;
  id v9 = [(HAPDataStreamTransportParameters *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tcpListeningPort, a3);
    objc_storeStrong((id *)&v10->_sessionIdentifier, a4);
  }

  return v10;
}

- (HAPDataStreamTransportParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportParameters;
  return [(HAPDataStreamTransportParameters *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPDataStreamTransportParameters);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportParameters *)v6 parseFromData:v5 error:&v10];
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