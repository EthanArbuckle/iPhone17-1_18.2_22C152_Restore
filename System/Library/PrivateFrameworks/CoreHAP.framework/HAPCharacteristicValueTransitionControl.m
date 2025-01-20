@interface HAPCharacteristicValueTransitionControl
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueTransitionControl)init;
- (HAPCharacteristicValueTransitionControl)initWithTransitionFetch:(id)a3 transitionStart:(id)a4;
- (HAPCharacteristicValueTransitionFetch)transitionFetch;
- (HAPCharacteristicValueTransitionStart)transitionStart;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setTransitionFetch:(id)a3;
- (void)setTransitionStart:(id)a3;
@end

@implementation HAPCharacteristicValueTransitionControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionStart, 0);

  objc_storeStrong((id *)&self->_transitionFetch, 0);
}

- (void)setTransitionStart:(id)a3
{
}

- (HAPCharacteristicValueTransitionStart)transitionStart
{
  return self->_transitionStart;
}

- (void)setTransitionFetch:(id)a3
{
}

- (HAPCharacteristicValueTransitionFetch)transitionFetch
{
  return self->_transitionFetch;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
  v5 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  v6 = [v3 stringWithFormat:@"<HAPCharacteristicValueTransitionControl transitionFetch=%@, transitionStart=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPCharacteristicValueTransitionControl *)a3;
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
      v7 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
      v8 = [(HAPCharacteristicValueTransitionControl *)v6 transitionFetch];
      if (v7 != v8)
      {
        v9 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
        v3 = [(HAPCharacteristicValueTransitionControl *)v6 transitionFetch];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
      v12 = [(HAPCharacteristicValueTransitionControl *)v6 transitionStart];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
        v14 = [(HAPCharacteristicValueTransitionControl *)v6 transitionStart];
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
  v4 = +[HAPCharacteristicValueTransitionControl allocWithZone:a3];
  v5 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
  v6 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  v7 = [(HAPCharacteristicValueTransitionControl *)v4 initWithTransitionFetch:v5 transitionStart:v6];

  return v7;
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
  v5 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];

  if (v5)
  {
    v6 = [(HAPCharacteristicValueTransitionControl *)self transitionFetch];
    id v28 = 0;
    v7 = [v6 serializeWithError:&v28];
    id v8 = v28;

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

      goto LABEL_28;
    }
LABEL_12:

    if (a3)
    {
      id v16 = v8;
      id v8 = v16;
LABEL_30:
      v25 = 0;
      *a3 = v16;
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_10:
  v14 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];

  if (!v14) {
    goto LABEL_31;
  }
  v15 = [(HAPCharacteristicValueTransitionControl *)self transitionStart];
  id v27 = 0;
  v7 = [v15 serializeWithError:&v27];
  id v8 = v27;

  if (v8) {
    goto LABEL_12;
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
  uint64_t v17 = v22;

  if (!v17)
  {
LABEL_31:
    v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v29);
    id v8 = 0;
    goto LABEL_34;
  }
LABEL_28:
  if (a3)
  {
    HMErrorFromOSStatus(v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_30;
  }
  id v8 = 0;
LABEL_33:
  v25 = 0;
LABEL_34:
  TLV8BufferFree();

  return v25;
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
LABEL_17:
    [(HAPCharacteristicValueTransitionControl *)self setTransitionFetch:v10];
    [(HAPCharacteristicValueTransitionControl *)self setTransitionStart:v9];
    unint64_t v11 = 0;
    BOOL v18 = 1;
    goto LABEL_25;
  }
  id v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v28 = 0;
    v26[1] = 0;
    uint64_t v27 = 0;
    v26[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v27)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      unint64_t v11 = (void *)v20;
      if (!v20) {
        goto LABEL_17;
      }
LABEL_21:
      if (a4)
      {
        id v19 = v11;
        unint64_t v11 = v19;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v28 == 2)
    {
      id v23 = v11;
      v14 = HAPTLVParseContiguousTlvs(2, v7, v12, v26, &v23);
      id v15 = v23;

      if (!v15)
      {
        uint64_t v22 = 0;
        id v16 = (id *)&v22;
        +[HAPCharacteristicValueTransitionStart parsedFromData:v14 error:&v22];
        id v9 = v17 = v9;
LABEL_11:
        id v15 = *v16;
      }
LABEL_12:

      unint64_t v11 = v15;
      goto LABEL_13;
    }
    if (v28 == 1)
    {
      id v25 = v11;
      v14 = HAPTLVParseContiguousTlvs(1, v7, v12, v26, &v25);
      id v15 = v25;

      if (!v15)
      {
        uint64_t v24 = 0;
        id v16 = (id *)&v24;
        +[HAPCharacteristicValueTransitionFetch parsedFromData:v14 error:&v24];
        unint64_t v10 = v17 = v10;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    unint64_t v7 = v26[0];
    if (v26[0] >= v12)
    {
      if (!v11) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  if (a4)
  {
    HMErrorFromOSStatus(Next);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    BOOL v18 = 0;
    *a4 = v19;
    goto LABEL_25;
  }
LABEL_24:
  BOOL v18 = 0;
LABEL_25:

  return v18;
}

- (HAPCharacteristicValueTransitionControl)initWithTransitionFetch:(id)a3 transitionStart:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueTransitionControl;
  id v9 = [(HAPCharacteristicValueTransitionControl *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transitionFetch, a3);
    objc_storeStrong((id *)&v10->_transitionStart, a4);
  }

  return v10;
}

- (HAPCharacteristicValueTransitionControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionControl;
  return [(HAPCharacteristicValueTransitionControl *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPCharacteristicValueTransitionControl);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransitionControl *)v6 parseFromData:v5 error:&v10];
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