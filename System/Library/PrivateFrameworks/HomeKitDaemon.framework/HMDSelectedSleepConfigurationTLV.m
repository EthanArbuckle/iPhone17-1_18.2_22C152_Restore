@interface HMDSelectedSleepConfigurationTLV
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)backoffTime;
- (HMDSelectedSleepConfigurationTLV)init;
- (HMDSelectedSleepConfigurationTLV)initWithOperationType:(id)a3 operationStatus:(id)a4 backoffTime:(id)a5;
- (HMDSleepConfigurationOperationStatusWrapper)operationStatus;
- (HMDSleepConfigurationOperationTypeWrapper)operationType;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setBackoffTime:(id)a3;
- (void)setOperationStatus:(id)a3;
- (void)setOperationType:(id)a3;
@end

@implementation HMDSelectedSleepConfigurationTLV

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTime, 0);
  objc_storeStrong((id *)&self->_operationStatus, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

- (void)setBackoffTime:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)backoffTime
{
  return self->_backoffTime;
}

- (void)setOperationStatus:(id)a3
{
}

- (HMDSleepConfigurationOperationStatusWrapper)operationStatus
{
  return self->_operationStatus;
}

- (void)setOperationType:(id)a3
{
}

- (HMDSleepConfigurationOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDSelectedSleepConfigurationTLV *)self operationType];
  v5 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];
  v6 = [(HMDSelectedSleepConfigurationTLV *)self backoffTime];
  v7 = [v3 stringWithFormat:@"<HMDSelectedSleepConfigurationTLV operationType=%@, operationStatus=%@, backoffTime=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HMDSelectedSleepConfigurationTLV *)a3;
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
      v8 = [(HMDSelectedSleepConfigurationTLV *)self operationType];
      v9 = [(HMDSelectedSleepConfigurationTLV *)v7 operationType];
      if (v8 != v9)
      {
        v3 = [(HMDSelectedSleepConfigurationTLV *)self operationType];
        v4 = [(HMDSelectedSleepConfigurationTLV *)v7 operationType];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];
      v12 = [(HMDSelectedSleepConfigurationTLV *)v7 operationStatus];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];
        v26 = [(HMDSelectedSleepConfigurationTLV *)v7 operationStatus];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HMDSelectedSleepConfigurationTLV *)self backoffTime];
      uint64_t v15 = [(HMDSelectedSleepConfigurationTLV *)v7 backoffTime];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HMDSelectedSleepConfigurationTLV *)self backoffTime];
        v17 = v23 = v3;
        [(HMDSelectedSleepConfigurationTLV *)v7 backoffTime];
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
  v4 = +[HMDSelectedSleepConfigurationTLV allocWithZone:a3];
  v5 = [(HMDSelectedSleepConfigurationTLV *)self operationType];
  v6 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];
  v7 = [(HMDSelectedSleepConfigurationTLV *)self backoffTime];
  v8 = [(HMDSelectedSleepConfigurationTLV *)v4 initWithOperationType:v5 operationStatus:v6 backoffTime:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  TLV8BufferInit();
  v5 = [(HMDSelectedSleepConfigurationTLV *)self operationType];

  if (v5)
  {
    v6 = [(HMDSelectedSleepConfigurationTLV *)self operationType];
    id v21 = 0;
    v7 = [v6 serializeWithError:&v21];
    id v8 = v21;

    if (v8) {
      goto LABEL_15;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend())
    {
LABEL_8:

LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
LABEL_17:
        uint64_t v15 = 0;
        *a3 = v12;
        goto LABEL_21;
      }
      id v8 = 0;
LABEL_18:
      uint64_t v15 = 0;
      goto LABEL_21;
    }
  }
  char v10 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];

  if (v10)
  {
    v11 = [(HMDSelectedSleepConfigurationTLV *)self operationStatus];
    id v20 = 0;
    v7 = [v11 serializeWithError:&v20];
    id v8 = v20;

    if (v8) {
      goto LABEL_15;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    if (TLV8BufferAppend()) {
      goto LABEL_8;
    }
  }
  v13 = [(HMDSelectedSleepConfigurationTLV *)self backoffTime];

  if (v13)
  {
    v14 = [(HMDSelectedSleepConfigurationTLV *)self backoffTime];
    id v19 = 0;
    v7 = [v14 serializeWithError:&v19];
    id v8 = v19;

    if (v8)
    {
LABEL_15:

      if (a3)
      {
        id v12 = v8;
        id v8 = v12;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    id v16 = v7;
    [v16 bytes];
    [v16 length];
    int v17 = TLV8BufferAppend();

    if (v17) {
      goto LABEL_9;
    }
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v22);
  id v8 = 0;
LABEL_21:
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
    id v21 = a4;
    id v22 = v6;
    id v9 = 0;
    char v10 = 0;
    v11 = 0;
    id v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v29 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      unint64_t v26 = 0;
      if (TLV8GetNext())
      {
        if (v21)
        {
          HMErrorFromOSStatus();
          BOOL v18 = 0;
          *id v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v18 = 0;
        }
        id v6 = v22;
        goto LABEL_25;
      }
      if (!v28)
      {
        uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];

        id v9 = (id)v19;
        if (v19) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
      if (v29 == 3) {
        break;
      }
      if (v29 == 2)
      {
        v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v24 = v9;
        uint64_t v15 = &v24;
        +[HMDSleepConfigurationOperationStatusWrapper parsedFromData:v14 error:&v24];
        v11 = id v16 = v11;
        goto LABEL_11;
      }
      if (v29 == 1)
      {
        v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v25 = v9;
        uint64_t v15 = &v25;
        +[HMDSleepConfigurationOperationTypeWrapper parsedFromData:v14 error:&v25];
        id v12 = v16 = v12;
LABEL_11:
        id v17 = *v15;

        id v9 = v17;
      }
      if (v26 >= v13)
      {
        if (v9)
        {
LABEL_14:
          id v6 = v22;
          if (v21)
          {
            id v9 = v9;
            BOOL v18 = 0;
            *id v21 = v9;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_25;
        }
LABEL_20:
        id v6 = v22;
        goto LABEL_21;
      }
    }
    v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:");
    id v23 = v9;
    uint64_t v15 = &v23;
    [MEMORY[0x263F35AF0] parsedFromData:v14 error:&v23];
    char v10 = v16 = v10;
    goto LABEL_11;
  }
  char v10 = 0;
  v11 = 0;
  id v12 = 0;
LABEL_21:
  [(HMDSelectedSleepConfigurationTLV *)self setOperationType:v12];
  [(HMDSelectedSleepConfigurationTLV *)self setOperationStatus:v11];
  [(HMDSelectedSleepConfigurationTLV *)self setBackoffTime:v10];
  id v9 = 0;
  BOOL v18 = 1;
LABEL_25:

  return v18;
}

- (HMDSelectedSleepConfigurationTLV)initWithOperationType:(id)a3 operationStatus:(id)a4 backoffTime:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSelectedSleepConfigurationTLV;
  id v12 = [(HMDSelectedSleepConfigurationTLV *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationType, a3);
    objc_storeStrong((id *)&v13->_operationStatus, a4);
    objc_storeStrong((id *)&v13->_backoffTime, a5);
  }

  return v13;
}

- (HMDSelectedSleepConfigurationTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSelectedSleepConfigurationTLV;
  return [(HMDSelectedSleepConfigurationTLV *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSelectedSleepConfigurationTLV);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSelectedSleepConfigurationTLV *)v6 parseFromData:v5 error:&v10];
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