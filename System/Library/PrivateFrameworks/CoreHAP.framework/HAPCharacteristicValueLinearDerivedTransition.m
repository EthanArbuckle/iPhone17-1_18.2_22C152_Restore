@interface HAPCharacteristicValueLinearDerivedTransition
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueLinearDerivedTransition)init;
- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5;
- (HAPCharacteristicValueRange)sourceValueRange;
- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID;
- (NSMutableArray)transitionPoints;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setSourceHAPInstanceID:(id)a3;
- (void)setSourceValueRange:(id)a3;
- (void)setTransitionPoints:(id)a3;
@end

@implementation HAPCharacteristicValueLinearDerivedTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceValueRange, 0);
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, 0);

  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

- (void)setSourceValueRange:(id)a3
{
}

- (HAPCharacteristicValueRange)sourceValueRange
{
  return self->_sourceValueRange;
}

- (void)setSourceHAPInstanceID:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID
{
  return self->_sourceHAPInstanceID;
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
  v4 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
  v6 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
  v7 = [v3 stringWithFormat:@"<HAPCharacteristicValueLinearDerivedTransition transitionPoints=%@, sourceHAPInstanceID=%@, sourceValueRange=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPCharacteristicValueLinearDerivedTransition *)a3;
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
      v8 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
      v9 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 transitionPoints];
      if (v8 != v9)
      {
        v3 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
        v4 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 transitionPoints];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
      v12 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceHAPInstanceID];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
        v26 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceHAPInstanceID];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
      uint64_t v15 = [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceValueRange];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
        v17 = v23 = v3;
        [(HAPCharacteristicValueLinearDerivedTransition *)v7 sourceValueRange];
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
  v4 = +[HAPCharacteristicValueLinearDerivedTransition allocWithZone:a3];
  v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  v6 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceHAPInstanceID];
  v7 = [(HAPCharacteristicValueLinearDerivedTransition *)self sourceValueRange];
  v8 = [(HAPCharacteristicValueLinearDerivedTransition *)v4 initWithTransitionPoints:v5 sourceHAPInstanceID:v6 sourceValueRange:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  TLV8BufferInit();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v39 = self;
  id v5 = [(HAPCharacteristicValueLinearDerivedTransition *)self transitionPoints];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    char v9 = 1;
    v38 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v44 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v42 = 0;
      v13 = [v11 serializeWithError:&v42];
      id v14 = v42;
      if (v14)
      {
        id v22 = v14;

        a3 = v38;
        goto LABEL_31;
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
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
      char v9 = 0;
      a3 = v38;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v24 = v12;
LABEL_22:
    a3 = v38;
    goto LABEL_23;
  }
LABEL_17:

  v20 = [(HAPCharacteristicValueLinearDerivedTransition *)v39 sourceHAPInstanceID];

  if (v20)
  {
    v21 = [(HAPCharacteristicValueLinearDerivedTransition *)v39 sourceHAPInstanceID];
    id v41 = 0;
    id v5 = [v21 serializeWithError:&v41];
    id v22 = v41;

    if (v22) {
      goto LABEL_31;
    }
    id v5 = v5;
    [v5 bytes];
    [v5 length];
    uint64_t v23 = TLV8BufferAppend();
    if (v23)
    {
      uint64_t v24 = v23;
LABEL_23:

LABEL_24:
      if (a3)
      {
        HMErrorFromOSStatus(v24);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = 0;
LABEL_33:
        v28 = 0;
        *a3 = v25;
        goto LABEL_35;
      }
      id v22 = 0;
LABEL_34:
      v28 = 0;
      goto LABEL_35;
    }
  }
  v26 = [(HAPCharacteristicValueLinearDerivedTransition *)v39 sourceValueRange];

  if (v26)
  {
    v27 = [(HAPCharacteristicValueLinearDerivedTransition *)v39 sourceValueRange];
    id v40 = 0;
    id v5 = [v27 serializeWithError:&v40];
    id v22 = v40;

    if (v22)
    {
LABEL_31:

      if (a3)
      {
        id v25 = v22;
        id v22 = v25;
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    v30 = a3;
    id v31 = v5;
    unint64_t v32 = [v31 bytes];
    unint64_t v33 = v32 + [v31 length];
    do
    {
      if ((uint64_t)(v33 - v32) >= 255) {
        uint64_t v34 = 255;
      }
      else {
        uint64_t v34 = v33 - v32;
      }
      uint64_t v35 = TLV8BufferAppend();
      if (v35) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = v34;
      }
      v32 += v36;
      if (v35) {
        BOOL v37 = 1;
      }
      else {
        BOOL v37 = v32 >= v33;
      }
    }
    while (!v37);
    uint64_t v24 = v35;

    a3 = v30;
    if (v24) {
      goto LABEL_24;
    }
  }
  v28 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v48);
  id v22 = 0;
LABEL_35:
  TLV8BufferFree();

  return v28;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  if (v7 < 1)
  {
    uint64_t v10 = 0;
    v11 = 0;
LABEL_20:
    -[HAPCharacteristicValueLinearDerivedTransition setTransitionPoints:](self, "setTransitionPoints:", v8, a4);
    [(HAPCharacteristicValueLinearDerivedTransition *)self setSourceHAPInstanceID:v11];
    [(HAPCharacteristicValueLinearDerivedTransition *)self setSourceValueRange:v10];
    char v9 = 0;
    BOOL v19 = 1;
    goto LABEL_28;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  unint64_t v12 = v6 + v7;
  while (1)
  {
    char v32 = 0;
    v30[1] = 0;
    uint64_t v31 = 0;
    v30[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v31)
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      char v9 = (void *)v22;
      if (!v22) {
        goto LABEL_20;
      }
LABEL_24:
      v20 = a4;
      if (a4)
      {
        id v21 = v9;
        char v9 = v21;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v32)
    {
      case 3:
        id v26 = v9;
        id v14 = HAPTLVParseContiguousTlvs(3, v6, v12, v30, &v26);
        id v15 = v26;

        if (!v15)
        {
          id v25 = 0;
          uint64_t v17 = +[HAPCharacteristicValueRange parsedFromData:v14 error:&v25];
          id v15 = v25;
          unint64_t v16 = v10;
          uint64_t v10 = (void *)v17;
          goto LABEL_14;
        }
LABEL_15:

        char v9 = v15;
        break;
      case 2:
        id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v27 = v9;
        uint64_t v18 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v27];
        id v15 = v27;

        unint64_t v16 = v11;
        v11 = (void *)v18;
        goto LABEL_14;
      case 1:
        id v29 = v9;
        id v14 = HAPTLVParseContiguousTlvs(1, v6, v12, v30, &v29);
        id v15 = v29;

        if (v15) {
          goto LABEL_15;
        }
        id v28 = 0;
        unint64_t v16 = +[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:v14 error:&v28];
        id v15 = v28;
        if (!v15) {
          [v8 addObject:v16];
        }
LABEL_14:

        goto LABEL_15;
    }
    unint64_t v6 = v30[0];
    if (v30[0] >= v12)
    {
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }
  }
  v20 = a4;
  if (a4)
  {
    HMErrorFromOSStatus(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_28;
  }
LABEL_27:
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  v11 = [(HAPCharacteristicValueLinearDerivedTransition *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 mutableCopy];
    transitionPoints = v11->_transitionPoints;
    v11->_transitionPoints = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_sourceHAPInstanceID, a4);
    objc_storeStrong((id *)&v11->_sourceValueRange, a5);
  }

  return v11;
}

- (HAPCharacteristicValueLinearDerivedTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  return [(HAPCharacteristicValueLinearDerivedTransition *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HAPCharacteristicValueLinearDerivedTransition);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueLinearDerivedTransition *)v6 parseFromData:v5 error:&v10];
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