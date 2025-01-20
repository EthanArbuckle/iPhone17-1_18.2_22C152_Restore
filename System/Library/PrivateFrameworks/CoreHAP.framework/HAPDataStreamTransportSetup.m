@interface HAPDataStreamTransportSetup
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportCommandWrapper)command;
- (HAPDataStreamTransportProtocolWrapper)transportType;
- (HAPDataStreamTransportSetup)init;
- (HAPDataStreamTransportSetup)initWithCommand:(id)a3 transportType:(id)a4 controllerKeySalt:(id)a5;
- (NSData)controllerKeySalt;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCommand:(id)a3;
- (void)setControllerKeySalt:(id)a3;
- (void)setTransportType:(id)a3;
@end

@implementation HAPDataStreamTransportSetup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerKeySalt, 0);
  objc_storeStrong((id *)&self->_transportType, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

- (void)setControllerKeySalt:(id)a3
{
}

- (NSData)controllerKeySalt
{
  return self->_controllerKeySalt;
}

- (void)setTransportType:(id)a3
{
}

- (HAPDataStreamTransportProtocolWrapper)transportType
{
  return self->_transportType;
}

- (void)setCommand:(id)a3
{
}

- (HAPDataStreamTransportCommandWrapper)command
{
  return self->_command;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPDataStreamTransportSetup *)self command];
  v5 = [(HAPDataStreamTransportSetup *)self transportType];
  v6 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
  v7 = [v3 stringWithFormat:@"<HAPDataStreamTransportSetup command=%@, transportType=%@, controllerKeySalt=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPDataStreamTransportSetup *)a3;
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
      v8 = [(HAPDataStreamTransportSetup *)self command];
      v9 = [(HAPDataStreamTransportSetup *)v7 command];
      if (v8 != v9)
      {
        v3 = [(HAPDataStreamTransportSetup *)self command];
        v4 = [(HAPDataStreamTransportSetup *)v7 command];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPDataStreamTransportSetup *)self transportType];
      v12 = [(HAPDataStreamTransportSetup *)v7 transportType];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPDataStreamTransportSetup *)self transportType];
        v26 = [(HAPDataStreamTransportSetup *)v7 transportType];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
      uint64_t v15 = [(HAPDataStreamTransportSetup *)v7 controllerKeySalt];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPDataStreamTransportSetup *)self controllerKeySalt];
        v17 = v23 = v3;
        [(HAPDataStreamTransportSetup *)v7 controllerKeySalt];
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
  v4 = +[HAPDataStreamTransportSetup allocWithZone:a3];
  v5 = [(HAPDataStreamTransportSetup *)self command];
  v6 = [(HAPDataStreamTransportSetup *)self transportType];
  v7 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
  v8 = [(HAPDataStreamTransportSetup *)v4 initWithCommand:v5 transportType:v6 controllerKeySalt:v7];

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
  v5 = [(HAPDataStreamTransportSetup *)self command];

  if (v5)
  {
    v6 = [(HAPDataStreamTransportSetup *)self command];
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
  v11 = [(HAPDataStreamTransportSetup *)self transportType];

  if (v11)
  {
    v12 = [(HAPDataStreamTransportSetup *)self transportType];
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
  uint64_t v15 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];

  if (v15)
  {
    v16 = [(HAPDataStreamTransportSetup *)self controllerKeySalt];
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
    goto LABEL_24;
  }
  id v26 = self;
  id v27 = a4;
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
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
      uint64_t v21 = v27;
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
      uint64_t v21 = v27;
      if (v27)
      {
        id v22 = v9;
        id v9 = v22;
LABEL_21:
        BOOL v23 = 0;
        *uint64_t v21 = v22;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v34 != 3)
    {
      if (v34 == 2)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v30 = v9;
        uint64_t v20 = +[HAPDataStreamTransportProtocolWrapper parsedFromData:v15 error:&v30];
        id v17 = v30;

        id v18 = v11;
        v11 = (void *)v20;
      }
      else
      {
        if (v34 != 1) {
          goto LABEL_14;
        }
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v31 = v9;
        uint64_t v16 = +[HAPDataStreamTransportCommandWrapper parsedFromData:v15 error:&v31];
        id v17 = v31;

        id v18 = v12;
        v12 = (void *)v16;
      }
      goto LABEL_12;
    }
    id v29 = v9;
    uint64_t v15 = HAPTLVParseContiguousTlvs(3, v7, v13, v32, &v29);
    id v17 = v29;

    if (!v17)
    {
      id v28 = 0;
      uint64_t v19 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v28];
      id v17 = v28;
      id v18 = v10;
      uint64_t v10 = (void *)v19;
LABEL_12:
    }
    id v9 = v17;
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
  -[HAPDataStreamTransportSetup setCommand:](self, "setCommand:", v12, v26);
  [(HAPDataStreamTransportSetup *)self setTransportType:v11];
  [(HAPDataStreamTransportSetup *)self setControllerKeySalt:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (HAPDataStreamTransportSetup)initWithCommand:(id)a3 transportType:(id)a4 controllerKeySalt:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamTransportSetup;
  v12 = [(HAPDataStreamTransportSetup *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_command, a3);
    objc_storeStrong((id *)&v13->_transportType, a4);
    objc_storeStrong((id *)&v13->_controllerKeySalt, a5);
  }

  return v13;
}

- (HAPDataStreamTransportSetup)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportSetup;
  return [(HAPDataStreamTransportSetup *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPDataStreamTransportSetup);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportSetup *)v6 parseFromData:v5 error:&v10];
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