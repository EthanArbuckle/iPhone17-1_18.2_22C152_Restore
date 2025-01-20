@interface HAPCharacteristicValueLinearTransition
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueLinearTransition)init;
- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4;
- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior;
- (NSMutableArray)transitionPoints;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setStartBehavior:(id)a3;
- (void)setTransitionPoints:(id)a3;
@end

@implementation HAPCharacteristicValueLinearTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startBehavior, 0);

  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

- (void)setStartBehavior:(id)a3
{
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior
{
  return self->_startBehavior;
}

- (void)setTransitionPoints:(id)a3
{
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  v5 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
  v6 = [v3 stringWithFormat:@"<HAPCharacteristicValueLinearTransition transitionPoints=%@, startBehavior=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPCharacteristicValueLinearTransition *)a3;
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
      v7 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
      v8 = [(HAPCharacteristicValueLinearTransition *)v6 transitionPoints];
      if (v7 != v8)
      {
        v9 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
        v3 = [(HAPCharacteristicValueLinearTransition *)v6 transitionPoints];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
      v12 = [(HAPCharacteristicValueLinearTransition *)v6 startBehavior];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
        v14 = [(HAPCharacteristicValueLinearTransition *)v6 startBehavior];
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
  v4 = +[HAPCharacteristicValueLinearTransition allocWithZone:a3];
  v5 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  v6 = [(HAPCharacteristicValueLinearTransition *)self startBehavior];
  v7 = [(HAPCharacteristicValueLinearTransition *)v4 initWithTransitionPoints:v5 startBehavior:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
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
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  TLV8BufferInit();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v29 = self;
  v5 = [(HAPCharacteristicValueLinearTransition *)self transitionPoints];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    char v9 = 1;
    v28 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v31 = 0;
      v13 = objc_msgSend(v11, "serializeWithError:", &v31, v28);
      id v14 = v31;
      if (v14)
      {
        id v22 = v14;

        a3 = v28;
        goto LABEL_19;
      }
      id v15 = v13;
      unint64_t v16 = [v15 bytes];
      unint64_t v17 = v16 + [v15 length];
      do
      {
        if ((uint64_t)(v17 - v16) >= 255) {
          uint64_t v18 = 255;
        }
        else {
          uint64_t v18 = v17 - v16;
        }
        uint64_t v19 = TLV8BufferAppend();
        if (v19)
        {
          uint64_t v24 = v19;

          goto LABEL_22;
        }
        v16 += v18;
      }
      while (v16 < v17);

      char v9 = 0;
      if (++v10 != v7) {
        goto LABEL_4;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      char v9 = 0;
      a3 = v28;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v24 = v12;
LABEL_22:

    a3 = v28;
    goto LABEL_23;
  }
LABEL_17:

  v20 = [(HAPCharacteristicValueLinearTransition *)v29 startBehavior];

  if (v20)
  {
    v21 = [(HAPCharacteristicValueLinearTransition *)v29 startBehavior];
    id v30 = 0;
    v5 = [v21 serializeWithError:&v30];
    id v22 = v30;

    if (v22)
    {
LABEL_19:

      if (a3)
      {
        id v23 = v22;
        id v22 = v23;
LABEL_25:
        v25 = 0;
        *a3 = v23;
        goto LABEL_30;
      }
      goto LABEL_27;
    }
    id v26 = v5;
    [v26 bytes];
    [v26 length];
    uint64_t v24 = TLV8BufferAppend();

    if (v24)
    {
LABEL_23:
      if (a3)
      {
        HMErrorFromOSStatus(v24);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = 0;
        goto LABEL_25;
      }
      id v22 = 0;
LABEL_27:
      v25 = 0;
      goto LABEL_30;
    }
  }
  v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v37);
  id v22 = 0;
LABEL_30:
  TLV8BufferFree();

  return v25;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  char v9 = [MEMORY[0x1E4F1CA48] array];
  if (v8 < 1)
  {
    v11 = 0;
LABEL_17:
    -[HAPCharacteristicValueLinearTransition setTransitionPoints:](self, "setTransitionPoints:", v9, v23);
    [(HAPCharacteristicValueLinearTransition *)self setStartBehavior:v11];
    uint64_t v10 = 0;
    BOOL v18 = 1;
    goto LABEL_25;
  }
  id v23 = a4;
  uint64_t v10 = 0;
  v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v29 = 0;
    v27[1] = 0;
    uint64_t v28 = 0;
    v27[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v28)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      uint64_t v10 = (void *)v21;
      if (!v21) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v19 = v23;
      if (v23)
      {
        id v20 = v10;
        uint64_t v10 = v20;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v29 == 2)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v24 = v10;
      uint64_t v17 = +[HAPCharacteristicValueTransitionLinearStartConditionWrapper parsedFromData:v14 error:&v24];
      id v15 = v24;

      unint64_t v16 = v11;
      v11 = (void *)v17;
      goto LABEL_11;
    }
    if (v29 == 1)
    {
      id v26 = v10;
      id v14 = HAPTLVParseContiguousTlvs(1, v7, v12, v27, &v26);
      id v15 = v26;

      if (!v15)
      {
        id v25 = 0;
        unint64_t v16 = +[HAPCharacteristicValueTransitionPoint parsedFromData:v14 error:&v25];
        id v15 = v25;
        if (!v15) {
          [v9 addObject:v16];
        }
LABEL_11:
      }
      uint64_t v10 = v15;
    }
    unint64_t v7 = v27[0];
    if (v27[0] >= v12)
    {
      if (!v10) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  uint64_t v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus(Next);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    BOOL v18 = 0;
    *uint64_t v19 = v20;
    goto LABEL_25;
  }
LABEL_24:
  BOOL v18 = 0;
LABEL_25:

  return v18;
}

- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueLinearTransition;
  uint64_t v8 = [(HAPCharacteristicValueLinearTransition *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    transitionPoints = v8->_transitionPoints;
    v8->_transitionPoints = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_startBehavior, a4);
  }

  return v8;
}

- (HAPCharacteristicValueLinearTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearTransition;
  return [(HAPCharacteristicValueLinearTransition *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPCharacteristicValueLinearTransition);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueLinearTransition *)v6 parseFromData:v5 error:&v10];
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