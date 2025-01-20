@interface HAPCharacteristicNotificationContext
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicNotificationContext)init;
- (HAPCharacteristicNotificationContext)initWithContextIdentifier:(id)a3 source:(id)a4 clockTickCounter:(id)a5;
- (HAPNotificationContextSourceWrapper)source;
- (HAPTLVUnsignedNumberValue)clockTickCounter;
- (HAPTLVUnsignedNumberValue)contextIdentifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setClockTickCounter:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation HAPCharacteristicNotificationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockTickCounter, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

- (void)setClockTickCounter:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)clockTickCounter
{
  return self->_clockTickCounter;
}

- (void)setSource:(id)a3
{
}

- (HAPNotificationContextSourceWrapper)source
{
  return self->_source;
}

- (void)setContextIdentifier:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];
  v5 = [(HAPCharacteristicNotificationContext *)self source];
  v6 = [(HAPCharacteristicNotificationContext *)self clockTickCounter];
  v7 = [v3 stringWithFormat:@"<HAPCharacteristicNotificationContext contextIdentifier=%@, source=%@, clockTickCounter=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPCharacteristicNotificationContext *)a3;
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
      v8 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];
      v9 = [(HAPCharacteristicNotificationContext *)v7 contextIdentifier];
      if (v8 != v9)
      {
        v3 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];
        v4 = [(HAPCharacteristicNotificationContext *)v7 contextIdentifier];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPCharacteristicNotificationContext *)self source];
      v12 = [(HAPCharacteristicNotificationContext *)v7 source];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPCharacteristicNotificationContext *)self source];
        v26 = [(HAPCharacteristicNotificationContext *)v7 source];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPCharacteristicNotificationContext *)self clockTickCounter];
      uint64_t v15 = [(HAPCharacteristicNotificationContext *)v7 clockTickCounter];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPCharacteristicNotificationContext *)self clockTickCounter];
        v17 = v23 = v3;
        [(HAPCharacteristicNotificationContext *)v7 clockTickCounter];
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
  v4 = +[HAPCharacteristicNotificationContext allocWithZone:a3];
  v5 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];
  v6 = [(HAPCharacteristicNotificationContext *)self source];
  v7 = [(HAPCharacteristicNotificationContext *)self clockTickCounter];
  v8 = [(HAPCharacteristicNotificationContext *)v4 initWithContextIdentifier:v5 source:v6 clockTickCounter:v7];

  return v8;
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
  v5 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];

  if (v5)
  {
    v6 = [(HAPCharacteristicNotificationContext *)self contextIdentifier];
    id v22 = 0;
    v7 = [v6 serializeWithError:&v22];
    id v8 = v22;

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
        goto LABEL_21;
      }
      id v8 = 0;
LABEL_18:
      v17 = 0;
      goto LABEL_21;
    }
  }
  v11 = [(HAPCharacteristicNotificationContext *)self source];

  if (v11)
  {
    v12 = [(HAPCharacteristicNotificationContext *)self source];
    id v21 = 0;
    v7 = [v12 serializeWithError:&v21];
    id v8 = v21;

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
  uint64_t v15 = [(HAPCharacteristicNotificationContext *)self clockTickCounter];

  if (v15)
  {
    v16 = [(HAPCharacteristicNotificationContext *)self clockTickCounter];
    id v20 = 0;
    v7 = [v16 serializeWithError:&v20];
    id v8 = v20;

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
    [v18 bytes];
    [v18 length];
    uint64_t v13 = TLV8BufferAppend();

    if (v13) {
      goto LABEL_9;
    }
  }
  v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v23);
  id v8 = 0;
LABEL_21:
  TLV8BufferFree();

  return v17;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 >= 1)
  {
    id v22 = self;
    long long v23 = a4;
    id v24 = v6;
    id v9 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v31 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      unint64_t v28 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (v23)
        {
          HMErrorFromOSStatus(Next);
          BOOL v19 = 0;
          id *v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v19 = 0;
        }
        id v6 = v24;
        goto LABEL_25;
      }
      if (!v30)
      {
        uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v20;
        if (v20) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
      if (v31 == 3) {
        break;
      }
      if (v31 == 2)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v26 = v9;
        v16 = &v26;
        +[HAPNotificationContextSourceWrapper parsedFromData:v15 error:&v26];
        v11 = v17 = v11;
        goto LABEL_11;
      }
      if (v31 == 1)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v27 = v9;
        v16 = &v27;
        +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v27];
        v12 = v17 = v12;
LABEL_11:
        id v18 = *v16;

        id v9 = v18;
      }
      if (v28 >= v13)
      {
        if (v9)
        {
LABEL_14:
          id v6 = v24;
          if (v23)
          {
            id v9 = v9;
            BOOL v19 = 0;
            id *v23 = v9;
          }
          else
          {
            BOOL v19 = 0;
          }
          goto LABEL_25;
        }
LABEL_20:
        id v6 = v24;
        self = v22;
        goto LABEL_21;
      }
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
    id v25 = v9;
    v16 = &v25;
    +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v25];
    uint64_t v10 = v17 = v10;
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  v11 = 0;
  v12 = 0;
LABEL_21:
  -[HAPCharacteristicNotificationContext setContextIdentifier:](self, "setContextIdentifier:", v12, v22);
  [(HAPCharacteristicNotificationContext *)self setSource:v11];
  [(HAPCharacteristicNotificationContext *)self setClockTickCounter:v10];
  id v9 = 0;
  BOOL v19 = 1;
LABEL_25:

  return v19;
}

- (HAPCharacteristicNotificationContext)initWithContextIdentifier:(id)a3 source:(id)a4 clockTickCounter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicNotificationContext;
  v12 = [(HAPCharacteristicNotificationContext *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextIdentifier, a3);
    objc_storeStrong((id *)&v13->_source, a4);
    objc_storeStrong((id *)&v13->_clockTickCounter, a5);
  }

  return v13;
}

- (HAPCharacteristicNotificationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicNotificationContext;
  return [(HAPCharacteristicNotificationContext *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPCharacteristicNotificationContext);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicNotificationContext *)v6 parseFromData:v5 error:&v10];
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