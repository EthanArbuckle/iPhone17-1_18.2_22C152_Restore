@interface HAPCharacteristicValueActiveTransitionContext
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueActiveTransitionContext)init;
- (HAPCharacteristicValueActiveTransitionContext)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 timeElapsedSinceStart:(id)a5;
- (HAPTLVUnsignedNumberValue)HAPInstanceID;
- (HAPTLVUnsignedNumberValue)timeElapsedSinceStart;
- (NSData)controllerContext;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setControllerContext:(id)a3;
- (void)setHAPInstanceID:(id)a3;
- (void)setTimeElapsedSinceStart:(id)a3;
@end

@implementation HAPCharacteristicValueActiveTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeElapsedSinceStart, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);

  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

- (void)setTimeElapsedSinceStart:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)timeElapsedSinceStart
{
  return self->_timeElapsedSinceStart;
}

- (void)setControllerContext:(id)a3
{
}

- (NSData)controllerContext
{
  return self->_controllerContext;
}

- (void)setHAPInstanceID:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)HAPInstanceID
{
  return self->_HAPInstanceID;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
  v5 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
  v6 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
  v7 = [v3 stringWithFormat:@"<HAPCharacteristicValueActiveTransitionContext HAPInstanceID=%@, controllerContext=%@, timeElapsedSinceStart=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPCharacteristicValueActiveTransitionContext *)a3;
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
      v8 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
      v9 = [(HAPCharacteristicValueActiveTransitionContext *)v7 HAPInstanceID];
      if (v8 != v9)
      {
        v3 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
        v4 = [(HAPCharacteristicValueActiveTransitionContext *)v7 HAPInstanceID];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
      v12 = [(HAPCharacteristicValueActiveTransitionContext *)v7 controllerContext];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
        v26 = [(HAPCharacteristicValueActiveTransitionContext *)v7 controllerContext];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
      uint64_t v15 = [(HAPCharacteristicValueActiveTransitionContext *)v7 timeElapsedSinceStart];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
        v17 = v23 = v3;
        [(HAPCharacteristicValueActiveTransitionContext *)v7 timeElapsedSinceStart];
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
  v4 = +[HAPCharacteristicValueActiveTransitionContext allocWithZone:a3];
  v5 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
  v6 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
  v7 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
  v8 = [(HAPCharacteristicValueActiveTransitionContext *)v4 initWithHAPInstanceID:v5 controllerContext:v6 timeElapsedSinceStart:v7];

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
  v5 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];

  if (!v5) {
    goto LABEL_4;
  }
  v6 = [(HAPCharacteristicValueActiveTransitionContext *)self HAPInstanceID];
  id v26 = 0;
  v7 = [v6 serializeWithError:&v26];
  id v8 = v26;

  if (v8) {
    goto LABEL_15;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = TLV8BufferAppend();

  if (!v10)
  {
LABEL_4:
    v11 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];

    if (v11)
    {
      v12 = [(HAPCharacteristicValueActiveTransitionContext *)self controllerContext];
      id v25 = 0;
      v7 = [v12 serializeWithError:&v25];
      id v8 = v25;

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
            break;
          }
          v14 += v16;
          if (v14 >= v15)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = v17;

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
LABEL_13:
    v18 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];

    if (!v18) {
      goto LABEL_22;
    }
    v19 = [(HAPCharacteristicValueActiveTransitionContext *)self timeElapsedSinceStart];
    id v24 = 0;
    v7 = [v19 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_15;
    }
    id v21 = v7;
    [v21 bytes];
    [v21 length];
    uint64_t v10 = TLV8BufferAppend();

    if (!v10)
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
    HMErrorFromOSStatus(v10);
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
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_24;
  }
  id v26 = self;
  long long v27 = a4;
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
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v28 = v9;
      uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v28];
      id v17 = v28;

      v18 = v10;
      uint64_t v10 = (void *)v19;
LABEL_12:

      goto LABEL_13;
    }
    if (v34 != 2)
    {
      if (v34 != 1) {
        goto LABEL_14;
      }
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v31 = v9;
      uint64_t v16 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v31];
      id v17 = v31;

      v18 = v12;
      v12 = (void *)v16;
      goto LABEL_12;
    }
    id v30 = v9;
    unint64_t v15 = HAPTLVParseContiguousTlvs(2, v7, v13, v32, &v30);
    id v17 = v30;

    if (!v17)
    {
      id v29 = 0;
      uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v29];
      id v17 = v29;
      v18 = v11;
      v11 = (void *)v20;
      goto LABEL_12;
    }
LABEL_13:

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
  -[HAPCharacteristicValueActiveTransitionContext setHAPInstanceID:](self, "setHAPInstanceID:", v12, v26);
  [(HAPCharacteristicValueActiveTransitionContext *)self setControllerContext:v11];
  [(HAPCharacteristicValueActiveTransitionContext *)self setTimeElapsedSinceStart:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (HAPCharacteristicValueActiveTransitionContext)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 timeElapsedSinceStart:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  v12 = [(HAPCharacteristicValueActiveTransitionContext *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v13->_controllerContext, a4);
    objc_storeStrong((id *)&v13->_timeElapsedSinceStart, a5);
  }

  return v13;
}

- (HAPCharacteristicValueActiveTransitionContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  return [(HAPCharacteristicValueActiveTransitionContext *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPCharacteristicValueActiveTransitionContext);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueActiveTransitionContext *)v6 parseFromData:v5 error:&v10];
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