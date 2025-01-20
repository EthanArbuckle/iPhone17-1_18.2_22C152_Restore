@interface HAP2TLVParamCharacteristicList
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVParamCharacteristicList)init;
- (HAP2TLVParamCharacteristicList)initWithCharacteristicSignatureList:(id)a3;
- (NSMutableArray)characteristicSignatureList;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCharacteristicSignatureList:(id)a3;
@end

@implementation HAP2TLVParamCharacteristicList

- (void).cxx_destruct
{
}

- (void)setCharacteristicSignatureList:(id)a3
{
}

- (NSMutableArray)characteristicSignatureList
{
  return self->_characteristicSignatureList;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HAP2TLVParamCharacteristicList *)self characteristicSignatureList];
  v4 = [v2 stringWithFormat:@"<HAP2TLVParamCharacteristicList characteristicSignatureList=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAP2TLVParamCharacteristicList *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAP2TLVParamCharacteristicList *)self characteristicSignatureList];
      v7 = [(HAP2TLVParamCharacteristicList *)v5 characteristicSignatureList];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HAP2TLVParamCharacteristicList *)self characteristicSignatureList];
        v9 = [(HAP2TLVParamCharacteristicList *)v5 characteristicSignatureList];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAP2TLVParamCharacteristicList allocWithZone:a3];
  v5 = [(HAP2TLVParamCharacteristicList *)self characteristicSignatureList];
  v6 = [(HAP2TLVParamCharacteristicList *)v4 initWithCharacteristicSignatureList:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
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
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  TLV8BufferInit();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [(HAP2TLVParamCharacteristicList *)self characteristicSignatureList];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    char v9 = 1;
    v26 = a3;
    while (1)
    {
      uint64_t v10 = 0;
LABEL_4:
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        uint64_t v12 = TLV8BufferAppend();
        if (v12) {
          break;
        }
      }
      id v27 = 0;
      v13 = objc_msgSend(v11, "serializeWithError:", &v27, v26);
      id v14 = v27;
      if (v14)
      {
        v21 = v14;

        v23 = v26;
        if (v26)
        {
          id v24 = v21;
          v21 = v24;
          goto LABEL_21;
        }
        goto LABEL_23;
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
          uint64_t v22 = v19;

          goto LABEL_19;
        }
        v16 += v18;
      }
      while (v16 < v17);

      char v9 = 0;
      if (++v10 != v7) {
        goto LABEL_4;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      char v9 = 0;
      if (!v7) {
        goto LABEL_17;
      }
    }
    uint64_t v22 = v12;
LABEL_19:

    v23 = v26;
    if (v26)
    {
      HMErrorFromOSStatus(v22);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
LABEL_21:
      v20 = 0;
      id *v23 = v24;
      goto LABEL_24;
    }
    v21 = 0;
LABEL_23:
    v20 = 0;
  }
  else
  {
LABEL_17:

    v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v33);
    v21 = 0;
  }
LABEL_24:
  TLV8BufferFree();

  return v20;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  char v9 = [MEMORY[0x1E4F1CA48] array];
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v11 = v7 + v8;
    while (1)
    {
      char v24 = 0;
      v22[1] = 0;
      uint64_t v23 = 0;
      v22[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (a4)
        {
          HMErrorFromOSStatus(Next);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        goto LABEL_20;
      }
      if (!v23) {
        break;
      }
      if (v24 == 19)
      {
        id v21 = v10;
        v13 = HAPTLVParseContiguousTlvs(19, v7, v11, v22, &v21);
        id v14 = v21;

        if (!v14)
        {
          id v20 = 0;
          id v15 = +[HAP2TLVParamCharacteristicSignature parsedFromData:v13 error:&v20];
          id v14 = v20;
          if (!v14) {
            [v9 addObject:v15];
          }
        }
        uint64_t v10 = v14;
      }
      unint64_t v7 = v22[0];
      if (v22[0] >= v11)
      {
        if (!v10) {
          goto LABEL_19;
        }
LABEL_13:
        if (a4)
        {
          id v16 = v10;
          uint64_t v10 = v16;
LABEL_17:
          BOOL v17 = 0;
          *a4 = v16;
          goto LABEL_21;
        }
LABEL_20:
        BOOL v17 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

    uint64_t v10 = (void *)v18;
    if (v18) {
      goto LABEL_13;
    }
  }
LABEL_19:
  [(HAP2TLVParamCharacteristicList *)self setCharacteristicSignatureList:v9];
  uint64_t v10 = 0;
  BOOL v17 = 1;
LABEL_21:

  return v17;
}

- (HAP2TLVParamCharacteristicList)initWithCharacteristicSignatureList:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2TLVParamCharacteristicList;
  v5 = [(HAP2TLVParamCharacteristicList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    characteristicSignatureList = v5->_characteristicSignatureList;
    v5->_characteristicSignatureList = (NSMutableArray *)v6;
  }
  return v5;
}

- (HAP2TLVParamCharacteristicList)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVParamCharacteristicList;
  return [(HAP2TLVParamCharacteristicList *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(HAP2TLVParamCharacteristicList);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVParamCharacteristicList *)v6 parseFromData:v5 error:&v10];
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