@interface HAPOperatingStateResponse
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPOperatingStateAbnormalReasonsWrapper)abnormalReasons;
- (HAPOperatingStateResponse)init;
- (HAPOperatingStateResponse)initWithState:(id)a3 abnormalReasons:(id)a4;
- (HAPOperatingStateWrapper)state;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAbnormalReasons:(id)a3;
- (void)setState:(id)a3;
@end

@implementation HAPOperatingStateResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abnormalReasons, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setAbnormalReasons:(id)a3
{
}

- (HAPOperatingStateAbnormalReasonsWrapper)abnormalReasons
{
  return self->_abnormalReasons;
}

- (void)setState:(id)a3
{
}

- (HAPOperatingStateWrapper)state
{
  return self->_state;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPOperatingStateResponse *)self state];
  v5 = [(HAPOperatingStateResponse *)self abnormalReasons];
  v6 = [v3 stringWithFormat:@"<HAPOperatingStateResponse state=%@, abnormalReasons=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPOperatingStateResponse *)a3;
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
      v7 = [(HAPOperatingStateResponse *)self state];
      v8 = [(HAPOperatingStateResponse *)v6 state];
      if (v7 != v8)
      {
        v9 = [(HAPOperatingStateResponse *)self state];
        v3 = [(HAPOperatingStateResponse *)v6 state];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPOperatingStateResponse *)self abnormalReasons];
      v12 = [(HAPOperatingStateResponse *)v6 abnormalReasons];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPOperatingStateResponse *)self abnormalReasons];
        v14 = [(HAPOperatingStateResponse *)v6 abnormalReasons];
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
  v4 = +[HAPOperatingStateResponse allocWithZone:a3];
  v5 = [(HAPOperatingStateResponse *)self state];
  v6 = [(HAPOperatingStateResponse *)self abnormalReasons];
  v7 = [(HAPOperatingStateResponse *)v4 initWithState:v5 abnormalReasons:v6];

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
  v5 = [(HAPOperatingStateResponse *)self state];

  if (v5)
  {
    v6 = [(HAPOperatingStateResponse *)self state];
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
  v11 = [(HAPOperatingStateResponse *)self abnormalReasons];

  if (!v11)
  {
LABEL_12:
    v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v19);
    id v8 = 0;
    goto LABEL_15;
  }
  v12 = [(HAPOperatingStateResponse *)self abnormalReasons];
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
  if (v8 < 1)
  {
    id v9 = 0;
    uint64_t v10 = 0;
LABEL_14:
    [(HAPOperatingStateResponse *)self setState:v10];
    [(HAPOperatingStateResponse *)self setAbnormalReasons:v9];
    v11 = 0;
    BOOL v18 = 1;
    goto LABEL_22;
  }
  long long v23 = a4;
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v29 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    unint64_t v26 = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v28)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      v11 = (void *)v21;
      if (!v21) {
        goto LABEL_14;
      }
LABEL_18:
      long long v19 = v23;
      if (v23)
      {
        id v20 = v11;
        v11 = v20;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    if (v29 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v24 = v11;
      v15 = &v24;
      +[HAPOperatingStateAbnormalReasonsWrapper parsedFromData:v14 error:&v24];
      id v9 = v16 = v9;
      goto LABEL_9;
    }
    if (v29 == 1)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      long long v25 = v11;
      v15 = &v25;
      +[HAPOperatingStateWrapper parsedFromData:v14 error:&v25];
      uint64_t v10 = v16 = v10;
LABEL_9:
      id v17 = *v15;

      v11 = v17;
    }
    if (v26 >= v12)
    {
      if (!v11) {
        goto LABEL_14;
      }
      goto LABEL_18;
    }
  }
  long long v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus(Next);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    BOOL v18 = 0;
    *long long v19 = v20;
    goto LABEL_22;
  }
LABEL_21:
  BOOL v18 = 0;
LABEL_22:

  return v18;
}

- (HAPOperatingStateResponse)initWithState:(id)a3 abnormalReasons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPOperatingStateResponse;
  id v9 = [(HAPOperatingStateResponse *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_state, a3);
    objc_storeStrong((id *)&v10->_abnormalReasons, a4);
  }

  return v10;
}

- (HAPOperatingStateResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPOperatingStateResponse;
  return [(HAPOperatingStateResponse *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPOperatingStateResponse);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPOperatingStateResponse *)v6 parseFromData:v5 error:&v10];
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